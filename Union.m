%��ͼ
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

%����е�60���ڵ�
before60=zeros(7,10,60);
for i=1:60
    row=R(i,:);
    k=reshape(row,10,7);
    before60(:,:,i)=k';
end
for j=1:60
    %
    %�����������ǵĻ�ͼ����
    %
    
    surf(xx,yy,before60(:,:,j));
    %colorbar;
    caxis([0,31]);
    view(0,-90);
    M(j) = getframe;
end
movie(M,4)
movie2avi(M, 'C:\Users\yanli0618\Desktop\�Բ�\������Ŀ\�հ׵�ˮ������\Before2.avi', 'compression', 'None','FPS',2);






%��͸ʱʱ��ڵ�i>60
line=input('��������Ҫ������');
after60=zeros(7,10,line);
for i=1:line
    j=i+60;
    row=R(j,:);
    k=reshape(row,10,7);
    after60(:,:,i)=k';
end


for j=1:line-60
    %
    %�����������ǵĻ�ͼ����
    %
    
    surf(xx,yy,after60(:,:,j));
    %colorbar;
    caxis([0,31]);
    view(0,-90);
    M6(j) = getframe;
end
movie(M6,4)
movie2avi(M6, 'C:\Users\yanli0618\Desktop\�Բ�\������Ŀ\�հ׵�ˮ������\After2.avi', 'compression', 'None','FPS',10);