::
:: ###################################################
:: #                                                 #
:: #                    MapiCam                      #
:: #                                                 #
:: ###################################################
:: #                                                 #
:: #  www.t.me/osmUA                                 #
:: #  @velmyshanovnyi                                #
:: #                                         (c)2019 #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: #                    ReadMe                       #
:: #                                                 #
:: ###################################################
::
:: ###################################################
:: #                                                 #
:: # https://t.me/osmUA                              #
:: # https://t.me/MapillaryUkraine                   #
:: # https://t.me/MapillaryUkraineChat               #
:: # https://github.com/mapicam/mapicam              #
:: # https://github.com/mapicam/mapicam/wiki         #
:: #                                                 #
:: ###################################################
::
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
:: 
cd %1%
@set MapiCamPhaseNum=[4]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date% %time% #                                                                                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [4] START : MergeGPX                                          >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [4] START : MergeGPX                             #
@echo #                                                  #
@echo ####################################################
@echo.

cd %1%
setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
:: Використовуємо механіку, коли ЯРЛИК (LNK) зчитує розташування і СКРИПТ працює відносно папки з якої запустили LNK
::   BlackVueFolder=F:\BlackVue
@set BlackVueFolder=%1%
::   BlackVueFPS=10
@set BlackVueFPS=%2%
::   BlackVueInterval 0.1
@IF %BlackVueFPS%==30    ( set BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set BlackVueInterval=30    ) 
ELSE ( set BlackVueInterval=%3% )
::   --duplicate_distance 0.2
@set BlackDuplicateDistance=%4%
::   --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%
@set MapiCamLOG=%BlackVueFolder%\mapicam-LOG.txt
::   --import_path "Record\jpg"
::                  Record\jpg\.mapillary (там же має лежати папка з файлами мапілларі)
@set uploadImportPath=Record\jpg
@echo ---------------------------------------------------
@echo %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%
@echo %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath%
@echo.
@echo %date% %time% # %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%                    >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%            >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%                      >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%                  >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%                       >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo ---------------------------------------------------
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
@echo ---------------------------------------------------
@echo.




@echo ---------------------
@set  MapiCamGBpath=C:\Progra~2\GPSBabel
::    MapiCamCSV2XLSX=D:\mapicam\tools\csv2xlsx\csv2xlsx_386.exe
@set  MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
@set  MapiCamCSV2XLSX=D:\mapicam\tools\csv2xlsx\csv2xlsx_386.exe
@echo MapiCamGBpath    = %MapiCamGBpath%
@echo MapiCamCSV2XLSX  = %MapiCamCSV2XLSX%
@echo ---------------------

mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\gpx\0
mkdir %BlackVueFolder%\Record\temp

@echo.
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS                                            #
@echo #-------------------------------------------------------------#
@echo OFF
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
@echo ON
@echo #                                                             #
@echo # date         = %date%                                   #
@echo # time         = %time%                                  #
@echo # year         = %year%                                         #
@echo # month        = %month%                                           #
@echo # day          = %day%                                           #
@echo # hour         = %hour%                                           #
@echo # min          = %min%                                           #
@echo # secs         = %secs%                                           #
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.



@echo.
@echo ----- CREATE PREFIX
:: СТВОРЮЄМО ПРЕФІКС
@echo CREATE "%BlackVueFolder%\Record\temp\_temp-1.txt"
:: якщо "_temp-1.txt" не існує, тому його буде створено!
:: якщо "_temp-1.txt" існує, то його буде перезаписано!
:: <?xml version="1.0" encoding="UTF-8"?>
echo ^<?xml version=^"1.0^" encoding=^"UTF-8^"?^>                                                                        >"%BlackVueFolder%\Record\temp\_temp-1.txt"
:: <gpx version="1.0" creator="GPSBabel - http://www.gpsbabel.org" xmlns="http://www.topografix.com/GPX/1/0">
echo ^<gpx version=^"1.0^" creator=^"GPSBabel - http://www.gpsbabel.org^" xmlns=^"http://www.topografix.com/GPX/1/0^"^> >>"%BlackVueFolder%\Record\temp\_temp-1.txt"
:: <time>2019-04-07T23:39:36.706Z</time>
echo ^<time^>%datetimefull%^</time^>                                                                                    >>"%BlackVueFolder%\Record\temp\_temp-1.txt"
:: <bounds minlat="50.4346" minlon="30.6144" maxlat="50.4359" maxlon="30.6155"/>
:: закоментовано через те що не можу вставляти значення правильних координат minlat/minlon/maxlat/maxlon - як параметрів
echo ^<bounds minlat=^"50.4346^" minlon=^"30.6144^" maxlat=^"50.4359^" maxlon=^"30.6155^"/^>                            >>"%BlackVueFolder%\Record\temp\_temp-1.txt"




@echo.
@echo ----- CREATE SUFIX
:: СТВОРЮЄМО СУФІКС
if not exist "%BlackVueFolder%\Record\temp\_temp-3.txt" (
:: якщо "mergeTemp-3.txt" не існує, тому його буде створено!
echo CREATE "%BlackVueFolder%\Record\temp\_temp-3.txt"
:: </gpx>
echo ^</gpx^>>"%BlackVueFolder%\Record\temp\_temp-3.txt"
) else (echo FILE "_temp-3.txt" = EXIST) 




@echo.
@echo ----- CREATE BODY
:: СТВОРЮЄМО ТІЛО
copy %BlackVueFolder%\Record\gpx\*.gpx "%BlackVueFolder%\Record\temp\_temp-2.txt"



@echo.
@echo ----- DELETE TAG
:: ВИЧИЩАЄМО З ТІЛА ЗАЙВІ ТЕГИ
:: <gpx>
:: <gpx>
:: </gpx>
:: взято тут http://itman.in/remove-lines-from-file/
type "%BlackVueFolder%\Record\temp\_temp-2.txt" | findstr /v ^<gpx^> | findstr /v ^</gpx^>>>"%BlackVueFolder%\Record\temp\_temp-4.txt"





@echo.
@echo ----- Prefix & Body & Sufix 
:: СКЛЕЮЄМО ПРЕФІКС+ТІЛО+СУФІКС
copy "%BlackVueFolder%\Record\temp\_temp-1.txt"+"%BlackVueFolder%\Record\temp\_temp-4.txt"+"%BlackVueFolder%\Record\temp\_temp-3.txt" "%BlackVueFolder%\Record\temp\_temp-5.txt"
@echo.
@echo #######################





:: ВИДАЛЯЄМО останній рядок, бо в ньому іноді зЯвляється символ переносу каретки, який спричиняє збої в подальшій обробці
:: \x0D0A або \x0A
:: взято тут http://itman.in/remove-lines-from-file/
type "%BlackVueFolder%\Record\temp\_temp-5.txt" | findstr /v \x0D0A | findstr /v \x0A>>"%BlackVueFolder%\Record\temp\_temp-6.txt"

:: СТВОРЮЄМО базовий .gpx
copy "%BlackVueFolder%\Record\temp\_temp-6.txt" "%BlackVueFolder%\Record\temp\merge.gpx"

:: ВИДАЛЯЄМО тимчасові файли
del "%BlackVueFolder%\Record\temp\_temp-?.txt"

@echo.
@echo Remove Duplicates (duplicate)
:: https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVueFolder%\Record\temp\merge.gpx" -x duplicate,location,shortname -o gpx -F "%BlackVueFolder%\Record\temp\duplicate.gpx"
@echo.


@echo.
@echo Interpolate between trackpoints (interpolate)
:: Інтерполюємо (ставимо відсутні точки) якщо час між точками більше 1 секунди. 
:: це допомагає боротись з провалами під мостами, та в щільній забудові.
:: Інтерполяцію не закоментовувати!!!!
@echo https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVueFolder%\Record\temp\duplicate.gpx" -x interpolate,time=1 -o gpx -F "%BlackVueFolder%\Record\temp\interpolate.gpx"
@echo.


:: ПЕРЕНОСИМО готові .gpx до папки GPX
mkdir %BlackVueFolder%\Record\gpx\0
move /Y "%BlackVueFolder%\Record\temp\merge.gpx" "%BlackVueFolder%\Record\gpx\0"
move /Y "%BlackVueFolder%\Record\temp\duplicate.gpx" "%BlackVueFolder%\Record\gpx\0"
move /Y "%BlackVueFolder%\Record\temp\interpolate.gpx" "%BlackVueFolder%\Record\gpx\0"
%MapiCamGBpath%\gpsbabel.exe -t -i gpx -f "%BlackVueFolder%\Record\gpx\0\interpolate.gpx" -o ricoh -F "%BlackVueFolder%\Record\gpx\0\interpolate2.csv"

:: https://gitlab.com/DerLinkshaender/csv2xlsx
:: Ths most basic use case is csv2xlsx -infile test.csv -outfile result.xlsx, where you take an input CSV file in UTF-8 and write out the .xslx file under a new file name. 
:: To list all available options, start "csv2xlsx --help"
:: D:\mapicam\tools\csv2xlsx\csv2xlsx_386.exe --help
%MapiCamCSV2XLSX% --help
:: D:\mapicam\tools\csv2xlsx\csv2xlsx_386.exe -infile "F:\BlackVue\20190409-C-irpin\Record\gpx\0\interpolate2.csv" -outfile "F:\BlackVue\20190409-C-irpin\Record\gpx\0\interpolate2a.xlsx" -colsep ","
%MapiCamCSV2XLSX% -infile "%BlackVueFolder%\Record\gpx\0\interpolate2.csv" -outfile "%BlackVueFolder%\Record\gpx\0\interpolate3.xlsx" -colsep ","


@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [4] END  :  MergeGPX                             #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [5] NEXT :  MoveJPG                              #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [4] END   : MergeGPX                                        # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [5] NEXT  : MoveJPG                                         # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%      
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
