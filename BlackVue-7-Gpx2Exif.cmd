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
:: 

@set MapiCamPhaseNum=[7]
@set MapiCamLOG=mapicam-LOG.txt
@echo.
@echo ####################################################
@echo #                                                  #
@echo # START : [7] Gpx2Exif                             #
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
@set BlackVueInterval=%3%
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
@echo BlackVueFolder             = %BlackVueFolder%
@echo BlackVueFPS                = %BlackVueFPS%
@echo MapiCamImgDrive            = %MapiCamImgDrive%
@echo MapiCamHeadXX              = %MapiCamHeadXX%
@echo offsetAngle                = %offsetAngle%
@echo MapiCamInterpolationPy     = %MapiCamInterpolationPy%
@echo MapiCamGeotagFromGpxPy     = %MapiCamGeotagFromGpxPy%
@echo MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo ---------------------------------------------------





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

:: REM exiftool "-DateTimeOriginal" "%MapiCamImgFolder%"
:: REM exiftool "-FileModifyDate"   "%MapiCamImgFolder%"
:: REM exiftool "-FileCreateDate"   "%MapiCamImgFolder%"
:: REM exiftool "-DateTime"         "%MapiCamImgFolder%"
:: REM exiftool "-CreateDate"       "%MapiCamImgFolder%"

@echo.
@echo #####################
@echo.


:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue
@set offsetAngle=0

	:: ---------------------
	:: Маніпуляції з датою та часом (на випадок якщо є здвиг в GPX):
    :: exiftool "-DateTimeOriginal-=0:0:0 2:00:00" "%MapiCamImgFolder%" -overwrite_original
:: exiftool -geotag %MapiCamGpxFolder%\0\interpolate.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original



    :: ----- (c)Mykhaylo Solodzhuk -------
    :: Наразі закоментовую (і лишаю на майбутнє) в звЯзку з тим що скрипт для BlackVue відпрацьовує стабільно на базі поточної схеми
    ::  <...>\python27\python <десь>\mapillary_tools\python\add_fix_dates.py <каталог з фото>\ "2019-03-27 14:07:08"
    :: C:\Python27\python.exe D:\mapicam\tools\mapillary\mapillary_tools\python\add_fix_dates.py "%MapiCamImgFolder%" "2019-12-31 23:59:59"
    :: ----- (c)Mykhaylo Solodzhuk END ---
	
	:: ---------------------
	:: параметри для %MapiCamGeotagFromGpxPy%:
	:: python %СКРИПТ% %КАРТИНКИ% %GPX% --offset_angle %КУТ%
	:: УВАГА! цей скрипт від попередньої версії
				
	::		REM python %MapiCamGeotagFromGpxPy% "%MapiCamImgFolder%" "%MapiCamGpxFolder%\0\interpolate.gpx" --offset_angle %offsetAngle%

	::		REM Traceback (most recent call last):
	::		REM File "D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py", line 234, in <module>
	::		REM add_exif_using_timestamp(filepath, filetime, gpx, args.time_offset, args.offset_angle)
	::		REM File "D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py", line 102, in add_exif_using_timestamp
	::		REM t = time - datetime.timedelta(seconds=offset_time)
	::		REM TypeError: unsupported operand type(s) for -: 'str' and 'datetime.timedelta'


exiftool "-ModifyDate<DateTimeOriginal"     "%MapiCamImgFolder%" -overwrite_original
exiftool "-FileModifyDate<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original

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
@echo # [7] END   : Gpx2Exif                            #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [8] NEXT  : ........                                      #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [7] END   : Gpx2Exif                                        # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [8] NEXT  : ........                                        # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%    
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
