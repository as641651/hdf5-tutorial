
from ...core.preprocessor import Preprocessor
import pandas as pd

class IOPreprocessor(Preprocessor):
    def __init__(self, strace_log_path,filtered_calls):
        super().__init__(strace_log_path)
        self.filtered_calls = filtered_calls
    
    def process(self,df):
        summary,df = self.get_summary(df)
        return summary,df

    def get_summary(self,df):
        summary = self.get_time_summary(df)

        if self.filtered_calls: 
            ## Filter the io_calls and find the time spent on io
            df = df[df['call'].isin(self.filtered_calls)]
            io_time = df['duration'].sum()
            summary.append(['IO time',io_time,(io_time/self.total_time)*100.0, (io_time/self.sys_time)*100.0])

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
    
