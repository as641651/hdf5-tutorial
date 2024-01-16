
from ...core.strace_line_reader import StraceLineReader

class IOLineReaderV2(StraceLineReader):
    def __init__(self):
        super().__init__()


    def get_bytes(self,call,unfinished,resumed):
        
        if call=='write':
            if unfinished:
                pattern = r'{}\((.*?)\<[^<]*$'.format(call)
                ret = self.match_pattern(pattern).split(',')
                bytes = int(ret[-1])
            elif resumed:
                return None
            else:
                pattern = r'{}\((.*?)\)[^)]*$'.format(call)
                ret = self.match_pattern(pattern).split(',')
                bytes = int(ret[-1])

        if call=='read':
            if resumed:
                bytes = int(self.line.split()[-4][:-1])
            elif unfinished:
                return None
            else:
                pattern = r'{}\((.*?)\)[^)]*$'.format(call)
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

        return val
       

    def parse_call_attrs(self,call,unfinished,resumed,error=False):
        if error or call not in ['read','write']:
            if not unfinished:
                return ['0',]
            else:
                return [None,]
            
        val = self.get_bytes(call,unfinished,resumed)
        return [val,]
