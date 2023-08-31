function [texture entro]=funextrafeature(I)
% [peatls texture entro bw5]=funextrafeature(I)

I1=imresize(I,[250 250]);
  h=I1(:,:,1);
  s=I1(:,:,2);
  v=I1(:,:,3);
  [row, col]=size(v);
  th=00;
    for i=1:1:row
       for j=1:1:col
          if v(i,j)<th
            v(i,j)=0;
            h(i,j)=0;
            s(i,j)=0;
          end
       end
   end
v1=cat(3,h,s,v);
J = rangefilt(I1);
G=rgb2gray(v1);

% % % % % % % % % % % Extra for GLCM

GLCM2 = graycomatrix(G,'Offset',[2 0;0 2]);
[stats] = GLCM_Features1(GLCM2,1);
features=cell2mat(struct2cell(stats));






%%%%%%%%%%% RGB VALUES%%%%%%%%%%%%%%%%%%%%%%%%%%%%%







R=v1(:,:,1);
G=v1(:,:,2);
B=v1(:,:,3);
  
T=max(R(:));
T1=min(R(:));
range_R=[T,T1];
  
T=max(G(:));
T1=min(G(:));
range_G=[T,T1];
  
T=max(B(:));
T1=min(B(:));
range_B=[T,T1];
fvector=cat(1,range_R,range_G,range_B);

glcm = graycomatrix(h);
ghc = graycoprops(glcm, 'contrast');
ghco= graycoprops(glcm, 'Correlation');
ghe = graycoprops(glcm, 'energy');
ghh= graycoprops(glcm, 'Homogeneity');
eh =entropy(h);
Temp(1,:) = cat(1,ghc.Contrast,ghco.Correlation,ghh.Homogeneity,ghe.Energy);

glcm = graycomatrix(s);
gsc = graycoprops(glcm, 'contrast');
gsco= graycoprops(glcm, 'Correlation');
gse = graycoprops(glcm, 'energy');
gsh= graycoprops(glcm, 'Homogeneity');
es =entropy(s);
Temp(1,:) = cat(1,gsc.Contrast,gsco.Correlation,gsh.Homogeneity,gse.Energy);

glcm = graycomatrix(v);
gvc = graycoprops(glcm, 'contrast');
gvco= graycoprops(glcm, 'Correlation');
gve = graycoprops(glcm, 'energy');
gvh = graycoprops(glcm, 'Homogeneity');
ev =entropy(v);
Temp(1,:) = cat(1,gvc.Contrast,gvco.Correlation,gvh.Homogeneity,gve.Energy);
texture(:,1)=[Temp(1,:),Temp(1,:),Temp(1,:)];
entro(:,1)=[eh,es,ev];

hu1=mean2(h);
v1=double(h);
varh=var(v1);
varh1=cov(varh);
h1=min(h(:));
h2=max(h(:));
reang_h=[h1 h2];

hu2=mean2(v);
v1=double(v);
varv=var(v1);
varv1=cov(varv);
h1=min(v(:));
h2=max(v(:));
reang_v=[h1 h2];

hu3=mean2(s);
v1=double(s);
vars=var(v1);
vars1=cov(vars);
h1=min(s(:));
h2=max(s(:));
reang_s=[h1 h2];
mean1=cat(1,hu1,hu2,hu3);
variance=cat(1,vars1,varv1,varh1);
range=cat(1,reang_h,reang_s,reang_v);

% level=graythresh(G);
% t=0.5529;
% BW=im2bw(G,t);
% se = strel('disk',5);
% bw2 = imdilate(BW,se);
% bw5 = bwmorph(bw2,'clean');
% [L,n]=bwlabel(bw5);
%  
%    for k=1:n
%        [r,c]=find(L==k);
%         rbar=mean(r);
%         cbar=mean(c);
%    end
% 
% s  = regionprops(L, 'all');
% centroids = cat(1, s.Centroid);
% Extremas = cat(1, s.Extrema);
% ConvexHull = cat(1, s.ConvexHull);
% [B,L,N] = bwboundaries(bw5);
%     for k=1:length(B)
%       boundary = B{k};
%    end
%  
% x1=cbar;
% y1=rbar;
% x2=ConvexHull(:,1);
% y2=ConvexHull(:,2);
%    
%                d=1;
%            for x=1:length(x2)
%                distx=(x1-x2(x))*(x1-x2(x));
%                a(d)=distx;
%                d=d+1;
%            end
% 
%    
%                      sumx=0;
%                  for i2=1:1:d-1 
%                      a(i2);
%        
%                  end
%    
%    
%  
%                            f=1;
%                        for y=1:length(y2)
%                            disty=(y1-y2(y))*(y1-y2(y));
%                            b(f)=disty;
%                            f=f+1;
%                        end
% 
%                                    sumy=0;
%                                for j2=1:1:f-1 
%                                    b(j2);
%                                end
% 
%                                        i=1;
%                                    for i2=1:d-1 
%                                        p=a(i2);
%                                        q=b(i2);
%                                        c(i2)=a(i2)+b(i2);
%                                        edist=c(i2);
%                                        i=i+1;       
%                                    end
% 
%                                         for i2=1:d-1
%                                             edistance=sqrt(c(i2));
%                                          end
% 
% 
% 
%  x1=cbar;
%  y1=rbar;
%  x2=Extremas(:,1);
%  y2=Extremas(:,2);
%    
%    
%                                                    d=1;
%                                                for x=1:length(x2)
%                                                    distx=(x1-x2(x))*(x1-x2(x));
%                                                    a(d)=distx;
%                                                    d=d+1;
%                                                end
% 
%                                                           sumx=0;
%                                                       for i2=1:1:d-1 
%                                                           a(i2);
%        
%                                                       end
%    
%    
%  
%                                                                   f=1;
%                                                               for y=1:length(y2)
%                                                                   disty=(y1-y2(y))*(y1-y2(y));
%                                                                   b(f)=disty;
%                                                                   f=f+1;
%                                                               end
% 
%                                                                           sumy=0;
%                                                                       for j2=1:1:f-1 
%                                                                            b(j2);
%                                                                       end
% 
%                                                                                 i=1;
%                                                                             for i2=1:d-1 
%                                                                                 p=a(i2);
%                                                                                 q=b(i2);
%                                                                                 c(i2)=a(i2)+b(i2);
%                                                                                 edist=c(i2);
%                                                                                 i=i+1;       
%                                                                             end
% 
%                                                                                     r=1;
%                                                                                     for i2=1:d-1
%                                                                                         edistance1(i2,:)=sqrt(c(i2));
%                                                                                         distance=edistance1(i2);
%                                                                                         distance1(r)=distance;
%                                                                                         r=r+1;
%                                                                                     end
% 
% distance1;
% eucdistance=distance1';
% R = 95;
% Center = [cbar,rbar];
% [X,Y]=circle(Center,R,100,'b-');
% 
% M2=round(X);
% N2=round(Y);
% M1=M2';
% N1=N2';
% M=M1(:,1);
% N=N1(:,1);
% f1=cat(2,M,N);
% [A B]=size(f1);
% [row col]=size(bw2);
% cnt=0;
% 
%             for p=1:length(M)
%                 pp(p)=M(p);
%             end
%             pp=pp';
%             
%                   for k=1:length(N)
%                       NN(k)=N(k);
%                   end
%                       NN=NN';
%                       
%                              cnt=1;
%                          for i=1:length(pp)
%                              s=pp(i);
%                              ss=NN(i);
%                              f(cnt)=bw2(s,ss);                             
%                              cnt=cnt+1;
%                          end
%                          
%                                    f=f';
%                                    temp=1;
%                                    tempv=0;
%                                    count=0;
%                                for i=1:length(pp)
%                                    value=f(i);
%                                   if (value == temp)                   
%                                      count=count+1;
%                                      temp1=count;
%                                   end
%                                end
%                                       temp1;
%                                       
%             
%                                           mm=1;
%                                       for i=1:length(f)            
%                                           if(f(i)>0)
%                                             pos1(mm)=f(i);                                     
%                                             mm=mm+1;
%                                           end                     
%                                       end
%                                       
%                                                     pos1=pos1';
%                                                     length(pos1);
%                                                     cnt=0;            
%                                                for  i=1:length(f1)
%                                                     ss(i,1)=pp(i);
%                                                     ss(i,2)=NN(i);
%                                                     ss(i,3)=bw2(ss(i,2),ss(i,1));                                                           
%                                                end
%  v=ss(:,3);
%  u=ss(:,1);
%  z=ss(:,2);
%            
%  
%         
%                
%            
% 
% 
%                                                        peatls=0;
%                                                        dec=0;
%                                                        jj=1;
%                                                        for pp=1:length(v)
%                                                           if(v(jj)==0)
%                                                              if((v(pp)==1)&&(v(pp-1)==0))
%                                                                 peatls=peatls+1;
%                                                              end
%                                                           else
%                                                              if((v(pp)==0)&&(v(pp-1)==1))
%                                                                  peatls=peatls+1;
%                                                             end
%                                                           end
%                                                        end       
% 
%                                                                     for i=1:length(v)               
%                                                                       for xx=1:length(pos1)
%                                                                          if(v(i)==pos1(xx)) 
%                                                                              uu(i)=u(i);
%                                                                              zz(i)=z(i);   
%                                                                          end
%                                                                       end
%                                                                     end  
%                                                                                                                                         
%  uu=uu';
%  zz=zz';
%              
%       
%                                                                                j=1;
%                                                                            for i=1:1:length(uu)
%                                                                              if(uu(i)>0)
%                                                                                 cc(j)=uu(i);
%                                                                                 j=j+1;
%                                                                              end
%                                                                            end
%  cc=cc';
%  
% 
%  
% 
%                                                                                j=1;
%                                                                            for i=1:1:length(zz)
%                                                                              if(zz(i)>0)
%                                                                                 dd(j)=zz(i);
%                                                                                 j=j+1;
%                                                                              end
%                                                                            end
%  dd=dd';
%  length(dd);
%  
 

 
 
 
 
% % % % % % % % % %  corner

