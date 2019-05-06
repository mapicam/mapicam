cd %1%
@set MapiCamPhaseNum=[RUN]
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


mkdir %BlackVueFolder%\Record


::1
:: CALL %MapiCamFolder%\BlackVue-1-Record-ListFileMP4.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::2
:: CALL %MapiCamFolder%\BlackVue-2-Record-Concat.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::3 
:: 10 FPS = 0.1 // 5 FPS = 0.2 // 2 FPS = 0.5 // 1 FPS = 1 
CALL %MapiCamFolder%\BlackVue-3-Video2Photo.cmd %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::4
CALL %MapiCamFolder%\BlackVue-4-MergeGPX.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::5
CALL %MapiCamFolder%\BlackVue-5-MoveJPG.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::6
CALL %MapiCamFolder%\BlackVue-6-FixDateTime.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::7
CALL %MapiCamFolder%\BlackVue-7-Gpx2Exif.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%

::7-A
CALL "C:\Program Files (x86)\EXIF Date Changer\EXIFDateChanger.exe" %BlackVueFolder%

::8
::CALL %MapiCamFolder%\BlackVue-8-Upload2mapillary.cmd  %BlackVueFolder% %BlackVueFPS% %BlackVueOffsetAngle% %BlackVueDuplicateDistance% %MapiCamUsernameAtMapillary%





@echo ---------------------------------------------------
RMDIR %BlackVueFolder%\[RUN]-PROCESSED             >> %MapiCamLOG%
MKDIR %BlackVueFolder%\[RUN]-ALL_PROCESSED_END     >> %MapiCamLOG%
DIR                                                >> %MapiCamLOG%
DIR
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
