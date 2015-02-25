[img, map] = imread('test.jpg');

if ~isempty(map)
    img = ind2rgb(img,map);
end

im = img(:,:,1);
    
dctimg = dct2(im);
idctimg = dct2(dctimg);
imshow(img(:,:,1),[0,1]);
figure,imshow(idctimg,[0,1]);

scale = size(im);

err = 0;

for i = 1:scale(1)
    for j=1:scale(2)
        err = err + (im(i,j)-idctimg(i,j))^2;
    end
end


err = err/(i*j)

