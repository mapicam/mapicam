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
cd %1%
@set MapiCamPhaseNum=[20190429]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date% %time% #                                                                                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # START : 20190429                                              >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ####################################################
@echo #                                                  #
@echo # START : 20190429                                 #
@echo #                                                  #
@echo ####################################################
@echo.

@echo.
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS                                            #
@echo #-------------------------------------------------------------#
@echo OFF
set year=%date:~-4%
set month=%date:~3,2%
  if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
  if "%day:~0,1%" == " " set day=0%day:~1,1%
set hour=%time:~0,2%
  if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
  if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
  if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set msec=%time::=%
  set msec=%msec:~-2%
set datetimefull=%year%-%month%-%day%T%hour%:%min%:%secs%Z
set MapiCamDate=%year%%month%%day%
set MapiCamTime=%hour%%min%%secs%
@echo ON
@echo #                                                             #
@echo # date         = %date%                                   #
@echo # time         = %time%                                  #
@echo # year         = %year%                                         #
@echo # month        = %month%                                           #
@echo # day          = %day%                                           #
@echo # hour         = %hour%                                           #
@echo # min          = %min%                                           #
@echo # secs         = %secs%                                           #
@echo # msec         = %msec%                                           #
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.
cd %1%
setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
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
ELSE ( set BlackVueInterval=0.1 )
::   --offset_angle 0
@set BlackVueOffsetAngle=%3%
::   --duplicate_distance 0.2
@set BlackVueDuplicateDistance=%4%
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
@echo %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%
@echo %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%
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
@echo %date% %time% # %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%              >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%        >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%                  >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%                       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueFolder\uploadImportPath = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
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
@set /a MapiCamHead=0
@set MapiCamHeadXX=%MapiCamHead%
@set offsetAngle=%MapiCamHeadXX%
@set MapiCamInterpolationPy="D:\mapicam_tools\mapillary\mapillary_tools-master\mapillary_tools\interpolation.py"
@set MapiCamGeotagFromGpxPy="D:\mapicam\tools\mapillary\mapillary_tools\python\geotag_from_gpx.py"
@set MapiCamMapillaryTools="D:\mapicam\tools\mapillary\mapillary_tools.exe"
@set MapiCamExifToolPath=D:\mapicam\tools\exiftool
@set MapiCamExifTool=%MapiCamExifToolPath%\exiftool.exe
@set /a MapiCamExifToolFixLocalTimeHH=3
@set /a MapiCamExifToolFixLocalTimeMM=0
@set /a MapiCamExifToolFixLocalTimeSS=0.000
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
@echo MapiCamExifToolPath        = %MapiCamExifToolPath%
@echo MapiCamExifTool            = %MapiCamExifTool%
@echo MapiCamExifToolFixLocalTimeHH = %MapiCamExifToolFixLocalTimeHH%
@echo MapiCamExifToolFixLocalTimeMM = %MapiCamExifToolFixLocalTimeMM%
@echo MapiCamExifToolFixLocalTimeSS = %MapiCamExifToolFixLocalTimeSS%
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




mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\%uploadImportPath%
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg


:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue
@set /a offsetAngle=0

	:: ---------------------

@echo [ ##### 3 ##### ] 
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe

:: F:\BlackVue\20190429-kyiv\09
setlocal enableextensions enabledelayedexpansion


REM @echo ######################################## START ######################################
REM for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".mp4"') do (
REM @echo ######################################## START ######################################


@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
D:\mapicam\tools\mapillary\mapillary_tools-042.exe video_process --advanced -h





%MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% >> %MapiCamLOG%




::%MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval%








:: ПРАЦЮЄ!
:: ВЕРСІЯ exiftool яка зараз використовується. (користуємось для відладки і інформації, щоб не заюзати бува якусь стару чи нестабільну версію утиліти)
:: exiftool -ver
%MapiCamExifTool% -ver
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -ver










:: ПРАЦЮЄ!
:: дістати та зберегти координати з відео файла
:: README: http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=5095.30
:: exiftool -ee -G3 FILE
:: exiftool -ee fileName.mp4 > ee.txt
:: README: https://sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html#ee--extractEmbedded
:: exiftool -p gpx.fmt FILE.mp4 > out.gpx
:: README: http://owl.phy.queensu.ca/~phil/exiftool/faq.html#Q2
%MapiCamExifTool% -p %MapiCamExifToolPath%\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w %BlackVueFolder%\Record\gpx\%%f.gpx %BlackVueFolder%\Record
:: ВІДЛАДКА: (нижче - аналог).
::D:\mapicam\tools\exiftool\exiftool.exe -p D:\mapicam\tools\exiftool\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w F:\BlackVue\20190429-kyiv\09\Record\gpx\%f.gpx F:\BlackVue\20190429-kyiv\09\Record



::4
CALL %MapiCamFolder%\BlackVue-4-MergeGPX.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%





:: ПРАЦЮЄ!
:: ПЕРЕНЕСТИ ВСІ .jpg ФАЙЛИ до папки "jpg"
mkdir %BlackVueFolder%\Record\jpg
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do (
:: copy /Y "%%I" "%BlackVueFolder%\Record\jpg"
:: xcopy "%%I" /Y /H /R "%BlackVueFolder%\Record\jpg"
move /Y "%%I" "%BlackVueFolder%\Record\jpg"
)
:: ВИДАЛИТИ порожню папку
rmdir /S /Q "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames\*"
rmdir /S /Q "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
rmdir /S /Q "%BlackVueFolder%\Record\%BlackVueFPS%fps"




:: ----- ПЕРЕНАЛАШТУВАТИ ПО ДАТІ СТВОРЕННЯ -----------------------------------------------------------
:: ЗМІНЮЄМО ДАТУ на всіх типах дат.
:: exiftool "-DateTimeOriginal+=0:0:0 0:00:00" "%MapiCamImgFolder%" -overwrite_original
:: exiftool                            "-AllDates<DateTimeOriginal" -w DIR                                       -overwrite_original
:: %MapiCamExifTool%                   "-AllDates<DateTimeOriginal" -w "%MapiCamImgFolder%"                      -overwrite_original
:: | AllDates 
:: | CreateDate      | ModifyDate      | DateTimeOriginal |  |  |  |  |  |
:: | FileCreateDate  | FileModifyDate  | FileAccessDate  
:: | TrackCreateDate | TrackModifyDate 
:: | MediaCreateDate | MediaModifyDate
REM %MapiCamExifTool% -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original_in_place
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-AllDates<DateTimeOriginal" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original_in_place
:: -----------------------------------------------------------------------------------------------------






:: змінюємо ІМЯ ФАЙЛА  беручи його з CreateDate. опрацьовується ВСЯ папка
:: ПЕРЕЙМЕНУВАТИ ФАЙЛИ
:: exiftool "-FileName<CreateDate" -d "%%Y%%m%%d_%%H%%M%%S.%%%%e" image.jpg
:: README: http://owl.phy.queensu.ca/~phil/exiftool/
:: README: http://owl.phy.queensu.ca/~phil/exiftool/filename.html
:: exiftool  -d "%Y%m%d-%H%M%S.%%e" "-FileName<CreateDate" DIR
:: exiftool           -d "%%Y%%m%%d-%%H%%M%%S.%%%%e"         "-FileName<CreateDate"     DIR
:: exiftool           -d "%%Y%%m%%d-%%H%%M%%S.%%%%e"         "-FileName<CreateDate"     DIR
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%MapiCamImgFolder%" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для файлів).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<FileCreateDate" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.2c.%%%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для консолі).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<CreateDate" -d "%Y%m%d-%H%M%S%%-.2c.%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original












:: отримати довжину відео файла
:: ПРАЦЮЄ!
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4" 
:: 7.10 s
:: ПРАЦЮЄ!
%MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record"
:: ВІДЛАДКА: (нижче - аналог).
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record"
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4"
:: '7.101'









:: зберегти ЧАС - в файл
:: ПРАЦЮЄ!
%MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record" > "%BlackVueFolder%\Record\VideoDuration.txt"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record" > "F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4" > "F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"






:: зчитати ЧАС - з файла в ЗМІННУ
:: ПРАЦЮЄ!
:: README: http://www.cyberforum.ru/cmd-bat/thread809990.html
set /p VideoDuration=<"%BlackVueFolder%\Record\VideoDuration.txt"
:: ВІДЛАДКА: (нижче - аналог).
:: set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
@echo set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
@echo VideoDuration=%VideoDuration%
:: ВИДАЛИТИ вже непотрібний VideoDuration.txt
del "%BlackVueFolder%\Record\VideoDuration.txt"


:: очистити ЗМІННУ - від зайвих лапок
:: ПРАЦЮЄ!
:: README: http://forum.oszone.net/thread-327751.html
set VideoDuration=%VideoDuration:~1,-1%
:: ВІДЛАДКА: (нижче - аналог).
:: set VideoDuration=%VideoDuration:~1,-1%
@echo VideoDuration=%VideoDuration%

:: якщо розкоментувати, то буде ЦІЛЕ ЧИСЛО, але й ззакоментованим працює корректно
:: set /a VideoDuration=%VideoDuration%
:: @echo set /a VideoDuration=%VideoDuration%
:: @echo VideoDuration=%VideoDuration%


:: ---------------------------------------------------------------
:: КОРЕГУЄМО ЗДВИГ ЧАСУ (перед прошивкою координат)
:: ТРЕБА: змінити час на значення ЗМІННОЇ (довжини відео файла). "поточнийЧас"-"довжинаВідеоФайла"=ПоточнийЧасРеальний
%MapiCamExifTool% "-DateTimeOriginal+=0:0:0 %MapiCamExifToolFixLocalTimeHH%:%MapiCamExifToolFixLocalTimeMM%:%MapiCamExifToolFixLocalTimeSS%" "%MapiCamImgFolder%" -overwrite_original_in_place
%MapiCamExifTool% "-DateTimeOriginal-=0:0:0 00:00:%VideoDuration%" "%MapiCamImgFolder%" -overwrite_original_in_place
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.2c.%%%%e" -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
:: %MapiCamExifTool% -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original_in_place
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe "-DateTimeOriginal-=0:0:0 0:00:07" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original_in_place
:: -----------------------------------------------------------------------------------------------------





:: Власне сама команда на прошивку (час файла має бути вже синхронізований з таймінгом gpx файла)
:: -v2 виводить інформацію на екран про параметри прошивки. використовувати лише ДЛЯ ДЕБАГА, бо СИЛЬНО СПОВІЛЬНЮЄ ПРОШИВКУ!!!! (це додатковий НЕОБОВЯЗКОВИЙ параметр)  
:: exiftool -geotag %MapiCamGpxFolder%\0\interpolate.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original -v2
:: exiftool -geotag %MapiCamGpxFolder%\0\interpolate.gpx %MapiCamImgFolder%\*.jpg -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
%MapiCamExifTool% -geotag "%MapiCamGpxFolder%\*.gpx" "%MapiCamImgFolder%\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
:: ВІДЛАДКА: (нижче - аналог).
:: прошиває! головне щоб дата/час співпадали
:: D:\mapicam\tools\exiftool\exiftool.exe -geotag "F:\BlackVue\20190429-kyiv\09\Record\gpx\*.gpx" "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.jpg" -gpsimgdirection=0 -overwrite_original

mkdir %BlackVueFolder%\Record\jpg-all
move /Y "%BlackVueFolder%\Record\jpg\*.*" "%BlackVueFolder%\Record\jpg-all"
:: ВІДЛАДКА: (нижче - аналог).
move /Y "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.*" "%BlackVueFolder%\Record\jpg-all"
rmdir "%BlackVueFolder%\Record\jpg"


@echo ----- ДО ЦЬОГО МІСЦЯ ВІДТЕСТОВАНО і ПРАЦЮЄ ВСЕ -----
@echo ----- DO CEGO MISTSIA VIDTESTOVANO i PRACUE VSE -----







:: ------------------------------------------------------------------------------------------------------------------
:: ПЕРЕМІСТИТИ в папку
:: СТВОРИТИ папку YYYYMMDD і перемістити в неї файли
:: D:\mapicam\tools\exiftool\exiftool.exe  -r "-Directory<datetimeoriginal" -d "F:\BlackVue\20190429-kyiv\09\Record\jpg\%Y%m%d" "F:\BlackVue\20190429-kyiv\09\Record\jpg"
:: ------------------------------------------------------------------------------------------------------------------	
	









REM @echo ===============================================END===================================
REM )
REM @echo ===============================================END===================================



pause




set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
:: D:\mapicam\tools\mapillary\mapillary_tools-050.exe  process --advanced -h
%MapiCamMapillaryTools% process --advanced --version --verbose ^
--import_path "%BlackVueFolder%\Record\jpg-all" ^
--user_name %MapiCamUsernameAtMapillary% ^
--skip_subfolders ^
--device_make "Blackvue" ^
--device_model "DR900S-1CH" ^
--geotag_source "gpx" ^
--geotag_source_path "%BlackVueFolder%\Record\gpx" ^
--orientation 0 ^
--offset_angle %BlackVueOffsetAngle% ^
--use_gps_start_time ^
--interpolate_directions ^
--duplicate_distance %BlackVueDuplicateDistance% ^
--overwrite_all_EXIF_tags ^
--overwrite_EXIF_time_tag ^
--overwrite_EXIF_gps_tag ^
--overwrite_EXIF_direction_tag ^
--overwrite_EXIF_orientation_tag ^
--move_duplicates ^
--move_uploaded >> %MapiCamLOG%

D:\mapicam\tools\mapillary\mapillary_tools-050.exe process --advanced --version --verbose --import_path "F:\BlackVue\20190429-kyiv\09\Record\jpg" --user_name velmyshanovnyi --skip_subfolders --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "gpx" --geotag_source_path "F:\BlackVue\20190429-kyiv\09\Record\gpx\*.gpx" --orientation 0 --offset_angle 0 --use_gps_start_time --interpolate_directions --duplicate_distance 0.5 --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --move_duplicates --move_uploaded  >>F:\BlackVue\20190429-kyiv\09\mapicam-LOG.txt







@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # END   : 20190429                                 #
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

cmd /k