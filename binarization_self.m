clc;
clear;

%original image ��������
img= imread("name.png");

% image grayscale�� ����
img_g=rgb2gray(img);

% ��� �ȼ��� ���� ���Ѵ�
allPixel=0;
temp= sum(img_g);

% threshold�� �������� ������ȯ
for i=1:2100
    allPixel= allPixel+temp(i);
end

 % ��� ���� ���� ������ ���� threshold ���� ���Ѵ�
PixelCnt=2100*2100;
threshold=allPixel/(PixelCnt);

img_b=[];
% threshold�� �������� ��� ������ �ٲ��ش�
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
