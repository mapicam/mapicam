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
@IF %BlackVueFPS%==30    ( set /a BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set /a BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set /a BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set /a BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set /a BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set /a BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set /a BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set /a BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set /a BlackVueInterval=30    ) ELSE ( 
@set /a BlackVueInterval=%3% )
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

@echo ---------------------------------------------------
RMDIR %BlackVueFolder%\[RUN]-PROCESSED
MKDIR %BlackVueFolder%\[RUN]-ALL_PROCESSED_END
DIR >> %MapiCamLOG%
@echo ---------------------------------------------------
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
