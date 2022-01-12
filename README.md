# JL-DCF (CVPR 2020, TPAMI 2021)
JL-DCF: Joint Learning and Densely-Cooperative Fusion Framework for RGB-D Salient Object Detection (CVPR2020) [[PDF](https://openaccess.thecvf.com/content_CVPR_2020/papers/Fu_JL-DCF_Joint_Learning_and_Densely-Cooperative_Fusion_Framework_for_RGB-D_Salient_CVPR_2020_paper.pdf)][[中文版](http://dpfan.net/wp-content/uploads/cvpr2020JLDCF_CameraReady_Chinese_final.pdf)]  
Siamese Network for RGB-D Salient Object Detection and Beyond (TPAMI2021) [[PDF](https://arxiv.org/pdf/2008.12134.pdf)][[中文版](http://www.kerenfu.top/sources/2021tpamijldcf-cn.pdf)]  
-Testing code is released!  
-:fire:**News!!!**:fire: The Pytorch implementation (**Training & Testing**) of JL-DCF is now released! Please step to the new [Project Page](https://github.com/jiangyao-scu/JL-DCF-pytorch) for more information.  
-Notice that there was a small description mistake in our papers that the NJU2K dataset we used indeed has 1,985 samples (with which we actually experimented), rather than 2,000. 

![alt text](./figures/JL-DCF_framework.png)

![alt text](./figures/JL-DCF_visual_comparisons.png)

![alt text](./figures/JL-DCF_results.png)
## Usage
The original implementation of JL-DCF is Caffe. The code can run on both Windows and Linux, depending on which OS you are using. It has been tested on Linux (with Ubuntu 16.04, CUDA-10, Cudnn-7.6, Matlab 2015b) and also Windows 10 (with CUDA-9, Cudnn-7.6, Matlab 2018a, Visual Studio 2015). It should also work on other configurations (better on CUDA-8.0+, Cudnn-5.0+, and Matlab 2013a+) but we didn't try.

1. STEP1: To run the code, you should first install Caffe and also its MATLAB Interface. 

    Suggested Caffe version from Github  
    For Linux: https://github.com/BVLC/caffe  
    For Windows: https://github.com/BVLC/caffe/tree/windows OR https://github.com/happynear/caffe-windows (the latter works more easily with Visual Studio project *.sln and is recommended to run our code for Windows users)  

    Note that standard Caffe is enough for running our code! 

2. STEP2: Download the model of JL-DCF from the following links and have it in the "models" folder.  
    链接：https://pan.baidu.com/s/1hHckF5PPtFXM52GaYNeuOw 提取码：nvoi  
    or:  
    https://drive.google.com/open?id=185L3uULu0-GKWyLxE6S8X79pYYj6JUOg  


3. STEP3: Open MATLAB, run demo_JLDCF.m and get the results in "results" folder.

## Results  
Results of our JL-DCF model on 7 benchmark datasets (NJU2K, NLPR, STERE, RGBD135, LFSD, SIP, DUT-RGBD) can be found below:  
链接: https://pan.baidu.com/s/1NGaoZbmPKDr1auMtO0syFQ 提取码: osnf  
or:  
https://drive.google.com/open?id=1I_2i5XbjTdAVfgOh4wpfV3EuqVaXRQH0

References of datasets:  
  [STERE] Leveraging stereopsis for saliency analysis. In CVPR 2012.  
  [NJU2K] Depth saliency based on anisotropic centersurround difference. In ICIP 2014.  
  [NLPR] Rgbd salient object detection: A benchmark and algorithms. In ECCV 2014.  
  [RGBD135] Depth enhanced saliency detection method. In International Conference on Internet Multimedia Computing and Service. ACM, 2014.  
  [LFSD] Saliency detection on light field. In CVPR 2014.  
  [DUT-RGBD] Depth-induced multi-scale recurrent attention network for saliency detection. In ICCV 2019.  
  [SIP] Rethinking RGB-D salient object detection: Models, datasets, and large-scale benchmarks. IEEE TNNLS, 2020.  

As some researchers require, results of our JL-DCF model on SSD dataset (having 80 samples) can be found below:
链接: https://pan.baidu.com/s/18q3YNCfEv9o5uwMUeJ3rgw 提取码: drir 
or:  
Google link comes soon...  

References of dataset:  
  [SSD] A three-pathway psychobiological framework of salient object detection using stereoscopic technology. In ICCVW 2017.  


## Important Tips!
Note that our JL-DCF model was trained on depth maps which satisfy the rule that closer objects present lower depth values (are "black"), 
while further objects have higher depth values (are "white"). such a rule is enforced in order to meet physical common sense. We observed that the model performance would somewhat degrade when using reversed maps (e.g., disparity maps) during testing. <strong>So be aware of the following issues when testing the models: </strong>
1. Depth maps are min-max normalized into [0, 1] or [0, 255].
2. Closer objects present lower depth values (are "black").
![alt text](./figures/Depth.png)


## Dataset
Our training dataset is  
链接: https://pan.baidu.com/s/1uF6LxbH0RIcMFN71cEcGHQ 提取码: 5z48  
or:  
https://drive.google.com/open?id=1BpVabSlPH_GhozzRQYjxTOT_cS6xDUgf

## Citation
Please cite our paper if you find the work useful: 

	@inproceedings{Fu2020JLDCF,
  	title={JL-DCF: Joint Learning and Densely-Cooperative Fusion Framework for RGB-D Salient Object Detection},
  	author={Fu, Keren and Fan, Deng-Ping and Ji, Ge-Peng and Zhao, Qijun},
  	booktitle={IEEE Conference on Computer Vision and Pattern Recognition (CVPR)},
  	pages={3052--3062},
  	year={2020}
	}
        
	@article{Fu2021siamese,
  	title={Siamese Network for RGB-D Salient Object Detection and Beyond},
  	author={Fu, Keren and Fan, Deng-Ping and Ji, Ge-Peng and Zhao, Qijun and Shen, Jianbing and Zhu, Ce},
  	journal={IEEE Transactions on Pattern Analysis and Machine Intelligence (TPAMI)},
  	year={2021}
	}
## Benchmark RGB-D SOD
The complete RGB-D SOD benchmark can be found in this page  
http://dpfan.net/d3netbenchmark/
