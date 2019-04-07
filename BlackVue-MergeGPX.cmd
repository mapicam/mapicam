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
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
:: 
:: #####################
:: # This is parametrs #
:: #####################
:: 
setlocal enabledelayedexpansion
@set MapiCamGBpath=C:\Progra~2\GPSBabel
:: BlackVue=F:\BlackVue
set BlackVue=%1%
:: BlackVueFPS=10
set BlackVueFPS=%2%
set MapiCamGpxFolder=%BlackVue%\Record\gpx
@echo .
@echo MapiCamGBpath    = %MapiCamGBpath%
@echo BlackVue         = %BlackVue%
@echo BlackVueFPS      = %BlackVueFPS%
@echo MapiCamGpxFolder = %MapiCamGpxFolder%
@echo .
mkdir %MapiCamGpxFolder%
cd %MapiCamGpxFolder%
set f=
for %%f in (*.gpx) do set f=!f! -f "%%f"
%MapiCamGBpath%\gpsbabel.exe -i gpx !f! -o gpx -F "merge.gpx"





@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause














