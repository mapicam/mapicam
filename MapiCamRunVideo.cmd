:: #####################
:: ###### MapiCam ######
:: #####################
:: ## www.t.me/osmUA  ##
:: ## @velmyshanovnyi ##
:: ##         (c)2019 ##
:: #####################
:: 
:: https://t.me/osmUA
:: https://t.me/MapillaryUkraine
:: https://t.me/MapillaryUkraineChat
:: https://t.me/joinchat/BYnnNRYLZdfub5u4MMvsRQ (MapiCam Chat)
:: 
:: #####################
:: ####   ReadMe   #####
:: #####################
:: Before start. 
:: complete all items "step by step":
:: 
:: ====     #0      ====
:: this is scheme camera degree:
::       0            
::   315    45
:: 270   x     90
::   225    135
::      180
:: ---------------------
::      A            
::   B     C
:: D    x    E
::   H     F
::      G
:: ---------------------
:: A=0
:: B=315
:: C=45
:: D=270
:: E=90
:: F=135
:: G=180
:: H=225
:: ---------------------
:: create specific .LNK for run you cameras: 
:: A.LNK --> "D:\mapicam_img\MapiCamRun.cmd A"
:: B.LNK --> "D:\mapicam_img\MapiCamRun.cmd B"
:: C.LNK --> "D:\mapicam_img\MapiCamRun.cmd C"
:: D.LNK --> "D:\mapicam_img\MapiCamRun.cmd D"
:: E.LNK --> "D:\mapicam_img\MapiCamRun.cmd E"
:: F.LNK --> "D:\mapicam_img\MapiCamRun.cmd F"
:: G.LNK --> "D:\mapicam_img\MapiCamRun.cmd G"
:: H.LNK --> "D:\mapicam_img\MapiCamRun.cmd H"
:: 
:: ====     #1      ====
:: for Windows-10:
:: download and install "FFMPEG"
:: https://www.ffmpeg.org/
:: https://ffmpeg.zeranoe.com/builds/
:: copy to "c:\ffmpeg\bin\ffmpeg.exe"
:: RUN "cmd" as Admin:
:: setx /M PATH "c:\ffmpeg\bin;%PATH%"
:: RUN this file (MapiCamRun.cmd)
:: for collect photo --> RUN camera *.LNK 
:: 
:: ====     #2      ====
:: for Windows-10:
:: download and install "python2"
:: https://www.python.org
:: https://www.python.org/downloads/windows/
:: install to "C:\Python27\python.exe"
:: RUN "cmd" as Admin:
:: setx /M PATH "C:\Python27\;%PATH%"
:: 
REM ORIGANAL: https://www.openstreetmap.org/user/Blackbird27/diary/38702
REM # Налаштування середовища Python для роботи зі скриптами Mapillary Tools 
REM Передумовою даного кроку є установлене та правильно налаштоване середовище програмування Python, 
REM в нашому випадку нам потрібен Python версії 2, крайній реліз можна завантажити тут:
REM https://www.python.org/downloads/windows/
REM Як правильно налаштувати Python можна прочитати тут англійською. 
REM Далі нам будуть потрібні скрипти Mapillary Tools, завантажити їх можна з GitHub тут:
REM http://www.howtogeek.com/197947/how-to-install-python-on-windows/
REM Архів бажано розпакувати на диску С в теку Документи користувача, так як диск С є робочим середовищем для Python.
REM Не зовсім повна та коректна стаття про те як запускати скрипти на Python для Mapillary знаходиться тут:
REM https://github.com/mapillary/mapillary_tools/archive/master.zip
REM https://github.com/mapillary/mapillary_tools
REM https://tools.mapillary.com/binary/win/mapillary_tools.exe
REM Далі для правильної роботи скриптів Mapillary Tools, попередньо доведеться встановити декілька бібліотек/пакунків
REM через pip (Менеджер встановлення пакунків), а саме:
REM 
REM exifread – встановлюється через pip.
REM gpxpy – встановлюється через pip.
REM PIL – встановлюється через pip.
REM piexif
REM pyexiv2 – встановлюється через встановлювач Windows в залежності від версії системи x32 або x64.
REM ----------------------------------
REM cmd
REM cd C:\Python27\Scripts\ 
REM python -m pip install --upgrade pip
REM pip install exifread
REM pip install gpxpy 
REM pip install Pillow
REM pip install piexif
REM install pyexiv2
REM :: Could not find a version that satisfies the requirement pyexiv2 (from versions: )
REM :: No matching distribution found for pyexiv2
REM pip install python-dateutil
REM pip install python-dateutil --upgrade
REM pip install pytz --upgrade
REM ----------------------------------
REM Якщо все пройшло без помилок то середовище Python тепер готове до роботи зі скриптами Mapillary Tools.
REM :: ===================================
REM Розрахунок напрямку зйомки зображення з допомогою скриптів Python
REM Спочатку хочу сказати, що Mapillary Tools містить багато скриптів для обробки зображень 
REM та для завантаження на сервіс Mapillary, в тому числі і скрипт для прив’язки зображень до GPS координат, 
REM проте деякі з них не працюють або працюють неправильно, 
REM про що автор скриптів і написав у коментарях даних скриптів. 
REM Так наприклад мені не вдалося прив’язати зображення до GPS координат, 
REM тому я і описав два простіших способи раніше у статті. 
REM Але скрипт для визначення напряму зйомки шляхом інтерполяції в моєму випадку працює 
REM і швидко задає напрям зйомки фото у градусах базуючись на координатах наступного знімка в серії time-lapse. 
REM Отже, перейдемо до встановлення напрямку зйомки. 
REM На даному етапі у нас є тека зі знімками, які уже мають координати та часові мітки, 
REM тому все що нам потрібно це вказати шлях до скрипта, шлях до теки зі знімками та зміщення камери відносно напряму руху. 
REM Якщо камера напрямлена в напрямку руху, то зміщення буде “0” 
REM Скрипти знаходяться в папці python завантаженого раніше архіву Mapillary Tools. 
REM В моєму випадку шлях до скрипта “interpolate_direction.py”, ("interpolation.py") який нам потрібен наступний: 
REM "D:\mapicam_tools\mapillary_tools-master\mapillary_tools\interpolation.py"
REM Шлях до теки зі знімками наступний: 
REM "D:\mapicam_img\20190101\A" 
REM Далі запускаємо командний рядок та вводимо наступне: 
REM python "D:\mapicam_tools\mapillary_tools-master\mapillary_tools\interpolation.py" "D:\mapicam_img\20190101\A" 0

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
:: ====     #2      ====
:: for Android smarthone:
:: download & install "GPS Logger"
:: https://www.basicairdata.eu/projects/android/android-gps-logger/ 
:: https://play.google.com/store/apps/details?id=eu.basicairdata.graziano.gpslogger
:: RUN and collect GPS data.
:: after the end, save GPS-log as ".GPX"
:: and copy all files day to D:\mapicam_gpx\20190101\*
:: (merge) all GPX files as "0-20190101.GPX"
:: and save to D:\mapicam_gpx\20190101\0-20190101.GPX
:: 
:: ====     #3 (оптимізовано до скрипта)     ====
:: for Windows-10:
:: download and install "EXIFDateChanger"
:: https://www.relliksoftware.com/exifdatechanger/
:: see manual https://goo.gl/si7Dc3 
:: run "EXIFDateChanger"
:: set settings "step by step":
:: 
:: AllImagesInSourceFolser	[x]
:: SourceFolder:			[D:\mapicam_img\A]
:: DestinationFolder:		[D:\mapicam_img\A\adjusted]
:: COMMENT: or/and other (ABCDEFGH) destination folder
:: 
:: [TimeDiffereence]-[2]-[3]-[4]-[5]-[6]----------------
:: SetDate/TimeFrom:				[x]
:: SetDate/TimeFrom:				[FileModifiedDate]
:: 
:: -[1]-[Options]-[3]-[4]-[5]-[6]-----------------------
:: PreserveOriginalModifacationDate	[x]
:: UseFileCreatedDateIfNoDateTaken	[x]
:: SetFileCreatedDateToTakenDate	[x]
:: Caprion							[none]
:: RenameFilesTo					[none]
:: RecurseFolders					[none]
:: RemoveOriginalFile				[none]
:: 
:: -[1]-[2]-[Advanced]-[4]-[5]-[6]----------------------
:: all = none [ ]
:: 
:: -[1]-[2]-[3]-[Privacy]-[5]-[6]-----------------------
:: all = none [ ]
:: 
:: -[1]-[2]-[3]-[4]-[Filters]-[6]-----------------------
:: all = none [ ]
:: 
:: -[1]-[2]-[3]-[4]-[5]-[UpgradeToPro]------------------
:: NONE
:: 
:: ====     #4      ====
:: for Windows-10:
:: download and install "gpsbabel"
:: 
:: 

:: ====     #6      ====
:: for Windows-10:
:: download and install "gpsbabel"
:: https://www.gpsbabel.org/download.html
:: "C:\Program Files (x86)\GPSBabel"
:: run "MapiCamGpsBabel.cmd"
:: for interpolate 
:: %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\*.gpx:: ====     #7      ====
:: for Windows-10:
:: download and install "gpsbabel"
:: https://www.gpsbabel.org/download.html
:: "C:\Program Files (x86)\GPSBabel"
:: run "MapiCamGpsBabel.cmd"
:: for interpolate 
:: %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\*.gpx
:: to 
:: %MapiCamImgDrive%\%MapiCamGpxFolder%\%MapiCamImgDateDIR%\interpolate\%MapiCamImgDateDIR%-interpolate-1.gpx
:: 
:: 
:: 
:: 
:: 
:: ====     #7      ====
:: for Windows-10:
:: download and install "ExifTool"
:: https://www.sno.phy.queensu.ca/~phil/exiftool/
:: copy to "c:\ffmpeg\bin\exiftool.exe"
:: copy to "c:\ffmpeg\bin\exiftool(-k).exe"
:: 

:: ====     #8      ====
:: 
:: 
:: 
:: 
:: 
:: 
:: ====     #9      ====
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: 
:: #####################
:: # This is parametrs #
:: #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamGBpath=C:\Progra~2\GPSBabel
@set MapiCamImgDrive=D:
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamHead=0
@set MapiCamImgDateDIR=20190101
@echo .
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath		= %MapiCamFFpath%
@echo MapiCamGBpath     = %MapiCamGBpath%  = C:\Program Files (x86)\GPSBabel
@echo MapiCamImgDrive	= %MapiCamImgDrive%
@echo MapiCamImgFolder	= %MapiCamImgFolder%
@echo MapiCamGpxFolder  = %MapiCamGpxFolder%
@echo MapiCamImgDIR     = default = %MapiCamImgDIR%
@echo MapiCamImgDateDIR = default = %MapiCamImgDateDIR%
@echo #####################
@echo .
:: #####################


:: #####################
:: ## ADD PORT NUMBER ##
:: #####################
:: 01 02 03 04 05 06 07 08 09 10
:: A B C D E F G H
:: 00 = FOR TEST!!!
:: #####################

:: BEEP SOUND 
rundll32 user32.dll,MessageBeep

@echo .
@echo .
@echo .
@echo .
@echo ONLY THIS: 01 02 03 04 05 06 07 08 09 10 / A B C D E F G H / 00 = FOR TEST!!!
@echo MapiCamImgDIR = %MapiCamImgDIR%
:: set /p MapiCamImgDIR="BBEDiTb HOMEP a6o LiTEPy KAMEPu: "
@echo .
@echo .
@echo .
@echo .

:: #####################
:: if you use Windows-XP -> run next command:
:: https://askdev.info/questions/101927/ffmpeg-command-line-for-capturing-and-recording-audio-and-video-in-720p-from-d
:: see devices:
:: ffmpeg -list_devices true -f dshow -i dummy
c:\ffmpeg\bin\ffmpegXP.exe -list_devices true -f dshow -i dummy
:: see options:
c:\ffmpeg\bin\ffmpegXP.exe -list_options true -f dshow -i video="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&28a58ce8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: #####################
:: ##### CLUSTER INFO ######################################
:: 
:: ##### CLUSTER:ANT-LSU MaxUsbValidAndCorrecUsePort=3 #####
::ANT-LSU-A
@set MapiCamNameA="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&39f754f8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-LSU-B
@set MapiCamNameB="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&273da453&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-LSU-C
@set MapiCamNameC="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&258516cf&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: 
:: ##### CLUSTER:ANT-SB MaxUsbValidAndCorrecUsePort=2
::ANT-SB-D
@set MapiCamNameD="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&7028550&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-SB-E
@set MapiCamNameE="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&1d29ee0d&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: 
:: ##### CLUSTER:ANT-SMABLYK MaxUsbValidAndCorrecUsePort=1
::ANT-SMABLYK-F
@set MapiCamNameF="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&28a58ce8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-SMABLYK-G
@set MapiCamNameG="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&15ebdc43&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-SMABLYK-H 
@set MapiCamNameH="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&3322b9e&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::
:: ##### CLUSTER:ANT-ACER MaxUsbValidAndCorrecUsePort=1
::ANT-ACER-F ##### RESERVE #####
::@set MapiCamNameF="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&e2531b3&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-ACER-G ##### RESERVE #####
::@set MapiCamNameG="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&2a07e03c&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::ANT-ACER-H ##### RESERVE #####
::@set MapiCamNameH="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&126c6da&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"

::
:: ##### CLUSTER:ANT-PC-SSD MaxUsbValidAndCorrecUsePort=8(6)
::L2L
@set MapiCamName01="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&9767192&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L2R
@set MapiCamName02="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&1c302237&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L5L
@set MapiCamName03="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&2de5f28f&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L5R
@set MapiCamName04="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&504d92d&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L3L
@set MapiCamName05="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&6ba0f70&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L3R
@set MapiCamName06="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&1973c015&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L4L
@set MapiCamName07="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&2c2d70ba&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::L4R
@set MapiCamName08="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&34c5758&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
::00
@set MapiCamName00="Microsoft® LifeCam HD-3000"
:: ##### CLUSTER INFO - END ################################
:: #####################

IF %MapiCamImgDIR% == A (
 set MapiCamName=%MapiCamNameA%
 set MapiCamHead=0
 )
IF %MapiCamImgDIR% == B (
 set MapiCamName=%MapiCamNameB%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == C (
 set MapiCamName=%MapiCamNameC%
 set MapiCamHead=45
 )
IF %MapiCamImgDIR% == D (
set MapiCamName=%MapiCamNameD%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == E (
 set MapiCamName=%MapiCamNameE%
 set MapiCamHead=90
 )
IF %MapiCamImgDIR% == F (
 set MapiCamName=%MapiCamNameF%
 set MapiCamHead=135
 )
IF %MapiCamImgDIR% == G (
 set MapiCamName=%MapiCamNameG%
 set MapiCamHead=180
 )
IF %MapiCamImgDIR% == H (
 set MapiCamName=%MapiCamNameH%
 set MapiCamHead=225
 )
IF %MapiCamImgDIR% == 01 (
 set MapiCamName=%MapiCamName01%
 set MapiCamHead=0
 )
IF %MapiCamImgDIR% == 02 (
 set MapiCamName=%MapiCamName02%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == 03 (
 set MapiCamName=%MapiCamName03%
 set MapiCamHead=45
 )
IF %MapiCamImgDIR% == 04 (
 set MapiCamName=%MapiCamName04%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == 05 (
 set MapiCamName=%MapiCamName05%
 set MapiCamHead=90
 )
IF %MapiCamImgDIR% == 06 (
 set MapiCamName=%MapiCamName06%
 set MapiCamHead=135
 )
IF %MapiCamImgDIR% == 07 (
 set MapiCamName=%MapiCamName07%
 set MapiCamHead=180
 )
IF %MapiCamImgDIR% == 08 (
set MapiCamName=%MapiCamName08%
 set MapiCamHead=225
 )
IF %MapiCamImgDIR% == 00 (
 set MapiCamName=%MapiCamName00%
 set set MapiCamHead=0
 )
:: #####################


cd..
cd..
cd..
cd..

:: %MapiCamFFpath%\ffmpeg.exe -codecs
:: ffmpeg -codecs

%MapiCamImgDrive%

mkdir %MapiCamGpxFolder%
cd %MapiCamGpxFolder%
mkdir %MapiCamImgDateDIR%
cd %MapiCamImgDateDIR%
mkdir interpolate
cd..
cd..

mkdir %MapiCamImgFolder%
cd %MapiCamImgFolder%
mkdir %MapiCamImgDIR%
cd %MapiCamImgDIR%


:: #####################################################################################
:: ##### MapiCam-XX ####################################################################
:: #####################################################################################

:: ERROR WinXP (cmdext.dll)
:: rundll32.exe cmdext.dll,MessageBeepStub
rundll32 user32.dll,MessageBeep

:: for Win10 (CAMERA PREVIEW)
%MapiCamFFpath%\ffplay.exe -f dshow -video_size 320x240 -rtbufsize 2M -framerate 10 -threads 0 -i video=%MapiCamName%

sleep 2
rundll32 user32.dll,MessageBeep


:: for Win10 (CAMERA CAPTURES) = (3 FPS) (оптимізований під ANT-LSU)
:: %MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 3 -threads 0 -f image2 -qscale:v 2 -strftime 0 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%010d.jpg" 

:: for Win10 (CAMERA CAPTURES) = (5 FPS) (це ідеальний бітрейт, але на ANT-LSU підтуплює, тому треба ставити менший)
:: %MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 5 -threads 0 -f image2 -qscale:v 2 -strftime 0 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%010d.jpg" 

:: for Win10 (CAMERA CAPTURES) = (1 FPS) (реалізація 1 кадр/сек, мілісекунди невдалось витягнути стандартними методами ffmpeg. Він включиться ЯК РЕЗЕРВНИЙ ГАРАНТОВАНО ПРАЦЮЮЧИЙ, якщо з якоїсь причини не відпрацює жоден з вишенаведених!)
%MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S.mpg" 

:: %%L	= викидає ERROR
:: %%s	= викидає ERROR
:: %%f	= викидає ERROR
:: %%t	= викидає ERROR
:: %%Z	= mapicam-A-0-20190101-011140-Фінляндія (зима).jpg
:: %%d	= mapicam-A-0-20190101-011140-01.jpg
:: %%010d = [image2 @ 04fcfa00] Could not get frame filename with strftime // av_interleaved_write_frame(): Invalid argument
:: frame_pts 1 %%010d.jpg" = викидає ERROR 
:: %%3N	= викидає ERROR
:: %%N	= викидає ERROR






sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep

:: for Win10 (CAMERA CAPTURES) ORIGINAL
%MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S.jpg" 

sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep

:: for Win10
%MapiCamFFpath%\ffplay.exe -f dshow -video_size 320x240 -rtbufsize 2M -framerate 10 -threads 0 -i video=%MapiCamName%

:: #####################################################################################
:: ##### MapiCam-XX - END ##############################################################
:: #####################################################################################



:: #####################################################################################
:: ##### MapiCam-XX - WinXP ############################################################
:: #####################################################################################

:: ERROR WinXP (cmdext.dll)
:: rundll32.exe cmdext.dll,MessageBeepStub
rundll32 user32.dll,MessageBeep

:: for WinXP
:: ERROR -  "the procedure entry point GetNumaNodeProcessorMaskEx could not be located in the dynamic link library KERNEL32.dll"
:: exception trying to use ffmpeg, since GetNumaNodeProcessorMaskEx sounds like x265, is possible to disable libx265 from being build into ffmpeg? (checked the ffmpeg_options.txt, but there was no mentioning of x265);
::%MapiCamFFpath%\ffplayXP.exe -f dshow -video_size 320x240 -rtbufsize 2M -framerate 10 -threads 0 -i video=%MapiCamName%
sleep 2
rundll32 user32.dll,MessageBeep

:: for WinXP (CAMERA CAPTURES) = (1 FPS)
%MapiCamFFpath%\ffmpegXP.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S.jpg" 

sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep

:: for WinXP (CAMERA CAPTURES) = (1 FPS)
%MapiCamFFpath%\ffmpegXP.exe -y -f dshow -video_size 1280x720 -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamImgDrive%\%MapiCamImgFolder%\%MapiCamImgDIR%\mapicam-%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S.jpg" 

sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep
sleep 2
rundll32 user32.dll,MessageBeep

:: #####################################################################################
:: ##### MapiCam-XX - WinXP - END ######################################################
:: #####################################################################################




