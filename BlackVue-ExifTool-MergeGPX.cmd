cd %1%
@set MapiCamPhaseNum=[4]
@echo ##### HEAD ##############################################################
SetLocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set BlackVueFolder=%1%
@set BlackVueFPS=%2%
@set BlackVueOffsetAngle=%3%
@set BlackVueDuplicateDistance=%4%
@set MapiCamUsernameAtMapillary=%5%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%
@echo ##### HEAD ##############################################################


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
mkdir %BlackVueFolder%\Record\gpx\temp

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
set msec=%time::=%
  set msec=%msec:~-2%
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
@echo # msec         = %msec%                                           #
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.



mkdir %BlackVueFolder%\Record\gpx
move "%BlackVueFolder%\Record\*.gpx" "%BlackVueFolder%\Record\gpx"
mkdir %BlackVueFolder%\Record\gpx\temp

@echo.
@echo ----- CREATE PREFIX
:: СТВОРЮЄМО ПРЕФІКС
@echo CREATE "%BlackVueFolder%\Record\gpx\temp\_temp-1.txt"
:: якщо "_temp-1.txt" не існує, тому його буде створено!
:: якщо "_temp-1.txt" існує, то його буде перезаписано!

:: <?xml version="1.0" encoding="utf-8"?>
echo ^<?xml version=^"1.0^" encoding=^"utf-8^"?^>    >"%BlackVueFolder%\Record\gpx\temp\_temp-1.txt"

:: <gpx version="1.0" creator="ExifTool 11.42" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns="http://www.topografix.com/GPX/1/0" xsi:schemaLocation="http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd">
echo ^<gpx version=^"1.0^" creator=^"ExifTool 11.42^" xmlns:xsi=^"http://www.w3.org/2001/XMLSchema-instance^" xmlns=^"http://www.topografix.com/GPX/1/0^" xsi:schemaLocation=^"http://www.topografix.com/GPX/1/0 http://www.topografix.com/GPX/1/0/gpx.xsd^"^> >>"%BlackVueFolder%\Record\gpx\temp\_temp-1.txt"

:: <time>2019-04-07T23:39:36.706Z</time>
:: echo ^<time^>%datetimefull%^</time^>    >>"%BlackVueFolder%\Record\temp\_temp-1.txt"
:: <bounds minlat="50.4346" minlon="30.6144" maxlat="50.4359" maxlon="30.6155"/>
:: закоментовано через те що не можу вставляти значення правильних координат minlat/minlon/maxlat/maxlon - як параметрів
:: echo ^<bounds minlat=^"50.4346^" minlon=^"30.6144^" maxlat=^"50.4359^" maxlon=^"30.6155^"/^>                            >>"%BlackVueFolder%\Record\temp\_temp-1.txt"



@echo.
@echo ----- CREATE SUFIX
:: СТВОРЮЄМО СУФІКС
if not exist "%BlackVueFolder%\Record\gpx\temp\_temp-3.txt" (
:: якщо "mergeTemp-3.txt" не існує, тому його буде створено!
echo CREATE "%BlackVueFolder%\Record\gpx\temp\_temp-3.txt"
:: </gpx>
echo ^</gpx^>>"%BlackVueFolder%\Record\gpx\temp\_temp-3.txt"
) else (echo FILE "_temp-3.txt" = EXIST) 




@echo.
@echo ----- CREATE BODY
:: СТВОРЮЄМО ТІЛО
copy %BlackVueFolder%\Record\gpx\*.gpx "%BlackVueFolder%\Record\gpx\temp\_temp-2.txt"



@echo.
@echo ----- DELETE TAG
:: ВИЧИЩАЄМО З ТІЛА ЗАЙВІ ТЕГИ
:: <gpx>
:: <gpx>
:: </gpx>
:: взято тут http://itman.in/remove-lines-from-file/
type "%BlackVueFolder%\Record\gpx\temp\_temp-2.txt" | findstr /v ^<gpx^> | findstr /v ^</gpx^> | findstr /v ^<gpx | findstr /v ^<^?xml | findstr /v creator | findstr /v xmlns:xsi | findstr /v xmlns | findstr /v xsi:schemaLocation | findstr /v ^<number^> >>"%BlackVueFolder%\Record\gpx\temp\_temp-4.txt"



type "%BlackVueFolder%\Record\gpx\temp\_temp-4.txt" | findstr /v ^<gpx^> | findstr /v ^</gpx^> | findstr /v ^<gpx | findstr /v ^<^?xml | findstr /v creator | findstr /v xmlns:xsi | findstr /v xmlns | findstr /v xsi:schemaLocation | findstr /v ^<number^> >>"%BlackVueFolder%\Record\gpx\temp\_temp-4.txt"







:: позбутись переносів рядків
:: рядки що містять "=" викликають "глюки" (((((
:: http://www.cyberforum.ru/cmd-bat/thread2039468.html
@echo off
::<file.txt>new.txt (for /f %%a in ('more') do @<nul set/p="%%a ")
<%BlackVueFolder%\Record\gpx\temp\_temp-4.txt>%BlackVueFolder%\Record\gpx\temp\_temp-4-1.txt (for /f %%a in ('more') do @<nul set/p="%%a")

pause




cd %BlackVueFolder%\Record\gpx\temp\
:: http://forum.oszone.net/thread-316638.html
:: 
@echo off
set "f=1.txt"
<"%f%">$ (
 for /f "delims=" %%a in ('more') do @(
  echo %%a|>nul findstr/ec:"== ))" && (
   for /f "tokens=1,2 delims=:" %%b in ("%%~a") do @(
    echo %%b::
    echo %%c
   )
  ) || (
   echo %%a
  )
 )
)& move $ "1.txt"
exit


@echo off
set "f=_temp-4-1.txt"
<"%f%">$ (
 for /f "delims=" %%a in ('more') do @(
  echo %%a|>nul findstr/ec:"</trkpt>" && (
   for /f "tokens=1,2 delims=:" %%b in ("%%~a") do @(
    echo %%b::
    echo %%c
   )
  ) || (
   echo %%a
  )
 )
)& move $ "_temp-4-4.txt"
exit





:: ПРАЦЮЄ! позбутись дублікатів рядків
:: http://www.cyberforum.ru/cmd-bat/thread1357901.html
:: <"1.txt">"2.txt" (for /f "delims=" %%i in ('more') do @if not defined %%i (echo %%i& set %%i=*))
<"%BlackVueFolder%\Record\gpx\temp\_temp-4.txt" >"%BlackVueFolder%\Record\gpx\temp\_temp-4-2.txt" (for /f "delims=" %%i in ('more') do @if not defined %%i (echo %%i& set %%i=*))






@echo.
@echo ----- Prefix & Body & Sufix 
:: СКЛЕЮЄМО ПРЕФІКС+ТІЛО+СУФІКС
copy "%BlackVueFolder%\Record\gpx\temp\_temp-1.txt"+"%BlackVueFolder%\Record\gpx\temp\_temp-4.txt"+"%BlackVueFolder%\Record\gpx\temp\_temp-3.txt" "%BlackVueFolder%\Record\gpx\temp\_temp-5.txt"
@echo.
@echo #######################




:: ВИДАЛЯЄМО останній рядок, бо в ньому іноді зЯвляється символ переносу каретки, який спричиняє збої в подальшій обробці
:: \x0D0A або \x0A
:: взято тут http://itman.in/remove-lines-from-file/
type "%BlackVueFolder%\Record\gpx\temp\_temp-5.txt" | findstr /v \x0D0A | findstr /v \x0A>>"%BlackVueFolder%\Record\gpx\temp\_temp-6.txt"

:: СТВОРЮЄМО базовий .gpx
copy "%BlackVueFolder%\Record\gpx\temp\_temp-6.txt" "%BlackVueFolder%\Record\gpx\temp\merge.gpx"

:: ВИДАЛЯЄМО тимчасові файли
del "%BlackVueFolder%\Record\gpx\temp\_temp-?.txt"

:: ВИДАЛЯЄМО тимчасову папку (якщо вона порожня)
RMDIR %BlackVueFolder%\Record\gpx\temp

@echo.
@echo Remove Duplicates (duplicate)
:: https://www.gpsbabel.org/htmldoc-development/filter_duplicate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVueFolder%\Record\gpx\temp\merge.gpx" -x duplicate,location,shortname -o gpx -F "%BlackVueFolder%\Record\gpx\temp\duplicate.gpx"
@echo.


@echo.
@echo Interpolate between trackpoints (interpolate)
:: Інтерполюємо (ставимо відсутні точки) якщо час між точками більше 1 секунди. 
:: це допомагає боротись з провалами під мостами, та в щільній забудові.
:: Інтерполяцію не закоментовувати!!!!
@echo https://www.gpsbabel.org/htmldoc-development/filter_interpolate.html
%MapiCamGBpath%\gpsbabel.exe -i gpx -f "%BlackVueFolder%\Record\gpx\temp\duplicate.gpx" -x interpolate,time=1 -o gpx -F "%BlackVueFolder%\Record\temp\interpolate.gpx"
@echo.


:: ПЕРЕНОСИМО готові .gpx до папки GPX
mkdir %BlackVueFolder%\Record\gpx\0
move /Y "%BlackVueFolder%\Record\gpx\temp\merge.gpx" "%BlackVueFolder%\Record\gpx\0"
move /Y "%BlackVueFolder%\Record\gpx\temp\duplicate.gpx" "%BlackVueFolder%\Record\gpx\0"
move /Y "%BlackVueFolder%\Record\gpx\temp\interpolate.gpx" "%BlackVueFolder%\Record\gpx\0"
:: ВИДАЛЯЄМО тимчасову папку (якщо вона порожня)
RMDIR %BlackVueFolder%\Record\gpx\temp

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

cmd /k

