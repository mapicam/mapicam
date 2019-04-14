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


@set MapiCamPhaseNum=[8]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% #                                                                                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [8] START : Upload2Mapillary                                  >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] START : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
@echo.

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

@echo ---------------------------------------------------------------
@echo.
@echo https://github.com/mapillary/mapillary_tools
@echo.
@echo ---------------------------------------------------------------

setlocal enabledelayedexpansion

@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
:: BlackVueFolder=F:\BlackVue
:: Використовуємо механіку, коли ЯРЛИК (LNK) зчитує розташування і СКРИПТ працює відносно папки з якої запустили LNK
@set BlackVueFolder=%1%
:: --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%2%
@set uploadUserName=%2%
:: --duplicate_distance 0.2
@set uploadDuplicateDistance=%3%
:: --import_path "Record\jpg"
::                Record\jpg\.mapillary (там же має лежати папка з файлами мапілларі)
@set uploadImportPath=Record\jpg
@set MapiCamLOG=%BlackVueFolder%\mapicam-LOG.txt

@echo.
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo %MapiCamPhaseNum% uploadUserName             = %uploadUserName%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%
@echo %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath%
@echo %MapiCamPhaseNum% uploadDuplicateDistance    = %uploadDuplicateDistance%
@echo.
@echo %date%%time% # %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%                  >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%                       >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%            >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadUserName             = %uploadUserName%                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadDuplicateDistance    = %uploadDuplicateDistance%          >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------

mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg

cd %BlackVueFolder%\Record\jpg



:: C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name XXX --user_email YYY --user_password ZZZ
:: потрібно при ПЕРШОМУ старті, потім треба закоментувати
:: НА МАЙБУТНЄ: зробити перевірку чи є вже в системі цей параметр, і якщо є - то запускати лише тоді
:: C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name %uploadUserName%

@echo %date%%time% # %MapiCamPhaseNum% ##ZAKOMENTOVANO## C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name %uploadUserName% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%


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
:: --number_threads 100 --max_attempts 50



@echo.
@echo ---------------------------------------------------------------
@echo process_and_upload = RUN!
@echo ---------------------------------------------------------------
@echo.

@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% process_and_upload = RUN                                        >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% parametr =                                                      >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --duplicate_distance %uploadDuplicateDistance% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%



:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --duplicate_distance %uploadDuplicateDistance%
%MapiCamMapillaryTools%    process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --duplicate_distance %uploadDuplicateDistance% >> %MapiCamLOG%



@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% process_and_upload = COMPLETE :-)                               >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------------------
@echo process_and_upload = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.


:: якщо треба перезаливати - то використовуй ЦЕЙ
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%uploadImportPath%" --user_name %uploadUserName% --number_threads 1 --max_attempts 2 --verbose --rerun --flag_duplicates --duplicate_distance %uploadDuplicateDistance%


@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] END   : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [9] NEXT  : ................                                #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.

@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [8] END   : Upload2Mapillary                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [9] NEXT  : ................                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!

pause