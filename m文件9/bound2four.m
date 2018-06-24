function rc_new = bound2four( rc )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
if size(rc,1)>1
    rc1=[rc(end-1,:);rc];
    done=0;
    while ~done
        d=diff(rc1,1);
        diagonal_locations=all(d,2);
        double_diagonal=diagonal_locations(1:end-1) & diff(diagonal_locations,1)==0;
        double_diagonal_idx=find(double_diagonal);
        turn= ~all(d(double_diagonal_idx,:)==d(double_diagonal_idx+1,:),2);
        turn_idx=double_diagonal_idx(turn);
        if isempty(turn_idx)
            done=1;
        else 
            first_turn=turn_idx(1);
            rc1(first_turn+1,:)=(rc1(first_turn,:)+rc1(first_turn+2,:))./2;
            if first_turn==1
                rc1(end,:)=rc1(2,:);
            end
        end
    end
    rc1=rc1(2:end,:);
end

rowdif=diff(rc1(:,1),1);
coldif=diff(rc1(:,2),1);
insert=rowdif & coldif;
num_old=size(rc1,1);
num_new=num_old+sum(insert);
rc_new=zeros(num_new,2);
idx_old=[1:num_old]'+[0;cumsum(insert)];
rc_new(idx_old,:)=rc1;
new_offset=[0 1;-1 0;1 0;0 -1];
offset_code=round(2*(-0.5*rowdif(insert)+0.25*coldif(insert)+1.25));
rc2=rc1(2:end,:);
insert_cordinate=rc2(insert,:)+new_offset(offset_code,:);
insert_location=zeros(num_new,1);
insert_location(idx_old)=1;
insert_location=~insert_location;
rc_new(insert_location,:)=insert_cordinate;

            
    

end

