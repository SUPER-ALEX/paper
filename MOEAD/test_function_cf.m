function obandcon=cf1tocf10(X,testNo)
%cf1
if testNo==1
    N=10;a=1;n=10;
    %0<=Xi<=1;
    odd=[3:2:n];even=[2:2:n];
    f1=X(1)+2/length(odd)*sum((X(odd)-X(1).^(0.5*(1+3*(odd-2)/(n-2)))).^2);
    f2=1-X(1)+2/length(even)*sum((X(even)-X(1).^(0.5*(1+3*(even-2)/(n-2)))).^2);
    temp=f1+f2-a*abs(sin(N*pi*(f1-f2+1)))-1;
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end
%cf2
if testNo==2
    N=2;a=1;n=10;
    %0<=X1<=1;-1<=Xi<=1;
    odd=[3:2:n];even=[2:2:n];
    f1=X(1)+2/length(odd)*sum((X(odd)-sin(6*pi*X(1)+odd*pi/n)).^2);
    f2=1-sqrt(X(1))+2/length(even)*sum((X(even)-cos(6*pi*X(1)+even*pi/n)).^2);
    t=f2+sqrt(f1)-a*sin(N*pi*(sqrt(f1)-f2+1))-1;
    temp=t/(1+exp(4*abs(t)));
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end
%cf3
if testNo==3
    N=2;a=1;n=10;
    %0<=X1<=1;-1<=Xi<=1;
    odd=[3:2:n];even=[2:2:n];
    y1=X(odd)-sin(6*pi*X(1)+odd*pi/n);
    y2=X(even)-sin(6*pi*X(1)+even*pi/n);
    f1=X(1)+2/length(odd)*(4*sum(y1.^2)-2*prod(cos(20*y1*pi./(sqrt(odd))))+2);
    f2=1-X(1)^2+2/length(even)*(4*sum(y2.^2)-2*prod(cos(20*y2*pi./(sqrt(even))))+2);
    t=f2+sqrt(f1)-a*sin(N*pi(sqrt(f1)-f2+1))-1;
    temp=t/(1+exp(4*abs(t)));
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end
%cf4
if testNo==4
    n=10;
    %0<=X1<=1;-2<=Xi<=2;
    odd=[3:2:n];even=[2:2:n];
    y1=X(odd)-sin(6*pi*X(1)+odd*pi/n);
    y2=X(even)-sin(6*pi*X(1)+even*pi/n);
    if y2(1)<1.5*(1-sqrt(2)/2)
        f1=X(1)+sum(y1.^2);
        f2=1-X(1)+abs(y2(1))+sum(y2(2:end).^2);
    else
        f1=X(1)+sum(y1.^2);
        f2=1-X(1)+0.125+(y2(1)-1)^2+sum(y2(2:end).^2);
    end
   
    t=X(2)-sin(6*pi*X(1)+2*pi/n)-0.5*X(1)+0.25;
    temp=t/(1+exp(4*abs(t)));
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end

%cf5
if testNo==5
    n=10;
    %0<=X1<=1;-2<=Xi<=2;
    odd=[3:2:n];even=[2:2:n];
    y1=X(odd)-0.8*X(1)*cos(6*pi*X(1)+odd*pi/n);
    y2=X(even)-0.8*X(1)*sin(6*pi*X(1)+even*pi/n);
    if y2(1)<1.5*(1-sqrt(2)/2)
        f1=X(1)+sum(y1.^2);
        f2=1-X(1)+abs(y2(1))+sum(y2(2:end).^2);
    else
        f1=X(1)+sum(2*y1.^2-cos(4*pi*(y1))+1);
        f2=1-X(1)+0.125+(y2(1)-1)^2+sum(2*y2(2:end).^2-cos(4*pi*y2(2:end)+1));
    end
    temp=X(2)-0.8*sin(6*pi*X(1)+2*pi/n)-0.5*X(1)+0.25;
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end

%cf6
if testNo==6
    n=10;
    %0<=X1<=1;-2<=Xi<=2;
    odd=[3:2:n];even=[2:2:n];
    y1=X(odd)-0.8*X(1)*cos(6*pi*X(1)+odd*pi/n);
    y2=X(even)-0.8*X(1)*sin(6*pi*X(1)+even*pi/n);
    f1=X(1)+sum(y1.^2);
    f2=(1-X(1))^2+sum(y2.^2);
    sig1=0.5*(1-X(1))-(1-X(1))^2;
    if sig1<0
        temp1=X(2)-0.8*X(1)*sin(6*pi*X(1)+2*pi/n)+sqrt(abs(0.5*(1-X(1))-(1-X(1))^2));
    elseif sig1==0
        temp1=X(2)-0.8*X(1)*sin(6*pi*X(1)+2*pi/n);
    else
        temp1=X(2)-0.8*X(1)*sin(6*pi*X(1)+2*pi/n)-sqrt(abs(0.5*(1-X(1))-(1-X(1))^2));
    end
    sig2=0.25*sqrt(1-X(1))-0.5*(1-X(1));
    if sig2<0
        temp2=X(4)-0.8*X(1)*sin(6*pi*X(1)+4*pi/n)+sqrt(abs(0.25*sqrt(1-X(1))-0.5*(1-X(1))));
    elseif sig2==0
        temp2=X(4)-0.8*X(1)*sin(6*pi*X(1)+4*pi/n);
    else
        temp2=X(4)-0.8*X(1)*sin(6*pi*X(1)+4*pi/n)-sqrt(abs(0.25*sqrt(1-X(1))-0.5*(1-X(1))));
    end
   
    cons=max(-temp1,0)+max(-temp2,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end

%cf7
if testNo==7
    n=10;
    %0<=X1<=1;-2<=Xi<=2;
    odd=[3:2:n];even=[2:2:n];
    y1=X(odd)-cos(6*pi*X(1)+odd*pi/n);
    y2=X(even)-sin(6*pi*X(1)+even*pi/n);
    f1=X(1)+sum(2*y1.^2-cos(4*pi*y1)+1);
    f2=(1-X(1))^2+y2(1)^2+y2(2)^2+sum(2*y2(3:end).^2-cos(4*pi*y2(3:end))+1);
    sig1=0.5*(1-X(1))-(1-X(1))^2;
    
   sig1=0.5*(1-X(1))-(1-X(1))^2;
    if sig1<0
        temp1=X(2)-sin(6*pi*X(1)+2*pi/n)+sqrt(abs(0.5*(1-X(1))-(1-X(1))^2));
    elseif sig1==0
        temp1=X(2)-sin(6*pi*X(1)+2*pi/n);
    else
        temp1=X(2)-sin(6*pi*X(1)+2*pi/n)-sqrt(abs(0.5*(1-X(1))-(1-X(1))^2));
    end
    sig2=0.25*sqrt(1-X(1))-0.5*(1-X(1));
    if sig2<0
        temp2=X(4)-sin(6*pi*X(1)+4*pi/n)+sqrt(abs(0.25*sqrt(1-X(1))-0.5*(1-X(1))));
    elseif sig2==0
        temp2=X(4)-sin(6*pi*X(1)+4*pi/n);
    else
        temp2=X(4)-sin(6*pi*X(1)+4*pi/n)-sqrt(abs(0.25*sqrt(1-X(1))-0.5*(1-X(1))));
    end
    
    cons=max(-temp1,0)+max(-temp2,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,gg1,cons];
end

%cf8
if testNo==8
    a=4;N=2;n=10;
    %0<=X1,X2<=1;-4<=Xi<=4;
    xuhao1=[4,7,10];xuhao2=[5,8];xuhao3=[3,6,9];
    f1=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao1))*sum((X(xuhao1)-2*X(2)*sin(2*pi*X(1)+xuhao1*pi/n)).^2);
    f2=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao2))*sum((X(xuhao2)-2*X(2)*sin(2*pi*X(1)+xuhao2*pi/n)).^2);
    f3=sin(0.5*X(1)*pi)+2/(length(xuhao3))*sum((X(xuhao3)-2*X(2)*sin(2*pi*X(1)+xuhao3*pi/n)).^2);
    
    temp=(f1^2+f2^2)/(1-f3^2)-a*abs(sin(N*pi*((f1^2-f2^2)/(1-f3^2)+1)))-1;
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,f3,gg1,cons];
end

%cf9
if testNo==9
    a=3;N=2;n=10;
    %0<=X1,X2<=1;-2<=Xi<=2;
    xuhao1=[4,7,10];xuhao2=[5,8];xuhao3=[3,6,9];
    f1=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao1))*sum((X(xuhao1)-2*X(2)*sin(2*pi*X(1)+xuhao1*pi/n)).^2);
    f2=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao2))*sum((X(xuhao2)-2*X(2)*sin(2*pi*X(1)+xuhao2*pi/n)).^2);
    f3=sin(0.5*X(1)*pi)+2/(length(xuhao3))*sum((X(xuhao3)-2*X(2)*sin(2*pi*X(1)+xuhao3*pi/n)).^2);
    temp=(f1^2+f2^2)/(1-f3^2)-a*sin(N*pi*((f1^2-f2^2)/(1-f3^2)+1))-1;
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,f3,gg1,cons];
end

%cf10
if testNo==10
    a=1;N=2;n=10;
    %0<=X1,X2<=1;-4<=Xi<=4;
    xuhao1=[4,7,10];xuhao2=[5,8];xuhao3=[3,6,9];
    y1=X(xuhao1)-2*X(2)*sin(2*pi*X(1)+xuhao1*pi/n);
    y2=X(xuhao2)-2*X(2)*sin(2*pi*X(1)+xuhao2*pi/n);
    y3=X(xuhao3)-2*X(2)*sin(2*pi*X(1)+xuhao3*pi/n);
    f1=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao1))*sum(4*y1.^2-cos(8*pi*y1)+1);
    f2=cos(0.5*X(1)*pi)*cos(0.5*X(2)*pi)+2/(length(xuhao2))*sum(4*y2.^2-cos(8*pi*y2)+1);
    f3=sin(0.5*X(1)*pi)+2/(length(xuhao3))*sum(4*y3.^2-cos(8*pi*y3)+1);
    
    temp=(f1^2+f2^2)/(1-f3^2)-a*sin(N*pi*((f1^2-f2^2)/(1-f3^2)+1))-1;
    
    cons=max(-temp,0);
    if cons>0
        gg1=0;
    else
        gg1=1;
    end
    obandcon=[f1,f2,f3,gg1,cons];
end










