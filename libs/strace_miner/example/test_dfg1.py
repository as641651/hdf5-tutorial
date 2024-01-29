from strace_miner.miner import IOMinerV4
from strace_miner.preprocessor import IOLineReaderV2
from strace_miner.visualization import DFGVisualizerV1

if __name__=="__main__":
    st_logs = ['logs/sms.st',]
    io_calls = ['read','write']
    line_reader = IOLineReaderV2(collapse=False)
    sta = IOMinerV4(st_logs,io_calls,line_reader)
    sta.preprocess()
    sta.prepare_summaries_and_event_log()
    sta.prepare_dfg()
    dfg_vis = DFGVisualizerV1(sta.dfg,sta.dfg_im,sta.dfg_fm, sta.activities_summary)
    dfg_vis.digraph.render('graph/dfg.html')
