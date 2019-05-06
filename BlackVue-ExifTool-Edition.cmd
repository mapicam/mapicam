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
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::D:\mapicam\tools\mapillary\mapillary_tools-042.exe video_process --advanced -h
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval% --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% >> %MapiCamLOG%
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
@echo.
@echo.
@echo.
@echo ######################################## START ######################################
@ECHO ##### FOR "%BlackVueFolder%\RecordRecord\#####.mp4 ##### (START) ###########################################
mkdir %BlackVueFolder%\Record\jpg
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".mp4"') do (
@echo ######################################## START ######################################
:: %MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record" --video_sample_interval %BlackVueInterval%
:: [ANCHOR-01]
pause
%MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record\%BlackVueFPS%fps" --video_import_path "%%I" --video_sample_interval %BlackVueInterval% && ^

										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ПРАЦЮЄ!
										REM :: ВЕРСІЯ exiftool яка зараз використовується. (користуємось для відладки і інформації, щоб не заюзати бува якусь стару чи нестабільну версію утиліти)
										REM :: exiftool -ver
										REM :: [ANCHOR-02]
										REM %MapiCamExifTool% -ver
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -ver
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ПРАЦЮЄ!
										REM :: дістати та зберегти координати з відео файла
										REM :: README: http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=5095.30
										REM :: exiftool -ee -G3 FILE
										REM :: exiftool -ee fileName.mp4 > ee.txt
										REM :: README: https://sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html#ee--extractEmbedded
										REM :: exiftool -p gpx.fmt FILE.mp4 > out.gpx
										REM :: README: http://owl.phy.queensu.ca/~phil/exiftool/faq.html#Q2
										REM :: [ANCHOR-03]
										REM %MapiCamExifTool% -p %MapiCamExifToolPath%\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w %BlackVueFolder%\Record\gpx\%%f.gpx %BlackVueFolder%\Record
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM ::D:\mapicam\tools\exiftool\exiftool.exe -p D:\mapicam\tools\exiftool\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w F:\BlackVue\20190429-kyiv\09\Record\gpx\%f.gpx F:\BlackVue\20190429-kyiv\09\Record
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: отримати довжину відео файла
										REM :: ПРАЦЮЄ!
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4" 
										REM :: 7.10 s
										REM :: ПРАЦЮЄ!
										REM :: [ANCHOR-04]
										REM %MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record"
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM ::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record"
										REM ::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4"
										REM :: '7.101'
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: зберегти ЧАС - в файл
										REM :: ПРАЦЮЄ!
										REM :: [ANCHOR-05]
										REM %MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record" > "%BlackVueFolder%\Record\VideoDuration.txt"
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record" > "F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record\20190429_194335_EF.mp4" > "F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: зчитати ЧАС - з файла в ЗМІННУ
										REM :: ПРАЦЮЄ!
										REM :: README: http://www.cyberforum.ru/cmd-bat/thread809990.html
										REM :: [ANCHOR-06]
										REM set /p VideoDuration=<"%BlackVueFolder%\Record\VideoDuration.txt"
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
										REM :: [ANCHOR-07]
										REM @echo set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record\VideoDuration.txt"
										REM :: [ANCHOR-08]
										REM @echo VideoDuration=%VideoDuration%
										REM :: ВИДАЛИТИ вже непотрібний VideoDuration.txt
										REM :: [ANCHOR-09]
										REM del "%BlackVueFolder%\Record\VideoDuration.txt"
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: очистити ЗМІННУ - від зайвих лапок
										REM :: ПРАЦЮЄ!
										REM :: README: http://forum.oszone.net/thread-327751.html
										REM :: [ANCHOR-10]
										REM set VideoDuration=%VideoDuration:~1,-1%
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: set VideoDuration=%VideoDuration:~1,-1%
										REM :: [ANCHOR-11]
										REM @echo VideoDuration=%VideoDuration%
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: якщо розкоментувати, то буде ЦІЛЕ ЧИСЛО, але й ззакоментованим працює корректно
										REM :: set /a VideoDuration=%VideoDuration%
										REM :: @echo set /a VideoDuration=%VideoDuration%
										REM :: @echo VideoDuration=%VideoDuration%
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: Власне сама команда на прошивку (час файла має бути вже синхронізований з таймінгом gpx файла)
										REM :: -v2 виводить інформацію на екран про параметри прошивки. використовувати лише ДЛЯ ДЕБАГА, бо СИЛЬНО СПОВІЛЬНЮЄ ПРОШИВКУ!!!! (це додатковий НЕОБОВЯЗКОВИЙ параметр)  
										REM :: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#geosync
										REM :: Geotag all images in directory "dir" from the GPS positions in "track.log" (in the current directory), for a camera clock that was running 25 seconds slower than the GPS clock:
										REM :: exiftool -geotag track.log -geosync=+25 dir
										REM ::    VideoDurationFix = (КількістьГодинЗміщення * КількістьСекундВгодині) + ЧасЗмішенняСукундДовжинаВідео
										REM :: [ANCHOR-12]
										REM @echo VideoDuration    = %VideoDuration%
										REM :: [ANCHOR-13]
										REM @set /a VideoDuration  =%VideoDuration%*1000
										REM :: [ANCHOR-14]
										REM @echo VideoDuration    : VideoDuration *1000 = %VideoDuration%
										REM :: [ANCHOR-15]
										REM @set /a VideoDurationFix =(3*3600)-%VideoDuration%
										REM :: [ANCHOR-16]
										REM @echo VideoDuration    = %VideoDuration%
										REM :: [ANCHOR-17]
										REM @echo VideoDurationFix = %VideoDurationFix%
										REM :: [ANCHOR-18]
										REM @echo. 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ПРАЦЮЄ!
										REM :: ПЕРЕНЕСТИ ВСІ .jpg ФАЙЛИ до папки "jpg"
										REM :: [ANCHOR-19]
										REM @echo off
										REM :: [ANCHOR-20]
										REM mkdir %BlackVueFolder%\Record\jpg
										REM :: [ANCHOR-21]
										REM for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do ( move /Y "%%I" "%BlackVueFolder%\Record\jpg" )
										REM :: ВИДАЛИТИ порожню папку
										REM :: [ANCHOR-22]
										REM rmdir "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
										REM :: [ANCHOR-23]
										REM rmdir "%BlackVueFolder%\Record\%BlackVueFPS%fps"
										REM :: видалити ВСІ файли і підпіпки без запитів
										REM :: rmdir /S /Q "%BlackVueFolder%\Record\%BlackVueFPS%fps"
										REM :: [ANCHOR-24]
										REM @echo on
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ----- ПЕРЕНАЛАШТУВАТИ ПО ДАТІ СТВОРЕННЯ -----------------------------------------------------------
										REM :: ЗМІНЮЄМО ДАТУ на всіх типах дат.
										REM :: exiftool "-DateTimeOriginal+=0:0:0 0:00:00" "%MapiCamImgFolder%" -overwrite_original
										REM :: exiftool                            "-AllDates<DateTimeOriginal" -w DIR                                       -overwrite_original
										REM :: %MapiCamExifTool%                   "-AllDates<DateTimeOriginal" -w "%MapiCamImgFolder%"                      -overwrite_original
										REM :: | AllDates 
										REM :: | CreateDate       | ModifyDate       | DateTimeOriginal |  |  |  |  |  |
										REM :: | FileCreateDate   | FileModifyDate   | FileAccessDate  
										REM :: | TrackCreateDate  | TrackModifyDate  |
										REM :: | MediaCreateDate  | MediaModifyDate  |
										REM :: | SubSecCreateDate | SubSecModifyDate | SubSecDateTimeOriginal
										REM :: %MapiCamExifTool% -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -r "-AllDates<DateTimeOriginal" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original_in_place
										REM :: -----------------------------------------------------------------------------------------------------
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: Власне сама команда на прошивку (час файла синхронізується з таймінгом gpx файла за допомогою здвигу часу)
										REM :: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#TP1
										REM :: %MapiCamExifTool%  -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original -v2
										REM :: [ANCHOR-25]
										REM %MapiCamExifTool% -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -geotag "F:\BlackVue\20190429-kyiv\09\Record\gpx\*.gpx" "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.jpg" -gpsimgdirection=0 -overwrite_original
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ---------------------------------------------------------------
										REM :: КОРЕГУЄМО ЗДВИГ ЧАСУ (ОБОВЯЗКОВО ПІСЛЯ прошивки координат, бо обнуляються МІЛІСЕКУНДИ і прошивати після цього може лише з таймінгом 1fps)
										REM :: ТРЕБА: змінити час на значення ЗМІННОЇ (довжини відео файла). "поточнийЧас"-"довжинаВідеоФайла"=ПоточнийЧасРеальний
										REM :: [ANCHOR-26]
										REM %MapiCamExifTool% "-DateTimeOriginal+=0:0:0 0:0:%VideoDurationFix%" "%BlackVueFolder%\Record\jpg" -overwrite_original
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: змінюємо ІМЯ ФАЙЛА  беручи його з DateTimeOriginal. опрацьовується ВСЯ папка
										REM :: ПЕРЕЙМЕНУВАТИ ФАЙЛИ
										REM :: exiftool "-FileName<DateTimeOriginal" -d "%%Y%%m%%d_%%H%%M%%S.%%%%e" image.jpg
										REM :: README: http://owl.phy.queensu.ca/~phil/exiftool/
										REM :: README: http://owl.phy.queensu.ca/~phil/exiftool/filename.html
										REM :: exiftool       -r "-FileName<DateTimeOriginal" -d "%Y%m%d-%H%M%S.%%e"                 DIR
										REM :: [ANCHOR-27]
										REM %MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record\jpg" -overwrite_original
										REM :: ВІДЛАДКА: (нижче - аналог: для файлів).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<FileCreateDate" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original
										REM :: ВІДЛАДКА: (нижче - аналог: для консолі).
										REM :: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<CreateDate" -d "%Y%m%d-%H%M%S%%-.1c.%%e" "F:\BlackVue\20190429-kyiv\09\Record\jpg" -overwrite_original
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ------------------------------------------------------
										REM :: ПЕРЕПРОШИВАЄМО ВСІ дати на одну (правильну)
										REM :: [ANCHOR-28]
										REM %MapiCamExifTool% ^
										  REM -r "-AllDates<DateTimeOriginal" ^
										  REM -r "-CreateDate<DateTimeOriginal" ^
										  REM -r "-ModifyDate<DateTimeOriginal" ^
										  REM -r "-FileCreateDate<DateTimeOriginal" ^
										  REM -r "-FileModifyDate<DateTimeOriginal" ^
										  REM -r "-SubSecCreateDate<DateTimeOriginal" ^
										  REM -r "-SubSecModifyDate<DateTimeOriginal" ^
										  REM -r "-SubSecDateTimeOriginal<DateTimeOriginal" ^
										  REM "%BlackVueFolder%\Record\jpg" -overwrite_original
										REM :: ------------------------------------------------------
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: ПЕРЕМІЩЕННЯ в загальну папку після корректної прошивки!
										REM :: [ANCHOR-29]
										REM mkdir "%BlackVueFolder%\jpg2mapillary"
										REM :: [ANCHOR-30]
										REM @move /Y "%BlackVueFolder%\Record\jpg\*.jpg" "%BlackVueFolder%\jpg2mapillary"
										REM :: [ANCHOR-31]
										REM :: ВІДЛАДКА: (нижче - аналог).
										REM :: move /Y "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.*" "%BlackVueFolder%\jpg2mapillary"
										REM :: [ANCHOR-32]
										REM @rmdir "%BlackVueFolder%\Record\jpg"
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
										REM :: 
@echo on

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
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: ------------------------------------------------------------------------------------------------------------------
:: СОРТУВАННЯ ЗА ДАТОЮ СТВОРЕННЯ (зручно в разі ВЕЛИКОЇ кількості відеофайлів за різні дати)
:: СТВОРИТИ папку YYYYMMDD і перемістити в неї файли
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" DIR
:: %MapiCamExifTool%   -r "-Directory<DateTimeOriginal" -d "%BlackVueFolder%\%Y%m%d\Record\jpg" "%BlackVueFolder%\Record\jpg"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe  -r "-Directory<DateTimeOriginal" -d "F:\BlackVue\20190429-kyiv\09\%Y%m%d\Record\jpg" "F:\BlackVue\20190429-kyiv\09\Record\jpg"
:: ------------------------------------------------------------------------------------------------------------------	
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
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