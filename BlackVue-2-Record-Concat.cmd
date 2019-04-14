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

@set MapiCamPhaseNum=[2]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% # %MapiCamPhaseNum% -------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% START : BlackVue-Record-Concat                                 >> %MapiCamLOG%
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [2] START : BlackVue-Record-Concat               #
@echo #                                                  #
@echo ####################################################
@echo.

setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
::   BlackVueFolder=F:\BlackVue
@set BlackVueFolder=%1%
@set BlackVue=%BlackVueFolder%
::   BlackVueFPS=10
@set BlackVueFPS=%2%
::   BlackVueInterval 0.1
@set BlackVueInterval=%3%
::   --duplicate_distance 0.1
@set BlackDuplicateDistance=%4%
::   --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%

@set concatTXT=BlackVue-Record-ListFileMP4.txt
@set concatMP4=BlackVue-Record-concat.mp4

@echo.
@echo %MapiCamPhaseNum% MapiCamFolder              = %MapiCamFolder%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% BlackVue                   = %BlackVue%
@echo %MapiCamPhaseNum% BlackVueFPS                = %BlackVueFPS%
@echo %MapiCamPhaseNum% BlackVueInterval           = %BlackVueInterval%
@echo %MapiCamPhaseNum% BlackDuplicateDistance     = %BlackDuplicateDistance%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo.
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo.
@echo %MapiCamPhaseNum% listFileTXT                =%listFileTXT%
@echo %MapiCamPhaseNum% listFileMP4                =%listFileMP4%
@echo.
@echo %MapiCamPhaseNum% concatTXT                  = %concatTXT%
@echo %MapiCamPhaseNum% concatMP4                  = %concatMP4%
@echo ---------------------


mkdir %BlackVueFolder%\Record
cd %BlackVueFolder%


:: FIX ERROR https://github.com/mapicam/mapicam/issues/2
ffmpeg -y -f concat -safe 0 -i %BlackVue%\%concatTXT% -codec copy %BlackVueFolder%\%concatMP4%
@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # END   : [2] BlackVue-Record-Concat               #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # NEXT  : [3] BlackVue-Video2Photo                 #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
