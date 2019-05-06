cd %1%
@set MapiCamPhaseNum=[3]
@echo ##### HEAD ##############################################################
setlocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set BlackVueFolder=%1%
@set BlackVueFPS=%2%
@set BlackVueOffsetAngle=%3%
@set BlackVueDuplicateDistance=%4%
@set MapiCamUsernameAtMapillary=%5%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%
@echo ##### HEAD ##############################################################

::   BlackVueInterval 0.1
@set BlackVueInterval=0.1
@IF %BlackVueFPS%==30    ( set BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set BlackVueInterval=30    ) 
@echo ##### HEAD (fix local error)#############################################



mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\%uploadImportPath%
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps



:: mkdir "F:\BlackVueFolder\Record\csv"
:: треба зробити (колись пізніше)-1: на цьому ж етапі генерувати і текстовий файл з координатами.
:: треба зробити (колись пізніше)-2: знайти якийсь аналог до --skip_subfolders , бо процес на ВСІ підпапки займає занадто багато часу, і іноді вилітає, що тягне за собою видалення всього, та повний повторний прогон рендеренгу.

:: D:\mapicam\tools\mapillary\mapillary_tools.exe sample_video --advanced -h

:: %MapiCamMapillaryTools% sample_video --advanced --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval%

@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --move_duplicates --move_uploaded >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%

:: D:\mapicam\tools\mapillary\mapillary_tools-050.exe video_process --advanced -h
:: --rerun
:: --use_gps_start_time - ОБОВЯЗКОВИЙ ПАРАМЕТР!
:: %MapiCamMapillaryTools% 
:: УВАГА !!!! УВАГА !!!! УВАГА !!!! УВАГА !!!! УВАГА !!!! 
:: УВАГА : ПЕРЕВІРЕНО ДЕКІЛЬКА РАЗІВ! корректно працює ЛИШЕ на 042 версії. лише на ній виходить розпарсити ДАТУ/ЧАС корректно!!! Версія 050 з тими ж параметрами дає 1970-01-01.
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo #####
%MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --move_duplicates --move_uploaded >> %MapiCamLOG%


:: mapillary_tools video_process 
:: --advanced
:: --version
:: --verbose
:: --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps"
:: --rerun
:: --user_name velmyshanovnyi
:: --video_import_path "%BlackVueFolder%\Record"
:: --video_sample_interval %BlackVueInterval%
:: --device_make "Blackvue"
:: --device_model "DR900S-1CH"
:: --geotag_source "blackvue_videos"
:: --geotag_source_path "%BlackVueFolder%\Record"
:: --offset_angle 0
:: --use_gps_start_time
:: --interpolate_directions
:: --duplicate_distance %BlackVueDuplicateDistance%
:: --overwrite_all_EXIF_tags
:: --overwrite_EXIF_gps_tag


:: optional arguments:
:: -h, --help									show this help message and exit
:: --advanced									Use the tools under an advanced level with additional	arguments and tools available.
:: --version									Print mapillary tools version.
:: --verbose									print debug info
:: --import_path IMPORT_PATH					path to your photos, or in case of video, path where the photos from video sampling will be saved
:: --rerun										rerun the processing
:: --user_name USER_NAME	user name
:: --organization_username ORGANIZATION_USERNAME	Specify organization user name
:: --organization_key ORGANIZATION_KEY				Specify organization key
:: --private									Specify whether the import is private
:: --skip_subfolders							Skip all subfolders and import only the images in the	given directory path.
:: --master_upload								Process images with a master key, note: only used by Mapillary employees
:: --device_make DEVICE_MAKE					Specify device manufacturer. Note this input has precedence over the input read from the import source file.
:: --device_model DEVICE_MODEL					Specify device model. Note this input has precedence over the input read from the import source file.
:: --add_file_name								Add original file name to EXIF. Note this input has precedence over the input read from the import source	file.
:: --exclude_import_path						If local file name is to be added exclude import_path from the name.
:: --exclude_path EXCLUDE_PATH					If local file name is to be added, specify the path to be excluded.
:: --add_import_date							Add import date.
:: --windows_path								If local file name is to be added with
:: 	--add_file_name,							added it as a windows path.
:: --orientation {0,90,180,270} 				Specify the image orientation in degrees. Note this might result in image rotation. Note this input has precedence over the input read from the import source file.
:: --GPS_accuracy GPS_ACCURACY   				GPS accuracy in meters. Note this input has precedence over the input read from the import source file.
:: --camera_uuid CAMERA_UUID 					Custom string used to differentiate different captures taken with the same camera make and model.
:: --geotag_source {exif,gpx,gopro_videos,nmea,blackvue_videos} 	Provide the source of date/time and gps information	needed for geotagging.
:: --geotag_source_path GEOTAG_SOURCE_PATH 		Provide the path to the file source of date/time and gps information needed for geotagging.
:: --local_time          						Assume image timestamps are in your local time 
:: --sub_second_interval SUB_SECOND_INTERVAL 	Sub second time between shots. Used to set image times with sub-second precision
:: --offset_time OFFSET_TIME					time offset between the camera and the gps device, in seconds.
:: --offset_angle OFFSET_ANGLE					offset camera angle (90 for right facing, 180 for rear facing, -90 for left facing)
:: --use_gps_start_time							Use GPS trace starting time in case of derivating timestamp from filename.
:: --cutoff_distance CUTOFF_DISTANCE			maximum gps distance in meters within a sequence
:: --cutoff_time CUTOFF_TIME 					maximum time interval in seconds within a sequence
:: --interpolate_directions						perform interploation of directions
:: --keep_duplicates							keep duplicates, ie do not flag duplicates for upload exclusion, but keep them to be uploaded
:: --duplicate_distance DUPLICATE_DISTANCE		max distance for two images to be considered duplicates in meters
:: --duplicate_angle DUPLICATE_ANGLE			max angle for two images to be considered duplicates in degrees
:: --skip_EXIF_insert    						Skip inserting the extracted data into image EXIF.
:: --keep_original       						Do not overwrite original images, instead save the processed images in a new directory called "processed_images" located in .mapillary in the import_path.
:: --summarize           						Summarize import for given import path.
:: --move_all_images     						Move all images in import_path according to import state.
:: --move_duplicates     						Move images in case they were flagged as duplicates.
:: --move_uploaded       						Move images according to upload state.
:: --move_sequences      						Move images into sequence folders.
:: --save_as_json        						Save summary or file status list in a json.
:: --list_file_status    						List file status for given import path.
:: --push_images         						Push images uploaded in given import path.
:: --split_import_path SPLIT_IMPORT_PATH		If splitting the import path into duplicates, sequences, success and failed uploads, provide a path for the splits.
:: --save_local_mapping							Save the mapillary photo uuid to local file mapping in a csv.
:: --overwrite_all_EXIF_tags					Overwrite the rest of the EXIF tags, whose values are changed during the processing. Default is False, which will result in the processed values to be inserted only in the EXIF Image Description tag.
:: --overwrite_EXIF_time_tag					Overwrite the capture time EXIF tag with the value obtained in process.
:: --overwrite_EXIF_gps_tag						Overwrite the gps EXIF tag with the value obtained in process.
:: --overwrite_EXIF_direction_tag  				Overwrite the camera direction EXIF tag with the value obtained in process.
:: --overwrite_EXIF_orientation_tag				Overwrite the orientation EXIF tag with the value obtained in process.
:: --custom_meta_data CUSTOM_META_DATA			Add custom meta data to all images. Required format of input is a string, consisting of the meta data name, type and value, separated by a comma for each entry, where entries are separated by semicolon. Supported types are long, double, string, boolean, date. Example for two meta data entries "random_name1,double,12.34;random_name2,long,1234"




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
	   
	   

:: УВАГА!!!
:: якщо з якоїсь причини папки (каталоги)
:: --video_import_path "%BlackVueFolder%\Record"
:: та
:: --geotag_source_path "%BlackVueFolder%\Record"
:: будуть відрізнятись - то це викличе помилку:
:: Warning, required geotag_process did not result in a valid json file for image F:\BlackVueFolder\Record\10fps\mapillary_sampled_video_frames\20190404_081744_NF\20190404_081744_NF_000610.jpg
:: і згенеровані файли (.JPG) НЕ БУДУТЬ ПРОШИТІ КООРДИНАТАМИ ІЗ ВІДЕО 
:: УВАГА!!! END

mkdir %BlackVueFolder%\Record\gpx
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
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [3] END   : BlackVueVideo2Photo                             # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [4] NEXT  : MergeGPS                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%      
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
