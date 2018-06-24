function [ out ,revertclass ] = tofloat( in )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
identity=@(x) x;
tosingle=@im2single;
table={'uint8',tosingle,@im2uint8
    'uint16',tosingle,@im2uint16
    'int16',tosingle,@im2int16
    'logical',tosingle,@logical
    'double',identity,identity
    'single',identity,identity};
classindex=find(strcmp(table(:,1),class(in)));
if isempty(classindex)
    error('unsupported input image class');
end
out=table{classindex,2}(in);
revertclass=table{classindex,3};

end

