from ...core.strace_analyzer import StraceAnalyzer
from ...core.preprocessor import Preprocessor

import os
import pm4py
import pandas as pd


class IOMinerV3(StraceAnalyzer):
    def __init__(self,st_log_paths,io_calls,line_reader):
        super().__init__(st_log_paths)
        self.io_calls = io_calls
        self.line_reader = line_reader
        self.activities_summary = {}
    
    def process_line(self, line):
        self.line_reader.set_line(line)
        attrs = self.line_reader.parse_attrs()
        call_attrs = self.line_reader.parse_call_attrs(attrs[0])
        return attrs+call_attrs
    
    def preprocess(self, reuse=False):
        for st_path in self.st_log_paths: 
              st = Preprocessor(st_path,self.io_calls,'IO')
              st.extra = ['bytes','fs']
              case_id = os.path.basename(st_path).split('.st')[0]
              if not reuse:
                st.prepare_csv_log(self.process_line)
            
              self.st_logs[case_id] = st
    
    def _get_activities_summaries(self,df,st):
          ## find the total duration of each activity
          summary = []
          grouped = df.groupby('concept')
          sum_by_call = dict(grouped['duration'].sum())      
          for call,dur in sum_by_call.items():
               p_tot = (dur/st.total_time)*100.0
               p_sys = (dur/st.sys_time)*100.0      
               summary.append([call.split('\n'),dur,p_tot,p_sys])
          return pd.DataFrame(summary,columns=st.stat_cols)
    
    def prepare_summaries_and_event_log(self):
         df_all = []
         for case_id,st in self.st_logs.items():
              df = st.get_df_from_csv()
              summary, df = st.process(df)
              self.summaries[case_id] = summary
              df['case'] = case_id
              df['concept'] = df['call'] + '\n' + df['bytes'].astype(str) + '\n' + df['fs']
              self.activities_summary[case_id] = self._get_activities_summaries(df,st)

              df = pm4py.format_dataframe(df,case_id='case',activity_key='concept',timestamp_key='time')
              df_all.append(df)

         self.el = pm4py.convert_to_event_log(pd.concat(df_all,ignore_index=True))


    def prepare_dfg(self):
         self.dfg,self.dfg_im,self.dfg_fm = pm4py.discover_dfg(self.el)

    def view_dfg(self):
         if self.dfg:
              return pm4py.view_dfg(self.dfg,self.dfg_im,self.dfg_fm)
