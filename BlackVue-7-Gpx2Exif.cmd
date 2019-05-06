cd %1%
@set MapiCamPhaseNum=[7]
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
	REM pause

    :: IF ERROR - RUN NEXT LINE FOR TEST:
    :: exiftool -geotag "%MapiCamGpxFolder%\*.gpx" "%MapiCamImgFolder%\*.jpg" -gpsimgdirection=0   -overwrite_original -v2
	:: Маніпуляції з датою та часом (на випадок якщо є здвиг в GPX):
    :: exiftool "-DateTimeOriginal+=0:0:0 2:57:00" "%MapiCamImgFolder%" -overwrite_original

:: Власне сама команда на прошивку
:: -v2 виводить інформацію на екран про параметри прошивки. використовувати лише ДЛЯ ДЕБАГА, бо СИЛЬНО СПОВІЛЬНЮЄ ПРОШИВКУ!!!! (це додатковий НЕОБОВЯЗКОВИЙ параметр)  
:: exiftool -geotag %MapiCamGpxFolder%\0\interpolate.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original -v2
exiftool -geotag %MapiCamGpxFolder%\0\*.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original



    :: ----- (c)Mykhaylo Solodzhuk -------
    :: Наразі закоментовую (і лишаю на майбутнє) в звЯзку з тим що скрипт для BlackVue відпрацьовує стабільно на базі поточної схеми
    ::  <...>\python27\python <десь>\mapillary_tools\python\add_fix_dates.py <каталог з фото>\ "2019-03-27 14:07:08"
    :: C:\Python27\python.exe D:\mapicam\tools\mapillary\mapillary_tools\python\add_fix_dates.py "%MapiCamImgFolder%" "2019-12-31 23:59:59"
    :: ----- (c)Mykhaylo Solodzhuk END ---
	
	:: ---------------------
	:: параметри для %MapiCamGeotagFromGpxPy%:
	:: python %СКРИПТ% %КАРТИНКИ% %GPX% --offset_angle %КУТ%
	:: УВАГА! цей скрипт від попередньої версії
				
	::		REM python %MapiCamGeotagFromGpxPy% "%MapiCamImgFolder%" "%MapiCamGpxFolder%\0\interpolate.gpx" --offset_angle %BlackVueOffsetAngle%

	::		REM Traceback (most recent call last):
	::		REM File "D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py", line 234, in <module>
	::		REM add_exif_using_timestamp(filepath, filetime, gpx, args.time_offset, args.offset_angle)
	::		REM File "D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py", line 102, in add_exif_using_timestamp
	::		REM t = time - datetime.timedelta(seconds=offset_time)
	::		REM TypeError: unsupported operand type(s) for -: 'str' and 'datetime.timedelta'



exiftool "-DateTimeOriginal-=0:0:0 3:00:00"    "%MapiCamImgFolder%" -overwrite_original

exiftool "-AllDates         <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
REM exiftool "-FileCreateDate   <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
REM exiftool "-CreateDate       <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
REM exiftool "-DateTime         <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
REM exiftool "-ModifyDate       <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
REM exiftool "-FileModifyDate   <DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original


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
@echo # [7] END   : Gpx2Exif                             #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [8] NEXT  : ........                             #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [7] END   : Gpx2Exif                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [8] NEXT  : ........                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%    
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!

