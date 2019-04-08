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
:: https://github.com/mapicam/mapicam
:: https://github.com/mapicam/mapicam/wiki/FixDateTime <-- READ ME!
:: 
:: #####################
:: # This is parametrs #
:: #####################
setlocal enableextensions enabledelayedexpansion
@set MapiCamFFpath=c:\ffmpeg\bin
:: BlackVue=F:\BlackVue
@set BlackVue=%1%
:: BlackVueFPS=10
@set BlackVueFPS=%2%
::   MapiCamImgFolder=%BlackVue%\Record\jpg
@set MapiCamImgFolder=%BlackVue%\Record\jpg
@set MapiCamGpxFolder=%BlackVue%\Record\gpx

@set MapiCamImgDIR=00
@set MapiCamImgDIR=%2%
@set MapiCamHead=0
@set MapiCamHeadXX=%MapiCamHead%
@set offsetAngle=%MapiCamHeadXX%
@set MapiCamImgDateDIR=20190319
@set MapiCamInterpolationPy="D:\mapicam_tools\mapillary\mapillary_tools-master\mapillary_tools\interpolation.py"
@set MapiCamGeotagFromGpxPy="D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py"
@set MapiCamMapillaryTools="D:\mapicam\tools\mapillary\mapillary_tools.exe"
@set MapiCamUsernameAtMapillary=velmyshanovnyi
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath              = %MapiCamFFpath%
@echo BlackVue                   = %BlackVue%
@echo BlackVueFPS                = %BlackVueFPS%
@echo MapiCamImgDrive            = %MapiCamImgDrive%
@echo MapiCamImgFolder           = %MapiCamImgFolder%
@echo MapiCamGpxFolder           = %MapiCamGpxFolder%
@echo MapiCamImgDIR              = %MapiCamImgDIR% (default)
@echo MapiCamImgDateDIR          = %MapiCamImgDateDIR% (default)
@echo MapiCamInterpolationPy     = %MapiCamInterpolationPy%
@echo MapiCamGeotagFromGpxPy     = %MapiCamGeotagFromGpxPy%
@echo MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo MapiCamHeadXX              = %MapiCamHeadXX%
@echo offsetAngle                = %offsetAngle%
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
:: exiftool -geotag "%MapiCamGpxFolder%\*.gpx" "%MapiCamImgFolder%\*.jpg" -gpsimgdirection=0   -overwrite_original -v2


@echo done
@set MapiCamDelayInSeconds=1000
@set MapiCamPingHost=127.0.0.1
@set MapiCamFixZnak1=-
@set MapiCamFixZnak2=+
@set MapiCamFixDate=0:0:0
@set MapiCamFixTime=2:00:00
REM Use ping to wait
ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul

@echo.
@echo #####################
@echo.

exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
exiftool "-FileModifyDate" "%MapiCamImgFolder%"
exiftool "-FileCreateDate" "%MapiCamImgFolder%"
exiftool "-DateTime" "%MapiCamImgFolder%"
exiftool "-CreateDate" "%MapiCamImgFolder%"

@echo.
@echo #####################
@echo.

exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original




:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue
@set offsetAngle=0
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
::exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgFolder%" -overwrite_original
::ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
	:: ---------------------
	:: Маніпуляції з датою та часом (на випадок якщо є здвиг в GPX):
	:: exiftool "-DateTimeOriginal-=0:0:0 2:00:00" "%MapiCamImgFolder%" -overwrite_original

	:: MapiCamFixZnak1
	:: exiftool "-DateTimeOriginal%MapiCamFixZnak1%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgFolder%" -overwrite_original

	:: MapiCamFixZnak2
	:: exiftool "-DateTimeOriginal%MapiCamFixZnak2%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgFolder%" -overwrite_original
	:: ---------------------
exiftool "-FileCreateDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
exiftool "-DateTime<DateTimeOriginal"       "%MapiCamImgFolder%" -overwrite_original
exiftool "-CreateDate<DateTimeOriginal"     "%MapiCamImgFolder%" -overwrite_original
	:: Працює і без "FileAccessDate" (можна сміливо закоментовувати для підвищення продуктивності)
exiftool "-FileAccessDate<DateTimeOriginal" %MapiCamImgFolder%" -overwrite_original
	:: ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
	:: закоментовано після того, як було оптимізовано скрипт який повертає фотки
	:: exiftool -geotag %MapiCamGpxFolder%\0\interpolate.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original

	
@echo <...>\python27\python <десь>\mapillary_tools\python\add_fix_dates.py <каталог з фото>\ "2019-03-27 14:07:08"
C:\Python27\python.exe D:\mapicam\tools\mapillary\mapillary_tools\python\add_fix_dates.py "%MapiCamImgFolder%" "2019-12-31 23:59:59"
	
	
	:: ---------------------
	:: параметри для %MapiCamGeotagFromGpxPy%:
	:: python %СКРИПТ% %КАРТИНКИ% %GPX% --offset_angle %КУТ%
	:: УВАГА! цей скрипт від попередньої версії
python %MapiCamGeotagFromGpxPy% "%MapiCamImgFolder%" "%MapiCamGpxFolder%\0\interpolate.gpx" --offset_angle %offsetAngle%



exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgFolder%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original

:: ===== BlackVue END ===========


exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
exiftool "-FileModifyDate" "%MapiCamImgFolder%"
exiftool "-FileCreateDate" "%MapiCamImgFolder%"
exiftool "-DateTime" "%MapiCamImgFolder%"
exiftool "-CreateDate" "%MapiCamImgFolder%"


@echo.
@echo.
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
@echo.
@echo.
@echo.
