mkdir "F:\BlackVue\Record"
mkdir "F:\BlackVue\Record\0100"
mkdir "F:\BlackVue\Record\csv"
mapillary_tools video_process --advanced --verbose --user_name velmyshanovnyi --import_path "F:\BlackVue\Record\test\0100" --video_import_path "F:\BlackVue\Record" --geotag_source "blackvue_videos" --geotag_source_path "F:\BlackVue\Record" --use_gps_start_time --interpolate_directions --offset_angle 0 --video_sample_interval 0.1 --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_EXIF_gps_tag --duplicate_distance 0.1
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause