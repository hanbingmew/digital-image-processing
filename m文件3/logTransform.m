function [g] = logTransform( f,varargin)
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
[f,revertclass]=tofloat(f);
if(numel(varargin)==0)
    c=1.0;
else if(numel(varargin)==1)
        c=varargin{1};
    end
end
if(numel(varargin)==2 && strcmp(varargin{2},'uint8'))
            c=varargin{1};revertclass=@im2uint8;
        else if(numel(varargin)==2 && strcmp(varargin{2},'uint16'))
                c=varargin{1};revertclass=@im2uint16;
            else error('unsupported class option for log method')
            end
end
            
g=c*(log(1+f));
g=revertclass(g);

end

