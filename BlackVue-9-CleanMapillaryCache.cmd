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


@set MapiCamPhaseNum=[9]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% #                                                                                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [9] START : CleanMapillaryCache                               >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [9] START : CleanMapillaryCache                             #
@echo #                                                             #
@echo ###############################################################
@echo.

setlocal enableextensions enabledelayedexpansion

@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
:: BlackVueFolder=F:\BlackVue
:: Використовуємо механіку, коли ЯРЛИК (LNK) зчитує розташування і СКРИПТ працює відносно папки з якої запустили LNK
@set BlackVueFolder=%1%
:: --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%
@set uploadUserName=%5%
:: --duplicate_distance 0.2
@set uploadDuplicateDistance=%4%
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
@echo %date%%time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------



@echo ---------------------------------------------------
@echo 

:: [1]DELETE 
:: ВИДАЛЯЄМО глючні файли конфігурації (C:\Users\velmy\.config\mapillary\config)
cd c:\
cd %BlackVueFolder%\%uploadImportPath%\.mapillary\logs
dir
DEL /F/Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary\logs\*\* > NUL
DEL /F/Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary\logs\* > NUL
RMDIR /Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary\logs
RMDIR /Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary
cd %BlackVueFolder%\%uploadImportPath%
dir

@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% DELETE = COMPLETE :-)                                           >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------------------
@echo DELETE = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.


@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [ 9] END  : CleanMapillaryCache                             #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [10] NEXT : ................                                #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.

@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [ 9] END  : Upload2Mapillary                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [10] NEXT : ................                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!

cmd /k
