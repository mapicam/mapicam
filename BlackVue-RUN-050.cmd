cd %1%
@set MapiCamPhaseNum=[RUN-050]
@set MapiCamLOG=mapicam-LOG.txt
@echo.
@echo ###################################################
@echo #                                                 #
@echo #                    MapiCam                      #
@echo #                                                 #
@echo ###################################################
@echo #                                                 #
@echo #  www.t.me/osmUA                                 #
@echo #  @velmyshanovnyi                                #
@echo #                                         (c)2019 #
@echo #                                                 #
@echo ###################################################
@echo                                                    
@echo ###################################################
@echo #                                                 #
@echo #                    ReadMe                       #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # https://t.me/osmUA                              #
@echo # https://t.me/MapillaryUkraine                   #
@echo # https://t.me/MapillaryUkraineChat               #
@echo # https://github.com/mapicam/mapicam              #
@echo # https://github.com/mapicam/mapicam/wiki         #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # START : RUN-START                               #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###############################################################
@echo #
@echo # START : RUN MapiCam 050                     
@echo #
@echo #--------------------------------------------------------------
@echo #
@echo # 1 Folder             %1%                         
@echo # 2 Fps                %2%                         
@echo # 3 OffsetAngle        %3%                         
@echo # 4 DuplicateDistance  %4%                         
@echo # 5 UserName           %5%                         
@echo #
@echo #--------------------------------------------------------------
@echo #           
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE                                       
RMDIR %BlackVueFolder%\[RUN-050]-ALL_PROCESSED_END 
MKDIR %BlackVueFolder%\[RUN-050]-PROCESSED

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
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
::   050 при рендері video_process_and_upload викликає 1970-01-01
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
::   ТЕСТУЄТЬСЯ 050 video_process 
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
:: Використовуємо механіку, коли ЯРЛИК (LNK) зчитує розташування і СКРИПТ працює відносно папки з якої запустили LNK
::   BlackVueFolder=F:\BlackVue
@set BlackVueFolder=%1%
::   BlackVueFPS=10
@set BlackVueFPS=%2%
::   BlackVueInterval 0.1
@IF %BlackVueFPS%==30    ( set BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set BlackVueInterval=30    ) 
ELSE ( set BlackVueInterval=0.1 )
::   --offset_angle 0
@set BlackVueOffsetAngle=%3%
::   --duplicate_distance 0.2
@set BlackVueDuplicateDistance=%4%
::   --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%
@set MapiCamLOG=%BlackVueFolder%\mapicam-LOG.txt
::   --import_path "Record\jpg"
::                  Record\jpg\.mapillary (там же має лежати папка з файлами мапілларі)
@set uploadImportPath=Record\jpg
@echo ---------------------------------------------------
@echo %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%
@echo %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%
@echo %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath%
@echo.
@echo %date% %time% # %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%                    >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%            >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%                      >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%              >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%        >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%                  >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%                       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo ---------------------------------------------------
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
@echo ---------------------------------------------------
@echo.




mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps


:: 050 & 042 = ERROR
:: %MapiCamMapillaryTools% video_process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%
:: Traceback (most recent call last):
::   File "mapillary_tools", line 76, in <module>
::   File "mapillary_tools\commands\video_process_and_upload.py", line 179, in run
::   File "mapillary_tools\post_process.py", line 161, in post_process
::   File "mapillary_tools\processing.py", line 680, in get_duplicate_file_list
:: NameError: global name 'root_dir' is not defined
:: [6204] Failed to execute script mapillary_tools



:: mapillary_tools video_process_and_upload 
:: --import_path "path/to/images" 
:: --video_import_path "path/to/videos" 
:: --user_name "mapillary_user" 
:: --advanced 
:: --geotag_source "gpx" 
:: --geotag_source_path "path/to/gpx_file" 
:: --video_sample_interval 1 
:: --interpolate_directions


@echo %date% %time% # %MapiCamPhaseNum% # %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag >> %MapiCamLOG%

%MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag >> %MapiCamLOG%


:: %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" ^
:: --video_import_path "%BlackVueFolder%\Record" --user_name %MapiCamUsernameAtMapillary% --video_sample_interval %BlackVueInterval%  ^
:: --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "blackvue_videos" ^
:: --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --cutoff_distance 10000 --use_gps_start_time ^
:: --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% ^
:: --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag >> %MapiCamLOG%





@echo ---------------------------------------------------
RMDIR %BlackVueFolder%\[RUN-050]-PROCESSED          >> %MapiCamLOG%
MKDIR %BlackVueFolder%\[RUN-050]-ALL_PROCESSED_END  >> %MapiCamLOG%
DIR                                                 >> %MapiCamLOG%
DIR
@echo ---------------------------------------------------


@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% upload = COMPLETE :-)                                           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-UPLOAD-2-MAPILLARY-COMPLETE

@echo.
@echo ---------------------------------------------------------------
@echo upload = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.



@echo.
@echo.
@echo.
@echo ###################################################
@echo #                                                 #
@echo #              END RUN-050 PROCESS                #
@echo #                                                 #
@echo ###################################################
@echo.
@echo.
@echo.

cmd /k
