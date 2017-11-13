function [u,uAccu,squareDev,LinfDev,h_size,t]=CN(a,tao,h1,h2,n1)
%Ut=div(div u)
%扩散系数a，时间步长tao,x方向步长h1,y方向步长h2,
%h1=1/m;
m=1/h1;
% h2=1/n;
n=1/h2;
r=(a*tao)/(h1*h2);%
knots=(m+1)*(n+1);%节点个数
u0=[];%用于储存初值

for j=1:m+1
    for k=1:n+1
        u0(j,k)=example1((j-1)*h1,(k-1)*h2,0);
    end
end

%%%%%%%%%%%%%%%%%%%%
%形成系数矩阵和右端项
A=sparse(knots,knots);
for i=1:knots
    A(i,i)=1;
end
B=sparse(knots,1);
%solution=sparse(zeros(knots,1));
%边界值对应系数矩阵A
%边界x=0                                B按列排序
for j=1:n+1
    i=j;
    A(i,i)=1;
end
%边界x=1
for j=1:n+1
    i=m*(n+1)+j;
    A(i,i)=1;
end

%边界y=0
for j=1:m+1
    i=(j-1)*(n+1)+1;
    A(i,i)=1;
    A(i,i+1)=-1;
end
%边界y=1
for j=1:m+1
    i=j*(n+1);
    A(i,i)=1;
    A(i,i-1)=-1;
end


%内点编号
%生成系数矩阵
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
%开始迭代计算

for t=1:n1
    for j=2:m
        for k=2:n
            i=(j-1)*(n+1)+k;
            %生成右端项
            B(i)=r/2*(u0(j+1,k)+u0(j,k+1)+u0(j-1,k)+u0(j,k-1))+(1-2*r)*u0(j,k);
        end
    end
    %边界x=0  
    for j=1:n+1
        i=j;
        B(i)=LeftB(0,j*h2,t);
    end
    %边界x=1
    for j=1:n+1
        i=m*(n+1)+j;
        B(i)=RightB(1,j*h2,t);
    end
    
    %边界y=0
    for j=1:m+1
        i=(j-1)*(n+1)+1;
        B(i)=LowB(j*h1,0,t);
    end
    %边界y=1
    for j=1:m+1
        i=j*(n+1);
        B(i)=UpB(j*h1,1,t);
    end
    %Jacobi(A,B,u0);
    
    solution=bicgstab(A,B,1.0e-6,400);
    %     [solution,more(1,t),more(2,t),more(3,t)]=bicgstab(A,B,1.0e-6,400);
    %     more
    %将一维结果改变成二维
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

%计算精确解
for j=1:m+1
    for k=1:n+1
        uAccu(j,k)=example1((j-1)*h1,(k-1)*h2,n1*tao);%%%%%%%%
    end
end
squareDev=errorCN(u,uAccu,m,n,knots);%L2误差
LinfDev=errorCN_inf(u,uAccu,1/h1,1/h2,knots);%Linf误差

end