#!/bin/bash
CUDA_VISIBLE_DEVICES=15 python tools/infer_simple.py \
			--dataset iiai \
        		--cfg configs/panet/e2e_panet_R-152-FPN_2x_mask.yaml \
                	--load_ckpt Outputs/R152_18/model_iiai_res152_c18_step179999.pth \
               		--image_dir test_images2 \
                	--output_dir test_results3/
