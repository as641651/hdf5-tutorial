
from ...core.strace_analyzer import StraceAnalyzer
from ...core.preprocessor import Preprocessor
import os
import pm4py
import pandas as pd
from datetime import timedelta


class IOMinerV4(StraceAnalyzer):
    def __init__(self,st_log_paths,io_calls,line_reader):
        super().__init__(st_log_paths)
        self.io_calls = io_calls
        self.line_reader = line_reader
        self.overall_summary = {}
        self.activities_summary = {}
        self.activities = None
        self.filtered_duration = 0.0

    
    def preprocess(self, reuse=False):
        for st_path in self.st_log_paths: 
              st = Preprocessor(st_path,self.io_calls,self.line_reader,'IO')
              st.extra = ['bytes','fs']
              case_id = os.path.basename(st_path).split('.st')[0]
              if not reuse:
                st.prepare_csv_log()
            
              self.st_logs[case_id] = st
    
    def prepare_summaries_and_event_log(self):
          df = []
          for case,st in self.st_logs.items():
               df_ = st.get_df_from_csv()
               #df_ = df_[df_['call'].isin(self.io_calls)]
               df_['case'] = case
               df_['time'] = pd.to_datetime(df_['time'],format='%H:%M:%S.%f')
               df_['duration'] = df_['duration'].apply(lambda x: max(0.0,x))
               df_['end'] = df_['time'] + df_['duration'].apply(lambda x: timedelta(seconds=x)) 
               df_['event'] = df_['call'] + '\n' + df_['bytes'].astype(str) + '\n' + df_['fs']
               df.append(df_)
          df = pd.concat(df,ignore_index=True)

          df = self._prepare_overall_summary_and_filter(df)
          self._prepare_events_summary(df)

          df = pm4py.format_dataframe(df,case_id='case',activity_key='event',timestamp_key='time')
          self.el = pm4py.convert_to_event_log(df)     
    
    
    def _prepare_overall_summary_and_filter(self,df):
          df = df.sort_values(by='time')
          total_duration = df['duration'].sum()
          total_time = (df['time'].iloc[-1]-df['time'].iloc[0]).total_seconds()
          sys_load = total_duration/total_time
          self.overall_summary['duration'] = total_duration
          self.overall_summary['time'] = total_time
          self.overall_summary['sys_load'] = sys_load

          df = df[df['call'].isin(self.io_calls)]
          self.filtered_duration = df['duration'].sum()
          self.overall_summary['IO_duration'] = self.filtered_duration
          self.overall_summary['IO_load'] = (self.filtered_duration/total_duration)*100.0
          self.activities = df['event'].unique()
          self.overall_summary['Total_events'] = len(self.activities)
          
          self.print_overall_summary()

          return df


    def print_overall_summary(self):
         if not self.overall_summary:
              print("Summary not available!")
              return
         str = "\nOverall Summary:\n\n"
         str += "Run time: {:.3f}s\n".format(self.overall_summary['time'])
         str += "Total duration of Sys calls: {:.3f}s\n".format(self.overall_summary['duration'])
         str += "System load: {:.3f}\n\n".format(self.overall_summary['sys_load'])

         str += "IO duration: {:.3f}s\n".format(self.overall_summary['IO_duration'])
         str += "IO load: {:.2f}%\n".format(self.overall_summary['IO_load'])
         str += "Total IO events: {}\n".format(self.overall_summary['Total_events'])

         print(str)

         
    def _get_max_parallel(self,df):
          px = []
          mp = 0
          for row in df.itertuples():
               r = []
               for x in px:
                    if row.time > x:
                         r.append(x)
               
               for x in r:
                    px.remove(x)

               px.append(row.end)
               if len(px) > mp:
                    mp = len(px)
               #print(row,mp)
          return mp

    def _prepare_events_summary(self,df):
          ret = []
          counts = dict(df['event'].value_counts())
          for event in df['event'].unique():
               df_x = df[df['event']==event]
               e_time = df_x['duration'].sum()
               p = (e_time/self.filtered_duration)*100.0
               mp = self._get_max_parallel(df_x)
               ret.append([event,counts[event],mp,p])
          self.activities_summary = pd.DataFrame(ret,columns=['event','count','max_parallel','io_percent'])

    def print_events_summary(self):
         df = self.activities_summary.copy()
         df['event'] = df['event'].apply(lambda x: x.split('\n'))
         print(df.to_string(index=False, float_format='{:,.2f}'.format))
         

    def prepare_dfg(self):
         self.dfg,self.dfg_im,self.dfg_fm = pm4py.discover_dfg(self.el)

    def view_dfg(self):
         if self.dfg:
              return pm4py.view_dfg(self.dfg,self.dfg_im,self.dfg_fm)
