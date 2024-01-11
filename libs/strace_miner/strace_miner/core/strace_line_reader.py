import re


class StraceLineReader:
    def __init__(self):
        self.line = ""

    def set_line(self,line):
        self.line = line

    def match_pattern(self,pattern):
        match = re.search(pattern, self.line)
        return match.group(1)

    def parse_attrs(self):
        attrs = self.line.strip().split()
        time = attrs[0]
        dur = attrs[-1][1:-1]
        try:
            dur=float(dur)
        except ValueError:
            dur=0.0
        call = attrs[3].split('(')[0]
        
        ret = [call,time,dur]
            #print(ret)
        return ret

    def parse_call_attrs(self,call):
        pass        
