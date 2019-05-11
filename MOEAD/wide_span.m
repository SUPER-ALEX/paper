function f=wide_span(D, E, M, V)

SUM=0;
for i=1:M
    fi_max=0;
    fi_min=0;
    true_max=0;
    true_min=0;
    max_val=0;
    min_cal=0;
    
    fi_max=max(D(:,V+i));
    fi_min=min(D(:,V+i));
    true_max=max(E(:,V+i));
    true_min=min(E(:,V+i));
    max_val=min(fi_max,true_max);
%     min_val=max(fi_min,true_min);
    min_val=min(fi_min,true_min);
    
%     SUM=SUM+(min(fi_max,true_max)-max(fi_min,true_min))./(true_max-true_min);
%     SUM=SUM+(fi_max-fi_min)./(true_max-true_min);
    SUM=SUM+((max_val-min_val)./(true_max-true_min)).^2;
end
f=sqrt(SUM./M);
    