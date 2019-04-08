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
@echo .
@echo #####################
@echo # This is parametrs #
@echo #####################
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


:: ПОТІМ змінити назву файла на "merge.gpx"
if not exist "%BlackVue%\Record\gpxMerge\merge.gpx.txt" (
:: якщо "merge.gpx.txt" не існує, тому його буде створено!
echo CREATE "%BlackVue%\Record\gpxMerge\merge.gpx.txt"
echo off > "%BlackVue%\Record\gpxMerge\merge.gpx.txt"
:: https://ru.stackoverflow.com/questions/912264/%D0%9A%D0%B0%D0%BA-%D1%8D%D0%BA%D1%80%D0%B0%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D1%82%D1%8C-%D0%BA%D0%B0%D0%B2%D1%8B%D1%87%D0%BA%D0%B8
:: екранувати символи

:: <?xml version="1.0" encoding="UTF-8"?>
echo ^<?xml version=^"1.0^" encoding=^"UTF-8^"?^>>>"%BlackVue%\Record\gpxMerge\merge.gpx.txt"
:: <gpx version="1.0" creator="GPSBabel - http://www.gpsbabel.org" xmlns="http://www.topografix.com/GPX/1/0">
echo ^<gpx version=^"1.0^" creator=^"GPSBabel - http://www.gpsbabel.org^" xmlns=^"http://www.topografix.com/GPX/1/0^"^>>>"%BlackVue%\Record\gpxMerge\merge.gpx.txt"
:: <time>2019-04-07T23:39:36.706Z</time>
echo ^<time^>%datetimefull%^</time^>>>"%BlackVue%\Record\gpxMerge\merge.gpx.txt"
:: <bounds minlat="50.4346" minlon="30.6144" maxlat="50.4359" maxlon="30.6155"/>
echo ^<bounds minlat=^"50.4346^" minlon=^"30.6144^" maxlat=^"50.4359^" maxlon=^"30.6155^"/^>>>"%BlackVue%\Record\gpxMerge\merge.gpx.txt"

) else (echo FILE "%BlackVue%\Record\gpxMerge\merge.gpx.txt" = TRUE) 




@echo ########## WORK ##########


pause

set i=
cd /d %BlackVue%\Record\gpx
(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do @echo %%i) >> "%BlackVue%\Record\gpxMerge\merge.gpx.txt"

::set i=
::cd /d %BlackVue%\Record\gpx
::(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do @echo %%i) > %BlackVue%\Record\gpxMerge\list.txt








pause
pause






@echo .
@echo Merge all .GPX files within a folder into one file with GPSbabel (merge)
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
cd /d %BlackVue%\Record\gpx
set f=
for %%f in ("%BlackVue%\Record\gpx\*.gpx") do set f=!f! -f "%%f"
%MapiCamGBpath%\gpsbabel.exe -i gpx !f! -o gpx -F "%BlackVue%\Record\gpxMerge\merge.gpx"







@echo AAAAAAAAAAAAAAAAAAAAAAAAAA
@echo ########## WORK ##########

::for %%f in (%BlackVue%\Record\gpx\*.gpx) do type "%%f" >> %BlackVue%\Record\gpxMerge\merge.gpx







@echo ########## WORK ##########
@echo VVVVVVVVVVVVVVVVVVVVVVVVVV


@echo .
@echo Remove Duplicates (duplicate)
:: https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVue%\Record\gpxMerge\merge.gpx" -x duplicate,location,shortname -o gpx -F "%BlackVue%\Record\gpxDuplicate\duplicate.gpx"
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














