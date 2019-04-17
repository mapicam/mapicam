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
cd %1%
@set MapiCamPhaseNum=[8]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date% %time% #                                                                                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [8] START : Upload2Mapillary                                  >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] START : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
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
@set /a BlackVueFPS=%2%
::   BlackVueInterval 0.1
IF %BlackVueFPS%==30    ( set /a BlackVueInterval=0.033 )
IF %BlackVueFPS%==10    ( set /a BlackVueInterval=0.1   )
IF %BlackVueFPS%==5     ( set /a BlackVueInterval=0.2   )
IF %BlackVueFPS%==2     ( set /a BlackVueInterval=0.5   )
IF %BlackVueFPS%==1     ( set /a BlackVueInterval=1     )
IF %BlackVueFPS%==0.5   ( set /a BlackVueInterval=2     )
IF %BlackVueFPS%==0.2   ( set /a BlackVueInterval=5     )
IF %BlackVueFPS%==0.1   ( set /a BlackVueInterval=10    )
IF %BlackVueFPS%==0.033 ( set /a BlackVueInterval=30    ) ELSE ( 
set /a BlackVueInterval=%3% )
@set /a BlackVueInterval=1/%BlackVueFPS%
::   --duplicate_distance 0.2
@set /a BlackDuplicateDistance=%4%
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




mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg




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







@echo ---------------------------------------------------
@echo SEE CODE IF ERROR - @HTTP Error 403
:: HTTP error: HTTP Error 403: Forbidden on 20190403_182624_NF_000032.jpg, will attempt upload again for 49 more times
:: https://github.com/mapillary/mapillary_tools/issues/328
:: Steps to fix that are:
:: 
:: [1] DELETE .config -  Mapillary credentials by deleting .config file. Default is ~/.config/mapillary/config  --- For Win10 (%homedrive%\.config\mapillary)
:: ВИДАЛЯЄМО глючні файли конфігурації (C:\Users\velmy\.config\mapillary\config)
:: cd c:\
:: cd %HOMEPATH%
:: DEL /F/Q/S %HOMEPATH%\.config\mapillary\*.* > NUL
:: DEL /F/Q/S %HOMEPATH%\.config\mapillary\* > NUL
:: RMDIR /Q/S %HOMEPATH%\.config\mapillary

:: [2] RUN               process again on each folder re-authenticating when prompted
:: %MapiCamMapillaryTools% authenticate --advanced --help
:: %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary%
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --help
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --user_name velmyshanovnyi
:: [3] UPLOAD            Upload reprocessed imagery.
:: 

::echo %date%%time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary% >> %MapiCamLOG%
::echo %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary%                                  >> %MapiCamLOG%
::echo %date%%time% # %MapiCamPhaseNum%                                                                                          >> %MapiCamLOG%
:: D:\mapicam\tools\mapillary\mapillary_tools.exe  --advanced authenticate --user_name XXX --user_email YYY --user_password ZZZ
:: потрібно при ПЕРШОМУ старті, потім треба закоментувати
:: НА МАЙБУТНЄ: зробити перевірку чи є вже в системі цей параметр, і якщо є - то запускати лише тоді
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --help
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --user_name velmyshanovnyi --help




:: зберегти оригінал (в тимчасовій папці буде створено копію файла. але процес займає в 3 рази більше часу.)
:: --keep_original

:: показати ExtraWarningError
:: --verbose

:: для повторного завантаження, чи коли попереднє завантаження з помилками (використовувати в парі)+(розташовувати ПІСЛЯ --advanced)
:: --verbose --rerun

:: якщо в PATH не зберігає шлях, то вказуємо лінком на ФАЙЛ
:: C:\ffmpeg\bin\mapillary_tools.exe

:: --flag_duplicates 
:: --duplicate_distance 0.5

:: --Позначати_дублікати --Дистанція_дублікатів (параметри використовуються в парі). Видаляти всі фотки які ближче одна до одної ніж 0.5 метра (це світлофори, зупинки, заправки та Старт/Стоп)
:: --flag_duplicates --duplicate_distance 0.5
:: --flag_duplicates ЗАРАЗ УСТАРІВ і не використовується, замісто нього писати --duplicate_distance 0.2

:: Кількість_потоків 10 та Кількісь_спроб 50
:: --number_threads 10 --max_attempts 50



@echo.
@echo ---------------------------------------------------------------
@echo IF upload = ERROR-403 USE version 0.4.2 - TRUE // version 0.5.0 - FALSE //  %MapiCamMapillaryTools% upload --verbose --advanced --import_path "%BlackVueFolder%\%uploadImportPath%"  --number_threads 10 --max_attempts 10
:: УВАГА!!! для UPLOAD: не можна ставити 
::     --number_threads
::     --max_attempts
::     --duplicate_distance
:: бо ПОМИЛКА
:: %MapiCamMapillaryTools% upload -advanced --import_path "%BlackVueFolder%\%uploadImportPath%"
@echo process            = ...
@echo ---------------------------------------------------------------
@echo.

@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% upload = RUN                                                    >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% parametr =                                                      >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% upload --verbose --advanced --import_path "%BlackVueFolder%\%uploadImportPath%"  --number_threads 2 --max_attempts 10 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% OR                                                              >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\%uploadImportPath%"  --rerun --user_name %MapiCamUsernameAtMapillary%  --offset_angle 0 --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackDuplicateDistance% --move_duplicates --move_uploaded --list_file_status --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%

@echo on
:: D:\mapicam\tools\mapillary\mapillary_tools.exe upload --advanced --help
%MapiCamMapillaryTools% upload --advanced --help
%MapiCamMapillaryTools% upload --verbose --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --number_threads 5 --max_attempts 5 >> %MapiCamLOG%

:: D:\mapicam\tools\mapillary\mapillary_tools.exe process_and_upload --advanced --help
%MapiCamMapillaryTools% process_and_upload --advanced --help
REM %MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\%uploadImportPath%" --geotag_source_path "%BlackVueFolder%\Record\gpx\0\interpolate.gpx" --rerun --user_name %MapiCamUsernameAtMapillary%  --offset_angle 0 --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackDuplicateDistance% --move_duplicates --move_uploaded --list_file_status --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%
@echo off
:: %MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\%uploadImportPath%"  --rerun --user_name %MapiCamUsernameAtMapillary%  --offset_angle 0 --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackDuplicateDistance% --move_duplicates --move_uploaded --list_file_status --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%

@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% upload = COMPLETE :-)                                           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------------------
@echo upload = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.

:: якщо треба перезаливати - то використовуй ЦЕЙ
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%uploadImportPath%" --user_name %MapiCamUsernameAtMapillary% --number_threads 1 --max_attempts 2 --verbose --rerun --duplicate_distance %BlackDuplicateDistance%

@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] END   : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [9] NEXT  : CleanMapillaryCache                             #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.

@RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
@MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-UPLOAD-2-MAPILLARY-COMPLETE

@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [8] END   : Upload2Mapillary                                # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [9] NEXT  : ................                                # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
cmd /k
