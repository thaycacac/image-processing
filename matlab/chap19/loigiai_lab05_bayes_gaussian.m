%% LOI GIAI LAB 5 - GAUSSIAN NAIVE BAYES
clear; close all; clc;
scriptDir=fileparts(mfilename('fullpath')); run(fullfile(scriptDir,'pattern_dataset.m'));
A=Xnorm(trainIdx,:); ya=y(trainIdx); B=Xnorm(testIdx,:); yb=y(testIdx); M=zeros(3,4); V=M; P=zeros(3,1);
for c=1:3, z=A(ya==c,:); M(c,:)=mean(z,1); V(c,:)=var(z,0,1)+1e-4; P(c)=size(z,1)/numel(ya); end
S=zeros(numel(yb),3);
for c=1:3, d=B-M(c,:); S(:,c)=log(P(c))-.5*sum(log(2*pi*V(c,:))+d.^2./V(c,:),2); end
[~,yp]=max(S,[],2); C=zeros(3); for i=1:numel(yb), C(yb(i),yp(i))=C(yb(i),yp(i))+1; end
figure('Name','Solution 5 - Gaussian Bayes');
subplot(1,2,1); imagesc(C); axis image; colorbar; xticks(1:3); yticks(1:3); xticklabels(classNames); yticklabels(classNames); title('Confusion matrix');
subplot(1,2,2); hold on; col=lines(3); for c=1:3, q=yb==c; scatter(B(q,2),B(q,4),35,col(c,:),'filled'); end
xlabel('Feature 2 (z)'); ylabel('Feature 4 (z)'); legend(classNames); grid on; hold off;
fprintf('Accuracy = %.2f%%\n',100*mean(yp==yb)); disp(C);
