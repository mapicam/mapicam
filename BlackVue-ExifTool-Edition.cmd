cd %1%
@set MapiCamPhaseNum=[PaketnaObrobka]
@echo ##### HEAD ##############################################################
enableextensions enabledelayedexpansion
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
mkdir %BlackVueFolder%\Record\jpg
mkdir %BlackVueFolder%\Record\gpx


:: ===== BlackVue START =============
@set MapiCamNameXX=BlackVue

@set "BlackVueCallFileName=%BlackVueCall%"
@set "BlackVueCallFilePath=%BlackVueCall:~0,-23%"
@set "BlackVueCallFileName=%BlackVueCall:~-22,-4%"
@echo.
@echo BlackVueCallFilePath=%BlackVueCallFilePath%
@echo BlackVueCallFileName=%BlackVueCallFileName%
@echo.


	:: ---------------------

@echo ##### THIS IS CALL-FILE #####

echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %6%
mkdir %BlackVueFolder%\Record_Call
move /Y %BlackVueCall% "%BlackVueFolder%\Record_Call"

mkdir %BlackVueFolder%\Record_Call
mkdir %BlackVueFolder%\Record_Call\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record_Call\jpg
mkdir %BlackVueFolder%\Record_Call\gpx


:: 
:: 
:: ПРАЦЮЄ!
:: ВЕРСІЯ exiftool яка зараз використовується. (користуємось для відладки і інформації, щоб не заюзати бува якусь стару чи нестабільну версію утиліти)
:: exiftool -ver
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
@set "cmdFileNameFull=%BlackVueFolder%\Record\gpx\%BlackVueCallFileName%.gpx"
@set "cmdFileName=%BlackVueCallFileName%.gpx"
@echo cmdFileNameFull =%cmdFileNameFull%
@echo cmdFileName     =%cmdFileName%
@set "cmdFileDateTime=%BlackVueCallFileName%"
@echo cmdFileDateTime =%cmdFileDateTime% // YYYYMMDD_HHMMSS_XX
@set "cmdFileDateTime=%cmdFileDateTime:~0,-3%"
@echo cmdFileDateTime =%cmdFileDateTime% // YYYYMMDD_HHMMSS
@set "cmdFileDate=%cmdFileDateTime:~0,-7%"
@echo cmdFileDate     =%cmdFileDate%        // YYYYMMDD
@set "cmdFileTime=%cmdFileDateTime:~9,6%"
@echo cmdFileTime     =%cmdFileTime%          // HHMMSS
@set "cmdFileDateTime=%cmdFileDate%%cmdFileTime%"
@echo cmdFileDateTime =%cmdFileDateTime%  // YYYYMMDDHHMMSS
@echo.
@set "cmdFileDateYYYY=%cmdFileDate:~0,4%"
@set "cmdFileDateMM=%cmdFileDate:~4,2%"
@set "cmdFileDateDD=%cmdFileDate:~6,2%"
@set "cmdFileTimeHH=%cmdFileTime:~0,2%"
@set "cmdFileTimeMM=%cmdFileTime:~2,2%"
@set "cmdFileTimeSS=%cmdFileTime:~4,2%"
@echo.
@echo cmdFileDateYYYY =%cmdFileDateYYYY% // YYYY
@echo cmdFileDateMM   =%cmdFileDateMM%   // MM
@echo cmdFileDateDD   =%cmdFileDateDD%   // DD
@echo cmdFileTimeHH   =%cmdFileTimeHH%   // HH
@echo cmdFileTimeMM   =%cmdFileTimeMM%   // MM
@echo cmdFileTimeSS   =%cmdFileTimeSS%   // SS
@echo.
@echo cmdFile: YYYYMMDDHHMMSS = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%   
@echo.
@echo https://sno.phy.queensu.ca/~phil/exiftool/geotag.html
exiftool -s -xmp:GpxTrkTrksegTrkptTime %cmdFileNameFull%
exiftool -s -xmp:GpxTrkTrksegTrkptTime %cmdFileNameFull% > %BlackVueFolder%\Record_call\GpxTrkTrksegTrkptTime.txt
for /f "usebackq tokens=*" %%a in ("%BlackVueFolder%\Record_call\GpxTrkTrksegTrkptTime.txt") do (call set "GpxTrkTrksegTrkptTime=%%~a")
@echo GpxTrkTrksegTrkptTime = %GpxTrkTrksegTrkptTime%
@set "cmdGpxDateTime=%GpxTrkTrksegTrkptTime:~34,19%"
@echo cmdGpxDateTime =%cmdGpxDateTime%        // ALL
@echo.
@set "cmdGpxDateYYYY=%cmdGpxDateTime:~0,4%"
@set "cmdGpxDateMM=%cmdGpxDateTime:~5,2%"
@set "cmdGpxDateDD=%cmdGpxDateTime:~8,2%"
@echo.
@set "cmdGpxTimeHH=%cmdGpxDateTime:~-8,2%"
@set "cmdGpxTimeMM=%cmdGpxDateTime:~-5,2%"
@set "cmdGpxTimeSS=%cmdGpxDateTime:~-2,2%"
@echo.
@echo cmdGpx : YYYYMMDDHHMMSS = %cmdGpxDateYYYY%%cmdGpxDateMM%%cmdGpxDateDD%%cmdGpxTimeHH%%cmdGpxTimeMM%%cmdGpxTimeSS%   //
@echo.
@set /a "cmdFileTimeSec=(%cmdFileTimeHH%*60*60)+(%cmdFileTimeMM%*60)+(%cmdFileTimeSS%)"
@set /a "cmdGpxTimeSec=(%cmdGpxTimeHH%*60*60)+(%cmdGpxTimeMM%*60)+(%cmdGpxTimeSS%)"
@set /a "delthaGpxSec=%cmdFileTimeSec%-%cmdGpxTimeSec%-(3*60*60)"
@echo cmdFileTimeSec - cmdGpxTimeSec - 03:00:00 = delthaGpxSec // %cmdFileTimeSec% - %cmdGpxTimeSec% - 10800 = %delthaGpxSec%
@echo.
@del "%BlackVueFolder%\Record_call\GpxTrkTrksegTrkptTime.txt"

@echo https://www.cy-pr.com/tools/time/
@echo 20190101000000 = 1546300800
@echo 20190201000000 = 1548979200
@echo 20190301000000 = 1551398400
@echo 20190401000000 = 1554076800
@echo 20190501000000 = 1556668800
@echo 20190601000000 = 1559347200
@echo 20190701000000 = 1561939200
@echo 20190801000000 = 1564617600
@echo 20190901000000 = 1567296000
@echo 20191001000000 = 1569888000
@echo 20191101000000 = 1572566400
@echo 20191201000000 = 1575158400
@echo 20200101000000 = 1577836800



set fixTime0YYYYMM=%cmdGpxDateYYYY%%cmdGpxDateMM%01000000
@echo fixTime0YYYYMM=%fixTime0YYYYMM%


@echo ################## WORK! ##########################
@echo.

if  %fixTime0YYYYMM%==20190101000000 (set /a "fixTime0YYYYMMunix=1546300800")
if  %fixTime0YYYYMM%==20190201000000 (set /a "fixTime0YYYYMMunix=1548979200")
if  %fixTime0YYYYMM%==20190301000000 (set /a "fixTime0YYYYMMunix=1551398400")
if  %fixTime0YYYYMM%==20190401000000 (set /a "fixTime0YYYYMMunix=1554076800")
if  %fixTime0YYYYMM%==20190501000000 (set /a "fixTime0YYYYMMunix=1556668800")
if  %fixTime0YYYYMM%==20190601000000 (set /a "fixTime0YYYYMMunix=1559347200")
if  %fixTime0YYYYMM%==20190701000000 (set /a "fixTime0YYYYMMunix=1561939200")
if  %fixTime0YYYYMM%==20190801000000 (set /a "fixTime0YYYYMMunix=1564617600")
if  %fixTime0YYYYMM%==20190901000000 (set /a "fixTime0YYYYMMunix=1567296000")
if  %fixTime0YYYYMM%==20191001000000 (set /a "fixTime0YYYYMMunix=1569888000")
if  %fixTime0YYYYMM%==20191101000000 (set /a "fixTime0YYYYMMunix=1572566400")
if  %fixTime0YYYYMM%==20191201000000 (set /a "fixTime0YYYYMMunix=1575158400")
if  %fixTime0YYYYMM%==20200101000000 (set /a "fixTime0YYYYMMunix=1577836800")
if  %fixTime0YYYYMM%==20200201000000 (set /a "fixTime0YYYYMMunix=1580515200")
if  %fixTime0YYYYMM%==20200301000000 (set /a "fixTime0YYYYMMunix=1583020800")
if  %fixTime0YYYYMM%==20200401000000 (set /a "fixTime0YYYYMMunix=1585699200")
if  %fixTime0YYYYMM%==20200501000000 (set /a "fixTime0YYYYMMunix=1588291200")
if  %fixTime0YYYYMM%==20200601000000 (set /a "fixTime0YYYYMMunix=1590969600")
if  %fixTime0YYYYMM%==20200701000000 (set /a "fixTime0YYYYMMunix=1593561600")
if  %fixTime0YYYYMM%==20200801000000 (set /a "fixTime0YYYYMMunix=1596240000")
if  %fixTime0YYYYMM%==20200901000000 (set /a "fixTime0YYYYMMunix=1598918400")
if  %fixTime0YYYYMM%==20201001000000 (set /a "fixTime0YYYYMMunix=1601510400")
if  %fixTime0YYYYMM%==20201101000000 (set /a "fixTime0YYYYMMunix=1604188800")
if  %fixTime0YYYYMM%==20201201000000 (set /a "fixTime0YYYYMMunix=1606780800")




@echo fixTime0YYYYMM=%fixTime0YYYYMM% fixTime0YYYYMMunix=%fixTime0YYYYMMunix%

set /a "fixTime1Sec=%cmdFileTimeSec%-10800"
:: КОСТИЛЬ: виправлення помилки двозначного числа, коли в роботі треба 10 число "decimal", а скрипт бачить його як 8 "hexadecimal".
:: "Invalid number. Numeric constants are either decimal (17), hexadecimal (0x11), or octal (021)."
:: РІШЕННЯ: додати перед значеннм 1, а від утвореного відняти 100.
:: для fixTime1
@set "fixTime1DD=%cmdFileDateDD%"
@set "fixTime1DD=1%fixTime1DD%"
@set /a "fixTime1DD=%fixTime1DD%-100"
:: для fixTime2
@set "fixTime2DD=%cmdGpxDateDD%"
@set "fixTime2DD=1%fixTime2DD%"
@set /a "fixTime2DD=%fixTime2DD%-100"
:: для fixTime3
@set "fixTime3DD=%cmdGpxDateDD%"
@set "fixTime3DD=1%fixTime3DD%"
@set /a "fixTime3DD=%fixTime3DD%-100"
@echo fixTime1DD=%fixTime1DD%
@echo fixTime2DD=%fixTime2DD%
@echo fixTime3DD=%fixTime3DD% 
:: КОСТИЛЬ-END: 

@set /a "fixTime1HH=(%fixTime1Sec%)/60/60"
@set /a "fixTime1MM=((%fixTime1Sec%)-(%fixTime1HH%*60*60))/60"
@set /a "fixTime1SS=((%fixTime1Sec%)-(%fixTime1HH%*60*60)-(%fixTime1MM%*60))"
@set    "fixTime1=%fixTime1HH%:%fixTime1MM%:%fixTime1SS%"
:: мінус -86400 секунд - це "віртуальна" доба яка ЗАВЖДИ утворюється при додаванні значення "РікМісяць" + "ДеньГодинаХвилинаСекунда".
:: бо в "РікМісяць" вже враховується значення першої доби місяця, тому треба це враховувати в подальших формулах
@set /a "fixTime1Unix=%fixTime0YYYYMMunix%+(%fixTime1DD%*24*60*60)+(%fixTime1HH%*60*60)+(%fixTime1MM%*60)+(%fixTime1SS%)-86400"

@set /a "fixTime2Sec=%cmdGpxTimeSec%"
@set /a "fixTime2HH=(%fixTime2Sec%)/60/60"
@set /a "fixTime2MM=((%fixTime2Sec%)-(%fixTime2HH%*60*60))/60"
@set /a "fixTime2SS=((%fixTime2Sec%)-(%fixTime2HH%*60*60)-(%fixTime2MM%*60))"
@set    "fixTime2=%fixTime2HH%:%fixTime2MM%:%fixTime2SS%"
@set /a "fixTime2Unix=%fixTime0YYYYMMunix%+(%fixTime2DD%*24*60*60)+(%fixTime2HH%*60*60)+(%fixTime2MM%*60)+(%fixTime2SS%)-86400"

@set /a "fixTime3Sec=%cmdGpxTimeSec%+10800"
@set /a "fixTime3HH=(%fixTime3Sec%)/60/60"
@set /a "fixTime3MM=((%fixTime3Sec%)-(%fixTime3HH%*60*60))/60"
@set /a "fixTime3SS=((%fixTime3Sec%)-(%fixTime3HH%*60*60)-(%fixTime3MM%*60))"
@set    "fixTime3=%fixTime3HH%:%fixTime3MM%:%fixTime3SS%"
@set /a "fixTime3Unix=%fixTime0YYYYMMunix%+(%fixTime3DD%*24*60*60)+(%fixTime3HH%*60*60)+(%fixTime3MM%*60)+(%fixTime3SS%)-86400"

@echo.
@echo ----- EXAMPLE (start)
@echo https://www.cy-pr.com/tools/time/
@echo fixTime1Unix = 1554815689
@echo GMT          = Tue, 09 Apr 2019 13:14:49 GMT
@echo LOCAL        = 09.04.2019, 16:14:49
@echo. 
@echo FileName     = 20190409_161449_XX.GPX
@echo fixTime1     = 13:14:49 = 13:14:49 = 1554815689 (VIDEO file name time)
@echo fixTime2     = 13:14:42 = 13:14:42 = 1554815682 (GPX first line time)
@echo fixTime3     = 16:14:42 = 16:14:42 = 1554826482 (GPX first line time LOCAL)
@echo ----- EXAMPLE (end)
@echo.
@echo fixTime1HH   = %fixTime1HH%
@echo fixTime1MM   = %fixTime1MM%
@echo fixTime1SS   = %fixTime1SS%
@echo fixTime1Unix = %fixTime1Unix%

@echo. 
@echo fixTime2HH   = %fixTime2HH%
@echo fixTime2MM   = %fixTime2MM%
@echo fixTime2SS   = %fixTime2SS%
@echo fixTime2Unix = %fixTime2Unix%
@echo. 
@echo fixTime3HH   = %fixTime3HH%
@echo fixTime3MM   = %fixTime3MM%
@echo fixTime3SS   = %fixTime3SS%
@echo fixTime3Unix = %fixTime3Unix%
@echo. 
@echo FileName     = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%_%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%_XX.GPX
@echo fixTime1     = %fixTime1% = %fixTime1HH%:%fixTime1MM%:%fixTime1SS% = %fixTime1Unix% (VIDEO file name time)
@echo fixTime2     = %fixTime2% = %fixTime2HH%:%fixTime2MM%:%fixTime2SS% = %fixTime2Unix% (GPX first line time)
@echo fixTime3     = %fixTime3% = %fixTime3HH%:%fixTime3MM%:%fixTime3SS% = %fixTime3Unix% (GPX first line time LOCAL)



:: 
:: 
:: 
:: 
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
set VideoDuration=%VideoDuration:~1,-1%
set VideoTrackDuration=%VideoTrackDuration:~1,-1%

set delthaVideoSec=%VideoTrackDuration%

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
@echo FIX-ERROR-BEFORE   : "Missing operator."
@echo VideoDuration      = %VideoDuration%
@echo VideoTrackDuration = %VideoTrackDuration%
@echo delthaVideoSec     = %delthaVideoSec%
@echo delthaGpsSec       = %delthaGpxSec%
:: Робимо цілим числом (позбуваємось дробної частини), щоб була можливість здійснювати математичні операції над цими параметрами
:: set /a VideoDuration=%VideoDuration%
:: @echo set /a "VideoDuration=%VideoDuration%"
:: @echo VideoDuration=%VideoDuration%
@echo.
@echo FIX-ERROR-SET      : "Missing operator."
@set /a "VideoDuration=%VideoDuration%"
@set /a "VideoTrackDuration=%VideoTrackDuration%"
@set /a "delthaVideoSec=%delthaVideoSec%"
@set /a "delthaGpxSec=%delthaGpxSec%"
@echo.
@echo FIX-ERROR-AFTER    : "Missing operator."
@echo VideoDuration      = %VideoDuration%
@echo VideoTrackDuration = %VideoTrackDuration%
@echo delthaVideoSec     = %delthaVideoSec%
@echo delthaGpsSec       = %delthaGpxSec%
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
@echo -----

REM set /a VideoDuration=0
REM set /a VideoTrackDuration=0
set /a "VideoDurationFix=3*3600-%VideoDuration%"
set /a "VideoTrackDurationFix=3*3600-%VideoTrackDuration%"
set /a "delthaVideoSecFix=3*3600-%delthaVideoSec%"
set /a "delthaGpsSecFix=3*3600-%delthaVideoSec%-%delthaGpxSec%"
:: тут застосовуємо ЗДВИГ який є в GPX файлі, віднімаючи його від здвигу відео.
@echo -----
set /a "VideoDurationFixGPS=%VideoDurationFix%-%delthaGpxSec%"
set /a "VideoTrackDurationFixGPS=%VideoTrackDurationFix%-%delthaGpxSec%"

@echo VideoDuration            (false) = %VideoDuration%
@echo VideoTrackDuration       (true)  = %VideoTrackDuration%
@echo VideoDurationFix         (false) = %VideoDurationFix%
@echo VideoTrackDurationFix    (true)  = %VideoTrackDurationFix%
@echo VideoDurationFixGPS      (false) = %VideoDurationFixGPS%
@echo VideoTrackDurationFixGPS (false) = %VideoTrackDurationFixGPS%
@echo.
@echo delthaVideoSec           (true)  = %delthaVideoSec%
@echo delthaGpxSec             (true)  = %delthaGpxSec%
@echo delthaVideoSecFix        (true)  = %delthaVideoSecFix%
@echo delthaGpsSecFix          (true)  = %delthaGpsSecFix%
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

@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe

::@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-042.exe
::D:\mapicam\tools\mapillary\mapillary_tools-042.exe video_process --advanced -h

:: %MapiCamMapillaryTools% video_process --advanced --version --verbose --import_path "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps" --user_name %MapiCamUsernameAtMapillary% --skip_subfolders --video_import_path "%BlackVueFolder%\Record_Call" --video_sample_interval %BlackVueInterval% --geotag_source "blackvue_videos" --geotag_source_path "%BlackVueFolder%\Record_Call" --offset_angle %BlackVueOffsetAngle% --use_gps_start_time --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% >> %MapiCamLOG%

mkdir %BlackVueFolder%\Record_Call\jpg
:: %MapiCamMapillaryTools% sample_video --advanced --version --import_path "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps" --video_import_path "%BlackVueFolder%\Record_Call" --video_sample_interval %BlackVueInterval%
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
:: ПЕРЕНЕСТИ ВСІ .jpg ФАЙЛИ до папки "jpg"

@mkdir %BlackVueFolder%\Record_Call\jpg
echo off
@echo.
@echo move /Y "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames\xxxxxxx\FILE.JPG" "%BlackVueFolder%\Record_Call\jpg"
@echo.
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do ( 
  @move /Y "%%I" "%BlackVueFolder%\Record_Call\jpg" > nul
)
echo on
:: ВИДАЛИТИ порожню папку
@rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames\%BlackVueCallFileName%"
@rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps\mapillary_sampled_video_frames"
@rmdir "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
:: видалити ВСІ файли і підпіпки без запитів
:: rmdir /S /Q "%BlackVueFolder%\Record_Call\%BlackVueFPS%fps"
:: 
:: 
:: 
:: 
:: 
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
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
:: GPS-TIME @ IMG-TIME	
:: -geosync="12:58:05@2010:01:02 12:25:26"
:: Both GPS and image timestamps are taken from the Geosync value. eg) 
:: 
:: 
@echo delthaVideoSec           (true)  = %delthaVideoSec%
@echo delthaGpxSec             (true)  = %delthaGpxSec%
@echo delthaVideoSecFix        (true)  = %delthaVideoSecFix%
@echo delthaGpsSecFix          (true)  = %delthaGpsSecFix%


@set /a "fixTime2Sec=%cmdGpxTimeSec%-%delthaVideoSec%-%delthaGpxSec%"
@set /a "fixTime2HH=(%fixTime2Sec%)/60/60"
@set /a "fixTime2MM=((%fixTime2Sec%)-(%fixTime2HH%*60*60))/60"
@set /a "fixTime2SS=((%fixTime2Sec%)-(%fixTime2HH%*60*60)-(%fixTime2MM%*60))"
@set    "fixTime2=%fixTime2HH%:%fixTime2MM%:%fixTime2SS%"
set /a "fixTime2Unix=%fixTime0YYYYMMunix%+(%fixTime2DD%*24*60*60)+(%fixTime2HH%*60*60)+(%fixTime2MM%*60)+(%fixTime2SS%)-86400"


:: для fixTime4
@set "fixTime4DD=%cmdFileDateDD%"
@set "fixTime4DD=1%fixTime4DD%"
@set /a "fixTime4DD=%fixTime4DD%-100"
@echo fixTime4DD=%fixTime4DD% 
::
@set /a "fixTime4Sec=%cmdFileTimeSec%"
@set /a "fixTime4HH=(%fixTime4Sec%)/60/60"
@set /a "fixTime4MM=((%fixTime4Sec%)-(%fixTime4HH%*60*60))/60"
@set /a "fixTime4SS=((%fixTime4Sec%)-(%fixTime4HH%*60*60)-(%fixTime4MM%*60))"
@set    "fixTime4=%fixTime4HH%:%fixTime4MM%:%fixTime4SS%"
set /a "fixTime4Unix=%fixTime0YYYYMMunix%+(%fixTime4DD%*24*60*60)+(%fixTime4HH%*60*60)+(%fixTime4MM%*60)+(%fixTime4SS%)-86400"

@echo. 
@echo FileName        = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%_%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%_XX.GPX
@echo fixTime1        = %fixTime1% (VIDEO file name time)
@echo fixTime2        = %fixTime2% (GPX first line time) AND fixVideoTime AND fixGpsTime
@echo fixTime3        = %fixTime3% (GPX first line time LOCAL)
@echo fixTime4        = %fixTime4% = %fixTime4HH%:%fixTime4MM%:%fixTime4SS% = %fixTime4Unix% (fix deltha video time)


:: 
:: 
:: 
:: 
:: 
:: ---------------------------------------------------------------
:: (для прошивки координат)
:: КОРЕГУЄМО ЗДВИГ ЧАСУ ТА ЗМІНЮЄМО ІМЯ ФАЙЛА  беручи його з DateTimeOriginal. опрацьовується ВСЯ папка 
:: ПЕРЕЙМЕНУВАТИ ФАЙЛИ
:: exiftool "-FileName<DateTimeOriginal" -d "%%Y%%m%%d_%%H%%M%%S.%%%%e" image.jpg
:: README: http://owl.phy.queensu.ca/~phil/exiftool/
:: README: http://owl.phy.queensu.ca/~phil/exiftool/filename.html
:: exiftool       -r "-FileName<DateTimeOriginal" -d "%Y%m%d-%H%M%S.%%e"                 DIR
:: %MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для файлів).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<FileCreateDate" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record_Call\jpg" -overwrite_original
:: ВІДЛАДКА: (нижче - аналог: для консолі).
:: D:\mapicam\tools\exiftool\exiftool.exe -r "-FileName<CreateDate" -d "%Y%m%d-%H%M%S%%-.1c.%%e" "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record_Call\jpg" -overwrite_original
:: ТРЕБА: змінити час на значення ЗМІННОЇ (довжини відео файла). "поточнийЧас"-"довжинаВідеоФайла"=ПоточнийЧасРеальний
:: УВАГА! НА СТАРИХ ВІДЕО ЦЕЙ ЕТАП РОБИТИ НЕ ТРЕБА, БО ТОДІ ІНОДІ ВИХОДИТЬ ПОДВІЙНИЙ ЗДВИГ

:: ТРЕБА: ВИЗНАЧАТИ КОЕФІЦІЕНТ по формулі (проаналізувати параметри і придумати) 





set /a "delthaFullSecCoeficient1=0"
set /a "delthaFullSecCoeficient2=%delthaFullSecCoeficient1%"
set /a "delthaFullSec1=%delthaVideoSec%+%delthaGpxSec%+%delthaFullSecCoeficient1%"
set /a "delthaFullSec2=10800+%delthaGpxSec%+%delthaFullSecCoeficient2%"
@echo.
@echo delthaFullSecCoeficient1 = %delthaFullSecCoeficient1%
@echo delthaFullSecCoeficient2 = %delthaFullSecCoeficient2%
@echo delthaFullSec1 = %delthaFullSec1%
@echo delthaFullSec2 = %delthaFullSec2%


%MapiCamExifTool% "-DateTimeOriginal-=0:0:0 0:0:%delthaFullSec1%.000" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original

@set delthaFullSec1A=0
echo off
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record_call\jpg" ^| findstr /i ".jpg"') do (set delthaFullSec1A=%%~nI)
echo on
@echo delthaFullSec1A = %delthaFullSec1A%
@echo.

:: для fixTime5
:: час ОСТАННЬОГО кадру відео
@set "fixTime5DD=%cmdFileDateDD%"
@set "fixTime5DD=1%fixTime5DD%"
@set /a "fixTime5DD=%fixTime5DD%-100"
@echo fixTime5DD=%fixTime5DD% 
::
@set fixTime5Sec=%delthaFullSec1A%
@set fixTime5Sec=%fixTime5Sec:~9,8%
@echo fixTime5Sec = %fixTime5Sec%
@set /a fixTime5HH=%fixTime5Sec:~0,2%
@set /a fixTime5MM=%fixTime5Sec:~2,2%
@set /a fixTime5SS=%fixTime5Sec:~4,2%
@set /a fixTime5MS=%fixTime5Sec:~7,1%
@set /a fixTime5Sec=(%fixTime5HH%*60*60)+(%fixTime5MM%*60)+(%fixTime5SS%)
@set   "fixTime5=%fixTime5HH%:%fixTime5MM%:%fixTime5SS%"
@echo fixTime5Sec = %fixTime5Sec%
@set /a "fixTime5Unix=%fixTime0YYYYMMunix%+(%fixTime5DD%*24*60*60)+(%fixTime5HH%*60*60)+(%fixTime5MM%*60)+(%fixTime5SS%)-86400"
@echo. 
@echo FileName        = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%_%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%_XX.GPX
@echo fixTime1        = %fixTime1% = %fixTime1Unix%                                          (VIDEO file name time)
@echo fixTime2        = %fixTime2% = %fixTime2Unix%                                          (GPX first line time) AND fixVideoTime AND fixGpsTime
@echo fixTime3        = %fixTime3% = %fixTime3Unix%                                          (GPX first line time LOCAL)
@echo fixTime4        = %fixTime4% = %fixTime4Unix% = %fixTime4HH%:%fixTime4MM%:%fixTime4SS% (fix deltha video time)
@echo fixTime5        = %fixTime5% = %fixTime5Unix% = %fixTime5HH%:%fixTime5MM%:%fixTime5SS% (ostnnij kadr video)

:: для fixTime6
:: час ПЕРШОГО кадру відео (= ЧасОстанньогоКадруВідео - ДовжинаВідеоВсекундах)
@set "fixTime6DD=%cmdFileDateDD%"
@set "fixTime6DD=1%fixTime6DD%"
@set /a "fixTime6DD=%fixTime6DD%-100"
@echo fixTime6DD=%fixTime6DD% 
:: МЕТОДИКА: щоб дізнатись секундВідПочаткуДоби ПЕРШОГО кадру відео (fixTime6Sec): від unix часу останнього кадру (fixTime5Unix) --- віднімаємо СумуЧасуВсекундах YYYYMM+DD-ДобаЗдвигуВсекундах --- від того що вийшло віднімаємо ДовжинуВідеоВсекундах
@set /a "fixTime6Sec=%fixTime5Unix%-(%fixTime0YYYYMMunix%+(%fixTime6DD%*24*60*60)-86400)-%delthaVideoSec%"
@set /a "fixTime6HH=(%fixTime6Sec%)/60/60"
@set /a "fixTime6MM=((%fixTime6Sec%)-(%fixTime6HH%*60*60))/60"
@set /a "fixTime6SS=((%fixTime6Sec%)-(%fixTime6HH%*60*60)-(%fixTime6MM%*60))"
@set    "fixTime6=%fixTime6HH%:%fixTime6MM%:%fixTime6SS%"
@set /a "fixTime6Unix=%fixTime0YYYYMMunix%+(%fixTime6DD%*24*60*60)+(%fixTime6HH%*60*60)+(%fixTime6MM%*60)+(%fixTime6SS%)-86400"
::
@echo FileName        = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%_%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%_XX.GPX
@echo fixTime1        = %fixTime1% = %fixTime1Unix%                                          (VIDEO file name time)
@echo fixTime2        = %fixTime2% = %fixTime2Unix%                                          (GPX first line time) AND fixVideoTime AND fixGpsTime
@echo fixTime3        = %fixTime3% = %fixTime3Unix%                                          (GPX first line time LOCAL)
@echo fixTime4        = %fixTime4% = %fixTime4Unix% = %fixTime4HH%:%fixTime4MM%:%fixTime4SS% (fix deltha video time)
@echo fixTime5        = %fixTime5% = %fixTime5Unix% = %fixTime5HH%:%fixTime5MM%:%fixTime5SS% (ostnnij kadr video)
@echo fixTime6        = %fixTime6% = %fixTime6Unix% = %fixTime6HH%:%fixTime6MM%:%fixTime6SS% (pershyi kadr video)


@echo #############################################################################
:: для fixTime7
:: різниця в часі між першим кадром відео і першою фоткою з цього ж відео. необхідно щоб на ЦЕ значення зробити здвигв прошивці ЖПС 
:: 
@set "fixTime7DD=%cmdFileDateDD%"
@set "fixTime7DD=1%fixTime7DD%"
@set /a "fixTime7DD=%fixTime7DD%-100"
::
@set /a "fixTime7Sec=%fixTime6Unix%-%fixTime1Unix%"
@set /a "fixTime7HH=(%fixTime7Sec%)/60/60"
@set /a "fixTime7MM=((%fixTime7Sec%)-(%fixTime7HH%*60*60))/60"
@set /a "fixTime7SS=((%fixTime7Sec%)-(%fixTime7HH%*60*60)-(%fixTime7MM%*60))"
@set    "fixTime7=%fixTime7HH%:%fixTime7MM%:%fixTime7SS%"
@set /a "fixTime7Unix=none"

:: для fixTime8
:: "fixTime8Sec" сума часу в секундах мід здвигом глюка "fixTime7" та "delthaFullSec2". Саме ця сума буде використовуватись для другої ітерації перепрошивки часу фоток, щоб потім в саме цей час шити координати. 
@set "fixTime8DD=%cmdFileDateDD%"
@set "fixTime8DD=1%fixTime7DD%"
@set /a "fixTime7DD=%fixTime7DD%-100"
::
set /a "fixTime8Sec=%fixTime7Unix%+(%delthaFullSec2%)"
set /a "fixTime8HH=(%fixTime8Sec%)/60/60"
set /a "fixTime8MM=((%fixTime8Sec%)-(%fixTime8HH%*60*60))/60"
set /a "fixTime8SS=((%fixTime8Sec%)-(%fixTime8HH%*60*60)-(%fixTime8MM%*60))"
set    "fixTime8=%fixTime8HH%:%fixTime8MM%:%fixTime8SS%"
set /a "fixTime8Unix=none"




@echo FileName        = %cmdFileDateYYYY%%cmdFileDateMM%%cmdFileDateDD%_%cmdFileTimeHH%%cmdFileTimeMM%%cmdFileTimeSS%_XX.GPX
@echo fixTime1        = %fixTime1% = %fixTime1Unix%                                          (VIDEO file name time)
@echo fixTime2        = %fixTime2% = %fixTime2Unix%                                          (GPX first line time) AND fixVideoTime AND fixGpsTime
@echo fixTime3        = %fixTime3% = %fixTime3Unix%                                          (GPX first line time LOCAL)
@echo fixTime4        = %fixTime4% = %fixTime4Unix% = %fixTime4HH%:%fixTime4MM%:%fixTime4SS% (fix deltha video time)
@echo fixTime5        = %fixTime5% = %fixTime5Unix% = %fixTime5HH%:%fixTime5MM%:%fixTime5SS% (ostnnij kadr video)
@echo fixTime6        = %fixTime6% = %fixTime6Unix% = %fixTime6HH%:%fixTime6MM%:%fixTime6SS% (pershyi kadr video)
@echo fixTime7        = %fixTime7% = %fixTime7Unix% = %fixTime7Sec% = %fixTime7HH%:%fixTime7MM%:%fixTime7SS% (zdvyg foto "v sekundah" vidnosno pershogo kadru video, yakshcho zdvyg e.)
@echo fixTime8        = %fixTime8% = %fixTime8Unix% = %fixTime8Sec% = %fixTime8HH%:%fixTime8MM%:%fixTime8SS% (zdvyg foto "v sekundah" vidnosno pershogo kadru video, vkluchno z "delthaFullSec2".)




pause


@echo #############################################################################



REM set /a "delthaFullSecCoeficient3= sec 16:14:49 - (sec END-131527+183 - 183 ) "
:: ВСІ операції рахувати в секундах!
:: A = fixTime1 = 1554826489 = 16:14:49 = ЧасПочаткуВідеоФайла 
:: B = fixTime5 = 1554815909 = 13:18:29 = ДатаЧас_ОстанньогоФайлаJpg_ЩоСконвертованийІзВідео (останній кадр відео) = 20190409-131829-0.JPG
:: C = delthaVideoSec = 183  =          = ДовжинаВідеоВсекундах (ми її віднімаємо від "В", для того щоб знати час першої секунди відео)
:: D = 
:: 
:: A - ( B - C )
@echo cmdFileTimeSec=%cmdFileTimeSec% // fixTime5Sec=%fixTime5Sec% // delthaVideoSec=%delthaVideoSec% //
set /a "delthaFullSecCoeficient3=%fixTime7Sec%"


pause







































:: 
:: 
:: Власне сама команда на прошивку (час файла синхронізується з таймінгом gpx файла за допомогою здвигу часу)
:: README: https://sno.phy.queensu.ca/~phil/exiftool/geotag.html#TP1
:: %MapiCamExifTool% -geosync=+%delthaGpsSecFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%ExifToolGpsImgDirection% -overwrite_original -v2

:: %MapiCamExifTool% -geosync=+%delthaGpsSecFix% -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%ExifToolGpsImgDirection% -overwrite_original
%MapiCamExifTool% -geosync=%cmdGpxTime2%@%cmdFileTime4%+03:00:00 -geotag "%BlackVueFolder%\Record\gpx\*.gpx" "%BlackVueFolder%\Record_Call\jpg\*.jpg" -gpsimgdirection=%ExifToolGpsImgDirection% -overwrite_original
:: ВІДЛАДКА: (нижче - аналог).
:: D:\mapicam\tools\exiftool\exiftool.exe -geosync=+ -geotag "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record\gpx\*.gpx" "G:\mapicam2upload\20190409-H-ALL-VARSHAVKA\Record_Call\jpg\*.jpg" -gpsimgdirection=0 -overwrite_original -v2


pause

:: КОРЕГУЄМО ЗДВИГ ЧАСУ (після прошивки координат, для відновлення співпадіння з часом який на відео)
%MapiCamExifTool% "-DateTimeOriginal+=0:0:0 0:0:%fixTime8Sec%.000" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original
%MapiCamExifTool% -r "-FileName<DateTimeOriginal" -d "%%Y%%m%%d-%%H%%M%%S%%%%-.1c.%%%%e" "%BlackVueFolder%\Record_Call\jpg" -overwrite_original


@echo ############ RESTART ################
@echo. 

pause
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
@mkdir %BlackVueFolder%\Record_Finalize
@mkdir %BlackVueFolder%\Record_Finalize\jpg
@mkdir %BlackVueFolder%\Record_Finalize\gpx
@mkdir %BlackVueFolder%\Record\gpx
@echo.
@move /Y "%BlackVueFolder%\Record_Call\*.mp4" "%BlackVueFolder%\Record_Finalize"          >nul
@echo @move /Y "%BlackVueFolder%\Record_Call\*.mp4" "%BlackVueFolder%\Record_Finalize"
@move /Y "%BlackVueFolder%\Record_Call\jpg\*.jpg" "%BlackVueFolder%\Record_Finalize\jpg"  >nul
@echo @move /Y "%BlackVueFolder%\Record_Call\jpg\*.jpg" "%BlackVueFolder%\Record_Finalize\jpg"
@move /Y "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record\gpx"           >nul
@echo @move /Y "%BlackVueFolder%\Record_Call\gpx\*.gpx" "%BlackVueFolder%\Record\gpx"
@echo.
:: ВІДЛАДКА: (нижче - аналог).
:: move /Y "F:\BlackVue\20190429-kyiv\09\Record\jpg\*.*" "%BlackVueFolder%\jpg2mapillary"
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