@echo #####################
@echo ###### MapiCam ######
@echo #####################
@echo ## www.t.me/osmUA  ##
@echo ## @velmyshanovnyi ##
@echo ##         (c)2019 ##
@echo #####################
@echo .
@echo https://t.me/osmUA
@echo https://t.me/MapillaryUkraine
@echo https://t.me/MapillaryUkraineChat
@echo https://t.me/joinchat/BYnnNRYLZdfub5u4MMvsRQ (MapiCam Chat)
@echo . 
@echo #####################
@echo ####   ReadMe   #####
@echo #####################
@echo Before start. 
@echo complete all items "step by step":
@echo .
@echo . ====     #0      ====
@echo . this is scheme camera degree:
@echo .       0            
@echo .   315    45
@echo . 270   x     90
@echo .   225    135
@echo .      180
@echo . ---------------------
@echo .      A            
@echo .   B     C
@echo . D    x    E
@echo .   H     F
@echo .      G
@echo . ---------------------
@echo . A=0
@echo . B=315
@echo . C=45
@echo . D=270
@echo . E=90
@echo . F=135
@echo . G=180
@echo . H=225
@echo . ---------------------
@echo . create specific .LNK for run PHOTO from you cameras: 
@echo . fA.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd A"
@echo . fB.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd B"
@echo . fC.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd C"
@echo . fD.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd D"
@echo . fE.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd E"
@echo . fF.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd F"
@echo . fG.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd G"
@echo . fH.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd H"
@echo . 
@echo . f01.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 01"
@echo . f02.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 02"
@echo . f03.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 03"
@echo . f04.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 04"
@echo . f05.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 05"
@echo . f06.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 06"
@echo . f07.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 07"
@echo . f08.LNK :: "D:\mapicam_img\MapiCamRunPhoto.cmd 08"
@echo . 
@echo . ---------------------
@echo . create specific .LNK for run VIDEO from you cameras: 
@echo . vA.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd A"
@echo . vB.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd B"
@echo . vC.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd C"
@echo . vD.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd D"
@echo . vE.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd E"
@echo . vF.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd F"
@echo . vG.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd G"
@echo . vH.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd H"
@echo . 
@echo . v01.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 01"
@echo . v02.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 02"
@echo . v03.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 03"
@echo . v04.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 04"
@echo . v05.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 05"
@echo . v06.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 06"
@echo . v07.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 07"
@echo . v08.LNK :: "D:\mapicam_img\MapiCamRunVideo.cmd 08"
@echo . 
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


@echo #####################
@echo #  YYYYMMDD HHMMSS  #
@echo #####################
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
set datetimefull=%year%%month%%day%%hour%%min%%secs%
set MapiCamDate=%year%%month%%day%
set MapiCamTime=%hour%%min%%secs%
@echo .
@echo year         = %year%
@echo month        = %month%
@echo day          = %day%
@echo hour         = %hour%
@echo min          = %min%
@echo secs         = %secs%
@echo datetimefull = %datetimefull%
@echo MapiCamDate  = %MapiCamDate%
@echo MapiCamTime  = %MapiCamTime%
@echo .
@echo #####################
@echo # This is parametrs #
@echo #####################
setlocal EnableDelayedExpansion
@set MapiCamFFpath=c:\ffmpeg\bin
@set MapiCamGBpath=C:\Progra~2\GPSBabel
@set MapiCamDrive=D:
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamGpsDIR=%MapiCamImgDIR%
@set MapiCamHead=0
@echo ---------------------
:: True = "mjpeg" ONLY!!! Other=Fail!
@set MapiCamCodec=mjpeg
@set MapiCamWidth=1280
@set MapiCamHeight=720
:: MapiCamFramerateVideo = min7.5 ... 30max
:: ANT-PC-SSD @fpsMax=30
:: ANT-LSU    @fpsMax=25
@set MapiCamFramerateVideo=7.5
:: MapiCamFrameratePhoto = min7.5 ... 10max
@set MapiCamFrameratePhoto=10
@set MapiCamFpsVideo=%MapiCamFramerateVideo%
:: for ANT-LSU OptimalFps = 3
@set MapiCamFpsPhoto=10
:: True=mjpeg:mp4|m4v|mpeg(#ПоганаЯкість)|flv(#ПоганаЯкість)|avi(#ПоганаЯкість)
:: m4v ::  [V: h264 high 4:2:2 L3.1, yuv422p, 1280x720, 5000 kb/s]
:: mp4 ::  [V: h264 high 4:2:2 L3.1, yuv422p, 1280x720, 4142 kb/s]
:: avi ::  [Video: FMP4  30fps                1280x720,  500 kb/s]
:: flv ::  [V: flv1,                 yuv420p, 1280x720,  200 kb/s]
:: mpeg :: [V: mpeg1video,           yuv420p, 1280x720,  100 kb/s]
@set MapiCamFormatVideo=mp4
:: 1s ::     1 :: png@1 fps =   2 Mb    jpg@1 fps = 200 kB 
:: 1s ::    10 :: png@10fps =  20 Mb    jpg@10fps =   2 Mb  m4v@30fps =   5 Mb png@30fps#render =  60 Mb = 30 фоток/сек
:: 1m ::   600 :: png@10fps = 1.2 Gb    jpg@10fps = 120 Mb  m4v@30fps =  30 Mb png@30fps#render = 3.6 Gb = 1.8к фоток/хв.
:: 1h :: 36000 :: png@10fps =  72 Gb    jpg@10fps = 7.2 Gb  m4v@30fps = 1.8 Gb png@30fps#render = 216 Gb = 108к фоток/год.
:: ПОЇЗДКА  10Гб/годину (з кожної камери) орієнтовно
:: ОБРОБКА 100Гб/годину (з кожної камери) орієнтовно
@set MapiCamFormatPhoto=jpg
@set MapiCamPrefixVideo=mapicam-
@set MapiCamPrefixPhoto=mapicam-
@set MapiCamSufixVideo=-%MapiCamWidth%x%MapiCamHeight%-fps%MapiCamFpsVideo%-%MapiCamCodec%
@set MapiCamSufixPhoto=-%MapiCamWidth%x%MapiCamHeight%-fps%MapiCamFpsPhoto%
@set MapiCamSufixPhotoFps1=-%MapiCamWidth%x%MapiCamHeight%-fps1
@echo #####################
@echo setlocal EnableDelayedExpansion
@echo MapiCamFFpath         = %MapiCamFFpath%
@echo MapiCamGBpath         = %MapiCamGBpath%  = C:\Program Files (x86)\GPSBabel
@echo MapiCamDrive          = %MapiCamDrive%
@echo MapiCamImgFolder      = %MapiCamImgFolder%
@echo MapiCamGpxFolder      = %MapiCamGpxFolder%
@echo MapiCamDate           = default = %MapiCamDate%
@echo MapiCamTime           = default = %MapiCamTime%
@echo MapiCamImgDateDIR     = default = %MapiCamImgDateDIR% = %%Y%%m%%d // OLD
@echo MapiCamImgDIR         = default = %MapiCamImgDIR%
@echo MapiCamGpsDIR         = default = %MapiCamGpsDIR%
@echo MapiCamHead           = %MapiCamHead%
@echo ---------------------
@echo MapiCamCodec          = %MapiCamCodec%
@echo MapiCamWidth          = %MapiCamWidth%
@echo MapiCamHeight         = %MapiCamHeight%
@echo MapiCamFramerateVideo = %MapiCamFramerateVideo%
@echo MapiCamFrameratePhoto = %MapiCamFrameratePhoto%
@echo MapiCamFormatVideo    = %MapiCamFormatVideo%
@echo MapiCamFormatPhoto    = %MapiCamFormatPhoto%
@echo MapiCamPrefixVideo    = %MapiCamPrefixVideo%
@echo MapiCamPrefixPhoto    = %MapiCamPrefixPhoto%
@echo MapiCamSufixVideo     = %MapiCamSufixVideo%
@echo MapiCamSufixPhoto     = %MapiCamSufixPhoto%
@echo #####################



@echo .
@echo #####################

@echo #####################
@echo ## ADD PORT NUMBER ##
@echo #####################
@echo 01 02 03 04 05 06 07 08 09 10
@echo A B C D E F G H
@echo 00 = FOR TEST!!!
@echo #####################

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep


@echo .
@echo .
@echo .
@echo .
@echo ONLY THIS: 01 02 03 04 05 06 07 08 09 10 / A B C D E F G H / 00 = FOR TEST!!!
@echo MapiCamImgDIR = %MapiCamImgDIR%
:: set /p MapiCamImgDIR="BBEDiTb HOMEP a6o LiTEPy KAMEPu: "
@echo .
@echo #####################
@echo #####  SETTING  #####
@echo #####################
@echo . "Microsoft® LifeCam HD-3000"
@echo . DirectShow video device options (from video devices)
@echo -----   PHOTO   -----
@echo . pixel_format=yuyv422  min s=1280x720 fps=7.5 max s=1280x720 fps=10
@echo . pixel_format=yuyv422  min s=1280x800 fps=10  max s=1280x800 fps=10
@echo -----   VIDEO   -----
@echo . vcodec=mjpeg  min s=1280x720 fps=7.5 max s=1280x720 fps=30
@echo #####################
@echo .
@echo .
@echo .
@echo ##### CLUSTER INFO ######################################
@echo .
@echo ##### CLUSTER:ANT-LSU MaxUsbValidAndCorrecUsePort=3 #####
@echo ANT-LSU-A
@set MapiCamNameA="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&39f754f8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-LSU-B
@set MapiCamNameB="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&273da453&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-LSU-C
@set MapiCamNameC="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&258516cf&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo .
@echo ##### CLUSTER:ANT-SB MaxUsbValidAndCorrecUsePort=2
@echo ANT-SB-D
 @set MapiCamNameD="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&7028550&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-SB-E
 @set MapiCamNameE="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&1d29ee0d&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo . 
@echo ##### CLUSTER:ANT-SMABLYK MaxUsbValidAndCorrecUsePort=1
@echo ANT-SMABLYK-F
 @set MapiCamNameF="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&28a58ce8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-SMABLYK-G
 @set MapiCamNameG="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&15ebdc43&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-SMABLYK-H 
 @set MapiCamNameH="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&3322b9e&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo . 
@echo ##### CLUSTER:ANT-ACER MaxUsbValidAndCorrecUsePort=1
@echo ANT-ACER-F ##### RESERVE #####
 @set MapiCamNameF="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&e2531b3&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-ACER-G ##### RESERVE #####
 @set MapiCamNameG="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&2a07e03c&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-ACER-H ##### RESERVE #####
 @set MapiCamNameH="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&126c6da&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo . 
@echo ##### CLUSTER:ANT-PC-SSD MaxUsbValidAndCorrecUsePort=8(6)
@echo ANT-PC-SSD-L2L[1] (fix 20190327)
@set MapiCamName01="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&9767192&5&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L2R[2] (fix 20190301)
@set MapiCamName02="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&1c302237&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L3L[]  (fix 20190301)
@set MapiCamName05="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&6ba0f70&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L3R[]  (fix 20190301)
@set MapiCamName06="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&1973c015&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L4L[]  (fix 20190301)
@set MapiCamName07="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&2c2d70ba&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L4R[]  (fix 20190301)
@set MapiCamName08="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&34c5758&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L5L[3] (fix 20190301)
@set MapiCamName03="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&2de5f28f&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L5R[4] (fix 20190301)
@set MapiCamName04="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&504d92d&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-00     (fix 20190301)
@set MapiCamName00="Microsoft® LifeCam HD-3000"
@echo ##### CLUSTER INFO - END ################################
@echo .
@echo #####################
IF %MapiCamImgDIR%== A (
 set MapiCamName=%MapiCamNameA%
 set MapiCamHead=000
 )
IF %MapiCamImgDIR% == B (
 set MapiCamName=%MapiCamNameB%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == C (
 set MapiCamName=%MapiCamNameC%
 set MapiCamHead=045
 )
IF %MapiCamImgDIR% == D (
set MapiCamName=%MapiCamNameD%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == E (
 set MapiCamName=%MapiCamNameE%
 set MapiCamHead=090
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
 set MapiCamHead=000
 )
IF %MapiCamImgDIR% == 02 (
 set MapiCamName=%MapiCamName02%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == 03 (
 set MapiCamName=%MapiCamName03%
 set MapiCamHead=045
 )
IF %MapiCamImgDIR% == 04 (
 set MapiCamName=%MapiCamName04%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == 05 (
 set MapiCamName=%MapiCamName05%
 set MapiCamHead=090
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
 set set MapiCamHead=000
 )
@echo #####################
@echo .


:: #####################
:: if you use Windows-XP -> run next command:
::  https://askdev.info/questions/101927/ffmpeg-command-line-for-capturing-and-recording-audio-and-video-in-720p-from-d
:: see devices:
%MapiCamFFpath%\ffmpeg.exe -list_devices true -f dshow -i dummy
:: c:\ffmpeg\bin\ffmpegXP.exe -list_devices true -f dshow -i dummy
:: see options:
%MapiCamFFpath%\ffmpeg.exe -list_options true -f dshow -i video=%MapiCamName%
:: c:\ffmpeg\bin\ffmpegXP.exe -list_options true -f dshow -i video=%MapiCamName%
:: #####################


::
:: РОЗКОМЕНТУВАТИ ЛИШЕ ДЛЯ тестування і розуміння яких кодеків в системі нема.
:: %MapiCamFFpath%\ffmpeg.exe -codecs
:: %MapiCamFFpath%\ffmpeg.exe -formats
:: ffmpeg -codecs
:: pause
:: 



cd %MapiCamDrive%
mkdir %MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%
mkdir %MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%-%MapiCamDate%-%MapiCamTime%
mkdir %MapiCamDrive%\%MapiCamGpxFolder%\%MapiCamDate%
cd %MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%


@echo .
@echo #####################################################################################
@echo ##### MapiCam-XX ####################################################################
@echo #####################################################################################
@echo .



:: ERROR WinXP (cmdext.dll)
:: rundll32.exe cmdext.dll,MessageBeepStub
rundll32 user32.dll,MessageBeep

:: for Win10 (CAMERA PREVIEW)
%MapiCamFFpath%\ffplay.exe -f dshow -video_size 640x360 -rtbufsize 2M -framerate %MapiCamFramerateVideo% -threads 0 -i video=%MapiCamName%

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep



:: for Win10 (CAMERA VIDEO) = (xx FPS) (реалізація 1 кадр/сек, мілісекунди невдалось витягнути стандартними методами ffmpeg. Він включиться ЯК РЕЗЕРВНИЙ ГАРАНТОВАНО ПРАЦЮЮЧИЙ, якщо з якоїсь причини не відпрацює жоден з вишенаведених!)
%MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate %MapiCamFramerateVideo% -vcodec %MapiCamCodec% -i video=%MapiCamName% "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%MapiCamTime%%MapiCamSufixVideo%.%MapiCamFormatVideo%"




@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep



:: for Win10 (CAMERA CAPTURES) FPS=%MapiCamFpsPhoto%
%MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate %MapiCamFrameratePhoto% -i video=%MapiCamName% -r %MapiCamFpsPhoto% -threads 0 -f image2 -qscale:v 2 -strftime 0 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%-%MapiCamDate%-%MapiCamTime%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%%012d%MapiCamSufixPhoto%.%MapiCamFormatPhoto%" 
:: for Win10 (CAMERA CAPTURES) RESERVE FPS=1
%MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixPhoto%%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S%MapiCamSufixPhotoFps1%.jpg"


@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep



:: for Win10
%MapiCamFFpath%\ffplay.exe -f dshow -video_size 320x180 -rtbufsize 2M -framerate %MapiCamFramerateVideo% -threads 0 -i video=%MapiCamName%

@echo #####################################################################################
@echo ##### MapiCam-XX - END ##############################################################
@echo #####################################################################################



@echo #####################################################################################
@echo ##### MapiCam-XX - WinXP ############################################################
@echo #####################################################################################

@echo .
@echo :: ERROR WinXP (cmdext.dll)
@echo :: rundll32.exe cmdext.dll,MessageBeepStub
rundll32 user32.dll,MessageBeep
@echo .

@echo .
@echo :: for WinXP
@echo :: ERROR -  "the procedure entry point GetNumaNodeProcessorMaskEx could not be located in the dynamic link library KERNEL32.dll"
@echo :: exception trying to use ffmpeg, since GetNumaNodeProcessorMaskEx sounds like x265, is possible to disable libx265 from being build into ffmpeg? (checked the ffmpeg_options.txt, but there was no mentioning of x265);
%MapiCamFFpath%\ffplayXP.exe -f dshow -video_size 640x360 -rtbufsize 2M -framerate 10 -threads 0 -i video=%MapiCamName%

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep

@echo .
@echo :: for WinXP (CAMERA CAPTURES) FPS=%MapiCamFpsPhoto%
%MapiCamFFpath%\ffmpegXP.exe -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate %MapiCamFrameratePhoto% -i video=%MapiCamName% -r %MapiCamFpsPhoto% -threads 0 -f image2 -qscale:v 2 -strftime 0 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%%012d%MapiCamSufixPhoto%.%MapiCamFormatPhoto%" 

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep


@echo :: for WinXP (CAMERA CAPTURES) = (1 FPS)
%MapiCamFFpath%\ffmpegXP.exe -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate 7.5 -i video=%MapiCamName% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixPhoto%%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S%MapiCamSufixPhotoFps1%.jpg"

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep


@echo #####################################################################################
@echo ##### MapiCam-XX - WinXP - END ######################################################
@echo #####################################################################################




