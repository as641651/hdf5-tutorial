
from abc import ABC, abstractmethod

class StraceAnalyzer(ABC):
    def __init__(self,st_log_paths):
        self.st_log_paths = st_log_paths
        self.st_logs = {}
        self.summaries = {}
        self.el = None

    @abstractmethod
    def process_line(self,line):
        pass

    @abstractmethod
    def preprocess(self,reuse=False):
        pass
    
    @abstractmethod
    def prepare_summaries_and_event_log(self):
        pass
