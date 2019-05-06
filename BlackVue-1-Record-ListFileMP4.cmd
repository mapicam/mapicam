cd %1%
@set MapiCamPhaseNum=[1]
@echo ##### HEAD ##############################################################
setlocal enableextensions enabledelayedexpansion
@set MapiCamFolder=D:\mapicam
@set BlackVueFolder=%1%
@set BlackVueFPS=%2%
@set BlackVueOffsetAngle=%3%
@set BlackVueDuplicateDistance=%4%
@set MapiCamUsernameAtMapillary=%5%
CALL %MapiCamFolder%\BlackVue-Head.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%
@echo ##### HEAD ##############################################################




@echo ---------------------
@set listFileTXT=BlackVue-Record-ListFileMP4.txt
@set listFileMP4=*.mp4
@echo %MapiCamPhaseNum% listFileTXT                =%listFileTXT%
@echo %MapiCamPhaseNum% listFileMP4                =%listFileMP4%
@echo ---------------------

mkdir %BlackVueFolder%\Record

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
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [1] END   : BlackVue-Record-ListFileMP4                     # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [2] NEXT  : BlackVue-Record-Concat                          # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
