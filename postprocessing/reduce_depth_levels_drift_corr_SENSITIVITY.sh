#!/bin/bash
  
# kick out the deepest levels

# step 1: interpolate to 3185m
# step 2: kick out depth levels >3045.6m from file
# step 3: merge file from step 2 with file from step 1 

module load climate-utils # this includes both nco and cdo
# module load nco
# module load cdo

drift1=2091 # 2081, 2091, 2098
drift2=2100

# example file name:
# pO2_fesom_ssp585_20980101_at_climatological_t_insitu_monthly_drift_corrected_2091_2100_minus_1995_2014

echo "ssp585"
cd /pscratch/sd/c/cnissen/files_toothfish_project_AGI/ssp585_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014/ 
for yy in $(seq $drift1 $drift2); do
    echo "$yy"
    # pO2
    cdo intlevel,3185.0 pO2_fesom_ssp585_${yy}0101_at_climatological_t_insitu_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014.nc outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_ssp585_${yy}0101_at_climatological_t_insitu_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_at_climatological_t_insitu_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_at_climatological_t_insitu_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_at_climatological_t_insitu_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done


