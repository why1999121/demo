function [ data,SS ] = NSSS( rawdata,parameter )
%NSSS �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[m,n]=size(rawdata);

[~,index]=sort(rawdata(:,1:end-1),1);
D=repmat(rawdata(:,end),1,n-1);
% D=D(index+m*[0:n-2]);
D=D(index);
% sort(D,1)
% sum(sum(D-D1))

I1=(D~=[D(1,:);D(1:end-1,:)])|(D~=[D(2:end,:);D(end,:)]);

INS=zeros(m,n-1);
index=index+repmat([0:(n-2)]*m,m,1);

INS(index)=I1(:);%ָ�����
K=sum(INS,2);%ָ������

% SS=K>mean(K)*1.2;
 SS=K>min(K)+floor((max(K)-min(K))*parameter);

data=rawdata(SS==1,:);

end

