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
@set BlackVueCall=%6%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary% %BlackVueCall%
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
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg

:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue

	:: ---------------------

@echo ##### THIS IS CALL-FILE #####

echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %6%
mkdir %BlackVueFolder%\Record_Call
move /Y %BlackVueCall% "%BlackVueFolder%\Record_Call"

mkdir %BlackVueFolder%\Record_Call
mkdir %BlackVueFolder%\Record_Call\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record_Call\gpx
mkdir %BlackVueFolder%\Record_Call\jpg




@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe






::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::D:\mapicam\tools\mapillary\mapillary_tools-042.exe video_process --advanced -h




:: %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record_Call" --video_sample_interval %BlackVueInterval% --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record_Call" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% >> %MapiCamLOG%


mkdir %BlackVueFolder%\Record_Call\jpg
:: %MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record_Call" --video_sample_interval %BlackVueInterval%
:: [ANCHOR-01]
%MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record_Call" --video_sample_interval %BlackVueInterval%

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
:: ПРАЦЮЄ!
:: ВЕРСІЯ exiftool яка зараз використовується. (користуємось для відладки і інформації, щоб не заюзати бува якусь стару чи нестабільну версію утиліти)
:: exiftool -ver
:: [ANCHOR-02]
%MapiCamExifTool% -ver
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -ver
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
:: ПРАЦЮЄ!
:: дістати та зберегти координати з відео файла
:: README: http://u88.n24.queensu.ca/exiftool/forum/index.php?topic=5095.30
:: exiftool -ee -G3 FILE
:: exiftool -ee fileName.mp4 > ee.txt
:: README: https://sno.phy.queensu.ca/~phil/exiftool/exiftool_pod.html#ee--extractEmbedded
:: exiftool -p gpx.fmt FILE.mp4 > out.gpx
:: README: http://owl.phy.queensu.ca/~phil/exiftool/faq.html#Q2
:: [ANCHOR-03]
%MapiCamExifTool% -p %MapiCamExifToolPath%\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w %BlackVueFolder%\Record_Call\gpx\%%f.gpx %BlackVueFolder%\Record_Call
:: ВІДЛАДКА: (нижче - аналог).
::D:\mapicam\tools\exiftool\exiftool.exe -p D:\mapicam\tools\exiftool\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w F:\BlackVue\20190429-kyiv\09\Record_Call\gpx\%f.gpx F:\BlackVue\20190429-kyiv\09\Record
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
:: отримати довжину відео файла
:: ПРАЦЮЄ!
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4" 
:: 7.10 s
:: ПРАЦЮЄ!
:: [ANCHOR-04]
%MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record_Call"
:: ВІДЛАДКА: (нижче - аналог).
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call"
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4"
:: '7.101'
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
:: зберегти ЧАС - в файл
:: ПРАЦЮЄ!
:: [ANCHOR-05]
%MapiCamExifTool% -T -Duration -q -p '$Duration#' "%BlackVueFolder%\Record_Call" > "%BlackVueFolder%\Record_Call\VideoDuration.txt"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call" > "F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4" > "F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
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
:: зчитати ЧАС - з файла в ЗМІННУ
:: ПРАЦЮЄ!
:: README: http://www.cyberforum.ru/cmd-bat/thread809990.html
:: [ANCHOR-06]
set /p VideoDuration=<"%BlackVueFolder%\Record_Call\VideoDuration.txt"
:: ВІДЛАДКА: (нижче - аналог).
:: set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
:: [ANCHOR-07]
echo set /p VideoDuration=<"%BlackVueFolder%\Record_Call\VideoDuration.txt"
:: [ANCHOR-08]
echo VideoDuration=%VideoDuration%
:: ВИДАЛИТИ вже непотрібний VideoDuration.txt
:: [ANCHOR-09]
del "%BlackVueFolder%\Record_Call\VideoDuration.txt"
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
:: очистити ЗМІННУ - від зайвих лапок
:: ПРАЦЮЄ!
:: README: http://forum.oszone.net/thread-327751.html
:: [ANCHOR-10]
set VideoDuration=%VideoDuration:~1,-1%
:: ВІДЛАДКА: (нижче - аналог).
:: set VideoDuration=%VideoDuration:~1,-1%
:: [ANCHOR-11]
echo VideoDuration=%VideoDuration%
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
:: якщо розкоментувати, то буде ЦІЛЕ ЧИСЛО, але й ззакоментованим працює корректно
:: set /a VideoDuration=%VideoDuration%
:: @echo set /a VideoDuration=%VideoDuration%
:: @echo VideoDuration=%VideoDuration%
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
:: Власне сама команда на прошивку (час файла має бути вже синхронізований з таймінгом gpx файла)
:: -v2 виводить інформацію на екран про параметри прошивки. використовувати лише ДЛЯ ДЕБАГА, бо СИЛЬНО СПОВІЛЬНЮЄ ПРОШИВКУ!!!! (це додатковий НЕОБОВЯЗКОВИЙ параметр)  
:: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#geosync
:: Geotag all images in directory "dir" from the GPS positions in "track.log" (in the current directory), for a camera clock that was running 25 seconds slower than the GPS clock:
:: exiftool -geotag track.log -geosync=+25 dir
::    VideoDurationFix = (КількістьГодинЗміщення * КількістьСекундВгодині) + ЧасЗмішенняСукундДовжинаВідео
:: [ANCHOR-12]
echo VideoDuration    = %VideoDuration%
:: [ANCHOR-13]
set /a VideoDuration  =%VideoDuration%*1000
:: [ANCHOR-14]
echo VideoDuration    : VideoDuration * 1000 = %VideoDuration%
:: [ANCHOR-15]
set /a VideoDurationFix =(3*3600)-%VideoDuration%
:: [ANCHOR-16]
echo VideoDuration    = %VideoDuration%
:: [ANCHOR-17]
echo VideoDurationFix = %VideoDurationFix%
:: [ANCHOR-18]
echo. 
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
:: ПРАЦЮЄ!
:: ПЕРЕНЕСТИ ВСІ .jpg ФАЙЛИ до папки "jpg"
:: [ANCHOR-19]
echo off
:: [ANCHOR-20]
mkdir %BlackVueFolder%\Record_Call\jpg
:: [ANCHOR-21]
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do ( move /Y "%%I" "%BlackVueFolder%\Record_Call\jpg" )
:: ВИДАЛИТИ порожню папку
:: [ANCHOR-22]
rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames"
:: [ANCHOR-23]
rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
:: видалити ВСІ файли і підпіпки без запитів
:: rmdir /S /Q "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
:: [ANCHOR-24]
echo on
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
:: %MapiCamExifTool% -r "-AllDates<DateTimeOriginal" "%MapiCamImgFolder%" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-AllDates<DateTimeOriginal" "F:\BlackVue\20190429-kyiv\09\Record_Call\jpg" -overwrite_original_in_place
:: -----------------------------------------------------------------------------------------------------
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
:: Власне сама команда на прошивку (час файла синхронізується з таймінгом gpx файла за допомогою здвигу часу)
:: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#TP1
:: %MapiCamExifTool%  -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original -v2
:: [ANCHOR-25]
%MapiCamExifTool% -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%MapiCamHeadXX% -overwrite_original
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -geotag "F:\BlackVue\20190429-kyiv\09\Record\gpx\*.gpx" "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.jpg" -gpsimgdirection=0 -overwrite_original
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
:: ---------------------------------------------------------------
:: КОРЕГУЄМО ЗДВИГ ЧАСУ (ОБОВЯЗКОВО ПІСЛЯ прошивки координат, бо обнуляються МІЛІСЕКУНДИ і прошивати після цього може лише з таймінгом 1fps)
:: ТРЕБА: змінити час на значення ЗМІННОЇ (довжини відео файла). "поточнийЧас"-"довжинаВідеоФайла"=ПоточнийЧасРеальний
:: [ANCHOR-26]
%MapiCamExifTool% "-DateTimeOriginal+=0:0:0 0:0:%VideoDurationFix%" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
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
:: змінюємо ІМЯ ФАЙЛА  беручи його з DateTimeOriginal. опрацьовується ВСЯ папка
:: ПЕРЕЙМЕНУВАТИ ФАЙЛИ
:: exiftool "-FileName<DateTimeOriginal" -d "%%Y%%m%%d_%%H%%M%%S.%%%%e" image.jpg
:: README: http://owl.phy.queensu.ca/~phil/exiftool/
:: README: http://owl.phy.queensu.ca/~phil/exiftool/filename.html
:: exiftool       -r "-FileName<DateTimeOriginal" -d "%Y%m%d-%H%M%S.%%e"                 DIR
:: [ANCHOR-27]
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для файлів).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<FileCreateDate" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "F:\BlackVue\20190429-kyiv\09\Record_Call\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для консолі).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<CreateDate" -d "%Y%m%d-%H%M%S%%-.1c.%%e" "F:\BlackVue\20190429-kyiv\09\Record_Call\jpg" -overwrite_original
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
:: ------------------------------------------------------
:: ПЕРЕПРОШИВАЄМО ВСІ дати на одну (правильну)
:: [ANCHOR-28]
%MapiCamExifTool% ^
  -r "-AllDates<DateTimeOriginal" ^
  -r "-CreateDate<DateTimeOriginal" ^
  -r "-ModifyDate<DateTimeOriginal" ^
  -r "-FileCreateDate<DateTimeOriginal" ^
  -r "-FileModifyDate<DateTimeOriginal" ^
  -r "-SubSecCreateDate<DateTimeOriginal" ^
  -r "-SubSecModifyDate<DateTimeOriginal" ^
  -r "-SubSecDateTimeOriginal<DateTimeOriginal" ^
  "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
:: ------------------------------------------------------
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
:: ПЕРЕМІЩЕННЯ в загальну папку після корректної прошивки!
:: [ANCHOR-29]
mkdir %BlackVueFolder%\Record_Finalize
mkdir %BlackVueFolder%\Record_Finalize\jpg
mkdir %BlackVueFolder%\Record_Finalize\gpx
:: [ANCHOR-30]
@move /Y "%BlackVueFolder%\Record_Call\*.mp4" "%BlackVueFolder%\Record_Finalize"
@move /Y "%BlackVueFolder%\Record_Call\jpg\*.jpg" "%BlackVueFolder%\Record_Finalize\jpg"
@move /Y "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record_Finalize\gpx"
:: [ANCHOR-31]
:: ВІДЛАДКА: (нижче - аналог).
:: move /Y "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.*" "%BlackVueFolder%\jpg2mapillary"
:: [ANCHOR-32]
@rmdir "%BlackVueFolder%\Record_Call\*fpx"
@rmdir "%BlackVueFolder%\Record_Call\jpg"
@rmdir "%BlackVueFolder%\Record_Call\gpx"
@rmdir "%BlackVueFolder%\Record_Call"

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
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!


