#!/bin/bash

gpus_available=(2 5 7 9)
imgs_per_gpu=3 

echo "Number of GPUs available:${#gpus_available[@]}"

for counter in $(seq 0 $((${#gpus_available[@]} - 1)));
do
    echo "Begin Process: $counter"
    let start_index="imgs_per_gpu*counter"
    let stop_index="imgs_per_gpu*(counter+1)"    
    CUDA_VISIBLE_DEVICES=${gpus_available[counter]} python tools/infer_multi_gpu.py \
                                    		    --dataset iiai \
                                                    --cfg configs/panet/e2e_panet_R-50-FPN_2x_mask.yaml \
                                    		    --load_ckpt Outputs/e2e_panet_R-50-FPN_2x_mask/Mar20-09-54-04_48f3fd90d1bb_step/ckpt/model_step179999.pth \
                                    		    --image_dir test_images2/ \
                                    		    --output_dir test_results3 \
				    		    --start_index $start_index \
				    		    --stop_index $stop_index > /dev/null 2>&1 &


    echo "Wait 5 seconds for process to start up, before starting next process"
    sleep 5
done

