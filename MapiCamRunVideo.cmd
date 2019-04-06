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
:: for Windows-10 download and install "FFMPEG"
:: https://github.com/mapicam/mapicam/wiki/%D0%86%D0%BD%D1%81%D1%82%D0%B0%D0%BB%D1%8F%D1%86%D1%96%D1%8F:-ffmpeg 
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
@echo #####  SETTING  #####
@echo #####################
@echo . "Microsoft® LifeCam HD-3000"
@echo . DirectShow video device options (from video devices)
@echo -----   PHOTO   -----
@echo . pixel_format=yuyv422  1280x720 fps=7.5 ... 10
@echo . pixel_format=yuyv422  1280x800 fps=10  ... 10
@echo -----   VIDEO   -----
@echo . vcodec=mjpeg          1280x720 fps=7.5 ... 30
@echo #####################
@echo .

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
@set MapiCamFFplay=c:\ffmpeg\bin\ffplay.exe
@set MapiCamFFmpeg=c:\ffmpeg\bin\ffmpeg.exe
@set MapiCamFFplayXP=c:\ffmpeg\bin\ffplayXP.exe
@set MapiCamFFmpegXP=c:\ffmpeg\bin\ffmpegXP.exe
@set MapiCamGBpath=C:\Progra~2\GPSBabel
:: @set MapiCamDrive=D:
@set MapiCamDrive=%2%
@set MapiCamImgFolder=mapicam_img
@set MapiCamGpxFolder=mapicam_gpx
@set MapiCamImgDIR=00
@set MapiCamImgDIR=%1%
@set MapiCamGpsDIR=%MapiCamImgDIR%
@set MapiCamHead=0
@echo ---------------------
:: True = "mjpeg" ONLY!!! Other=Fail!
@set MapiCamCodec=mjpeg
@set MapiCamPixelFormat=yuyv422
@set MapiCamRtBufSize=16M
@set MapiCamWidthVideo=1280
@set MapiCamHeightVideo=720
@set MapiCamWidthPhoto=1280
@set MapiCamHeightPhoto=800
:: MapiCamFramerateVideo = min7.5 ... 30max
:: ANT-PC-SSD @fpsMax=30
:: ANT-LSU    @fpsMax=25
@set MapiCamFramerateVideo=10
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
::---:---:png:-----:jpg:-----:m4v:-----:png.......:-----:
::---:---:fps:-----:fps:-----:fps:-----:fps#render:-----:
:: 1s:  1:@ 1=  2Mb:@ 1:200kB:...:.....:..........:.....: 
:: 1s: 10:@10= 20Mb:@10:  2Mb:@30:  5Mb:@30#render: 60Mb:  30 фоток/сек
:: 1m:600:@10=1.2Gb:@10:120Mb:@30: 30Mb:@30#render:3.6Gb:1.8k фоток/хв.
:: 1h:36k:@10= 72Gb:@10:7.2Gb:@30:1.8Gb:@30#render:216Gb:108k фоток/год.
:: ПОЇЗДКА  10Гб/годину (з кожної камери) орієнтовно
:: ОБРОБКА 100Гб/годину (з кожної камери) орієнтовно
@set MapiCamFormatPhoto=jpg
@set MapiCamPrefixVideo=mapicam-
@set MapiCamPrefixPhoto=mapicam-
@set MapiCamSufixVideo=-%MapiCamWidthVideo%x%MapiCamHeightVideo%-fps%MapiCamFpsVideo%-%MapiCamCodec%
@set MapiCamSufixPhoto=-%MapiCamWidthPhoto%x%MapiCamHeightPhoto%-fps%MapiCamFpsPhoto%
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
@echo MapiCamPixelFormat    = %MapiCamPixelFormat%
@echo MapiCamRtBufSize      = %MapiCamRtBufSize%
@echo MapiCamWidthVideo     = %MapiCamWidthVideo%
@echo MapiCamHeightVideo    = %MapiCamHeightVideo%
@echo MapiCamWidthPhoto     = %MapiCamWidthPhoto%
@echo MapiCamHeightPhoto    = %MapiCamHeightPhoto%
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
@echo .
@echo .
@echo ##### CLUSTER INFO ######################################
@echo .
@echo ##### CLUSTER:ANT-LSU MaxUsbValidAndCorrecUsePort=3 #####
:: "Microsoft® LifeCam HD-3000"
@echo ANT-LSU-HP-A
  @set MapiCamNameAv="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&39f754f8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameAa="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{63F7B6B2-3B5B-4458-935C-A8C93F820925}"
@echo ANT-LSU-HP-B
  @set MapiCamNameBv="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&273da453&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameBa="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{F2CA1238-1A06-4AB0-B604-181247FB425D}"
@echo ANT-LSU-HP-C
  @set MapiCamNameCv="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&258516cf&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameCa="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{8D955D5F-939E-4A04-B3B3-01AE1DC09A05}"
:: LSU-HP/Webcam--/"HP Webcam"="@device_pnp_\\?\usb#vid_04f2&pid_b52d&mi_00#6&362501d0&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
:: LSU-HP/Webcam--"Microphone (Realtek High Definition Audio)"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{DDF253A2-E355-4928-A956-1D74D9197ADA}"
@echo ANT-LSU-HP-Webcam
  @set MapiCamNameWebcamv="@device_pnp_\\?\usb#vid_04f2&pid_b52d&mi_00#6&362501d0&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameWebcama="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{DDF253A2-E355-4928-A956-1D74D9197ADA}"
@echo .
@echo ##### CLUSTER:ANT-SB MaxUsbValidAndCorrecUsePort=2
:: "Microsoft® LifeCam HD-3000"
@echo ANT-SB-D
  @set MapiCamNameDv="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&7028550&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameDa="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{E61A8800-3A5B-48F7-AFDA-3667CBD7FB75}"
@echo ANT-SB-E
  @set MapiCamNameEv="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&1d29ee0d&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameEa="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{6461F01A-0DDA-4332-B5C0-8461F8E8052C}"
@echo ANT-SB-OV5648
:: ANT-SB/planshet-"OV5648"="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"
:: ANT-SB/planshet-"GC2355"="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{82a248ab-e5f1-4091-892e-a3853f5c675f}"
:: ANT-SB/planshet-"Microphone (Realtek High Definition Audio(SST))"="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{10E6AD4E-7493-4410-B7AB-8DBECCF38A4B}"
:: 1920x1080@29.97|1280x720@30 pixel_format=yuyv422
  @set MapiCamNameSB1v="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{83ce0022-d6ec-41de-b2c3-a0a19f6d380b}"
  @set MapiCamNameSB1a="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{10E6AD4E-7493-4410-B7AB-8DBECCF38A4B}"
@echo ANT-SB-GC2355
  @set MapiCamNameSB2v="@device_pnp_\\?\display#int34d7#4&2f2e9f39&0&uid144599#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\{82a248ab-e5f1-4091-892e-a3853f5c675f}"
  @set MapiCamNameSB2a="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{10E6AD4E-7493-4410-B7AB-8DBECCF38A4B}"
  @echo . 
@echo ##### CLUSTER:ANT-SMABLYK MaxUsbValidAndCorrecUsePort=1
@echo ANT-SMABLYK-F
  @set MapiCamNameF="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&28a58ce8&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameF=""
@echo ANT-SMABLYK-G
  @set MapiCamNameG="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&15ebdc43&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameG=""
@echo ANT-SMABLYK-H 
  @set MapiCamNameH="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#6&3322b9e&0&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamNameH=""
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
  @set MapiCamName01v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&9767192&5&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamName01a="@device_cm_{33D9A762-90C8-11D0-BD43-00A0C911CE86}\wave_{C5DC6C31-04D8-4244-912E-D7E5433A133F}"
@echo ANT-PC-SSD-L2R[2] (fix 20190301)
  @set MapiCamName02v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&1c302237&4&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
  @set MapiCamName02a=""
@echo ANT-PC-SSD-L3L[]  (fix 20190301)
  @set MapiCamName05v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&6ba0f70&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L3R[]  (fix 20190301)
  @set MapiCamName06v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&1973c015&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L4L[]  (fix 20190301)
  @set MapiCamName07v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&2c2d70ba&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L4R[]  (fix 20190301)
  @set MapiCamName08v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#8&34c5758&1&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L5L[3] (fix 20190301)
  @set MapiCamName03v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&2de5f28f&3&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-L5R[4] (fix 20190301)
  @set MapiCamName04v="@device_pnp_\\?\usb#vid_045e&pid_0779&mi_00#7&504d92d&2&0000#{65e8773d-8f56-11d0-a3b9-00a0c9223196}\global"
@echo ANT-PC-SSD-00     (fix 20190301)
  @set MapiCamName00v="Microsoft® LifeCam HD-3000"
@echo ##### CLUSTER INFO - END ################################
@echo .
@echo #####################
IF %MapiCamImgDIR%== A (
 set MapiCamName=%MapiCamNameA%
 set MapiCamNameV=%MapiCamNameAv%
 set MapiCamNameA=%MapiCamNameAa%
 set MapiCamHead=000
 )
IF %MapiCamImgDIR% == B (
 set MapiCamName=%MapiCamNameB%
 set MapiCamNameV=%MapiCamNameBv%
 set MapiCamNameA=%MapiCamNameBa%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == C (
 set MapiCamName=%MapiCamNameC%
 set MapiCamNameV=%MapiCamNameCv%
 set MapiCamNameA=%MapiCamNameCa%
 set MapiCamHead=045
 )
IF %MapiCamImgDIR% == D (
set MapiCamName=%MapiCamNameD%
 set MapiCamNameV=%MapiCamNameDv%
 set MapiCamNameA=%MapiCamNameDa%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == E (
 set MapiCamName=%MapiCamNameE%
 set MapiCamNameV=%MapiCamNameEv%
 set MapiCamNameA=%MapiCamNameEa%
 set MapiCamHead=090
 )
IF %MapiCamImgDIR% == F (
 set MapiCamName=%MapiCamNameF%
 set MapiCamNameV=%MapiCamNameFv%
 set MapiCamNameA=%MapiCamNameFa%
 set MapiCamHead=135
 )
IF %MapiCamImgDIR% == G (
 set MapiCamName=%MapiCamNameG%
 set MapiCamNameV=%MapiCamNameGv%
 set MapiCamNameA=%MapiCamNameGa%
 set MapiCamHead=180
 )
IF %MapiCamImgDIR% == H (
 set MapiCamName=%MapiCamNameH%
 set MapiCamNameV=%MapiCamNameHv%
 set MapiCamNameA=%MapiCamNameHa%
 set MapiCamHead=225
 )
IF %MapiCamImgDIR% == 01 (
 set MapiCamName=%MapiCamName01%
 set MapiCamNameV=%MapiCamName01v%
 set MapiCamNameA=%MapiCamName01a%
 set MapiCamHead=000
 )
IF %MapiCamImgDIR% == 02 (
 set MapiCamName=%MapiCamName02%
 set MapiCamNameV=%MapiCamName02v%
 set MapiCamNameA=%MapiCamName02a%
 set MapiCamHead=315
 )
IF %MapiCamImgDIR% == 03 (
 set MapiCamName=%MapiCamName03%
 set MapiCamNameV=%MapiCamName03v%
 set MapiCamNameA=%MapiCamName03a%
 set MapiCamHead=045
 )
IF %MapiCamImgDIR% == 04 (
 set MapiCamName=%MapiCamName04%
 set MapiCamNameV=%MapiCamName04v%
 set MapiCamNameA=%MapiCamName04a%
 set MapiCamHead=270
 )
IF %MapiCamImgDIR% == 05 (
 set MapiCamName=%MapiCamName05%
 set MapiCamNameV=%MapiCamName05v%
 set MapiCamNameA=%MapiCamName05a%
 set MapiCamHead=090
 )
IF %MapiCamImgDIR% == 06 (
 set MapiCamName=%MapiCamName06%
 set MapiCamNameV=%MapiCamName06v%
 set MapiCamNameA=%MapiCamName06a%
 set MapiCamHead=135
 )
IF %MapiCamImgDIR% == 07 (
 set MapiCamName=%MapiCamName07%
 set MapiCamNameV=%MapiCamName07v%
 set MapiCamNameA=%MapiCamName07a%
 set MapiCamHead=180
 )
IF %MapiCamImgDIR% == 08 (
set MapiCamName=%MapiCamName08%
 set MapiCamNameV=%MapiCamName08v%
 set MapiCamNameA=%MapiCamName08a%
 set MapiCamHead=225
 )
IF %MapiCamImgDIR% == 00 (
 set MapiCamName=%MapiCamName00%
 set MapiCamNameV=%MapiCamName00v%
 set MapiCamNameA=%MapiCamName00a%
 set set MapiCamHead=000
 )
@echo #####################
@echo .


:: #####################
:: if you use Windows-XP -> run next command:
:: https://askdev.info/questions/101927/ffmpeg-command-line-for-capturing-and-recording-audio-and-video-in-720p-from-d
:: see devices:
:: %MapiCamFFpath%\ffmpeg.exe -list_devices true -f dshow -i dummy
:: %MapiCamFFpath%\ffmpegXP.exe -list_devices true -f dshow -i dummy
:: see options:
:: %MapiCamFFpath%\ffmpeg.exe -list_options true -f dshow -i video=%MapiCamNameV%
:: %MapiCamFFpath%\ffmpegXP.exe -list_options true -f dshow -i video=%MapiCamNameV%
:: audio list options:
:: %MapiCamFFpath%\ffmpeg.exe -f dshow -list_options true -i audio=%MapiCamNameA%
:: #####################


::
:: РОЗКОМЕНТУВАТИ ЛИШЕ ДЛЯ тестування і розуміння яких кодеків в системі нема.
:: %MapiCamFFpath%\ffmpeg.exe -codecs
:: %MapiCamFFpath%\ffmpeg.exe -formats
::
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

:: ERROR
:: Could not run graph (sometimes caused by a device already in use by other application)


%MapiCamFFpath%\ffplay.exe -f dshow -video_size 640x480 -framerate 7.5 -threads 0 -i video=%MapiCamNameV%:audio=%MapiCamNameA%


pause

:: for Win10 (CAMERA PREVIEW)
%MapiCamFFpath%\ffplay.exe ^
 -f dshow ^
 -video_size 640x480 ^
 -rtbufsize 2M ^
 -threads 0 ^
 -i video="%MapiCamNameV%" :audio="%MapiCamNameA%"

:: THIS IS OPTIONAL ::
:: READ THIS MANUAL :: https://ffmpeg.org/ffmpeg.html
:: -hide_banner
:: -framerate 10




@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep

pause

:: %MapiCamFFpath%\ffmpeg.exe -y -f dshow -video_size 640x360 -framerate 7.5 -vcodec mjpeg -i video=%MapiCamNameV% "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixVideo%-%MapiCamTime%.%MapiCamFormatVideo%"



:: for Win10 (CAMERA VIDEO) = (xx FPS) (реалізація 1 кадр/сек, мілісекунди невдалось витягнути стандартними методами ffmpeg. Він включиться ЯК РЕЗЕРВНИЙ ГАРАНТОВАНО ПРАЦЮЮЧИЙ, якщо з якоїсь причини не відпрацює жоден з вишенаведених!)
:: READ THIS MANUAL :: https://ffmpeg.org/ffmpeg.html

%MapiCamFFmpeg% -y -hide_banner ^
 -f dshow ^
 -video_size %MapiCamWidthVideo%x%MapiCamHeightVideo% ^
 -rtbufsize %MapiCamRtBufSize% ^
 -framerate %MapiCamFramerateVideo% ^
 -i video="%MapiCamNameV%" :audio="%MapiCamNameA%" ^
 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%MapiCamTime%%MapiCamSufixVideo%.%MapiCamFormatVideo%"

:: THIS IS OPTIONAL ::
:: READ THIS MANUAL :: https://ffmpeg.org/ffmpeg.html
:: -vcodec %MapiCamCodec%^
 
 
 
:: ==========
:: NON USE THIS!
:: ----------
:: -b:v 2M 
:: Option b:v (video bitrate (please use -b:v)) cannot be applied to input url [video=%MapiCamNameV%] -- you are trying to apply an input option to an output file or vice versa. Move this option before the file it belongs to. 
:: Error parsing options for input file [video=%MapiCamNameV%]. 
:: Error opening input files [video=%MapiCamNameV%]: Invalid argument
:: ----------
:: -pixel_format %MapiCamPixelFormat% 
:: Pixel format may only be set when video codec is not set or set to rawvideo
:: ----------
:: -thread_queue_size 5096^
:: -indexmem 9999^
:: -minrate 1M^
:: -maxrate 16M^
:: -bufsize 32M^
:: ==========



pause


REM :: ----- http://qaru.site/questions/16426248/ffmpeg-max-rtbufsize-via-dshow
REM _____ffmpeg -y -hide_banner -thread_queue_size 9999 -indexmem 9999 -guess_layout_max 0 -f dshow -rtbufsize 2147.48M^
 REM -i audio="Analog (1+2) (RME Fireface UC)"^
 REM -thread_queue_size 9999 -indexmem 9999 -guess_layout_max 0 -f dshow -rtbufsize 2147.48M^
 REM -i audio="ADAT (5+6) (RME Fireface UC)"^
 REM -thread_queue_size 9999 -indexmem 9999 -guess_layout_max 0 -f dshow -video_size 3840x2160 -rtbufsize 2147.48M^
 REM -framerate 60 -pixel_format nv12 -i video="Video (00 Pro Capture HDMI 4K+)":audio="ADAT (3+4) (RME Fireface UC)"^
 REM -thread_queue_size 9999 -indexmem 9999 -guess_layout_max 0 -f dshow -video_size 3840x2160 -rtbufsize 2147.48M^
 REM -framerate 60 -pixel_format nv12 -i video="AVerMedia HD Capture GC573 1":audio="SPDIF/ADAT (1+2) (RME Fireface UC)"^
 REM -thread_queue_size 9999 -indexmem 9999 -r 25 -f lavfi -rtbufsize 2147.48M -i color=c=black:s=50x50^
 REM -map 4,0 -map 0 -c:v libx264 -r 25 -rc-lookahead 50 -forced-idr 1 -sc_threshold 0 -flags +cgop^
 REM -force_key_frames "expr:gte(t,n_forced*2)" -preset ultrafast -pix_fmt nv12 -b:v 16K -minrate 16K -maxrate 16K -bufsize 16k^
 REM -c:a aac -ar 44100 -b:a 384k -ac 2 -af "aresample=async=250" -vsync 1 -ss 00:00:01.768^
 REM -max_muxing_queue_size 9999 -f segment -segment_time 600 -segment_wrap 9 -reset_timestamps 1^
 REM -segment_format_options max_delay=0 C:\Users\djcim\Videos\Main\Discord\Discord%02d.ts^
 REM -map 4,1 -map 1 -c:v libx264 -r 25 -rc-lookahead 50 -forced-idr 1 -sc_threshold 0 -flags +cgop^
 REM -force_key_frames "expr:gte(t,n_forced*2)" -preset ultrafast -pix_fmt nv12 -b:v 16K -minrate 16K -maxrate 16K -bufsize 16k^
 REM -c:a aac -ar 44100 -b:a 384k -ac 2 -af "aresample=async=250" -vsync 1 -ss 00:00:01.071^
 REM -max_muxing_queue_size 9999 -f segment -segment_time 600 -segment_wrap 9 -reset_timestamps 1^
 REM -segment_format_options max_delay=0 C:\Users\djcim\Videos\Main\Soundboard\Soundboard%02d.ts^
 REM -map 2:0,2:1 -map 2:1 -c:v h264_nvenc -r 60 -rc-lookahead 120 -forced-idr 1 -strict_gop 1 -sc_threshold 0 -flags +cgop^
 REM -force_key_frames "expr:gte(t,n_forced*2)" -preset: llhp -pix_fmt nv12 -b:v 250M -minrate 250M -maxrate 250M -bufsize 250M^
 REM -c:a aac -ar 44100 -b:a 384k -ac 2 -af "atrim=0.086, asetpts=PTS-STARTPTS, aresample=async=250" -vsync 1 -ss 00:00:00.102^
 REM -max_muxing_queue_size 9999 -f segment -segment_time 600 -segment_wrap 9 -reset_timestamps 1^
 REM -segment_format_options max_delay=0 C:\Users\djcim\Videos\Main\Magewell\Magewell%02d.ts^
 REM -map 3:0,3:1 -map 3:1 -c:v h264_nvenc -r 60 -rc-lookahead 120 -forced-idr 1 -strict_gop 1 -sc_threshold 0 -flags +cgop^
 REM -force_key_frames "expr:gte(t,n_forced*2)" -preset: llhp -pix_fmt nv12 -b:v 250M -minrate 250M -maxrate 250M -bufsize 250M^
 REM -c:a aac -ar 44100 -b:a 384k -ac 2 -af "pan=mono|c0=c0, aresample=async=250" -vsync 1^
 REM -max_muxing_queue_size 9999 -f segment -segment_time 600 -segment_wrap 9 -reset_timestamps 1^
 REM -segment_format_options max_delay=0 C:\Users\djcim\Videos\Main\Camera\Camera%02d.ts
REM :: ----- 


REM :: ----- http://qaru.site/questions/15004063/real-time-buffer-too-full-ffmpeg
REM _____ffmpeg -guess_layout_max 0 -y -f dshow -video_size 3440x1440 -rtbufsize 2147.48M -pixel_format nv12 -framerate 200 ^
REM -i video="Video (00 Pro Capture HDMI 4K+)":audio="SPDIF/ADAT (1+2) (RME Fireface UC)" -map 0:0,0:1 -map 0:1 ^
REM -preset: llhp -codec:v h264_nvenc -pix_fmt nv12 -b:v 250M -maxrate:v 250M -minrate:v 250M -bufsize:v 250M -b:a 320k ^
REM -ac 2 -r 100 -async 1 -vsync 1 -segment_time 600 -segment_wrap 9 -f segment C:\Users\djcim\Videos\PC\PC%02d.mp4 ^
REM -guess_layout_max 0 -f dshow -rtbufsize 2000M -i audio="Analog (3+4) (RME Fireface UC)" -map 1:0 -b:a 320k -ac 2 ^
REM -af "adelay=200|200" -segment_time 600 -segment_wrap 9 -f segment C:\Users\djcim\Videos\PC\Voices\Theirs\TPC%02d.wav ^
REM -guess_layout_max 0 -f dshow -rtbufsize 2000M -i audio="Analog (5+6) (RME Fireface UC)" -map 2:0 -b:a 320k -ac 2 ^
REM -af "adelay=825|825" -segment_time 600 -segment_wrap 9 -f segment C:\Users\djcim\Videos\PC\Voices\Mine\MPC%02d.wav
REM :: ----- 
REM _____ffmpeg -y -thread_queue_size 5096 -guess_layout_max 0 -f dshow -video_size 3440x1440 -rtbufsize 2147.48M -framerate 200 ^
REM -pixel_format nv12 -i video="Video (00 Pro Capture HDMI 4K+)":audio="SPDIF/ADAT (1+2) (RME Fireface UC)" -map 0:0,0:1 ^
REM -map 0:1 -preset: llhp -c:v h264_nvenc -pix_fmt nv12 -b:v 250M -minrate 250M -maxrate 250M -bufsize 250M -b:a 320k -ac 2 ^
REM -r 100 -async 1 -vsync 1 -segment_time 600 -segment_wrap 9 -f segment C:\Users\djcim\Videos\PC\PC%02d.mp4 ^
REM -guess_layout_max 0 -thread_queue_size 5096 -f dshow -rtbufsize 2000M -i audio="Analog (3+4) (RME Fireface UC)" -map 1:0 ^
REM -b:a 320k -ac 2 -af "adelay=200|200" -segment_time 600 -segment_wrap 9 -f segment ^
REM C:\Users\djcim\Videos\PC\Voices\Theirs\TPC%02d.wav ^
REM -guess_layout_max 0 -thread_queue_size 5096 -f dshow -rtbufsize 2000M -i audio="Analog (5+6) (RME Fireface UC)" -map 2:0 ^
REM -b:a 320k -ac 2 -af "adelay=825|825" -segment_time 600 -segment_wrap 9 -f segment ^
REM C:\Users\djcim\Videos\PC\Voices\Mine\MPC%02d.wav
REM :: ----- 










@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep



@echo :: for Win10 (CAMERA PHOTO CAPTURES) FPS=%MapiCamFpsPhoto%

%MapiCamFFmpeg% -y ^
 -f dshow^
 -rtbufsize %MapiCamRtBufSize%^
 -video_size %MapiCamWidthPhoto%x%MapiCamHeightPhoto%^
 -framerate %MapiCamFrameratePhoto%^
 -i video=%MapiCamNameV%^
 -r %MapiCamFpsPhoto%^
 -threads 0^
 -f image2^
 -qscale:v 2^
 -strftime 0^
 -pixel_format %MapiCamPixelFormat%^
 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%-%MapiCamDate%-%MapiCamTime%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%%012d%MapiCamSufixPhoto%.%MapiCamFormatPhoto%" 

@echo :: for Win10 (CAMERA PHOTO CAPTURES) RESERVE FPS=1
%MapiCamFFmpeg% -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate 7.5 -i video=%MapiCamNameV% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixPhoto%%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S%MapiCamSufixPhotoFps1%.jpg"


@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep



:: for Win10
%MapiCamFFplay% -f dshow -video_size 320x180 -rtbufsize 2M -framerate %MapiCamFramerateVideo% -threads 0 -i video=%MapiCamNameV%

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

%MapiCamFFplayXP% -f dshow -video_size 640x360 -rtbufsize 2M -framerate 10 -threads 0 -i video=%MapiCamNameV%

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep

@echo .
@echo :: for WinXP (CAMERA CAPTURES) FPS=%MapiCamFpsPhoto%
%MapiCamFFmpegXP% -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate %MapiCamFrameratePhoto% -i video=%MapiCamNameV% -r %MapiCamFpsPhoto% -threads 0 -f image2 -qscale:v 2 -strftime 0 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixVideo%%MapiCamImgDIR%-%MapiCamHead%-%MapiCamDate%-%%012d%MapiCamSufixPhoto%.%MapiCamFormatPhoto%" 

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep


@echo :: for WinXP (CAMERA CAPTURES) = (1 FPS)
%MapiCamFFmpegXP% -y -f dshow -video_size %MapiCamWidth%x%MapiCamHeight% -framerate 7.5 -i video=%MapiCamNameV% -r 1 -threads 0 -f image2 -qscale:v 2 -strftime 1 "%MapiCamDrive%\%MapiCamImgFolder%\%MapiCamDate%\%MapiCamImgDIR%\%MapiCamPrefixPhoto%%MapiCamImgDIR%-%MapiCamHead%-%%Y%%m%%d-%%H%%M%%S%MapiCamSufixPhotoFps1%.jpg"

@echo BEEP SOUND 
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep
rundll32 user32.dll,MessageBeep


@echo #####################################################################################
@echo ##### MapiCam-XX - WinXP - END ######################################################
@echo #####################################################################################




