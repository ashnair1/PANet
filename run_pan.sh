#!/bin/bash
CUDA_VISIBLE_DEVICES=15 python tools/infer_simple.py \
			--dataset iiai \
        		--cfg configs/panet/e2e_panet_R-50-FPN_2x_mask.yaml \
                	--load_ckpt Outputs/e2e_panet_R-50-FPN_2x_mask/Mar20-09-54-04_48f3fd90d1bb_step/ckpt/model_step179999.pth \
               		--image_dir test_images2 \
                	--output_dir test_results3/
