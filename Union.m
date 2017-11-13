%作图
h1=0.2;
a1=0;
a2=0;
b1=1.8;
b2=1.2;
x=a1:h1:b1;
y=a2:h1:b2;
[xx,yy]=meshgrid(x,y);
figure;
surf(xx,yy,after60(:,:,2));
colorbar;
caxis([0,31]);
view(0,-90)

%灌溉中的60各节点
before60=zeros(7,10,60);
for i=1:60
    row=R(i,:);
    k=reshape(row,10,7);
    before60(:,:,i)=k';
end
for j=1:60
    %
    %这里输入我们的绘图命令
    %
    
    surf(xx,yy,before60(:,:,j));
    %colorbar;
    caxis([0,31]);
    view(0,-90);
    M(j) = getframe;
end
movie(M,4)
movie2avi(M, 'C:\Users\yanli0618\Desktop\苍苍\创新项目\空白地水分运移\Before2.avi', 'compression', 'None','FPS',2);






%渗透时时间节点i>60
line=input('请输入需要的行数');
after60=zeros(7,10,line);
for i=1:line
    j=i+60;
    row=R(j,:);
    k=reshape(row,10,7);
    after60(:,:,i)=k';
end


for j=1:line-60
    %
    %这里输入我们的绘图命令
    %
    
    surf(xx,yy,after60(:,:,j));
    %colorbar;
    caxis([0,31]);
    view(0,-90);
    M6(j) = getframe;
end
movie(M6,4)
movie2avi(M6, 'C:\Users\yanli0618\Desktop\苍苍\创新项目\空白地水分运移\After2.avi', 'compression', 'None','FPS',10);