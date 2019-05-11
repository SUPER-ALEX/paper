function f=variation_cross_operator(Pff,Pfirst,Pcc,iter,Gmax)
 for i=1:size(Pff,1)
        indexpff=randperm(size(Pff,1));
        indexpfir=randperm(size(Pfirst,1));
        if size(Pcc,1)>=1
            if rand<=(0.5-0.2*iter/Gmax)
                indexpcc=randperm(size(Pcc,1));
                V(i,:)=Pff(indexpff(1),:)+F*(Pcc(indexpcc(1),:)-Pff(indexpff(2),:))+F*(Pff(indexpff(4),:)-Pff(indexpff(5),:));
            else
              V(i,:)=Pff(indexpff(1),:)+F*(Pfirst(indexpfir(1),:)-Pff(indexpff(2),:))+F*(Pff(indexpff(4),:)-Pff(indexpff(5),:));  
            end
        else
            V(i,:)=Pff(indexpff(1),:)+F*(Pfirst(indexpfir(1),:)-Pff(indexpff(2),:))+F*(Pff(indexpff(4),:)-Pff(indexpff(5),:));
        end
        for j=1:5
            if rand<=CR
                U(i,j)=V(i,j);
            else
                U(i,j)=Pff(i,j);
            end
        end
        for j=1:5
            if U(i,j)<xmin(j)
                U(i,j)=xmin(j)+0.5*rand*(xmax(j)-xmin(j));
                %U(i,j)=xmin(j);
                %U(i,j)=xmin(j)+rand*(xmax(j)-xmin(j));
            elseif U(i,j)>xmax(j)
                U(i,j)=xmin(j)+(0.5*rand+0.5)*(xmax(j)-xmin(j));
                %U(i,j)=xmax(j);
                %U(i,j)=xmin(j)+rand*(xmax(j)-xmin(j));
            end
        end
    end
