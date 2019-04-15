@echo.
@echo ###################################################
@echo #                                                 #
@echo #                    MapiCam                      #
@echo #                                                 #
@echo ###################################################
@echo #                                                 #
@echo #  www.t.me/osmUA                                 #
@echo #  @velmyshanovnyi                                #
@echo #                                         (c)2019 #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo #                    ReadMe                       #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # https://t.me/osmUA                              #
@echo # https://t.me/MapillaryUkraine                   #
@echo # https://t.me/MapillaryUkraineChat               #
@echo # https://github.com/mapicam/mapicam              #
@echo # https://github.com/mapicam/mapicam/wiki         #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###################################################
@echo #                                                 #
@echo # START : RUN-START                               #
@echo #                                                 #
@echo ###################################################
@echo.
@echo ###############################################################
@echo #
@echo # START : RUN MapiCam 1234567
@echo #
@echo #--------------------------------------------------------------
@echo #
@echo # 1 Folder             %1%
@echo # 2 Fps                %2%
@echo # 3 sample_interval    %3%
@echo # 4 DuplicateDistance  %4%
@echo # 5 UserName           %5%
@echo #
@echo #--------------------------------------------------------------
@echo #

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
@set BlackVueInterval=%3%
::   --duplicate_distance 0.2
@set BlackDuplicateDistance=%4%
::   --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%
:: --import_path "Record\jpg"
::                Record\jpg\.mapillary (там же має лежати папка з файлами мапілларі)
@set uploadImportPath=Record\jpg
@set MapiCamLOG=%BlackVueFolder%\mapicam-LOG.txt

@echo.
@echo %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo.
@echo ---------------------------------------------------
mkdir "%BlackVueFolder%\Record"
mkdir "%BlackVueFolder%\Record\%BlackVueFPS%fps"
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg
cd    %BlackVueFolder%\Record\jpg


::1
CALL %MapiCamFolder%\BlackVue-1-Record-ListFileMP4.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::2
CALL %MapiCamFolder%\BlackVue-2-Record-Concat.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::3 
:: 10 FPS = 0.1 // 5 FPS = 0.2 // 2 FPS = 0.5 // 1 FPS = 1 
CALL %MapiCamFolder%\BlackVue-3-Video2Photo.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::4
CALL %MapiCamFolder%\BlackVue-4-MergeGPX.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::5
CALL %MapiCamFolder%\BlackVue-5-MoveJPG.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::6
:: CALL %MapiCamFolder%\BlackVue-6-FixDateTime.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%

::7
:: CALL %MapiCamFolder%\BlackVue-7-Gpx2Exif.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueInterval% %BlackDuplicateDistance% %MapiCamUsernameAtMapillary%


::8

@echo.
@echo.
@echo.
@echo ###################################################
@echo #                                                 #
@echo #                END RUN PROCESS                  #
@echo #                                                 #
@echo ###################################################
@echo.
@echo.
@echo.
cmd /k
