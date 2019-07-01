
@echo.
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS                                            #
@echo #-------------------------------------------------------------#
@echo OFF
set year=%date:~-4%
set month=%date:~3,2%
  if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
  if "%day:~0,1%" == " " set day=0%day:~1,1%
set hour=%time:~0,2%
  if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
  if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
  if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set datetimefull=%year%-%month%-%day%T%hour%:%min%:%secs%Z
set MapiCamDate=%year%%month%%day%
set MapiCamTime=%hour%%min%%secs%
@echo ON
@echo #                                                             #
@echo # date         = %date%                                   #
@echo # time         = %time%                                  #
@echo # year         = %year%                                         #
@echo # month        = %month%                                           #
@echo # day          = %day%                                           #
@echo # hour         = %hour%                                           #
@echo # min          = %min%                                           #
@echo # secs         = %secs%                                           #
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.

cd %1%
setlocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe

mkdir jpg

D:\mapicam\tools\mapillary\mapillary_tools-050.exe video_process ^
--import_path "jpg" ^
--video_import_path "Record" ^
--user_name "velmyshanovnyi" ^
--advanced  ^
--version ^
--verbose ^
--rerun ^
--geotag_source "blackvue_videos" ^
--geotag_source_path "Record" ^
--use_gps_start_time ^
--offset_angle 0 ^
--cutoff_distance 500 ^
--interpolate_directions ^
--duplicate_distance 0.3 ^
--duplicate_angle 3 ^
--video_sample_interval 0.05 ^
--device_make "Blackvue" ^
--device_model "DR900S-1CH" ^
--overwrite_EXIF_gps_tag

@rem для 050 скрипта виокремив ще один БАГ. якщо містить параметр "--skip_subfolders" то не перестає прошивати координатами (((


cmd -k
