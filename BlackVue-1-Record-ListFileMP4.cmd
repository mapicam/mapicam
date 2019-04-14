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

@set MapiCamPhaseNum=[1]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% # %MapiCamPhaseNum% -------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% START : BlackVue-Record-ListFileMP4                            >> %MapiCamLOG%
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [1] START : BlackVue-Record-ListFileMP4                     #
@echo #                                                             #
@echo ###############################################################


setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
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

@set listFileTXT=BlackVue-Record-ListFileMP4.txt
@set listFileMP4=*.mp4

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


@echo ---------------------
mkdir %BlackVueFolder%\Record
cd %BlackVueFolder%\Record
(for %%i in (%BlackVueFolder%\Record\%listFileMP4%) do @echo file '%%i') > %BlackVueFolder%\%listFileTXT%


@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [1] END   : BlackVue-Record-ListFileMP4                     #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [2] NEXT  : BlackVue-Record-Concat                          #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
