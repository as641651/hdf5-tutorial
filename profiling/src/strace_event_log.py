
import csv
import pandas as pd
import pm4py

        
class StraceEventLog:
    def __init__(self,strace_log_path):
        self.st_log = strace_log_path
        self.io_calls = ['read','write','mmap','openat']
        self.total_time = 0.0

    def process_line(self, line):
        ret = line.strip().split()
        time = ret[0]
        dur = ret[-1][1:-1]
        try:
            dur=float(dur)
        except ValueError:
            dur=0.0
        call = ret[3].split('(')[0]
        ret = [call,time,dur]
        #print(ret)
        return ret

    def prepare_csv_log(self,csv_file_path):
        with open(self.st_log,'r') as in_f, open(csv_file_path,'w') as csv_f:
            csv_writer = csv.writer(csv_f)
            csv_writer.writerow(['call','time','duration'])
            for line in in_f:
                ret = self.process_line(line)
                csv_writer.writerow(ret)
        
    def get_io_stats(self,df):
        grouped = df.groupby('call')
        sum_by_call = dict(grouped['duration'].sum())
        stats = []
        for call,dur in sum_by_call.items():
            p = (dur/self.total_time)*100.0
            stats.append([call,dur,p])
        others_dur = self.total_time - df['duration'].sum()
        stats.append(['others',others_dur,(others_dur/self.total_time)*100.0])
        stats.append(['Total',self.total_time,100.0])
        return pd.DataFrame(stats,columns=['call','duration','percent'])


    
    def event_log_from_csv(self,csv_path):
        #self.prepare_df_from_csv(csv_path)
        df = pd.read_csv(csv_path,sep=',')
        self.total_time = df['duration'].sum()
        df = df[df['call'].isin(self.io_calls)]

        stats = self.get_io_stats(df)

        df['case'] = 0
        #print(df)
        df = pm4py.format_dataframe(df,case_id='case',activity_key='call',timestamp_key='time')
        el = pm4py.convert_to_event_log(df)
        return el,stats
