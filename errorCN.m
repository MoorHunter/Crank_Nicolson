function squareDev=errorCN(u,uAccu,m,n,knots)
Meansqrt=zeros(m+1,n+1);
for i=1:m+1
    for j=1:n+1
        Meansqrt(i,j)=(u(i,j)-uAccu(i,j))^2;
    end 
end
squareDev=sqrt(sum(sum(Meansqrt)))/knots;
end