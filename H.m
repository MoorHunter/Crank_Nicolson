
%误差分析
H=[0.1 0.05 0.025 0.0125 0.00625 0.003125];
% H=[0.1 0.09 0.08 0.07 0.06 0.05];
%CN(a,tao,h1,h2,n1);
    
% tao=[0.1 0.05 0.025 0.0125 0.00625 0.003125];
tao=0.005;
n1=100;
a=1/16;

[u1,u01,squareDev1,LinfDev1,h1_size,t1]=CN(a,tao,H(1),H(1),n1);
[u2,u02,squareDev2,LinfDev2,h2_size,t2]=CN(a,tao,H(2),H(2),n1);
[u3,u03,squareDev3,LinfDev3,h3_size,t3]=CN(a,tao,H(3),H(3),n1);
[u4,u04,squareDev4,LinfDev4,h4_size,t4]=CN(a,tao,H(4),H(4),n1);
[u5,u05,squareDev5,LinfDev5,h5_size,t5]=CN(a,tao,H(5),H(5),n1);
%  [u6,u06,squareDev6,LinfDev6,h6_size,t6]=CN(a,tao(6),H(6),H(6),n1);

ordersquare=zeros(1,5);
ordersquare(1)=log(squareDev1/squareDev2)/log(2);
ordersquare(2)=log(squareDev2/squareDev3)/log(2);
ordersquare(3)=log(squareDev3/squareDev4)/log(2);
ordersquare(4)=log(squareDev4/squareDev5)/log(2);
% ordersquare(5)=log(squareDev5/squareDev6)/log(2);
o(1)=squareDev1/squareDev2;
o(2)=squareDev2/squareDev3;
o(3)=squareDev3/squareDev4;
o(4)=squareDev4/squareDev5;

orderLinf=zeros(1,5);

orderLinf(1)=log(LinfDev1/LinfDev2)/log(2);
orderLinf(2)=log(LinfDev2/LinfDev3)/log(2);
orderLinf(3)=log(LinfDev3/LinfDev4)/log(2);
orderLinf(4)=log(LinfDev4/LinfDev5)/log(2);
% orderLinf(4)=log(LinfDev5/LinfDev6)/log(2);

m(1)=LinfDev2/LinfDev1;
m(2)=LinfDev3/LinfDev2;
m(3)=LinfDev4/LinfDev3;
m(4)=LinfDev5/LinfDev4;


for j=1:8
    for k=1:8
        ue(j,k)=u04(j*10,k*10);%精确解
        uee(j,k)=u4(j*10,k*10);%差分解
    end
end
