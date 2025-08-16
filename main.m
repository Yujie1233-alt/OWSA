clear
clc
close
T=11;
% M=floor(T/2);
% N=T-M;
M=11;
N=13;
%%%%1
if M<=10
    S_11=[0 1:3:1+3*ceil((M-6)/3) M-1];
    S_12=[N*(M+1)-6:-3:N*(M+1)-6-3*floor((M-5)/3)];
    S_13=[N*(M+1)+M-6:-3:N*(M+1)+M-3-3*ceil((M-5)/3)];
    S_14=[N*(M+1)+M-2 N*(M+1)+M];
    S_1=[S_11 S_12 S_13 S_14];
    S_2=[2*M:(M+1):2*M+(N-2)*(M+1)];
    S=[S_1 S_2];
    S=unique(S);
%%%%%2
if M<=4
    uDOF=2*(N*(M+1)-1)+1;
end
if M>=5 && mod(M,9)~=0
    uDOF=2*(N*(M+1)-5)+1;
end
if M>=5 && mod(M,9)==0
    uDOF=(N*(M+1)+M-6)+1;
end
w1=1;
w2=2;
if M<=6
    w3=1;
else
    w3=M-5;
end
Smax=N*(M+1)+M;
S_max=max(S);
end
if M>=11
%     S_11=[0 1 6:4:6+4*floor((M-9)/4) M-1];
%     S_12=[M+3 M+8:4:M+8+4*(ceil((M-9)/4)-1)];
%     S_13=[N*(M+1)-7 N*(M+1)-12:-4:N*(M+1)-12-4*(floor((M-11)/4))];
%     S_14=[N*(M+1)+M-7 N*(M+1)+M-12:-4:N*(M+1)+M-12-4*(floor((M-12)/4))];
%     S_15=[N*(M+1)+2*M-7 N*(M+1)+M N*(M+1)+M-2];
% S_1=[S_11 S_12 S_13 S_14 S_15];
% S_2=[2*M:(M+1):2*M+(N-2)*(M+1)];
% S=[S_1 S_2];

    S_1=[0 1 6:4:6+4*floor((M-9)/4) M-1];
    S_2=[M+3 M+8:4:M+8+4*floor((M-10)/4)];
    S_3=[2*M:(M+1):2*M+(N-2)*(M+1)];
    S_4=[N*(M+1)-7 N*(M+1)-12:-4:N*(M+1)-12-4*floor((M-11)/4)];
    if M>=12
        S_5=[N*(M+1)+M-12:-4:N*(M+1)+M-12-4*floor((M-12)/4) N*(M+1)+M-7];
    else
        S_5=[N*(M+1)-2 N*(M+1)+M-7];
    end
    S_6=[N*(M+1)+M-2 N*(M+1)+M N*(M+1)+2*M-7];
    S=[S_1 S_2 S_3 S_4 S_5 S_6];
    S=[-S S]+max(S);
  % S_1=[0 1 6:4:6+4*floor((M-9)/4) M-1];
  % S_2=[M+3 M+8:4:M+8+4*floor((M-10)/4)];
  % S_3=[2*M:(M+1):2*M+(N-3)*(M+1)];
  % S_4=[N*(M+1)-12:-4:N*(M+1)-12-4*floor((M-11)/4)];
  % if M>=12
  %     S_5=[N*(M+1)+M-12:-4:N*(M+1)+M-12-4*floor((M-12)/4)];
  % else
  %     S_5=[];
  % end
  % S_6=[N*(M+1)+2*M-7 N*(M+1)+M-7 N*(M+1)-7  N*(M+1)+M N*(M+1)+M-2 N*(M+1)-2 ];
  % S=[S_1 S_2 S_3 S_4 S_5 S_6];
S=unique(S);
if mod(M,4)~=1
    uDOF=2*(N*(M+1)-10)+1;
else
    uDOF=2*(N*(M+1)+M-12)+1;
end
Smax=N*(M+1)+2*M-7;
S_max=max(S);
w1=1;
w2=2;
w3=1;
end
S
uDOF_maximum(S)
Lu=(uDOF-1)/2
w=[w1 w2 w3]
DOF=2*Smax+1
%%%%%%%%%%计算耦合矩阵
% cc=S-S.';
% c=zeros(1,length(S));
% B=100;
% C=zeros(length(S),length(S));
% for u=1:length(S)
%     for v=1:length(S)
%         if cc(u,v)==0 
%             C(u,v)=1;
%         elseif abs(cc(u,v))>=100
%             C(u,v)=0;
%         elseif abs(cc(u,v))==1
%              C(u,v)=0.3*exp(j*pi/3);
%         end
%         if abs(cc(u,v))~=1 && cc(u,v)~=0 && abs(cc(u,v))<=100
%             C(u,v)=0.3*exp(j*pi/3)*exp(-j*(abs(cc(u,v))-1)*pi/8);
%         end
%     end
% end
% norm(C, 'fro')
% %%%%%耦合泄漏
% U=C-diag(C);
% F=0;
% G=0;
% for i=1:length(S)
%     for j=1:length(S)
%         F=C(i,j)*C(i,j)+F;
%         G=U(i,j)*U(i,j)+G;
%     end
% end
% F=sqrt(F);
% G=sqrt(G);
% L=F/G;
% L=abs(L)
% LL = norm(C, 'fro') / norm(C - diag(diag(C)), 'fro')
% %%%%%%%冗余度
% gamma=T*T/(2*Smax+1)
%%%%%%耦合矩阵图
% bb=abs(C);
% for ik=1:length(S)
%     for jk=1:length(S)
%         if cc(ik,jk)~=0
%             bb(ik,jk)=1/(abs(cc(ik,jk))+1);
%         else
%             bb(ik,jk)=1;
%         end
%     end
% end
% gray_photo(abs(bb),1)
% %%%%%%%%散点图
% name='OWSA';
% scatter_photo(S,name)
% %%%%%%SS_MUSIC(阵型,来波角,快拍数,信噪比,阵元间距)
name='OWSA';
theta=[-60:6:60];
snapshots=1000;
SNR=50;
dd=0.5;
SS_MUSIC(S,theta,snapshots,SNR,dd,name)
% %%% %  RMSE(循环次数,阵型,来波角,快拍数,信噪比,阵元间距)
% name='OWSA';
% theta=[-60:20:60];
% snapshots=1000;
% SNR=30;
% dd=0.5;
% times=200;
% RMSE(times,S,theta,snapshots,SNR,dd,name)
