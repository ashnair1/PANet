#!/bin/bash

gpus_available=(8 9 10 11)

#--load_ckpt Outputs/e2e_panet_R-50-FPN_2x_mask/Mar20-09-54-04_48f3fd90d1bb_step/ckpt/model_step239999.pth \
#--load_ckpt Outputs/e2e_panet_R-50-FPN_2x_mask/Mar14-07-54-03_29acf9c0158b_step/ckpt/model_step179999.pth \
#--load_ckpt Outputs/e2e_panet_R-152-FPN_2x_mask/Mar28-05-42-28_48f3fd90d1bb_step/ckpt/model_step157499.pth
#--load_ckpt Outputs/e2e_panet_R-152-FPN_2x_mask/Apr02-08-42-03_48f3fd90d1bb_step/ckpt/model_step177499.pth \
#--load_ckpt Outputs/e2e_panet_R-152-FPN_2x_mask/Apr09-09-44-43_48f3fd90d1bb_step/ckpt/model_step179999.pth \

echo "Evaluating Model"

echo "Number of GPUs available:${#gpus_available[@]}"

CUDA_VISIBLE_DEVICES=0,3,4,7 python tools/test_net.py \
                                                --dataset iiai \
                                                --cfg configs/panet/e2e_panet_R-152-FPN_2x_mask.yaml \
                                                --load_ckpt Outputs/R152_18/model_iiai_res152_c18_step179999.pth \
                                                --multi-gpu-testing #> /dev/null 2>&1 &

                                                #--load_ckpt Outputs/R152_28/model_step179999.pth \
                                                #--multi-gpu-testing #> /dev/null 2>&1 &

                                                


