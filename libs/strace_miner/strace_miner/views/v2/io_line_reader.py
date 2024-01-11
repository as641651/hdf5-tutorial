
from ...core.strace_line_reader import StraceLineReader

class IOLineReaderV2(StraceLineReader):
    def __init__(self):
        super().__init__()
       

    def parse_call_attrs(self,call):
        bytes = 0
        if call == 'read':
            pattern = r'read\((.*?)\)[^)]*$'
            ret = self.match_pattern(pattern).split(',')
            bytes = int(ret[-1])
        elif call == 'write':
            pattern = r'write\((.*?)\)[^)]*$'
            ret = self.match_pattern(pattern).split(',')
            bytes = int(ret[-1])

        if bytes == 0:
            val = '0'
        elif bytes < 1024*4:
            val = '[<4KB]'
        elif bytes < 1024*1024*4:
            val = '[<4MB]'
        else:
            val = '[>4MB]'
        return [val,]

            
