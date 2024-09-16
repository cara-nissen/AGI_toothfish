#!/bin/bash

# kick out the deepest levels

# step 1: interpolate to 3185m
# step 2: kick out depth levels >3045.6m from file
# step 3: merge file from step 2 with file from step 2 

module load nco
module load cdo

echo "historical"
cd /work/ollie/ncara/fesom/fesom-1.4-recom/HLRN/files_toothfish_project_AGI/simB
for yy in {1995..2014}; do
    echo "$yy"
    # pO2
    cdo intlevel,3185.0 pO2_fesom_simB_${yy}0101.nc  outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_simB_${yy}0101.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../simB_reduced/pO2_fesom_simB_${yy}0101_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../simB_reduced/pO2_fesom_simB_${yy}0101_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../simB_reduced/pO2_fesom_simB_${yy}0101_v2.nc
    rm outfile1.nc
    rm outfile2.nc
    # insitu temp
    cdo intlevel,3185.0 t_insitu_fesom_simB_${yy}0101.nc  outfile1.nc
    ncks -F -d depth,1,87 t_insitu_fesom_simB_${yy}0101.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../simB_reduced/t_insitu_fesom_simB_${yy}0101_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../simB_reduced/t_insitu_fesom_simB_${yy}0101_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../simB_reduced/t_insitu_fesom_simB_${yy}0101_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done

#cdo intlevel,3185.0 infile.nc outfile1.nc
#ncks -F -d depth,1,87 infile.nc outfile2.nc
#cdo merge outfile2.nc outfile1.nc final.nc

# check missing values

