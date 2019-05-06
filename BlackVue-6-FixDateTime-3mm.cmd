cd %1%
@set MapiCamPhaseNum=[6]
@echo ##### HEAD ###################################################################################################################################
setlocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set BlackVueFolder=%1%
@set BlackVueFPS=%2%
@set BlackVueOffsetAngle=%3%
@set BlackVueDuplicateDistance=%4%
@set MapiCamUsernameAtMapillary=%5%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%
@echo ##### HEAD ###################################################################################################################################


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

:: README: https://github.com/mapicam/mapicam/wiki/FixDateTime
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

:: ---------------------
:: Маніпуляції з датою та часом (на випадок якщо є здвиг в GPX):
:: -DateTimeOriginal-='0:0:0 3:00:00' = subtract 3 hours from image's date.
:: -DateTimeOriginal+='0:0:0 2:00:00' = add 2 hours.
:: exiftool "-DateTimeOriginal-=0:0:0 3:00:00" "%MapiCamImgFolder%" -overwrite_original
exiftool "-DateTimeOriginal-=0:0:0 0:03:00" "%MapiCamImgFolder%" -overwrite_original

	:: MapiCamFixZnak1
	:: exiftool "-DateTimeOriginal%MapiCamFixZnak1%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgFolder%" -overwrite_original

	:: MapiCamFixZnak2
	:: exiftool "-DateTimeOriginal%MapiCamFixZnak2%=%MapiCamFixDate% %MapiCamFixTime%" "%MapiCamImgFolder%" -overwrite_original
	:: ---------------------







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
