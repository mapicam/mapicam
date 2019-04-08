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



:: СПРОБУВАТИ ЩЕ ЦЕ http://www.cyberforum.ru/cmd-bat/thread734403.html
setlocal enableextensions enabledelayedexpansion
set "WORKPATH=E:\VIDEO\"
set etime=1400 
rem выставляем пороговое время на 14:00 и убираем разделитель ":"
   rem ищем все файлы с расширением ".jpg", в папке E:\VIDEO\ и всех его подкаталогах.
for /f %%I in ('dir /b/s/a-d "%WORKPATH%" ^| findstr /i ".jpg"') do (call :1 "%%I")
endlocal
exit  
:1
rem форматируем дату/время создания файла и извлекаем переменную времени
set tr=%~t1
set tr=%tr:.=%
set tv=%tr:~9,5%
set tv=%tv::=%
rem сравниваем время создания файла (больше, либо равно) с нашим пороговым значением, и копируем такие файлы в D:\video\
if %tv% GTR %etime% copy %~1 D:\video\%~nx1






pause
 
 


cd /d "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
for %%a in ("%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames\*\*.jpg") do echo %%~fa > %BlackVue%\Record\jpg\list.txt

pause
 
 
 
 
 
 
 
 
 
 
for /f "tokens=*" %%G IN ('dir %BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames ^| find "*.jpg"') DO echo %%G >> "%BlackVue%\Record\jpg\list.txt"
:: (for /f "delims=" %%a in (dir /b /s "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames") do @echo %%a) >> "%BlackVue%\Record\jpg\list.txt"

pause
pause
pause

(for %%i in (%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames) do @echo %%i) > %BlackVue%\Record\jpg\list.txt


pause
pause
pause


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
