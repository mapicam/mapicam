cd %1%
@set MapiCamPhaseNum=[5]
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


mkdir "%BlackVueFolder%\Record"
mkdir "%BlackVueFolder%\Record\jpg"
mkdir "%BlackVueFolder%\Record\jpg\.mapillary"
mkdir "%BlackVueFolder%\Record\%BlackVueFPS%fps"
mkdir "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"
@echo.

:: Перенос(копіювання) ВСІХ файлів (.JPG) в окрему папку
:: це в межах підготовки до зміни дати та прошивки
:: http://www.cyberforum.ru/cmd-bat/thread734403.html
:: copy /Y 111 222            // https://ab57.ru/cmdlist/copy.html
:: xcopy 111 222 /Y /H /R     // https://ab57.ru/cmdlist/xcopy.html
:: move /Y 111 222            // https://ab57.ru/cmdlist/move.html
:: copy|xcopy|move --> /Y - це перезаписувати без попередження
:: xcopy           --> /Q - Запрет вывода имен копируемых файлов.
:: xcopy           --> /H - Копирование, среди прочих, скрытых и системных файлов.
:: xcopy           --> /R - Перезапись файлов, предназначенных только для чтения.
:: xcopy           --> /S - Перезапись файлов, предназначенных только для чтения.

@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
setlocal enableextensions enabledelayedexpansion
for /f %%I in ('dir /b/s/a-d "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames" ^| findstr /i ".jpg"') do (
:: copy /Y "%%I" "%BlackVueFolder%\Record\jpg"
:: xcopy "%%I" /Y /H /R "%BlackVueFolder%\Record\jpg"
move /Y "%%I" "%BlackVueFolder%\Record\jpg"                                                             >> %MapiCamLOG%
)
@echo ---------------------------------------------------
@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [5] END   : MoveJPG = OK                         #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.


@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [5] ---   : MoveFOLDER                           #
@echo #                                                  #
@echo ####################################################
@cd "%BlackVueFolder%\Record\%BlackVueFPS%fps\"
:: https://ab57.ru/cmdlist/attrib.html
:: R - Атрибут "Только чтение".
:: A - Атрибут "Архивный".
:: S - Атрибут "Системный".
:: H - Атрибут "Скрытый".
:: I - Атрибут "Неиндексированное содержимое".

cd /D "%BlackVueFolder%\Record\%BlackVueFPS%fps"
attrib -S -H /S /D  
:: ATTRIB -R -H -S -A /S /D
:: ATTRIB "%BlackVueFolder%\Record\%BlackVueFPS%fps" -R -H -S -A /S /D


  

@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
setlocal enableextensions enabledelayedexpansion
for /f "delims=" %%a in ('dir /b /s /on /ad "%BlackVueFolder%\Record\%BlackVueFPS%fps\" ^| findstr /L ".mapillary"') do (
@echo %date% %time% # %MapiCamPhaseNum% MOVE %%a                                                        >> %MapiCamLOG%
@cd %%a
@cd..\cd..\cd.. \cd..
:: dir
:: https://ss64.com/nt/robocopy.html
robocopy "..\.mapillary" "%BlackVueFolder%\Record\jpg\.mapillary" /S /E /MOVE
)
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo.
@echo.
@echo.



@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [5] ---   : CopyFOLDER (if not move)             #
@echo #                                                  #
@echo ####################################################
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
setlocal enableextensions enabledelayedexpansion
for /f "delims=" %%a in ('dir /b /s /on /ad "%BlackVueFolder%\Record\%BlackVueFPS%fps\" ^| findstr /L ".mapillary"') do (
@echo %date% %time% # %MapiCamPhaseNum% COPY %%a                                                        >> %MapiCamLOG%
@cd %%a
@cd..
@cd..
@cd.. 
dir
xcopy ".mapillary" "%BlackVueFolder%\Record\jpg\.mapillary" /Y /H /R /S                                 >> %MapiCamLOG%
)
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo.
dir

:: ВИДАЛЯЄМО папку з тимчасовими файлами Mapillary (якщо вона порожня)
RMDIR "%BlackVueFolder%\Record\%BlackVueFPS%fps\mapillary_sampled_video_frames"

@echo.
@echo.
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [5] END   : MoveJPG = OK                         #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [5] END   : MoveFOLDER = OK                      #
@echo #                                                  #
@echo ####################################################
@echo #                                                  #
@echo # [6] NEXT  : FixDateTime                          #
@echo #                                                  #
@echo ####################################################
@echo.
@echo.
@echo.
RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [5] END   : MoveJPG    = OK                                 # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [5] END   : MoveFOLDER = OK                                 # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [6] NEXT  : FixDateTime                                     # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%      
:: НЕ СТАВИТИ ПАУЗУ - бо НЕ БУДЕ працювати пакетна обробка!
