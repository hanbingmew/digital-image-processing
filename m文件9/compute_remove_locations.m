function remove = compute_remove_locations( rc )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
rc_1=[rc(2:end,:);rc(1,:)];
diff=rc_1-rc;
diff_1=[diff(2:end,:);diff(1,:)];
dotprod=sum(diff.*diff_1,2);
remove= ~all(diff,2) & (dotprod==0);
remove=[remove(end,:);remove(1:end-1,:)];
    
end

