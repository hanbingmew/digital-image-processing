function g = endpoint( f )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
persistent lut;
if(isempty(lut))
    lut=makelut(@endpoint_fcm,3);
end
g=applylut(f,lut);

end