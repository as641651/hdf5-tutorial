
import os
import csv
import pandas as pd
from datetime import datetime

class Preprocessor():
    def __init__(self,strace_log_path,filtered_calls,name='Filtered'):
         self.st_log = strace_log_path   
         self.csv_log = self.st_log.split('.st')[0]+'.csv'      
         self.filtered_calls = filtered_calls
         self.name = name
                  
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
    
    def process(self,df):
        summary = self.get_time_summary(df)

        if self.filtered_calls: 
            ## Filter the io_calls and find the time spent on io
            df = df[df['call'].isin(self.filtered_calls)]
            io_time = df['duration'].sum()
            summary.append(['{} time'.format(self.name),io_time,(io_time/self.total_time)*100.0, (io_time/self.sys_time)*100.0])

            remaining_time = self.sys_time - io_time
            summary.append(['Remaining sys time', remaining_time,
                        (remaining_time/self.total_time)*100.0,
                        (remaining_time/self.sys_time)*100.0])

            ## find the total duration of each io call
            grouped = df.groupby('call')
            sum_by_call = dict(grouped['duration'].sum())      
            for call,dur in sum_by_call.items():
                p_tot = (dur/self.total_time)*100.0
                p_sys = (dur/self.sys_time)*100.0      
                summary.append([call,dur,p_tot,p_sys])

        return pd.DataFrame(summary,columns=self.stat_cols),df
    

