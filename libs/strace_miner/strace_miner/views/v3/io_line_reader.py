
from ...core.strace_line_reader import StraceLineReader

class IOLineReaderV3(StraceLineReader):
    def __init__(self,prefixes=None,collapse=False):
        super().__init__()
        self.prefixes = prefixes
        self.collapse = collapse    

    def get_bytes(self,call):
        if not call in ['read','write']:
            return '0'
        pattern = r'{}\((.*?)\)[^)]*$'.format(call)
        ret = self.match_pattern(pattern).split(',')
        bytes = int(ret[-1])

        if bytes < 1024*4:
            val = '[<4KB]'
        elif bytes < 1024*1024*4:
            val = '[<4MB]'
        else:
            val = '[>4MB]'
        
        return val
    
    def _get_concise_path(self,path,file_name=False):
        components = path.split('/')
        if len(components) < 3:
            pass
        else:
            path = "/{}/{}".format(components[1],components[2])
            if file_name:
                if len(components)>3:
                    path = path + ".../{}".format(components[-1])
        return path
    
    def get_fs(self,call):
        if not call in ['read','write']:
            return ' '
        
        pattern = r'<(.*?)>' 
        val = self.match_pattern(pattern)

        if not self.collapse:
            path = self._get_concise_path(val)
        else:
            path = " "
        if self.prefixes:
            for prefix in self.prefixes:
                if prefix in val:
                    path = self._get_concise_path(val,file_name=True)
        return path                    



    def parse_call_attrs(self,call):
        bytes = self.get_bytes(call)
        fs = self.get_fs(call)
        return [bytes,fs]
