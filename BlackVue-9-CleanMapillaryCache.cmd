cd %1%
@set MapiCamPhaseNum=[9]
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




@echo ---------------------------------------------------
@echo 

:: [1]DELETE 
:: ВИДАЛЯЄМО глючні файли конфігурації (C:\Users\velmy\.config\mapillary\config)
cd c:\
cd %BlackVueFolder%\%uploadImportPath%\.mapillary\logs
dir
DEL /F/Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary\logs\* > NUL
RMDIR /Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary\logs
RMDIR /Q/S %BlackVueFolder%\%uploadImportPath%\.mapillary
cd %BlackVueFolder%\%uploadImportPath%
dir

:: відтестити чи видаляє!
echo ######################################## START .mp4 ######################################
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".mp4"') do (
set BlackVueCall=%%I
echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %%I
DEL /F/Q/S %%I > NUL
)
echo ############################################## END .mp4 ##################################
:: відтестити чи видаляє!
echo ######################################## START .JPG ######################################
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".jpg"') do (
set BlackVueCall=%%I
echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %%I
DEL /F/Q/S %%I > NUL
)
echo ############################################## END .JPG ##################################
:: відтестити чи видаляє!
echo ######################################## START .json ######################################
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record" ^| findstr /i ".json"') do (
set BlackVueCall=%%I
echo BlackVueCall = !BlackVueCall! = %BlackVueCall% = %%I
DEL /F/Q/S %%I > NUL
DEL /F/Q/S geotag_process.*              > NUL
DEL /F/Q/S geotag_process_*              > NUL
DEL /F/Q/S import_meta_data_process.*    > NUL
DEL /F/Q/S import_meta_data_process_*    > NUL
DEL /F/Q/S manual_upload                 > NUL
DEL /F/Q/S mapillary_image_description.* > NUL
DEL /F/Q/S mapillary_image_description_* > NUL
)
echo ############################################## END .json ##################################





@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% DELETE - COMPLETE :-)                                           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
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
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [ 9] END  : Upload2Mapillary                                # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [10] NEXT : ................                                # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!


