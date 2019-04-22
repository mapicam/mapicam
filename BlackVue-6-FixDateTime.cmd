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
cd %1%
@set MapiCamPhaseNum=[6]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date% %time% #                                                                                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [6] START : FixDateTime                                       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [6] START : FixDateTime                          #
@echo #                                                  #
@echo ####################################################
@echo.

cd %1%
setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
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
ELSE ( set BlackVueInterval=%3% )
::   --duplicate_distance 0.2
@set BlackDuplicateDistance=%4%
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
@echo %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%
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
@echo %date% %time% # %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%           >> %MapiCamLOG%
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




@echo ---------------------------------------------------
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamImgFolder=%BlackVueFolder%\Record\jpg
@set MapiCamGpxFolder=%BlackVueFolder%\Record\gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%2%
@set MapiCamHead=0
@set MapiCamHeadXX=%MapiCamHead%
@set offsetAngle=%MapiCamHeadXX%
@set MapiCamInterpolationPy="D:\mapicam_tools\mapillary\mapillary_tools-master\mapillary_tools\interpolation.py"
@set MapiCamGeotagFromGpxPy="D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py"
@set MapiCamMapillaryTools="D:\mapicam\tools\mapillary\mapillary_tools.exe"
@echo ---------------------------------------------------
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath              = %MapiCamFFpath%
@echo MapiCamImgFolder           = %MapiCamImgFolder%
@echo MapiCamGpxFolder           = %MapiCamGpxFolder%
@echo MapiCamImgDIR              = %MapiCamImgDIR% (default)
@echo BlackVueFolder                   = %BlackVueFolder%
@echo BlackVueFPS                = %BlackVueFPS%
@echo MapiCamImgDrive            = %MapiCamImgDrive%
@echo MapiCamHeadXX              = %MapiCamHeadXX%
@echo offsetAngle                = %offsetAngle%
@echo MapiCamInterpolationPy     = %MapiCamInterpolationPy%
@echo MapiCamGeotagFromGpxPy     = %MapiCamGeotagFromGpxPy%
@echo MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo ---------------------------------------------------



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

:: REM exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
:: REM exiftool "-FileModifyDate" "%MapiCamImgFolder%"
:: REM exiftool "-FileCreateDate" "%MapiCamImgFolder%"
:: REM exiftool "-DateTime" "%MapiCamImgFolder%"
:: REM exiftool "-CreateDate" "%MapiCamImgFolder%"

@echo.
@echo #####################
@echo.


:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue
@set offsetAngle=0
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
exiftool "-DateTimeOriginal<FileModifyDate" "%MapiCamImgFolder%" -overwrite_original
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


:: REM exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
:: REM exiftool "-FileModifyDate"   "%MapiCamImgFolder%"
:: REM exiftool "-FileCreateDate"   "%MapiCamImgFolder%"
:: REM exiftool "-DateTime"         "%MapiCamImgFolder%"
:: REM exiftool "-CreateDate"       "%MapiCamImgFolder%"


@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [6] END   : FixDateTime                          #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [7] NEXT  : Gpx2Exif                             #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [6] END   : FixDateTime                                     # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [7] NEXT  : Gpx2Exif                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%     
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
