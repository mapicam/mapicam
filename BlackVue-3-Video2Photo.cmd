::
:: ###################################################
:: #                                                 #
:: #                    MapiCam                      #
:: #                                                 #
:: ###################################################
:: #                                                 #
:: #  www.t.me/osmUA                                 #
:: #  @velmyshanovnyi                                #
:: #                                         (c)2019 #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: #                    ReadMe                       #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: # https://t.me/osmUA                              #
:: # https://t.me/MapillaryUkraine                   #
:: # https://t.me/MapillaryUkraineChat               #
:: # https://github.com/mapicam/mapicam              #
:: # https://github.com/mapicam/mapicam/wiki         #
:: #                                                 #
:: ###################################################
::
@set MapiCamPhaseNum=[3]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% #                                                                                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [3] START : BlackVueVideo2Photo                               >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ###################################################
@echo #                                                 #
@echo # START : [3] BlackVueVideo2Photo                 #
@echo #                                                 #
@echo ###################################################
@echo.

setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
::   BlackVueFolder=F:\BlackVue
@set BlackVueFolder=%1%
@set BlackVue=%BlackVueFolder%
::   BlackVueFPS=10
@set BlackVueFPS=%2%
::   BlackVueInterval 0.1
@set BlackVueInterval=%3%
::   --duplicate_distance 0.1
@set BlackDuplicateDistance=%4%
::   --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%


@echo.
@echo %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo                   BlackVue                   = %BlackVue%
@echo %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo.
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo.

mkdir "%BlackVueFolder%\Record"
mkdir "%BlackVueFolder%\Record\%BlackVueFPS%fps"
mkdir "%BlackVueFolder%\Record\gpx"
:: mkdir "F:\BlackVueFolder\Record\csv"
:: треба зробити (колись пізніше)-1: на цьому ж етапі генерувати і текстовий файл з координатами.
:: треба зробити (колись пізніше)-2: знайти якийсь аналог до --skip_subfolders , бо процес на ВСІ підпапки займає занадто багато часу, і іноді вилітає, що тягне за собою видалення всього, та повний повторний прогон рендеренгу.

mapillary_tools video_process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle 0 --interpolate_directions --duplicate_distance %BlackVueDistance% --use_gps_start_time --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag	--overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag	--overwrite_EXIF_orientation_tag --save_as_json --list_file_status

	

 
		   :: REM [-h] [--advanced] [--version] [--verbose] [--import_path IMPORT_PATH]
		   :: REM [--rerun] --user_name USER_NAME
		   :: REM [--organization_username ORGANIZATION_USERNAME] [--organization_key ORGANIZATION_KEY] [--private]
		   :: REM [--video_import_path VIDEO_IMPORT_PATH]
		   :: REM [--video_sample_interval VIDEO_SAMPLE_INTERVAL] [--video_duration_ratio VIDEO_DURATION_RATIO] [--video_start_time VIDEO_START_TIME] 
		   :: REM [--skip_subfolders]
		   :: REM [--master_upload] 
		   :: REM [--device_make DEVICE_MAKE]
		   :: REM [--device_model DEVICE_MODEL] 
		   :: REM [--add_file_name] 
		   :: REM [--exclude_import_path]
		   :: REM [--exclude_path EXCLUDE_PATH] 
		   :: REM [--windows_path] 
		   :: REM [--add_import_date]
		   :: REM [--orientation {0,90,180,270}] 
		   :: REM [--GPS_accuracy GPS_ACCURACY]
		   :: REM [--camera_uuid CAMERA_UUID]
		   :: REM [--geotag_source {exif,gpx,gopro_videos,nmea,blackvue_videos}]
		   :: REM [--geotag_source_path GEOTAG_SOURCE_PATH] 
		   :: REM [--local_time]
		   :: REM [--sub_second_interval SUB_SECOND_INTERVAL] 
		   :: REM [--offset_time OFFSET_TIME]
		   :: REM [--offset_angle OFFSET_ANGLE] 
		   :: REM [--use_gps_start_time]
		   :: REM [--cutoff_distance CUTOFF_DISTANCE] 
		   :: REM [--cutoff_time CUTOFF_TIME]
		   :: REM [--interpolate_directions] 
		   :: REM [--flag_duplicates] 
		   :: REM [--keep_duplicates]
		   :: REM [--duplicate_distance DUPLICATE_DISTANCE]
		   :: REM [--duplicate_angle DUPLICATE_ANGLE] 
		   :: REM [--skip_EXIF_insert]
		   :: REM [--keep_original] 
		   :: REM [--number_threads NUMBER_THREADS]
		   :: REM [--max_attempts MAX_ATTEMPTS] 
		   :: REM [--overwrite_all_EXIF_tags]
		   :: REM [--overwrite_EXIF_time_tag] 
		   :: REM [--overwrite_EXIF_gps_tag]
		   :: REM [--overwrite_EXIF_direction_tag] 
		   :: REM [--overwrite_EXIF_orientation_tag]
		   :: REM [--summarize] 
		   :: REM [--move_all_images] 
		   :: REM [--move_duplicates] 
		   :: REM [--move_uploaded]
		   :: REM [--move_sequences] 
		   :: REM [--save_as_json] 
		   :: REM [--list_file_status]
		   :: REM [--push_images] [--split_import_path SPLIT_IMPORT_PATH]
		   :: REM [--save_local_mapping] [--custom_meta_data CUSTOM_META_DATA]
	   
	   

:: REM mapillary_tools video_process 
:: REM --advanced 
:: REM --verbose 
:: REM --user_name velmyshanovnyi 
:: REM --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" 
:: REM --video_import_path "%BlackVueFolder%\Record" 
:: REM --geotag_source "blackvue_videos" 
:: REM --geotag_source_path "%BlackVueFolder%\Record" 
:: REM --use_gps_start_time 
:: REM --offset_angle 0 
:: REM --interpolate_directions 
:: REM --video_sample_interval %BlackVueInterval% 
:: REM --device_make "Blackvue" 
:: REM --device_model "DR900S-1CH" 
:: REM --overwrite_EXIF_gps_tag 
:: REM --duplicate_distance %BlackVueInterval%


:: УВАГА!!!
:: якщо з якоїсь причини папки (каталоги)
:: --video_import_path "%BlackVueFolder%\Record"
:: та
:: --geotag_source_path "%BlackVueFolder%\Record"
:: будуть відрізнятись - то це викличе помилку:
:: Warning, required geotag_process did not result in a valid json file for image F:\BlackVueFolder\Record\10fps\mapillary_sampled_video_frames\20190404_081744_NF\20190404_081744_NF_000610.jpg
:: і згенеровані файли (.JPG) НЕ БУДУТЬ ПРОШИТІ КООРДИНАТАМИ ІЗ ВІДЕО 
:: УВАГА!!! END

move "%BlackVueFolder%\Record\*.gpx" "%BlackVueFolder%\Record\gpx"

@echo.
@echo.
@echo.
@echo ###################################################
@echo #                                                 #
@echo # END   : [3] BlackVueVideo2Photo                 #
@echo #                                                 #
@echo ###################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!


pause