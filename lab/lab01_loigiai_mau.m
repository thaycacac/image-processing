%% LAB 01 (MAU) - Loi giai tham khao cho de "Lab - 60 minutes"
% Cau 1: uoc luong nhieu + khu nhieu (3d)
% Cau 2: tao khung vien (3d)
% Cau 3: coins.png - histogram, nguong, dem dong xu (4d)
% Dat cac anh (NoisyImage.jpg, coins.png, coin2.png, F13.bmp) cung thu muc script.
clear; close all; clc;

%% ================= CAU 1: UOC LUONG NHIEU & KHU NHIEU =================
I = imread('NoisyImage.jpg');
if size(I,3) == 3, G = rgb2gray(I); else, G = I; end
Gd = im2double(G);

% (a) Nhan dang loai nhieu: ti le pixel cuc tri (0/255) -> muoi tieu
pSP = mean(G(:) == 0 | G(:) == 255);
% (b) Uoc luong sigma bang vung phang: do lech chuan cua phan du Gd - median 3x3
resid  = Gd - medfilt2(Gd,[3 3]);
sigma  = 1.4826 * median(abs(resid(:) - median(resid(:))));   % MAD
fprintf('Ti le pixel 0/255 = %.2f %% | sigma uoc luong = %.4f\n', 100*pSP, sigma);

figure('Name','Cau 1 - Phan tich nhieu');
subplot(1,2,1); imshow(G); title('Anh nhieu (xam)');
subplot(1,2,2); imhist(G);  title('Histogram');

if pSP > 0.005
    kind = 'Salt & Pepper';  % loc trung vi: tot nhat voi nhieu xung
    if size(I,3) == 3
        R = I; for c = 1:3, R(:,:,c) = medfilt2(I(:,:,c),[3 3]); end
    else
        R = medfilt2(I,[3 3]);
    end
else
    kind = 'Gaussian';       % wiener2 thich nghi theo phuong sai cuc bo
    if size(I,3) == 3
        R = I; for c = 1:3, R(:,:,c) = wiener2(I(:,:,c),[5 5]); end
    else
        R = wiener2(I,[5 5]);
    end
end
fprintf('Loai nhieu nhan dang: %s\n', kind);
figure('Name','Cau 1 - Khu nhieu');
subplot(1,2,1); imshow(I); title('Anh nhieu');
subplot(1,2,2); imshow(R); title(['Khoi phuc (' kind ')']);

%% ================= CAU 2: KHUNG VIEN =================
% Y cung kich thuoc X, vien rong b = 50, phan trong lay tu X.
b = 50;
X = imread('cameraman.tif');                   % anh xam bat ky (doi ten file neu can)
if size(X,3) == 3, X = rgb2gray(X); end
[h,w] = size(X);
mask = false(h,w); mask(b+1:h-b, b+1:w-b) = true;   % true = vung giu anh

% (a) anh xam: vien den / trang
figure('Name','Cau 2a');
ttl = {'Vien den','Vien trang'};
for k = 1:2
    Y = X; Y(~mask) = (k-1)*255;               % k=1 den, k=2 trang
    subplot(1,2,k); imshow(Y); title(ttl{k});
end

% (b) anh mau: den, trang, do, xanh la, xanh duong, vang
C = imread('peppers.png');                     % anh mau bat ky
[h,w,~] = size(C);
mask = false(h,w); mask(b+1:h-b, b+1:w-b) = true;
names  = {'Den','Trang','Do','Xanh la','Xanh duong','Vang'};
colors = [0 0 0; 255 255 255; 255 0 0; 0 255 0; 0 0 255; 255 255 0];
figure('Name','Cau 2b');
for k = 1:6
    Y = C;
    for ch = 1:3
        P = Y(:,:,ch); P(~mask) = colors(k,ch); Y(:,:,ch) = P;
    end
    subplot(2,3,k); imshow(Y); title(names{k});
end
% Neu de yeu cau khung BEN NGOAI (anh to ra): padarray(X,[b b],255) hoac
% padarray(C,[b b],0) roi gan mau tung kenh.

%% ================= CAU 3: COINS =================
analyzeCoins('coins.png');
% 3d - Option 1: analyzeCoins('coin2.png');
% 3d - Option 2: dem hinh tron trong F13.bmp
% countCircles('F13.bmp');

%% ----------------------- HAM CUC BO -----------------------
function analyzeCoins(fname)
    I = imread(fname);
    if size(I,3) == 3, I = rgb2gray(I); end

    % (a) Anh goc + histogram
    figure('Name',['3a - ' fname]);
    subplot(1,2,1); imshow(I); title('Anh goc');
    subplot(1,2,2); imhist(I); title('Histogram');

    % (b) Nguong Otsu (graythresh) -> phan doan, hien thi nguong tren histogram
    T  = graythresh(I);
    bw = imbinarize(I,T);                       % neu nen sang hon dong xu: bw = ~bw
    bw = imopen(bw,strel('disk',3));            % bo nhieu nho
    bw = imfill(bw,'holes');                    % lap lo trong dong xu
    bw = bwareaopen(bw,100);
    figure('Name',['3b - ' fname]);
    subplot(1,2,1); imhist(I); hold on; xline(T*255,'r','LineWidth',2);
    title(sprintf('Nguong Otsu = %.4f (%d)',T,round(T*255)));
    subplot(1,2,2); imshow(bw); title('Anh nhi phan sau phan doan');

    % (c) Dem tung loai dong xu theo dien tich
    [L,n] = bwlabel(bw,8);
    st    = regionprops(L,'Area','Centroid','BoundingBox');
    A     = [st.Area]';
    onBorder = false(n,1);
    [h,w] = size(bw);
    for i = 1:n
        bb = st(i).BoundingBox;                  % [x y w h]
        onBorder(i) = bb(1) <= 1 || bb(2) <= 1 || bb(1)+bb(3) >= w || bb(2)+bb(4) >= h;
    end
    Ause = A(~onBorder);                         % dong xu bi cat o bien khong tin cay
    [~,cen] = kmeans_lite(Ause);                 % 2 cum: dong nho / to
    thr = mean(cen);
    type = ones(n,1); type(A > thr) = 2;         % 1 = nho, 2 = to
    fprintf('[%s] Tong vat the: %d (bi cat o bien: %d)\n',fname,n,sum(onBorder));
    fprintf('   Loai nho: %d | Loai to: %d | Nguong dien tich: %.0f px\n', ...
            sum(type==1 & ~onBorder), sum(type==2 & ~onBorder), thr);
    figure('Name',['3c - ' fname]); imshow(I); hold on;
    col = {'g','r'};
    for i = 1:n
        c = st(i).Centroid;
        plot(c(1),c(2),'+','Color',col{type(i)},'MarkerSize',10,'LineWidth',2);
        text(c(1),c(2)+14,num2str(i),'Color','y','FontWeight','bold');
    end
    title('Xanh = nho, Do = to');
end

function countCircles(fname)
    I = imread(fname);
    if size(I,3) == 3, I = rgb2gray(I); end
    bw = imbinarize(I);
    if mean(bw(:)) > 0.5, bw = ~bw; end          % dam bao doi tuong = trang
    bw = imfill(bw,'holes');
    bw = bwareaopen(bw,30);
    [L,n] = bwlabel(bw,8);
    st = regionprops(L,'Area','Perimeter','Centroid');
    circ = 4*pi*[st.Area]./([st.Perimeter].^2);  % ~1 neu la hinh tron
    isCircle = circ > 0.8;
    fprintf('[%s] Doi tuong: %d | hinh tron: %d\n',fname,n,sum(isCircle));
    figure('Name',['Dem hinh tron - ' fname]);
    subplot(1,2,1); imshow(I); title('Anh goc');
    subplot(1,2,2); imshow(label2rgb(L,'jet','k')); title(sprintf('So hinh tron = %d',sum(isCircle)));
end

function [idx,cen] = kmeans_lite(x)
    % k-means 1 chieu, k=2 (khong can Statistics Toolbox)
    cen = [min(x); max(x)];
    for it = 1:50
        [~,idx] = min(abs(x - cen'),[],2);
        new = [mean(x(idx==1)); mean(x(idx==2))];
        if isequal(new,cen), break; end
        cen = new;
    end
end
