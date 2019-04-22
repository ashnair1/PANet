#!/bin/bash
CUDA_VISIBLE_DEVICES=8,9,10,11,12,13,14,15 python tools/train_net_step.py --dataset iiai --cfg configs/panet/e2e_panet_R-152-FPN_2x_mask.yaml

