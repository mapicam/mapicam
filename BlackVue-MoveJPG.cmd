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


pause
 
(for /f "delims=" %%a in ('dir /b /s %BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames') do @echo %%a) >> "%BlackVue%\Record\jpg\list.txt"

pause
pause
pause

:: Перенос ВСІХ файлів (.JPG) в окрему папку
:: це в межах підготовки до зміни дати та прошивки
:: http://forum.oszone.net/thread-214001.html
set t=*.jpg
set c=%BlackVue%\Record\jpg
dir /b /s %BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames >> %t%
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
