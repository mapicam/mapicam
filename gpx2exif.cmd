:: MapiCam
:: www.t.me/mapicam

:: DownloadThis - ExifTool
:: https://www.sno.phy.queensu.ca/~phil/exiftool/

:: ReadThis:
:: http://www.belursus.info/soft/i.php?c=exiftool
:: DateTimeOriginal | CreateDate | ModifyDate

:: COMMAHD FOR COMPAS: 
:: -gpsdestbearing=270 -gpsdestbearingref=true 

:: Mapillary Compass
:: http://u88.n24.queensu.ca/exiftool/forum/index.php/topic,4462.msg21255.html#msg21255
:: exiftool -gpsimgdirection+=315 *.jpg

:: https://forum.mapillary.com/t/for-those-with-lineageos-snap-camera/1051
:: exiftool '-gpsimgdirection<${gpsimgdirection;$_=($_+90)%360}' *.jpg


:: #####################
:: # This is parametrs #
:: #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamImgDrive=D:
@set MapiCamImgFolder=mapicam2upload
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamHead=0
@set MapiCamImgDateDIR=20190121
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath     = %MapiCamFFpath%
@echo MapiCamImgDrive   = %MapiCamImgDrive%
@echo MapiCamImgFolder  = %MapiCamImgFolder%
@echo MapiCamImgDIR     = %MapiCamImgDIR% (default)
@echo MapiCamImgDateDIR = %MapiCamImgDateDIR% (default)
@echo #####################
@echo .


::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\A\*.jpg -gpsimgdirection=0   -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\B\*.jpg -gpsimgdirection=315 -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\C\*.jpg -gpsimgdirection=45  -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\D\*.jpg -gpsimgdirection=270 -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\E\*.jpg -gpsimgdirection=90  -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\F\*.jpg -gpsimgdirection=135 -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\G\*.jpg -gpsimgdirection=180 -overwrite_original
::exiftool -geotag D:\My_gpx\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\H\*.jpg -gpsimgdirection=225 -overwrite_original


::exiftool -gpsimgdirection=0   %MapiCamImgDateDIR%\A\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=315 %MapiCamImgDateDIR%\B\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=45  %MapiCamImgDateDIR%\C\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=270 %MapiCamImgDateDIR%\D\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=90  %MapiCamImgDateDIR%\E\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=135 %MapiCamImgDateDIR%\F\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=180 %MapiCamImgDateDIR%\G\adjusted\*.jpg -overwrite_original
::exiftool -gpsimgdirection=225 %MapiCamImgDateDIR%\H\adjusted\*.jpg -overwrite_original



ECHO ##### GOTOVO :) #####
pause
