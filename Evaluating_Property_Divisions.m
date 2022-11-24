% PropertyNames={'306 W Jackson',' '}
ProxyNames={'1st_property';'2nd_property';'3rd_property';'4th_property';'5th_property';'6th_property';'7th_property';'8th_property';'9th_property'};
Values=[91500,30000,130253,124666,85437,71666,119900,66333,101725]';
Properties=table(ProxyNames,Values)
sum(Values)

firstGroups=nchoosek(Values,3)
L=length(Values);
secondProxy=zeros(length(firstGroups),6);
z=zeros(length(firstGroups),L);
for i=1:length(firstGroups)
   q=firstGroups(i,:)';
   for k=1:9
      for n=1:3
      if(Values(k)==q(n))
          z(i,k)=1;
      end
      end
   end
   curr=z(i,:);
   curr=logical(curr);
   secondProxy(i,:)=Values(~curr);
end
secondProxy
    secondGroups=zeros(length(firstGroups),20,3);
secondChoices=zeros(length(firstGroups),20,3);
for i=1:length(firstGroups)
   
   q=secondProxy(i,:)';
   secondGroups(i,:,:)=nchoosek(q,3);
   for p=1:20
   for k=1:6
      for n=1:3
        if(secondGroups(i,p,n)==q(k))
          z(i,p,k)=1;
        else
          z(i,p,k)=0;
        end
      end
   end
  
   curr=z(i,p,:);
   curr=logical(curr);
   
   secondChoices(i,p,:)=q(~curr);
   end
end

