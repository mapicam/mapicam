:: #####################
:: ###### MapiCam ######
:: #####################
:: ## www.t.me/osmUA  ##
:: ## @velmyshanovnyi ##
:: ##         (c)2019 ##
:: #####################
:: 
:: #####################
:: ####   ReadMe   #####
:: #####################
:: 
:: https://t.me/osmUA
:: https://t.me/MapillaryUkraine
:: https://t.me/MapillaryUkraineChat
:: 
:: DownloadThis - ExifTool
:: https://www.sno.phy.queensu.ca/~phil/exiftool/
:: 
:: ReadThis:
:: http://www.belursus.info/soft/i.php?c=exiftool
:: DateTimeOriginal | CreateDate | ModifyDate
:: 
:: COMMAHD FOR COMPAS: 
:: -gpsdestbearing=270 -gpsdestbearingref=true 
:: 
:: Mapillary Compass
:: http://u88.n24.queensu.ca/exiftool/forum/index.php/topic,4462.msg21255.html#msg21255
:: exiftool -gpsimgdirection+=315 *.jpg
:: 
:: https://forum.mapillary.com/t/for-those-with-lineageos-snap-camera/1051
:: exiftool '-gpsimgdirection<${gpsimgdirection;$_=($_+90)%360}' *.jpg
:: 
:: https://www.openstreetmap.org/user/Blackbird27/diary/38702

:: 
:: #####################
:: # This is parametrs #
:: #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamImgDrive=D:
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamHead=0
@set MapiCamImgDateDIR=20190319
@set MapiCamInterpolationPy="D:\mapicam_tools\mapillary\mapillary_tools-master\mapillary_tools\interpolation.py"
@set MapiCamGeotagFromGpxPy="D:\mapicam_tools\mapillary\mapillary_tools\python\geotag_from_gpx.py"
@set MapiCamMapillaryTools="D:\mapicam_tools\mapillary\mapillary_tools.exe"
@set MapiCamUsernameAtMapillary=velmyshanovnyi
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath              = %MapiCamFFpath%
@echo MapiCamImgDrive            = %MapiCamImgDrive%
@echo MapiCamImgFolder           = %MapiCamImgFolder%
@echo MapiCamGpxFolder           = %MapiCamGpxFolder%
@echo MapiCamImgDIR              = %MapiCamImgDIR% (default)
@echo MapiCamImgDateDIR          = %MapiCamImgDateDIR% (default)
@echo MapiCamInterpolationPy     = %MapiCamInterpolationPy%
@echo MapiCamGeotagFromGpxPy     = %MapiCamGeotagFromGpxPy%
@echo MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo #####################
@echo .
@echo .
@echo .
@echo . Якщо пише ТАКУ помилку, то можливо треба перевести назад на 2 години час в зведеному файлі GPX.
@echo . 
@echo . Setting new values from D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo . Geotime value: 2018:12:31 22:00:00.000 UTC (local timezone is +02:00)
@echo . Warning: Time is too far before track in File:Geotime (ValueConvInv) - D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo . Warning: No writable tags set from D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo . Nothing changed in D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo . 

REM pause

:: IF ERROR - RUN NEXT LINE FOR TEST:
:: exiftool -geotag "%MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\A\adjusted\*.jpg" -gpsimgdirection=0   -overwrite_original -v2


@echo done
@set MapiCamDelayInSeconds=1000
@set MapiCamPingHost=1.1.1.1
@set MapiCamFixZnak1=-
@set MapiCamFixZnak2=+
@set MapiCamFixDate=0:0:0
@set MapiCamFixTime=2:00:00
REM Use ping to wait
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul




:: ===== TEST ==========
@set MapiCamNameXX=00
@set MapiCamHeadXX=45
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
			:: ---------------------
			:: Маніпуляції з датою та часом (на випадок якщо є здвиг в GPX):
			:: exiftool "-DateTimeOriginal-=0:0:0 2:00:00" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
			::
			:: MapiCamFixZnak1
			:: exiftool "-DateTimeOriginal%MapiCamFixZnak1%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
			:: 
			:: MapiCamFixZnak2
			:: exiftool "-DateTimeOriginal%MapiCamFixZnak2%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
			:: ---------------------
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
			:: Працює і без цього (закоментовано для підвищення продуктивності)
			:: exiftool "-FileAccessDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
			:: ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
			:: прибрано після того, як було оптимізовано скрипт який повертає фотки
			:: exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\0-%MapiCamImgDateDIR%.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
			:: --------
			:: параметри для %MapiCamGeotagFromGpxPy%:
			:: python %СКРИПТ% %КАРТИНКИ% %GPX% --offset_angle %КУТ%
python %MapiCamGeotagFromGpxPy% "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" "%MapiCamImgDrive%\%MapiCamGpxFolder%\0-%MapiCamImgDateDIR%.gpx" --offset_angle %MapiCamHeadXX%
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

pause

:: mapillary_tools.exe process_and_upload --advanced --import_path D:/**** --user_name **** --interpolate_directions
:: %MapiCamMapillaryTools% process --advanced --import_path "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" --user_name %MapiCamUsernameAtMapillary%  --interpolate_directions --duplicate_distance 0.5 --skip_subfolders 

:: %MapiCamMapillaryTools% process --advanced --import_path "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" --user_name %MapiCamUsernameAtMapillary%  --interpolate_directions --offset_angle %MapiCamHeadXX% --skip_subfolders 

:: mapillary_tools process --advanced --import_path "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" --user_name %MapiCamUsernameAtMapillary%  --interpolate_directions --offset_angle %MapiCamHeadXX% --skip_subfolders 

:: mapillary_tools process --advanced --import_path "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" --user_name %MapiCamUsernameAtMapillary% --offset_time "offset time"  --interpolate_directions --offset_angle %MapiCamHeadXX% --geotag_source "gpx" --geotag_source_path "%MapiCamImgDrive%\%MapiCamGpxFolder%\0-%MapiCamImgDateDIR%.gpx" --skip_subfolders 

pause

REM @echo off
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\add_fix_dates.py C:\Mapillary\src\0\A\ "2019-03-19 10:44:47" 1
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\add_fix_dates.py C:\Mapillary\src\0\B\ "2019-03-19 10:44:47" 1
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\add_fix_dates.py C:\Mapillary\src\0\C\ "2019-03-19 10:44:47" 1
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\geotag_from_gpx.py C:\Mapillary\src\0\A\ C:\Mapillary\src\0\0-20190319.gpx 
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\geotag_from_gpx.py C:\Mapillary\src\0\B\ C:\Mapillary\src\0\0-20190319.gpx --offset_angle -45
REM c:\python27\python D:\mapicam_tools\mapillary\mapillary_tools\python\geotag_from_gpx.py C:\Mapillary\src\0\C\ C:\Mapillary\src\0\0-20190319.gpx --offset_angle 45


@echo . ============= END TEST =================
pause
@echo . ============= END TEST =================
pause


:: ===== A =============
@set MapiCamNameXX=A
@set MapiCamHeadXX=0
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
REM :: прибрано після того, як було оптимізовано скрипт який повертає фотки
REM :: exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
REM :: --------
REM :: параметри для %MapiCamGeotagFromGpxPy%:
REM :: python %СКРИПТ% %КАРТИНКИ% %GPX% --offset_angle %КУТ%
python %MapiCamGeotagFromGpxPy% "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" "%MapiCamImgDrive%\%MapiCamGpxFolder%\0-%MapiCamImgDateDIR%.gpx" --offset_angle %MapiCamHeadXX%
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== B =============
@set MapiCamNameXX=B
@set MapiCamHeadXX=315
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== C =============
@set MapiCamNameXX=C
@set MapiCamHeadXX=45
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== D =============
@set MapiCamNameXX=D
@set MapiCamHeadXX=270
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== E =============
@set MapiCamNameXX=E
@set MapiCamHeadXX=90
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== F =============
@set MapiCamNameXX=F
@set MapiCamHeadXX=135
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== G =============
@set MapiCamNameXX=G
@set MapiCamHeadXX=180
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== H =============
@set MapiCamNameXX=H
@set MapiCamHeadXX=225
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool -geotag %MapiCamImgDrive%\%MapiCamGpxFolder%\*.gpx %MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDateDIR%\%MapiCamNameXX%" -overwrite_original

:: ===== END ===========

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
