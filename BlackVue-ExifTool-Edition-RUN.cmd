cd %1%
@set MapiCamPhaseNum=[PaketnaObrobka]
@echo ##### HEAD ##############################################################
enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set BlackVueFolder=%1%
@set BlackVueFPS=%2%
@set BlackVueOffsetAngle=%3%
@set BlackVueDuplicateDistance=%4%
@set MapiCamUsernameAtMapillary=%5%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%
@echo ##### HEAD ##############################################################
@echo.
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
@echo BlackVueFPS      = %BlackVueFPS%
@echo BlackVueInterval = %BlackVueInterval%
@echo ##### HEAD (fix local error)#############################################
@set MapiCamExifToolPath=D:\mapicam\tools\exiftool
@set MapiCamExifTool=%MapiCamExifToolPath%\exiftool.exe
@echo ##### HEAD (fix local error)#############################################
@echo.
mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg

:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue


echo ######################################## START ######################################
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".mp4"') do (
set BlackVueCall=%%I
echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %%I
CALL %MapiCamFolder%\BlackVue-ExifTool-Edition.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary% %%I
)
echo ############################################## END ##################################


:: ------------------------------------------------------------------------------------------------------------------
:: СОРТУВАННЯ ЗА ДАТОЮ СТВОРЕННЯ (зручно в разі ВЕЛИКОЇ кількості відеофайлів за різні дати)
:: СТВОРИТИ папку YYYYMMDD і перемістити в неї файли
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" DIR
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" "%BlackVueFolder%\Record\jpg"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe  -r "-Directory<DateTimeOriginal" -d "F:\BlackVue\20190429-kyiv\09\%Y%m%d\Record\jpg" "F:\BlackVue\20190429-kyiv\09\Record\jpg"
:: ------------------------------------------------------------------------------------------------------------------	
	
mkdir %BlackVueFolder%\Record\jpg
@move /Y "%BlackVueFolder%\Record_Finalize\jpg\*.jpg" "%BlackVueFolder%\Record\jpg"
@rmdir "%BlackVueFolder%\Record_Finalize\jpg"


set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
:: D:\mapicam\tools\mapillary\mapillary_tools-050.exe  process --advanced -h
%MapiCamMapillaryTools% process --advanced --version --verbose ^
--import_path "%BlackVueFolder%\Record\jpg" ^
--user_name %MapiCamUsernameAtMapillary% ^
--skip_subfolders ^
--device_make "Blackvue" ^
--device_model "DR900S-1CH" ^
--geotag_source "exif" ^
--geotag_source_path "%BlackVueFolder%\Record\jpg" ^
--orientation 0 ^
--offset_angle %BlackVueOffsetAngle% ^
--use_gps_start_time ^
--interpolate_directions ^
--duplicate_distance %BlackVueDuplicateDistance% ^
--overwrite_all_EXIF_tags ^
--overwrite_EXIF_time_tag ^
--overwrite_EXIF_gps_tag ^
--overwrite_EXIF_direction_tag ^
--overwrite_EXIF_orientation_tag ^
--move_duplicates ^
--move_uploaded

:: D:\mapicam\tools\mapillary\mapillary_tools-042.exe process --advanced --version --verbose --import_path "F:\BlackVue\20190429-kyiv\09\Record\jpg2mapillary" --user_name velmyshanovnyi --skip_subfolders --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "exif" --geotag_source_path "F:\BlackVue\20190429-kyiv\09\Record\jpg2mapillary" --orientation 0 --offset_angle 0 --use_gps_start_time --interpolate_directions --duplicate_distance 0.5 --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --move_duplicates --move_uploaded




mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record_Finalize
mkdir %BlackVueFolder%\Record_Finalize\gpx

@move /Y "%BlackVueFolder%\Record_Finalize\*.mp4" "%BlackVueFolder%\Record"
@move /Y "%BlackVueFolder%\Record_Finalize\gpx\*.gpx" "%BlackVueFolder%\Record\gpx"

@rmdir "%BlackVueFolder%\Record\01fpx"
@rmdir "%BlackVueFolder%\Record\02fpx"
@rmdir "%BlackVueFolder%\Record\05fpx"
@rmdir "%BlackVueFolder%\Record\10fpx"
@rmdir "%BlackVueFolder%\Record\15fpx"
@rmdir "%BlackVueFolder%\Record\20fpx"
@rmdir "%BlackVueFolder%\Record\30fpx"

@rmdir "%BlackVueFolder%\Record_Call\*fpx"
@rmdir "%BlackVueFolder%\Record_Call\jpg"
@rmdir "%BlackVueFolder%\Record_Call\gpx"
@rmdir "%BlackVueFolder%\Record_Call"

@rmdir "%BlackVueFolder%\Record_Finalize\*fpx"
@rmdir "%BlackVueFolder%\Record_Finalize\jpg"
@rmdir "%BlackVueFolder%\Record_Finalize\gpx"
@rmdir "%BlackVueFolder%\Record_Finalize"



@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # END   : %MapiCamPhaseNum%                        #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # END : %MapiCamPhaseNum%                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%    
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!

REM D:\mapicam\tools\exiftool\exiftool.exe "-DateTimeOriginal+=0:0:1 0:0:0" "F:\BlackVue\20190429-kyiv\Record\jpg" -overwrite_original && D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<DateTimeOriginal" -d "%Y%m%d-%H%M%S%%-.1c.%%e" "F:\BlackVue\20190429-kyiv\Record\jpg" -overwrite_original && D:\mapicam\tools\exiftool\exiftool.exe -r "-AllDates<DateTimeOriginal" -r "-CreateDate<DateTimeOriginal" -r "-ModifyDate<DateTimeOriginal" -r "-FileCreateDate<DateTimeOriginal" -r "-FileModifyDate<DateTimeOriginal" -r "-SubSecCreateDate<DateTimeOriginal" -r "-SubSecModifyDate<DateTimeOriginal" -r "-SubSecDateTimeOriginal<DateTimeOriginal" "F:\BlackVue\20190429-kyiv\Record\jpg" -overwrite_original

@echo.
@echo delthaVideoSec           (true)  = %delthaVideoSec%
@echo delthaGpxSec             (true)  = %delthaGpxSec%
@echo delthaVideoSecFix        (true)  = %delthaVideoSecFix%
@echo delthaGpsSecFix          (true)  = %delthaGpsSecFix%
@echo. 

cmd /k

