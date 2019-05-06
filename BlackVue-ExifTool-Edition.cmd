cd %1%
@set MapiCamPhaseNum=[20190429]
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
@echo.
::   BlackVueInterval 0.1
@set BlackVueInterval=0.1
@IF %BlackVueFPS%==30    ( set BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set BlackVueInterval=30    ) 
@echo BlackVueFPS      = %BlackVueFPS%
@echo BlackVueInterval = %BlackVueInterval%
@echo ##### HEAD (fix local error)#############################################
@set MapiCamExifToolPath=D:\mapicam\tools\exiftool
@set MapiCamExifTool=%MapiCamExifToolPath%\exiftool.exe
@echo ##### HEAD (fix local error)#############################################
@echo.
mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\%uploadImportPath%
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg

:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue

	:: ---------------------


@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe






::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::D:\mapicam\tools\mapillary\mapillary_tools-042.exe video_process --advanced -h




:: %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% >> %MapiCamLOG%




@echo.
@echo.
@echo.
@echo ######################################## START ######################################
@ECHO ##### FOR "%BlackVueFolder%\RecordRecord\#####.mp4 ##### (START) ###########################################
mkdir %BlackVueFolder%\Record\jpg
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".mp4"') do (
@echo ######################################## START ######################################
@echo.
@echo.
@echo.
:: %MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval%
%MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%%I" --video_sample_interval %BlackVueInterval%





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











:: Власне сама команда на прошивку (час файла має бути вже синхронізований з таймінгом gpx файла)
:: -v2 виводить інформацію на екран про параметри прошивки. використовувати лише ДЛЯ ДЕБАГА, бо СИЛЬНО СПОВІЛЬНЮЄ ПРОШИВКУ!!!! (це додатковий НЕОБОВЯЗКОВИЙ параметр)  
:: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#geosync
:: Geotag all images in directory "dir" from the GPS positions in "track.log" (in the current directory), for a camera clock that was running 25 seconds slower than the GPS clock:
:: exiftool -geotag track.log -geosync=+25 dir
::    VideoDurationFix = (КількістьГодинЗміщення * КількістьСекундВгодині) + ЧасЗмішенняСукундДовжинаВідео
@echo VideoDuration    = %VideoDuration%
@set /a VideoDuration  =%VideoDuration%*1000
@echo VideoDuration    : VideoDuration *1000 = %VideoDuration%
@set /a VideoDurationFix =(3*3600)-%VideoDuration%
@echo VideoDuration    = %VideoDuration%
@echo VideoDurationFix = %VideoDurationFix%







:: ПРАЦЮЄ!
:: ПЕРЕНЕСТИ ВСІ .jpg ФАЙЛИ до папки "jpg"
@echo off
mkdir %BlackVueFolder%\Record\jpg
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do (
  move /Y "%%I" "%BlackVueFolder%\Record\jpg"
)
:: ВИДАЛИТИ порожню папку
rmdir "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
rmdir "%BlackVueFolder%\Record\%BlackVueFPS%fps"
:: видалити ВСІ файли і підпіпки без запитів
:: rmdir /S /Q "%BlackVueFolder%\Record\%BlackVueFPS%fps"
@echo on








:: ----- ПЕРЕНАЛАШТУВАТИ ПО ДАТІ СТВОРЕННЯ -----------------------------------------------------------
:: ЗМІНЮЄМО ДАТУ на всіх типах дат.
:: exiftool "-DateTimeOriginal+=0:0:0 0:00:00" "%MapiCamImgFolder%" -overwrite_original
:: exiftool                            "-AllDates<DateTimeOriginal" -w DIR                                       -overwrite_original
:: %MapiCamExifTool%                   "-AllDates<DateTimeOriginal" -w "%MapiCamImgFolder%"                      -overwrite_original
:: | AllDates 
:: | CreateDate       | ModifyDate       | DateTimeOriginal |  |  |  |  |  |
:: | FileCreateDate   | FileModifyDate   | FileAccessDate  
:: | TrackCreateDate  | TrackModifyDate  |
:: | MediaCreateDate  | MediaModifyDate  |
:: | SubSecCreateDate | SubSecModifyDate | SubSecDateTimeOriginal
REM %MapiCamExifTool% -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original_in_place
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-AllDates<DateTimeOriginal" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original_in_place
:: -----------------------------------------------------------------------------------------------------



:: Власне сама команда на прошивку (час файла синхронізується з таймінгом gpx файла за допомогою здвигу часу)
:: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#TP1
:: %MapiCamExifTool%  -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original -v2
%MapiCamExifTool%  -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -geotag "F:\BlackVue\20190429-kyiv\09\Record\gpx\*.gpx" "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.jpg" -gpsimgdirection=0 -overwrite_original










:: ---------------------------------------------------------------
:: КОРЕГУЄМО ЗДВИГ ЧАСУ (ОБОВЯЗКОВО ПІСЛЯ прошивки координат, бо обнуляються МІЛІСЕКУНДИ і прошивати після цього може лише з таймінгом 1fps)
:: ТРЕБА: змінити час на значення ЗМІННОЇ (довжини відео файла). "поточнийЧас"-"довжинаВідеоФайла"=ПоточнийЧасРеальний
%MapiCamExifTool% "-DateTimeOriginal+=0:0:0 0:0:%VideoDurationFix%" "%BlackVueFolder%\Record\jpg" -overwrite_original



:: змінюємо ІМЯ ФАЙЛА  беручи його з DateTimeOriginal. опрацьовується ВСЯ папка
:: ПЕРЕЙМЕНУВАТИ ФАЙЛИ
:: exiftool "-FileName<DateTimeOriginal" -d "%%Y%%m%%d_%%H%%M%%S.%%%%e" image.jpg
:: README: http://owl.phy.queensu.ca/~phil/exiftool/
:: README: http://owl.phy.queensu.ca/~phil/exiftool/filename.html
:: exiftool       -r "-FileName<DateTimeOriginal" -d "%Y%m%d-%H%M%S.%%e"                 DIR
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для файлів).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<FileCreateDate" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для консолі).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<CreateDate" -d "%Y%m%d-%H%M%S%%-.1c.%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original

:: ------------------------------------------------------
:: ПЕРЕПРОШИВАЄМО ВСІ дати на одну (правильну)
%MapiCamExifTool% ^
  -r "-AllDates<DateTimeOriginal" ^
  -r "-CreateDate<DateTimeOriginal" ^
  -r "-ModifyDate<DateTimeOriginal" ^
  -r "-FileCreateDate<DateTimeOriginal" ^
  -r "-FileModifyDate<DateTimeOriginal" ^
  -r "-SubSecCreateDate<DateTimeOriginal" ^
  -r "-SubSecModifyDate<DateTimeOriginal" ^
  -r "-SubSecDateTimeOriginal<DateTimeOriginal" ^
  "%BlackVueFolder%\Record\jpg" -overwrite_original
:: ------------------------------------------------------






:: ПЕРЕМІЩЕННЯ в загальну папку після корректної прошивки!
mkdir "%BlackVueFolder%\jpg2mapillary"
@move /Y "%BlackVueFolder%\Record\jpg\*.jpg" "%BlackVueFolder%\jpg2mapillary"
:: ВІДЛАДКА: (нижче - аналог).
:: move /Y "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.*" "%BlackVueFolder%\jpg2mapillary"
@rmdir "%BlackVueFolder%\Record\jpg"






@echo.
@echo.
@echo.
@echo ############################################## END ##################################
)
@ECHO ##### FOR "%BlackVueFolder%\RecordRecord\#####.mp4 ##### (END) ###########################################
@echo ############################################## END ##################################
@echo.
@echo.
@echo.

:: ------------------------------------------------------------------------------------------------------------------
:: СОРТУВАННЯ ЗА ДАТОЮ СТВОРЕННЯ (зручно в разі ВЕЛИКОЇ кількості відеофайлів за різні дати)
:: СТВОРИТИ папку YYYYMMDD і перемістити в неї файли
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" DIR
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" "%BlackVueFolder%\Record\jpg"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe  -r "-Directory<DateTimeOriginal" -d "F:\BlackVue\20190429-kyiv\09\%Y%m%d\Record\jpg" "F:\BlackVue\20190429-kyiv\09\Record\jpg"
:: ------------------------------------------------------------------------------------------------------------------	
	





set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
:: D:\mapicam\tools\mapillary\mapillary_tools-050.exe  process --advanced -h
%MapiCamMapillaryTools% process --advanced --version --verbose ^
--import_path "%BlackVueFolder%\jpg2mapillary" ^
--user_name %MapiCamUsernameAtMapillary% ^
--skip_subfolders ^
--device_make "Blackvue" ^
--device_model "DR900S-1CH" ^
--geotag_source "exif" ^
--geotag_source_path "%BlackVueFolder%\jpg2mapillary" ^
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
--move_uploaded

:: D:\mapicam\tools\mapillary\mapillary_tools-042.exe process --advanced --version --verbose --import_path "F:\BlackVue\20190429-kyiv\09\Record\jpg2mapillary" --user_name velmyshanovnyi --skip_subfolders --device_make "Blackvue" --device_model "DR900S-1CH" --geotag_source "exif" --geotag_source_path "F:\BlackVue\20190429-kyiv\09\Record\jpg2mapillary" --orientation 0 --offset_angle 0 --use_gps_start_time --interpolate_directions --duplicate_distance 0.5 --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --move_duplicates --move_uploaded







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
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # END : %MapiCamPhaseNum%                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%    
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!














@echo ----- ДО ЦЬОГО МІСЦЯ ВІДТЕСТОВАНО і ПРАЦЮЄ ВСЕ -----
@echo ----- DO CEGO MISTSIA VIDTESTOVANO i PRACUE VSE -----


cmd /k