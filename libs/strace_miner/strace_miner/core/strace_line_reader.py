import re

class StraceLineReader:
    def __init__(self):
        self.line = ""
        self.reg = {}

    def set_line(self,line):
        self.line = line

    def match_pattern(self,pattern):
        match = re.search(pattern, self.line)
        return match.group(1)

    def get_tid_time(self,attrs):
        tid = int(attrs[0])
        time = attrs[1]
        return [tid,time]

    def get_duration(self, attrs):
        dur = attrs[-1][1:-1]
        try:
            dur=float(dur)
        except ValueError:
            dur=-2.0
        return dur

    def parse_call_attrs(call,unfinished,resumed,error=False):
        return []

    def _get_combined_list(self,a,b):
        return [x if x is not None else y for x, y in zip(a, b) if x is not None or y is not None]

    def process_line(self,line):
        self.set_line(line)
        attrs = line.strip().split()
        tid,time = self.get_tid_time(attrs)
        if '<unfinished' in attrs:
            call = attrs[4].split('(')[0]
            call_attrs = self.parse_call_attrs(call,True,False)
            self.reg['{}_{}'.format(tid,call)] = [time,]+call_attrs 
            ret = None
        elif 'resumed>)' in attrs:
            call = attrs[5]
            rid = '{}_{}'.format(tid,call)
            if rid in self.reg.keys():
                tmp = self.reg[rid]
                time = tmp[0]
                tmp2 =  self.parse_call_attrs(call,False,True)
                call_attrs = self._get_combined_list(tmp[1:],tmp2)
                #call_attrs = tmp[1:] + self.parse_call_attrs(call,False,True)
                self.reg.pop(rid)
                dur = self.get_duration(attrs)
                ret = [tid,call,time,dur]+call_attrs
            else:
                call_attrs = self.parse_call_attrs(call,False,False,error=True)
                ret = [tid,call,time,-1.0]+call_attrs
        else:
            call = attrs[4].split('(')[0]
            call_attrs = self.parse_call_attrs(call,False,False)
            dur = self.get_duration(attrs)
            ret = [tid,call,time,dur]+call_attrs
        return ret  
