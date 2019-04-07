@echo ##### START BlackVueVideo2Photo ###############
@echo https://github.com/mapicam/mapicam/wiki
@echo ###############################################
:: BlackVue=F:\BlackVue
set BlackVue=%1%
@echo BlackVue=%BlackVue%

mkdir "F:\BlackVue\Record"
mkdir "F:\BlackVue\Record\10fps"
mkdir "F:\BlackVue\Record\gpx"
mkdir "F:\BlackVue\Record\csv"
mapillary_tools video_process --advanced --verbose --user_name velmyshanovnyi --import_path "%BlackVue%\Record\10fps" --video_import_path "%BlackVue%\Record" --geotag_source "blackvue_videos" --geotag_source_path "%BlackVue%\Record\gpx" --use_gps_start_time --interpolate_directions --offset_angle 0 --video_sample_interval 0.1 --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_EXIF_gps_tag --duplicate_distance 0.1
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause