#!/bin/bash
  
# kick out the deepest levels

# step 1: interpolate to 3185m
# step 2: kick out depth levels >3045.6m from file
# step 3: merge file from step 2 with file from step 1 

module load climate-utils # this includes both nco and cdo
# module load nco
# module load cdo

drift1=2081 # 2081, 2091, 2098
drift2=2100

echo "ssp585"
cd /pscratch/sd/c/cnissen/files_toothfish_project_AGI/ssp585_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014/ 
for yy in $(seq $drift1 $drift2); do
    echo "$yy"
   # # rename time dimension to make cdo commands work
   # ncrename -d month,time pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_pO2.nc
   # ncrename -d month,time t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_t_insitu.nc
    # pO2
    cdo intlevel,3185.0 pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp585_reduced/pO2_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
    # insitu temp
    cdo intlevel,3185.0 t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp585_reduced/t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp585_reduced/t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp585_reduced/t_insitu_fesom_ssp585_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done

echo "ssp370"
cd /pscratch/sd/c/cnissen/files_toothfish_project_AGI/ssp370_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014/ 
for yy in $(seq $drift1 $drift2); do
    echo "$yy"
   # # rename time dimension to make cdo commands work
   # ncrename -d month,time pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_pO2.nc
   # ncrename -d month,time t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_t_insitu.nc
    # pO2
    cdo intlevel,3185.0 pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp370_reduced/pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp370_reduced/pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp370_reduced/pO2_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
    # insitu temp
    cdo intlevel,3185.0 t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp370_reduced/t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp370_reduced/t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp370_reduced/t_insitu_fesom_ssp370_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done


echo "ssp245"
cd /pscratch/sd/c/cnissen/files_toothfish_project_AGI/ssp245_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014/ 
for yy in $(seq $drift1 $drift2); do
    echo "$yy"
   # # rename time dimension to make cdo commands work
   # ncrename -d month,time pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_pO2.nc
   # ncrename -d month,time t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_t_insitu.nc
    # pO2
    cdo intlevel,3185.0 pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc  outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp245_reduced/pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp245_reduced/pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp245_reduced/pO2_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
    # insitu temp
    cdo intlevel,3185.0 t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp245_reduced/t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp245_reduced/t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp245_reduced/t_insitu_fesom_ssp245_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done

echo "ssp126"
cd /pscratch/sd/c/cnissen/files_toothfish_project_AGI/ssp126_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014/ 
for yy in $(seq $drift1 $drift2); do
    echo "$yy"
   # # rename time dimension to make cdo commands work
   # ncrename -d month,time pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_pO2.nc
   # ncrename -d month,time t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc test_file_t_insitu.nc
    # pO2
    cdo intlevel,3185.0 pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc  outfile1.nc
    ncks -F -d depth,1,87 pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp126_reduced/pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp126_reduced/pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp126_reduced/pO2_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
    # insitu temp
    cdo intlevel,3185.0 t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile1.nc
    ncks -F -d depth,1,87 t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_aM.nc outfile2.nc
    cdo merge outfile2.nc outfile1.nc ../ssp126_reduced/t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lat,c,c,"degree N" ../ssp126_reduced/t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    ncatted -a unit,lon,c,c,"degree E" ../ssp126_reduced/t_insitu_fesom_ssp126_${yy}0101_monthly_drift_corrected_${drift1}_${drift2}_minus_1995_2014_v2.nc
    rm outfile1.nc
    rm outfile2.nc
done

#cdo intlevel,3185.0 infile.nc outfile1.nc
#ncks -F -d depth,1,87 infile.nc outfile2.nc
#cdo merge outfile2.nc outfile1.nc final.nc

# check missing values

                                                                                                                                                                      125,0-1       Bot

