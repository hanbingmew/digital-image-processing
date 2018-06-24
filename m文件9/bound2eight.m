function rc_new = bound2eight( rc )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
if size(rc,1)<=3
    rc_new=rc;
    return;
end
rc_new=rc(1:end-1,:);

remove_locations=compute_remove_locations(rc_new);
remove_locations=remove_locations & (rem(rc_new(:,1),2)==0) & (rem(rc_new(:,2),2)==0);
rc_new(remove_locations,:)=[];
remove_locations=compute_remove_locations(rc_new);
remove_locations=remove_locations & (rem(rc_new(:,1),2)==0) & (rem(rc_new(:,2),2)==1);
rc_new(remove_locations,:)=[];
remove_locations=compute_remove_locations(rc_new);
remove_locations=remove_locations & (rem(rc_new(:,1),2)==1) & (rem(rc_new(:,2),2)==0);
rc_new(remove_locations,:)=[];
remove_locations=compute_remove_locations(rc_new);
remove_locations=remove_locations & (rem(rc_new(:,1),2)==1) & (rem(rc_new(:,2),2)==1);
rc_new(remove_locations,:)=[];
rc_new=[rc_new;rc_new(1,:)];
end

