from graphviz import Digraph

class DFGVisualizerV1:
    def __init__(self,dfg,im,fm,events_summary):
        self.dfg = dfg
        self.im = im
        self.fm = fm
        self.df = events_summary
        self.events = list(self.df['event'])

        self.event_attrs = self._prepare_event_attr()
        self.event_colors = self._prepare_event_colors()
        self.penwidths = self._prepare_penwidth_edges()

        self.digraph = self._prepare_digraph()

    def _prepare_event_attr(self):
        event_attr = {}
        for event in self.events:
            rec = self.df[self.df['event']==event]
            count = rec['count'].values[0]
            mp = rec['max_parallel'].values[0]
            io_p = rec['io_percent'].values[0]/100.0
            event_attr[event] = "{}/{}/{:.2f}".format(count,mp,io_p)
        return event_attr
    
    def _get_color(self,trans_count, min_trans_count, max_trans_count):
        trans_base_color = int(255 - 100 * (trans_count - min_trans_count) / (max_trans_count - min_trans_count + 0.00001))
        trans_base_color_hex = str(hex(trans_base_color))[2:].upper()
        return "#" + trans_base_color_hex + trans_base_color_hex + "FF"
    
    def _prepare_event_colors(self):
        event_colors = {}
        for k,v in self.event_attrs.items():
            val = float(v.split('/')[-1])
            event_colors[k] = self._get_color(val,0.0,1.0)
        return event_colors
    
    def _get_width(self,val,min_,max_):
        MAX_EDGE_PENWIDTH_GRAPHVIZ = 2.6
        MIN_EDGE_PENWIDTH_GRAPHVIZ = 1.0
        width =  MIN_EDGE_PENWIDTH_GRAPHVIZ + (MAX_EDGE_PENWIDTH_GRAPHVIZ - MIN_EDGE_PENWIDTH_GRAPHVIZ) * (
                val - min_) / (max_ - min_ + 0.00001)
        return str(width)
    
    def _prepare_penwidth_edges(self):
        vals = []
        for _,v in self.dfg.items():
            vals.append(v)
        max_ = max(vals)
        min_ = min(vals)
        
        penwidth_edges = {}
        for k,v in self.dfg.items():
            width = self._get_width(v,min_,max_)
            penwidth_edges[k] = width
        return penwidth_edges
    
    def _prepare_digraph(self):
        graph = Digraph(strict=True, engine='dot',format='png')
        graph.attr(rankdir='LR')
        start = "<&#9679;>"
        end = "<&#9632;>"

        graph.node_attr['shape'] = 'box'
        graph.node(start, shape='circle', fontsize="30")
        for event in self.events:
            attr_str = self.event_attrs[event]
            label = "{}\n({})".format(event.strip(),attr_str)
            graph.node(event,label=label,style='filled',fillcolor=self.event_colors[event],fontsize='12')
        graph.node(end, shape='doublecircle', fontsize="30")

        for event,val in self.im.items():
            graph.edge(start,event,label=str(val))    

        for edge,label in self.dfg.items():
            if 'port' in edge[0]:
                print(edge[0])
            graph.edge(edge[0],edge[1],label=str(label),penwidth=self.penwidths[edge])


        for event,val in self.fm.items():
            if 'port' in event:
                print(event)
            graph.edge(event,end,label=str(val))

        return graph

    def view_in_jupyter(self):
        from IPython.display import Image
        image = Image(self.digraph.render())
        from IPython.display import display
        display(image) 
