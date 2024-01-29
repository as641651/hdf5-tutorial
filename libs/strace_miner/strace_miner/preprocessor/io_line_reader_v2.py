
from ..preprocessor.io_line_reader_v1 import IOLineReaderV1

class IOLineReaderV2(IOLineReaderV1):
    def __init__(self,prefixes=None,collapse=False):
        super().__init__()
        self.prefixes = prefixes
        self.collapse = collapse    

    
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


    def parse_call_attrs(self,call,unfinished,resumed,error=False):
        if error or call not in ['read','write']:
            if not unfinished:
                return ['0', ' ']
            else:
                return [None,None]
            
        bytes = self.get_bytes(call,unfinished,resumed)
        if not resumed:
            fs = self.get_fs(call)
        else:
            fs = None
        return [bytes,fs]
