:: MapiCam
:: www.t.me/mapicam

:: downloadThis - ExifTool
:: https://www.sno.phy.queensu.ca/~phil/exiftool/

:: ReadThis:
:: http://www.belursus.info/soft/i.php?c=exiftool
:: DateTimeOriginal | CreateDate | ModifyDate

:: COMMAHD FOR COMPASS: 
:: -gpsdestbearing=270 -gpsdestbearingref=true 

:: Compass
:: ---------------------
:: this is scheme camera degree:
::       0            
::   315    45
:: 270   x     90
::   225    135
::      180
:: ---------------------
::      A            
::   B     C
:: D    x    E
::   H     F
::      G
:: ---------------------
:: A=0
:: B=315
:: C=45
:: D=270
:: E=90
:: F=135
:: G=180
:: H=225
:: ---------------------

:: https://forum.mapillary.com/t/for-those-with-lineageos-snap-camera/1051
:: exiftool '-gpsimgdirection<${gpsimgdirection;$_=($_+90)%360}' *.jpg

:: http://u88.n24.queensu.ca/exiftool/forum/index.php/topic,4462.msg21255.html#msg21255
:: exiftool -gpsimgdirection+=315 *.jpg

ECHO ##### START fix COMPASS (HEAD) #####
pause

::exiftool -geotag D:\My_gpx\*.gpx E\adjusted\*.jpg  -overwrite_original
exiftool  -gpsimgdirection=135 F\*.jpg  -overwrite_original


ECHO ##### GOTOVO :) #####
pause
