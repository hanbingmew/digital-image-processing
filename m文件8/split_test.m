function v = split_test( B,mindim,fun)
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
k=size(B,3);
v(1:k)=false;
for x=1:k
    if size(B(:,:,x),1)<=mindim
        v(x)=false;
        continue;
    end
    if fun(B(:,:,x))==1
            v(x)=true;
    end
end

end

