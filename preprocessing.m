
function images = preprocessing(im,size_im)
% resize to fixed input size
im = single(im);
% mean BGR pixel
mean_pix = [104, 117, 123];
im = imresize(im, [size_im size_im]);
% RGB -> BGR
images = im(:, :, [3 2 1]);
% mean BGR pixel subtraction
for c = 1:3
    images(:, :, c) = images(:, :, c) - mean_pix(c);
end
% change x and y
images=permute(images,[2 1 3]);