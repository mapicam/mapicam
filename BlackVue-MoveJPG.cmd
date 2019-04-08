:: #####################
:: ###### MapiCam ######
:: #####################
:: ## www.t.me/osmUA  ##
:: ## @velmyshanovnyi ##
:: ##         (c)2019 ##
:: #####################
:: 
:: #####################
:: ####   ReadMe   #####
:: #####################
:: 
:: https://t.me/osmUA
:: https://t.me/MapillaryUkraine
:: https://t.me/MapillaryUkraineChat
:: https://github.com/mapicam/mapicam
:: https://github.com/mapicam/mapicam/wiki <-- READ ME!
:: 
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
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
set datetimefull=%year%-%month%-%day%T%hour%:%min%:%secs%Z
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
@echo.
@echo #####################
@echo # This is parametrs #
@echo #####################
setlocal enabledelayedexpansion
:: BlackVue=F:\BlackVue
set BlackVue=%1%
:: BlackVueFPS=10
set BlackVueFPS=%2%
@echo BlackVue         = %BlackVue%
@echo BlackVueFPS      = %BlackVueFPS%
@echo.
@echo "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
@echo.
mkdir "%BlackVue%\Record"
mkdir "%BlackVue%\Record\jpg"
mkdir "%BlackVue%\Record\%BlackVueFPS%fps"
mkdir "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
@echo.

:: Перенос ВСІХ файлів (.JPG) в окрему папку
:: це в межах підготовки до зміни дати та прошивки
:: http://forum.oszone.net/thread-214001.html
set t=*.jpg
set c=%BlackVue%\Record\jpg
dir /b /s %BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames\*\>>%t%
::dir /b /s y:\>>%t%
::dir /b /s z:\>>%t%
del /F /Q "%c%\*.*" 2>nul
for /F "delims=" %%I in ('^<"%t%" find /i ".jpg"') do copy "%%I" "%c%\"
del /F /Q "%t%" 2>nul
@echo.
@echo.
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause
