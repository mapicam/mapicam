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
setlocal enableextensions enabledelayedexpansion
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

:: Перенос(копіювання) ВСІХ файлів (.JPG) в окрему папку
:: це в межах підготовки до зміни дати та прошивки
:: http://www.cyberforum.ru/cmd-bat/thread734403.html
:: copy /Y 111 222            // https://ab57.ru/cmdlist/copy.html
:: xcopy 111 222 /Y /H /R     // https://ab57.ru/cmdlist/xcopy.html
:: move /Y 111 222            // https://ab57.ru/cmdlist/move.html
:: copy|xcopy|move --> /Y - це перезаписувати без попередження
:: xcopy           --> /Q - Запрет вывода имен копируемых файлов.
:: xcopy           --> /H - Копирование, среди прочих, скрытых и системных файлов.
:: xcopy           --> /R - Перезапись файлов, предназначенных только для чтения.
setlocal enableextensions enabledelayedexpansion
for /f %%I in ('dir /b/s/a-d "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do (
:: copy /Y "%%I" "%BlackVue%\Record\jpg"
:: xcopy "%%I" /Y /H /R "%BlackVue%\Record\jpg"
move /Y "%%I" "%BlackVue%\Record\jpg")
	:: ДООПРАЦЮВАТИ ПІЗНІШЕ. ЩОБ КОПІЮВАЛО ПАПКАМИ !
	::for /f %%I in ('dir /b/s/a-d "%BlackVue%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".mapillary"') do (
	::xcopy "%%I" /Y "%BlackVue%\Record\jpg"
	::)

@echo.
@echo.
@echo.
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
