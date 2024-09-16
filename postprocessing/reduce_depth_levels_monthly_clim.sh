#!/bin/bash

# kick out the deepest levels

# step 0: rename dimension "month" to "time"
# step 1: interpolate to 3185m
# step 2: kick out depth levels >3045.6m from file
# step 3: merge file from step 2 with file from step 2 

module load nco
module load cdo

echo "historical"
cd /work/ollie/ncara/fesom/fesom-1.4-recom/HLRN/files_toothfish_project_AGI/simAssp585_monthly

# pO2
ncrename -d month,time pO2_fesom_simA_monthly_clim_1995_2014.nc pO2_fesom_simA_monthly_clim_1995_2014_v1.nc
cdo intlevel,3185.0 pO2_fesom_simA_monthly_clim_1995_2014_v1.nc outfile1.nc
ncks -F -d depth,1,87 pO2_fesom_simA_monthly_clim_1995_2014_v1.nc outfile2.nc
cdo merge outfile2.nc outfile1.nc ../simAssp585_monthly/pO2_fesom_simA_monthly_clim_1995_2014_v2.nc
ncatted -a unit,lat,c,c,"degree N" ../simAssp585_monthly/pO2_fesom_simA_monthly_clim_1995_2014_v2.nc
ncatted -a unit,lon,c,c,"degree E" ../simAssp585_monthly/pO2_fesom_simA_monthly_clim_1995_2014_v2.nc
rm outfile1.nc
rm outfile2.nc
# insitu temp
ncrename -d month,time t_insitu_fesom_simA_monthly_clim_1995_2014.nc t_insitu_fesom_simA_monthly_clim_1995_2014_v1.nc
cdo intlevel,3185.0 t_insitu_fesom_simA_monthly_clim_1995_2014_v1.nc outfile1.nc
ncks -F -d depth,1,87 t_insitu_fesom_simA_monthly_clim_1995_2014_v1.nc outfile2.nc
cdo merge outfile2.nc outfile1.nc ../simAssp585_monthly/t_insitu_fesom_simA_monthly_clim_1995_2014_v2.nc
ncatted -a unit,lat,c,c,"degree N" ../simAssp585_monthly/t_insitu_fesom_simA_monthly_clim_1995_2014_v2.nc
ncatted -a unit,lon,c,c,"degree E" ../simAssp585_monthly/t_insitu_fesom_simA_monthly_clim_1995_2014_v2.nc
rm outfile1.nc
rm outfile2.nc

