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
:: #####################
:: # This is parametrs #
:: #####################
:: 
setlocal enabledelayedexpansion
@set MapiCamGBpath=C:\Progra~2\GPSBabel
:: BlackVue=F:\BlackVue
set BlackVue=%1%
@echo .
@echo MapiCamGBpath    = %MapiCamGBpath%
@echo BlackVue         = %BlackVue%
@echo .
mkdir %BlackVue%\Record\gpx
mkdir %BlackVue%\Record\gpxMerge
mkdir %BlackVue%\Record\gpxDuplicate
mkdir %BlackVue%\Record\gpxInterpolate

@echo .
@echo Merge all .GPX files within a folder into one file with GPSbabel (merge)
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
set i=
cd /d %BlackVue%\Record\gpx
(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do @echo %%i) > %BlackVue%\Record\gpxMerge\list-1.txt


@echo AAAAAAAAAAAAAAAAAAAAAAAAAA
@echo ########## WORK ##########

cd /d %BlackVue%\Record\gpxMerge
for %f in (%BlackVue%\Record\gpx\*.gpx) do type "%f" >> %BlackVue%\Record\gpxMerge\merge-1.gpx





pause







@echo ########## WORK ##########
@echo VVVVVVVVVVVVVVVVVVVVVVVVVV


@echo .
@echo Remove Duplicates (duplicate)
:: https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVue%\Record\gpxMerge\merge-1.gpx" -x duplicate,location,shortname -o gpx -F "%BlackVue%\Record\gpxDuplicate\duplicate.gpx"
@echo .

@echo .
@echo Interpolate between trackpoints (interpolate)
:: Інтерполюємо (ставимо відсутні точки) якщо час між точками більше 1 секунди. 
:: це допомагає боротись з провалами під мостами, та в щільній забудові.
:: Інтерполяцію не закоментовувати!!!!
@echo https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVue%\Record\gpxDuplicate\duplicate.gpx" -x interpolate,time=1 -o gpx -F "%BlackVue%\Record\gpxInterpolate\interpolate.gpx"
@echo .


@echo .
@echo #######################
@echo ##### END PROCESS #####
@echo #######################
pause














