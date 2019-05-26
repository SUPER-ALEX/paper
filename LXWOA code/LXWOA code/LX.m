function  [X F Fbest Lbest]=LX(X,F,Fbest,Lbest,fobj,N,dim,low,up)
%[Positions fitness Leader_score Leader_pos]=LX(Positions,fitness,Leader_score,Leader_pos,fobj,SearchAgents_no,dim,lb,ub)
    [k r]=max(F);
    r2=round(N*rand);
    if r2<1 
        r2=1;
    elseif r2>30
        r2=30;
    end
    x1=Lbest;k1=Fbest;
    x2=X(r2,:);k2=F(r2);
    [y1 y2]=LXvector(x1,x2,low,up,dim);
    fy1=fobj(y1);
    fy2=fobj(y2);
    
    if fy1<k
        F(r)=fy1;X(r,:)=y1;
        [k r]=max(F);
        if fy2<k
            X(r,:)=y2;F(r)=fy2;
        end
    elseif fy2<k
        F(r)=fy2;X(r,:)=y2;
    end
  %---------------------------  
    if fy1<Fbest
        Fbest=fy1;Lbest=y1;
    end
    if fy2<Fbest
        Fbest=fy2;Lbest=y2;
    end
end