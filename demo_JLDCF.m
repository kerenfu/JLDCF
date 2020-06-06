clear all;
close all;
clc;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%root%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
protoFile = 'models_prototxts/test_JLDCF_resnet101.prototxt';
modelFile = 'models/JLDCF_resnet101.caffemodel';
useGPU = true; % GPU / CPU
input_path = 'test_images/';    %input image path
depth_path = 'test_images/';    %input image path
output_path= 'results/';
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%initialize%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if exist(modelFile, 'file') == 0
  fprintf('%s does not exist.', modelFile);
end
if ~exist(protoFile,'file')
  error('%s does not exist.', protoFile);
end
caffe.reset_all();
if useGPU
  fprintf('Using GPU Mode\n');
  caffe.set_mode_gpu();
  caffe.set_device(0);
else
  fprintf('Using CPU Mode\n');
  caffe.set_mode_cpu;
end
net = caffe.Net(protoFile, modelFile, 'test');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%processing%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
input_filelist = dir([input_path '/*.jpg']); %get input image list   
len = length(input_filelist);
for Ind=1:len
    disp('-------------------------------------');
    disp(['Processing ' num2str(Ind) 'th image']);
    %% read image, depth and data preparation
    string_file=input_filelist(Ind).name;
    im_data=imread([input_path string_file]);
    depth_data=imread([depth_path string_file(1:end-4) '.bmp']);
    if size(depth_data,3)==1
        depth_data=repmat(depth_data,[1 1 3]);
    end
    [H, W, S]=size(im_data);
    if S==1 src=repmat(src,[1,1,3]); end
    
    data_shape=net.blobs('image').shape;
    input_size=data_shape(1);
    %% predict RGB-D saliency
    im_data= preprocessing(im_data,input_size);
    depth_data= preprocessing(depth_data,input_size);
    
    t1 = tic;
    net.forward({im_data,depth_data});
    running_time(Ind) = toc(t1);
    
%     %%uncomment below code to get global coarse RGB and depth prediction%%%
%     output = net.blobs('sigmoid_global').get_data();
%     global_rgb=output(:,:,:,1);
%     global_rgb=permute(global_rgb,[2,1,3]);
%     global_rgb=imresize(global_rgb,[H,W],'nearest');
%     global_depth=output(:,:,:,2);
%     global_depth=permute(global_depth,[2,1,3]);
%     global_depth=imresize(global_depth,[H,W],'nearest');
%     imwrite([global_rgb],[output_path,string_file(1:end-4),'_JLDCF_rgb.png']);
%     imwrite([global_depth],[output_path,string_file(1:end-4),'_JLDCF_depth.png']);
    
    final_fusion = net.blobs('final_fusion').get_data();
    final_fusion=permute(final_fusion,[2,1,3]);
    final_fusion=imresize(final_fusion,[H,W],'nearest');

    imwrite([final_fusion],[output_path,string_file(1:end-4),'_JLDCF.png']);
end
fprintf('mean time: %.3fs\n', mean(running_time(2:end)));%ignore the 1st image for warming up