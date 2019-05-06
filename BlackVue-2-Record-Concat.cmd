cd %1%
@set MapiCamPhaseNum=[2]
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
@set concatTXT=BlackVue-Record-ListFileMP4.txt
@set concatMP4=BlackVue-Record-concat.mp4
@echo %MapiCamPhaseNum% listFileTXT                =%listFileTXT%
@echo %MapiCamPhaseNum% listFileMP4                =%listFileMP4%
@echo %MapiCamPhaseNum% concatTXT                  = %concatTXT%
@echo %MapiCamPhaseNum% concatMP4                  = %concatMP4%
@echo ---------------------



:: FIX ERROR https://github.com/mapicam/mapicam/issues/2
ffmpeg -y -f concat -safe 0 -i %BlackVueFolder%\%concatTXT% -codec copy %BlackVueFolder%\%concatMP4%

@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [2] END  : BlackVue-Record-Concat                #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [3] NEXT : BlackVue-Video2Photo                  #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [2] END   : BlackVue-Record-Concat                          # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [3] NEXT  : BlackVue-Video2Photo                            # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%      
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
