###########################################for membrane channel to segment cells or directly segement cells based on GFP channel

# step1 mannually annotate images (cyto channel)
conda activate cellpose
# initiate Gui
python -m cellpose
# annotate images using cyto/cyto2/own pretrained model
# we generated at least 5 _seg.npy files included in the folder I will train a model based on them
# step2 train a new model using command line in a new shell
conda activate cellpose
# train a new model for cyto images
python -m cellpose --verbose --train --dir /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_GFP/ --mask_filter _seg.npy --pretrained_model cyto2 --chan 2  --learning_rate 0.1 --weight_decay 0.0001 --n_epochs 100 
# step3 generating masks in batch using customozed model 
python -m cellpose --verbose --dir /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_GFP/ --img_filter ch2 --chan 2 --pretrained_model /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_GFP/models/cellpose_residual_on_style_on_concatenation_off_tiff_GFP_2023_10_31_11_47_16.101528 --batch_size 4 --flow_threshold 0.4 --save_png

###########################################segment DAPI channel 
# step1 mannually annotate images (nuclei channel)
conda activate cellpose
# initiate Gui
python -m cellpose
# annotate images using nuclei/own pretrained model
# we generated at least 5 _seg.npy files included in the folder I will train a model based on them
# step2 train a new model using command line in a new shell
conda activate cellpose
# train a new model for cyto images
python -m cellpose --verbose --train --dir /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_nuclei/ --mask_filter _seg.npy --pretrained_model nuclei  --learning_rate 0.1 --weight_decay 0.0001 --n_epochs 100 
# step3 generating masks in batch using customized model 
python -m cellpose --verbose --dir /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_nuclei/ --img_filter ch3 --chan 3 --pretrained_model /Volumes/Expansion/for_Xue_uu/20220704_dnap1_arrb1_tiff/tiff_nuclei/models/cellpose_residual_on_style_on_concatenation_off_tiff_nuclei_2023_10_31_11_35_50.763246 --batch_size 4 --flow_threshold 0.4 --save_png
