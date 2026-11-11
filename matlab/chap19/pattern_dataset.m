% Du lieu mau cho cac lab chuong 19. Chay bang run(...) tu script lab.
% Bon dac trung mo phong: mean intensity, texture std, circularity, aspect ratio.
rng(19);
nPerClass=60;
classNames={'Round smooth','Compact textured','Elongated'};
featureNames={'Mean intensity','Texture std','Circularity','Aspect ratio'};
centers=[.36 .16 .82 1.12; .57 .32 .56 1.55; .73 .22 .30 2.05];
spreads=[.10 .08 .09 .20; .11 .10 .12 .25; .09 .09 .10 .32];
X=zeros(3*nPerClass,4); y=zeros(3*nPerClass,1);
for c=1:3
    rows=(c-1)*nPerClass+(1:nPerClass);
    X(rows,:)=randn(nPerClass,4).*spreads(c,:)+centers(c,:);
    y(rows)=c;
end
X(:,1:3)=min(max(X(:,1:3),0),1);
% Initialize as column vectors so each class split appends vertically.
trainIdx=zeros(0,1); testIdx=zeros(0,1);
for c=1:3
    rows=find(y==c); rows=rows(randperm(numel(rows))); rows=rows(:);
    nTrain=round(.70*numel(rows)); trainIdx=[trainIdx;rows(1:nTrain)]; testIdx=[testIdx;rows(nTrain+1:end)];
end
muTrain=mean(X(trainIdx,:),1); sigmaTrain=std(X(trainIdx,:),0,1); sigmaTrain(sigmaTrain==0)=1;
Xnorm=(X-muTrain)./sigmaTrain;
