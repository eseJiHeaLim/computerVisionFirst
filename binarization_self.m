clc;
clear;

%original image 가져오기
img= imread("name.png");

% image grayscale로 변경
img_g=rgb2gray(img);

% 모든 픽셀의 합을 구한다
allPixel=0;
temp= sum(img_g);

% threshold를 기준으로 이진변환
for i=1:2100
    allPixel= allPixel+temp(i);
end

 % 모든 합의 셀의 갯수로 나눠 threshold 값을 구한다
PixelCnt=2100*2100;
threshold=allPixel/(PixelCnt);

img_b=[];
% threshold를 기준으로 흑과 백으로 바꿔준다
for i=1:2100
    for j=1:2100
        if (img_g(i,j)<threshold)
            img_b(i,j)=0;
        else
            img_b(i,j)=1;
        end
    end
end

figure(1);
subplot(2,2,1)
imshow(img)
title('original image')
subplot(2,2,2)
imshow(img_g)
title('grayscale image')
subplot(2,2,3)
imshow(img_b)
title('binarization image')
subplot(2,2,4)
imshow(imbinarize(img_g))
title('matlab function binarization image')
