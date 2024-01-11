
from abc import ABC, abstractmethod
import os
import csv
import pandas as pd
from datetime import datetime

class Preprocessor(ABC):
    def __init__(self,strace_log_path):
         self.st_log = strace_log_path   
         self.csv_log = self.st_log.split('.st')[0]+'.csv'      
         self.filtered_calls = []
                  
         self.cols = ['call','time','duration']
         self.extra = []
         self.sys_time = 0.0
         self.io_time = 0.0
         self.total_time = 0.0
         self.dt_format = "%H:%M:%S.%f"
         self.stat_cols = ['call','duration','percent_total', 'percent_sys']


    def prepare_csv_log(self,fn_process_line):
        print("CSV log path: {}".format(self.csv_log))

        with open(self.st_log,'r') as in_f, open(self.csv_log,'w') as csv_f:
            csv_writer = csv.writer(csv_f)
            csv_writer.writerow(self.cols+self.extra)
            for line in in_f:
                ret = fn_process_line(line)
                csv_writer.writerow(ret)

    def get_df_from_csv(self,csv_file=None):
        if csv_file:
            self.csv_log = csv_file
        if not os.path.exists(self.csv_log):
            return None
        return pd.read_csv(self.csv_log,sep=',')
    
    def get_time_summary(self,df):
        stats = []
        ##get total time
        start = datetime.strptime(df['time'].iloc[0],self.dt_format)
        end = datetime.strptime(df['time'].iloc[-1],self.dt_format)
        self.total_time = (end-start).total_seconds()
        #print(self.total_time)
        stats.append(['Total',self.total_time,100.0,-1])

        ## get the time spent on all sys calls
        self.sys_time = df['duration'].sum()
        stats.append(['Sys time',self.sys_time,(self.sys_time/self.total_time)*100.0,100.0])

        return stats
    
    @abstractmethod
    def process(self,df):
        pass

