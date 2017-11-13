function [u,uAccu,squareDev,LinfDev,h_size,t]=CN(a,tao,h1,h2,n1)
%Ut=div(div u)
%��ɢϵ��a��ʱ�䲽��tao,x���򲽳�h1,y���򲽳�h2,
%h1=1/m;
m=1/h1;
% h2=1/n;
n=1/h2;
r=(a*tao)/(h1*h2);%
knots=(m+1)*(n+1);%�ڵ����
u0=[];%���ڴ����ֵ

for j=1:m+1
    for k=1:n+1
        u0(j,k)=example1((j-1)*h1,(k-1)*h2,0);
    end
end

%%%%%%%%%%%%%%%%%%%%
%�γ�ϵ��������Ҷ���
A=sparse(knots,knots);
for i=1:knots
    A(i,i)=1;
end
B=sparse(knots,1);
%solution=sparse(zeros(knots,1));
%�߽�ֵ��Ӧϵ������A
%�߽�x=0                                B��������
for j=1:n+1
    i=j;
    A(i,i)=1;
end
%�߽�x=1
for j=1:n+1
    i=m*(n+1)+j;
    A(i,i)=1;
end

%�߽�y=0
for j=1:m+1
    i=(j-1)*(n+1)+1;
    A(i,i)=1;
    A(i,i+1)=-1;
end
%�߽�y=1
for j=1:m+1
    i=j*(n+1);
    A(i,i)=1;
    A(i,i-1)=-1;
end


%�ڵ���
%����ϵ������
for j=2:m
    for k=2:n
        i=(j-1)*(n+1)+k;
        A(i,i)=1+2*r;
        A(i,i-1)=-r/2;
        A(i,i+1)=-r/2;
        A(i,i-(n+1))=-r/2;
        A(i,i+(n+1))=-r/2;
    end
end
%%%%%%%%%%%%%%%%%%%
%��ʼ��������

for t=1:n1
    for j=2:m
        for k=2:n
            i=(j-1)*(n+1)+k;
            %�����Ҷ���
            B(i)=r/2*(u0(j+1,k)+u0(j,k+1)+u0(j-1,k)+u0(j,k-1))+(1-2*r)*u0(j,k);
        end
    end
    %�߽�x=0  
    for j=1:n+1
        i=j;
        B(i)=LeftB(0,j*h2,t);
    end
    %�߽�x=1
    for j=1:n+1
        i=m*(n+1)+j;
        B(i)=RightB(1,j*h2,t);
    end
    
    %�߽�y=0
    for j=1:m+1
        i=(j-1)*(n+1)+1;
        B(i)=LowB(j*h1,0,t);
    end
    %�߽�y=1
    for j=1:m+1
        i=j*(n+1);
        B(i)=UpB(j*h1,1,t);
    end
    %Jacobi(A,B,u0);
    
    solution=bicgstab(A,B,1.0e-6,400);
    %     [solution,more(1,t),more(2,t),more(3,t)]=bicgstab(A,B,1.0e-6,400);
    %     more
    %��һά����ı�ɶ�ά
    for j=1:m+1
        for k=1:n+1
            i=(j-1)*(n+1)+k;
            u(j,k)=solution(i);
        end
    end
    u0=u;
end
t=n1*tao;
h_size=[h1,h2];
% u-u0;

%���㾫ȷ��
for j=1:m+1
    for k=1:n+1
        uAccu(j,k)=example1((j-1)*h1,(k-1)*h2,n1*tao);%%%%%%%%
    end
end
squareDev=errorCN(u,uAccu,m,n,knots);%L2���
LinfDev=errorCN_inf(u,uAccu,1/h1,1/h2,knots);%Linf���

end