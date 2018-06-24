function test(varargin)
disp(['nargin is ' num2str(nargin)])
for v=1:numel(varargin)
disp(['varargin{' num2str(v) '} class is ' class(varargin{v})])

end

