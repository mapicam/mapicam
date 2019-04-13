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
:: https://github.com/mapicam/mapicam/wiki/FixDateTime <-- READ ME!

@echo.
@echo ####################################################
@echo #                                                  #
@echo # START : [6] FixDateTime                          #
@echo #                                                  #
@echo ####################################################
@echo.

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
@set MapiCamInterpolationPy="D:\mapicam_tools\mapillary\mapillary_tools-master\mapillary_tools\interpolation.py"
@set MapiCamGeotagFromGpxPy="D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py"
@set MapiCamMapillaryTools="D:\mapicam\tools\mapillary\mapillary_tools.exe"
@set MapiCamUsernameAtMapillary=velmyshanovnyi
@echo.
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath              = %MapiCamFFpath%
@echo BlackVue                   = %BlackVue%
@echo BlackVueFPS                = %BlackVueFPS%
@echo MapiCamImgDrive            = %MapiCamImgDrive%
@echo MapiCamImgFolder           = %MapiCamImgFolder%
@echo MapiCamGpxFolder           = %MapiCamGpxFolder%
@echo MapiCamImgDIR              = %MapiCamImgDIR% (default)
@echo MapiCamInterpolationPy     = %MapiCamInterpolationPy%
@echo MapiCamGeotagFromGpxPy     = %MapiCamGeotagFromGpxPy%
@echo MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo MapiCamHeadXX              = %MapiCamHeadXX%
@echo offsetAngle                = %offsetAngle%
@echo #####################
@echo.
@echo.
@echo.
@echo Якщо пише ТАКУ помилку, то можливо треба перевести назад на 2 години час в зведеному файлі GPX.
@echo. 
@echo Setting new values from D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo Geotime value: 2018:12:31 22:00:00.000 UTC (local timezone is +02:00)
@echo Warning: Time is too far before track in File:Geotime (ValueConvInv) - D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo Warning: No writable tags set from D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo Nothing changed in D:/mapicam_img/20190101/A/adjusted/mapicam-A-0-20190101-000000.jpg
@echo. 

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

REM exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
REM exiftool "-FileModifyDate" "%MapiCamImgFolder%"
REM exiftool "-FileCreateDate" "%MapiCamImgFolder%"
REM exiftool "-DateTime" "%MapiCamImgFolder%"
REM exiftool "-CreateDate" "%MapiCamImgFolder%"

@echo.
@echo #####################
@echo.


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
	:: Працює і без "FileAccessDate" (можна сміливо закоментовувати для підвищення продуктивності), а ще він викликає помилку при прошиванні фоток з BlackVue
    :: exiftool "-FileAccessDate<DateTimeOriginal" %MapiCamImgFolder%" -overwrite_original
	:: ping %MapiCamPingHost% -n 1 -w %MapiCamDelayInSeconds% > nul
	:: закоментовано після того, як було оптимізовано скрипт який повертає фотки
:: ===== BlackVue END ===========


REM exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
REM exiftool "-FileModifyDate" "%MapiCamImgFolder%"
REM exiftool "-FileCreateDate" "%MapiCamImgFolder%"
REM exiftool "-DateTime" "%MapiCamImgFolder%"
REM exiftool "-CreateDate" "%MapiCamImgFolder%"


@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # END   : [6] FixDateTime                          #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # NEXT  : [7] Gpx2Exif                             #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
