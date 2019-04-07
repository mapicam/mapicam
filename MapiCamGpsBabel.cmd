:: #####################
:: ###### MapiCam ######
:: #####################
:: ## www.t.me/osmUA  ##
:: ## @velmyshanovnyi ##
:: ##         (c)2019 ##
:: #####################
:: 
:: https://t.me/osmUA
:: https://t.me/MapillaryUkraine
:: https://t.me/MapillaryUkraineChat
:: https://t.me/joinchat/BYnnNRYLZdfub5u4MMvsRQ (MapiCam Chat)
:: 
:: #####################
:: ####   ReadMe   #####
:: #####################
:: #####################
:: # This is parametrs #
:: #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamGBpath=C:\Progra~2\GPSBabel
@set MapiCamImgDrive=D:
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamHead=0
@set MapiCamImgDateDIR=20190101
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath     = %MapiCamFFpath%
@echo MapiCamGBpath     = %MapiCamGBpath%  = C:\Program Files (x86)\GPSBabel
@echo MapiCamImgDrive   = %MapiCamImgDrive%
@echo MapiCamImgFolder  = %MapiCamImgFolder%
@echo MapiCamGpxFolder  = %MapiCamGpxFolder%
@echo MapiCamImgDIR     = default = %MapiCamImgDIR%
@echo MapiCamImgDateDIR = default = %MapiCamImgDateDIR%
@echo #####################

:: pause
:: 



cd..
cd..
cd..
cd..

%MapiCamImgDrive%
mkdir %MapiCamGpxFolder%
cd %MapiCamGpxFolder%
mkdir %MapiCamImgDateDIR%
cd %MapiCamImgDateDIR%
mkdir merged
mkdir interpolate


@echo .
@echo Remove Duplicates (duplicate)
@echo https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
@echo :: SKIP next line
@echo :: %MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\1.gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\2.gpx -x duplicate,location,shortname -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\merget\%MapiCamImgDateDIR%-merget.gpx
@echo .

@echo .
@echo Interpolate between trackpoints (interpolate)
@echo https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
:: %MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\merget\%MapiCamImgDateDIR%-merget.gpx -x interpolate,time=1 -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\interpolate\%MapiCamImgDateDIR%-interpolate.gpx
%MapiCamGBpath%\gpsbabel.exe -i gpx -f %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\%MapiCamImgDateDIR%.gpx -x interpolate,time=1 -o gpx -F %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\interpolate\%MapiCamImgDateDIR%-interpolate.gpx
@echo .




@echo .
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause
