clear all
close all
input=imread('Fig0222(c)(crowd).tif'); 
% input=imread('Fig0222(a)(face).tif');
% input=imread('Fig0222(b)(cameraman).tif');
%%%%%%%%%%%%%%%%%%%%%
% input=zeros(256,256);
%  for i=1:256
%     input(:,i)=(i-1)*ones(256,1);
%  end
% input=uint8(input);
%%%%%%%%%%%%%%%%%%%%
figure(1)
imshow(input)
%
[m, n]=size(input); 
% m2=double(m)/(8.5*96);  
% n2=double(n)/(11*96);

m2=double(m)/(272);  %272/8.5=32
n2=double(n)/(352);%352/11=32

scale = max(m2, n2); 
if(scale>1)
    input=imresize(input,1/scale ); 
end

[m1,n1]=size(input);     % 获取图片大小
level=fix(double(input)/25.6);  % 四舍五入。灰度级减小到10灰度级，取整数形式。
output=zeros(m1*3, n1*3);  % 创建新图片

change(:,:,1)=[0 0 0;0 0 0;0 0 0];
change(:,:,2)=[0 255 0;0 0 0;0 0 0];
change(:,:,3)=[0 255 0;0 0 0;0 0 255];
change(:,:,4)=[255 255 0;0 0 0;0 0 255];
change(:,:,5)=[255 255 0;0 0 0;255 0 255];
change(:,:,6)=[255 255 255;0 0 0,;255 0 255];
change(:,:,7)=[255 255 255;0 0 255,;255 0 255];
change(:,:,8)=[255 255 255;0 0 255;255 255 255];
change(:,:,9)=[255 255 255;255 0 255;255 255 255];
change(:,:,10)=[255 255 255;255 255 255;255 255 255];

for i=1:m1
   for j=1:n1
      a1=level(i, j);  % 去除灰度级
      output((i-1)*3+1:i*3,(j-1)*3+1:j*3)=change(:,:,a1+1);
   end
end
output=uint8(output);
figure(2)
imshow(output)