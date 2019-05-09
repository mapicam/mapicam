cd %1%
@set MapiCamPhaseNum=[PaketnaObrobka]
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
::   -gpsimgdirection=%ExifToolGpsImgDirection%
@set ExifToolGpsImgDirection=%BlackVueOffsetAngle%
@echo ##### HEAD (fix local error)#############################################
@echo.
mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\jpg
mkdir %BlackVueFolder%\Record\gpx


:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue

	:: ---------------------

@echo ##### THIS IS CALL-FILE #####

echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %6%
mkdir %BlackVueFolder%\Record_Call
move /Y %BlackVueCall% "%BlackVueFolder%\Record_Call"

mkdir %BlackVueFolder%\Record_Call
mkdir %BlackVueFolder%\Record_Call\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record_Call\jpg
mkdir %BlackVueFolder%\Record_Call\gpx




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
move /Y %BlackVueFolder%\Record_Call\gpx\*.gpx "%BlackVueFolder%\Record\gpx"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -p D:\mapicam\tools\exiftool\Image-ExifTool\fmt_files\gpx.fmt -ee -ext mp4 -w G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record\gpx\%f.gpx G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record
:: 
:: 
:: 
:: 
:: 
:: ФІКС глюку коли в файлі GPX є "здвиг" по координатам на декілька секунд. іноді навіть на 10 секунд. це дає похибку іноді на 20....100м
:: README : https://superuser.com/questions/489240/how-to-get-filename-only-without-path-in-windows-command-line
FOR /R "%BlackVueFolder%\Record\gpx" %%I IN ("*.gpx") DO (
set "cmdFileNameFull=%%I"
set "cmdFileName=%%~nI%%~xI"
echo %%~nI - expands %I to a file name only                   > nul
echo %%~xI - expands %I to a file extension only              > nul
echo cmdFileNameFull =!cmdFileNameFull!                       > nul
echo cmdFileName     =!cmdFileName!                           > nul
set "cmdFileDateTime=%%~nI"
echo cmdFileDateTime =!cmdFileDateTime! // YYYYMMDD_HHMMSS_XX > nul
set "cmdFileDateTime=!cmdFileDateTime:~0,-3!"
echo cmdFileDateTime =!cmdFileDateTime! // YYYYMMDD_HHMMSS    > nul
set "cmdFileDate=!cmdFileDateTime:~0,-7!"
echo cmdFileDate     =!cmdFileDate!        // YYYYMMDD        > nul
set "cmdFileTime=!cmdFileDateTime:~9,6!"
echo cmdFileTime     =!cmdFileTime!          // HHMMSS        > nul
set "cmdFileDateTime=!cmdFileDate!!cmdFileTime!"
echo cmdFileDateTime =!cmdFileDateTime!  // YYYYMMDDHHMMSS    > nul
echo .                                                        > nul
set "cmdFileDateYYYY=!cmdFileDate:~0,4!"
set "cmdFileDateMM=!cmdFileDate:~4,2!"
set "cmdFileDateDD=!cmdFileDate:~6,2!"
set "cmdFileTimeHH=!cmdFileTime:~0,2!"
set "cmdFileTimeMM=!cmdFileTime:~2,2!"
set "cmdFileTimeSS=!cmdFileTime:~4,2!"
echo .                                                        > nul
echo .                                                        > nul



REM ----- WORK! ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- ----- -----


echo cmdFileDateYYYY =!cmdFileDateYYYY! // YYYY
echo cmdFileDateMM   =!cmdFileDateMM!   // MM
echo cmdFileDateDD   =!cmdFileDateDD!   // DD
echo cmdFileTimeHH   =!cmdFileTimeHH!   // HH
echo cmdFileTimeMM   =!cmdFileTimeMM!   // MM
echo cmdFileTimeSS   =!cmdFileTimeSS!   // SS
echo .
echo cmdFile: YYYYMMDDHHMMSS = !cmdFileDateYYYY!!cmdFileDateMM!!cmdFileDateDD!!cmdFileTimeHH!!cmdFileTimeMM!!cmdFileTimeSS!   
echo .
echo .
echo https://sno.phy.queensu.ca/~phil/exiftool/geotag.html
exiftool -s -xmp:GpxTrkTrksegTrkptTime !cmdFileNameFull!
exiftool -s -xmp:GpxTrkTrksegTrkptTime !cmdFileNameFull! > %BlackVueFolder%\GpxTrkTrksegTrkptTime.txt
for /f "usebackq tokens=*" %%a in ("%BlackVueFolder%\GpxTrkTrksegTrkptTime.txt") do (call set "GpxTrkTrksegTrkptTime=%%~a")
echo GpxTrkTrksegTrkptTime = !GpxTrkTrksegTrkptTime!
set "cmdGpxDateTime=!GpxTrkTrksegTrkptTime:~34,19!"
echo cmdGpxDateTime =!cmdGpxDateTime!        // ALL
echo .
set "cmdGpxDateYYYY=!cmdGpxDateTime:~0,4!"
set "cmdGpxDateMM=!cmdGpxDateTime:~5,2!"
set "cmdGpxDateDD=!cmdGpxDateTime:~8,2!"
echo .
set "cmdGpxTimeHH=!cmdGpxDateTime:~-8,2!"
set "cmdGpxTimeMM=!cmdGpxDateTime:~-5,2!"
set "cmdGpxTimeSS=!cmdGpxDateTime:~-2,2!"
echo .
echo cmdGpx : YYYYMMDDHHMMSS = !cmdGpxDateYYYY!!cmdGpxDateMM!!cmdGpxDateDD!!cmdGpxTimeHH!!cmdGpxTimeMM!!cmdGpxTimeSS!   //
echo .

pause

REM echo .                                                        > nul
REM set /a "cmdFileTimeUnix=(!cmdFileTimeHH!*60*60)+(!cmdFileTimeMM!*60)+(!cmdFileTimeSS!)"
REM set /a "cmdGpxTimeUnix=(!cmdGpxTimeHH!*60*60)+(!cmdGpxTimeMM!*60)+(!cmdGpxTimeSS!)"
REM set /a "delthaGpxSec=!cmdFileTimeUnix!-!cmdGpxTimeUnix!-(3*60*60)"
echo cmdFileTimeUnix - cmdGpxTimeUnix - 03:00:00 = delthaGpxSec // !cmdFileTimeUnix! - !cmdGpxTimeUnix! - 10800 = !delthaGpxSec!
echo .
rem outputing
REM echo GPG-TIME-START    (seconds) = !cmdFileTimeUnix! 
REM echo GPX-TIME-END      (seconds) = !cmdGpxTimeUnix!
REM echo GPX-TIME-DURATION (seconds) = !delthaGpxSec!
echo ---------------------------------------------------------
)
:: 
:: 
:: 
:: 





pause





:: 
:: 
:: 
:: отримати довжину відео файла
:: https://askubuntu.com/questions/224237/how-to-check-how-long-a-video-mp4-is-using-the-shell
:: exiftool -T -Duration -q -p '$Duration#' *.mp4
:: ПРАЦЮЄ!
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4" 
:: 7.10 s
:: ПРАЦЮЄ!
%MapiCamExifTool% -T -Duration      -q -p '$Duration#'      "%BlackVueFolder%\Record_Call"
%MapiCamExifTool% -T -TrackDuration -q -p '$TrackDuration#' "%BlackVueFolder%\Record_Call"
:: ВІДЛАДКА: (нижче - аналог).
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call"
::D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4"
:: '7.101'
:: D:\mapicam\tools\exiftool\exiftool.exe -T -TrackDuration -q -p '$TrackDuration#' "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record_Call"
:: 
:: 
:: 
:: 
:: 
:: 
:: 





pause





:: 
:: 
:: 
:: 
:: 
:: зберегти ЧАС - в файл
:: ПРАЦЮЄ!
%MapiCamExifTool% -T -Duration      -q -p '$Duration#'      "%BlackVueFolder%\Record_Call" > "%BlackVueFolder%\Record_Call\VideoDuration.txt"
%MapiCamExifTool% -T -TrackDuration -q -p '$TrackDuration#' "%BlackVueFolder%\Record_Call" > "%BlackVueFolder%\Record_Call\VideoTrackDuration.txt"
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record_Call" > "F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
:: D:\mapicam\tools\exiftool\exiftool.exe -T -Duration -q -p '$Duration#' "F:\BlackVue\20190429-kyiv\09\Record_Call\20190429_194335_EF.mp4" > "F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
:: 
:: 
:: 
:: 
:: 
:: 





pause





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
echo VideoDuration             =  %VideoDuration%
:: 
set /p VideoTrackDuration=<"%BlackVueFolder%\Record_Call\VideoTrackDuration.txt"
echo VideoTrackDuration        =  %VideoTrackDuration%
:: 
set delthaVideoSec=%VideoTrackDuration%
echo delthaVideoSec            =  %delthaVideoSec%
:: ВІДЛАДКА: (нижче - аналог).
:: set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record_Call\VideoDuration.txt"
:: set /p VideoDuration=<"F:\BlackVue\20190429-kyiv\09\Record_Call\VideoTrackDuration.txt"
:: 
:: ВИДАЛИТИ вже непотрібний VideoDuration.txt
del "%BlackVueFolder%\Record_Call\VideoDuration.txt"
del "%BlackVueFolder%\Record_Call\VideoTrackDuration.txt"
:: 
:: 
:: 
:: 
:: 
:: 
:: -->IF-->
:: %MapiCamExifTool% -T -TrackDuration "%BlackVueFolder%\Record_Call"
:: 
:: 0:03:03
:: 0:03:00
:: 16.04 s
:: 0:03:01
:: 0:03:00
:: 0:03:05
:: 
:: -->IF-->
:: %MapiCamExifTool% -T -TrackDuration -q -p '$TrackDuration#' "%BlackVueFolder%\Record_Call"
:: 
:: '182.865'
:: '180.464'
:: '16.036'
:: '180.831'
:: '180.23'
:: 
:: 
:: 
:: 
:: 
:: очистити ЗМІННУ - від зайвих лапок (символів)
:: ПРАЦЮЄ!
:: README: http://forum.oszone.net/thread-327751.html
set  VideoDuration=%VideoDuration:~1,-1%
echo VideoDuration      = %VideoDuration%
set  VideoTrackDuration=%VideoTrackDuration:~1,-1%
echo VideoTrackDuration = %VideoTrackDuration%
:: 
set delthaVideoSec=%VideoTrackDuration%
echo delthaVideoSec     = %delthaVideoSec%
echo delthaGpsSec       = %delthaGpxSec%
:: ВІДЛАДКА: (нижче - аналог).
:: set VideoDuration=%VideoDuration:~1,-1%
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
pause
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
echo VideoDuration             =%VideoDuration%
echo VideoTrackDuration        =%VideoTrackDuration%
REM set /a VideoDuration=0
REM set /a VideoTrackDuration=0
echo VideoDuration             =VideoDuration * 1000      = %VideoDuration%
echo VideoTrackDuration        =VideoTrackDuration * 1000 = %VideoTrackDuration%
set /a VideoDurationFix=(3*3600)-%VideoDuration%
set /a VideoTrackDurationFix=(3*3600)-%VideoTrackDuration%
:: тут застосовуємо ЗДВИГ який є в GPX файлі, віднімаючи його від здвигу відео.
set /a VideoDurationFixGPS=%VideoDurationFix%-%cmdFixGpxUnix%
set /a VideoTrackDurationFixGPS=%VideoTrackDurationFix%-%cmdFixGpxUnix%
echo VideoDuration             =%VideoDuration%
echo VideoTrackDuration        =%VideoTrackDuration%
echo VideoDurationFix          =%VideoDurationFix%
echo VideoTrackDurationFix     =%VideoTrackDurationFix%
echo cmdFixGpxUnix             =%cmdFixGpxUnix%
echo VideoDurationFixGPS       =%VideoDurationFixGPS%
echo VideoTrackDurationFixGPS  =%VideoTrackDurationFixGPS%
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
echo off
mkdir %BlackVueFolder%\Record_Call\jpg
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do ( move /Y "%%I" "%BlackVueFolder%\Record_Call\jpg" )
:: ВИДАЛИТИ порожню папку
rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames"
rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
:: видалити ВСІ файли і підпіпки без запитів
:: rmdir /S /Q "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
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
:: %MapiCamExifTool%  -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%ExifToolGpsImgDirection% -overwrite_original -v2
%MapiCamExifTool% -geosync=+%VideoDurationFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%ExifToolGpsImgDirection% -overwrite_original
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
:: УВАГА! НА СТАРИХ ВІДЕО ЦЕЙ ЕТАП РОБИТИ НЕ ТРЕБА, БО ТОДІ ВИХОДИТЬ ПОДВІЙНИЙ ЗДВИГ
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
mkdir %BlackVueFolder%\Record\gpx
:: [ANCHOR-30]
@move /Y "%BlackVueFolder%\Record_Call\*.mp4" "%BlackVueFolder%\Record_Finalize"
@move /Y "%BlackVueFolder%\Record_Call\jpg\*.jpg" "%BlackVueFolder%\Record_Finalize\jpg"
@move /Y "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record\gpx"
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
:: 
:: 
:: 
:: 
:: 
:: 
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!