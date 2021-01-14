# for loop
# range of fields
echo "/mnt/nfs/datasets/cityscapes_traffic_signs/training_cityscapes_tfs.h5" | awk -F "/" '{for(i=4; i<=(NF); i++){printf("/"$i)};printf("\n")}'
