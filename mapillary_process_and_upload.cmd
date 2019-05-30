cd %1%
@echo ##### HEAD ##############################################################
setlocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set import_path=%1%\Record\jpg
@set geotag_source_path=%1%\Record\jpg
@set user_name=%2%
@set offset_angle=%3%
@set duplicate_distance=%4%
@set duplicate_angle=%5%
@set rerun=%6%
@echo ##### HEAD ##############################################################

mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg

D:\mapicam\tools\mapillary\mapillary_tools-050.exe process_and_upload --advanced --version --help

:: D:\mapicam\tools\mapillary\mapillary_tools-050.exe process_and_upload --advanced --version --verbose --import_path "F:\process_and_upload\Record\jpg" --user_name velmyshanovnyi --skip_subfolders --device_make "Blackvue" --device_model "DR900S-1CH" --add_import_date --geotag_source "exif" --geotag_source_path "F:\process_and_upload\Record\jpg" --offset_angle 0 --cutoff_distance 500 --interpolate_directions --duplicate_distance 0.3 --duplicate_angle 3 --move_duplicates --move_uploaded --list_file_status --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 10 --max_attempts 100

D:\mapicam\tools\mapillary\mapillary_tools-050.exe process_and_upload ^
--advanced ^
--version ^
--verbose %rerun% ^
--import_path %import_path% ^
--user_name %user_name% ^
--skip_subfolders ^
--device_make "Blackvue" ^
--device_model "DR900S-1CH" ^
--add_import_date ^
--geotag_source "exif" ^
--geotag_source_path %geotag_source_path% ^
--offset_angle %offset_angle% ^
--cutoff_distance 500 ^
--interpolate_directions ^
--duplicate_distance %duplicate_distance% ^
--duplicate_angle %duplicate_angle% ^
--move_duplicates ^
--move_uploaded ^
--list_file_status ^
--overwrite_all_EXIF_tags ^
--overwrite_EXIF_time_tag ^
--overwrite_EXIF_gps_tag ^
--overwrite_EXIF_direction_tag ^
--overwrite_EXIF_orientation_tag ^
--number_threads 10 ^
--max_attempts 100

cmd /k