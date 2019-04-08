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
@echo.
@echo MapiCamGBpath    = %MapiCamGBpath%
@echo BlackVue         = %BlackVue%
@echo.
mkdir %BlackVue%\Record\gpx
mkdir %BlackVue%\Record\gpxMerge
mkdir %BlackVue%\Record\gpxDuplicate
mkdir %BlackVue%\Record\gpxInterpolate

:: СТВОРЮЄМО ПРЕФІКС
:: ПОТІМ змінити назву файла на "merge.gpx"
if not exist "%BlackVue%\Record\gpxMerge\mergeTemp-1.txt" (
:: якщо "mergeTemp-1.txt" не існує, тому його буде створено!
echo CREATE "%BlackVue%\Record\gpxMerge\mergeTemp-1.txt"
:: <?xml version="1.0" encoding="UTF-8"?>
echo ^<?xml version=^"1.0^" encoding=^"UTF-8^"?^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-1.txt"
:: <gpx version="1.0" creator="GPSBabel - http://www.gpsbabel.org" xmlns="http://www.topografix.com/GPX/1/0">
echo ^<gpx version=^"1.0^" creator=^"GPSBabel - http://www.gpsbabel.org^" xmlns=^"http://www.topografix.com/GPX/1/0^"^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-1.txt"
:: <time>2019-04-07T23:39:36.706Z</time>
echo ^<time^>%datetimefull%^</time^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-1.txt"
:: <bounds minlat="50.4346" minlon="30.6144" maxlat="50.4359" maxlon="30.6155"/>
echo ^<bounds minlat=^"50.4346^" minlon=^"30.6144^" maxlat=^"50.4359^" maxlon=^"30.6155^"/^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-1.txt"
) else (echo FILE "mergeTemp-1.txt" = EXIST) 


:: СТВОРЮЄМО СУФІКС
if not exist "%BlackVue%\Record\gpxMerge\mergeTemp-3.txt" (
:: якщо "mergeTemp-3.txt" не існує, тому його буде створено!
echo CREATE "%BlackVue%\Record\gpxMerge\mergeTemp-3.txt"
:: </trkseg>
echo ^</trkseg^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-3.txt"
:: </trk>
echo ^</trk^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-3.txt"
:: </gpx>
echo ^</gpx^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-3.txt"
) else (echo FILE "mergeTemp-3.txt" = EXIST) 

:: СТВОРЮЄМО ТІЛО
copy %BlackVue%\Record\gpx\*.gpx "%BlackVue%\Record\gpxMerge\mergeTemp-2.txt"


:: ВИЧИЩАЄМО З ТІЛА ЗАЙВІ ТЕГИ
:: <gpx>
:: <gpx>
:: </gpx>
:: взято тут http://itman.in/remove-lines-from-file/
type "%BlackVue%\Record\gpxMerge\mergeTemp-2.txt" | findstr /v ^<gpx^> | findstr /v ^</gpx^>>>"%BlackVue%\Record\gpxMerge\mergeTemp-2a.txt"



@echo ########## WORK ##########





pause




:: СКЛЕЮЄМО ПРЕФІКС+ТІЛО+СУФІКС

pause
pause
pause



for %%f in (%BlackVue%\Record\gpx\*.gpx) do echo.>>%%f










cd /d %BlackVue%\Record\gpx
(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do copy "%%i" "%BlackVue%\Record\gpxMerge\merge.gpx.txt" /a)
::(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do copy "%%i" "%BlackVue%\Record\gpxMerge\merge.gpx.txt") >> "%BlackVue%\Record\gpxMerge\merge.gpx.txt"
::(FOR %%i in (%BlackVue%\Record\gpx\*.gpx)  do @echo %%i) >> "%BlackVue%\Record\gpxMerge\merge.gpx.txt"

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














