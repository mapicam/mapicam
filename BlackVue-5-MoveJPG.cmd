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
:: 
:: https://stackoverflow.com/questions/38554131/merge-all-gpx-files-within-a-folder-into-one-file-with-gpsbabel 
:: 
cd %1%
@set MapiCamPhaseNum=[5]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date% %time% #                                                                                   >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [5] START : MoveJPG                                           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ####################################################
@echo #                                                  #
@echo # [5] START : MoveJPG                              #
@echo #                                                  #
@echo ####################################################
@echo.

@echo.
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS                                            #
@echo #-------------------------------------------------------------#
@echo OFF
set year=%date:~-4%
set month=%date:~3,2%
  if "%month:~0,1%" == " " set month=0%month:~1,1%
set day=%date:~0,2%
  if "%day:~0,1%" == " " set day=0%day:~1,1%
set hour=%time:~0,2%
  if "%hour:~0,1%" == " " set hour=0%hour:~1,1%
set min=%time:~3,2%
  if "%min:~0,1%" == " " set min=0%min:~1,1%
set secs=%time:~6,2%
  if "%secs:~0,1%" == " " set secs=0%secs:~1,1%
set msec=%time::=%
  set msec=%msec:~-2%
set datetimefull=%year%-%month%-%day%T%hour%:%min%:%secs%Z
set MapiCamDate=%year%%month%%day%
set MapiCamTime=%hour%%min%%secs%
@echo ON
@echo #                                                             #
@echo # date         = %date%                                   #
@echo # time         = %time%                                  #
@echo # year         = %year%                                         #
@echo # month        = %month%                                           #
@echo # day          = %day%                                           #
@echo # hour         = %hour%                                           #
@echo # min          = %min%                                           #
@echo # secs         = %secs%                                           #
@echo # msec         = %msec%                                           #
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.
cd %1%
setlocal enableextensions enabledelayedexpansion
::   MapiCamFolder=D:\mapicam
@set MapiCamFolder=D:\mapicam
::   version 0.4.2 - TRUE // version 0.5.0 - FALSE // 
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
::   MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools-050.exe
:: Використовуємо механіку, коли ЯРЛИК (LNK) зчитує розташування і СКРИПТ працює відносно папки з якої запустили LNK
::   BlackVueFolder=F:\BlackVue
@set BlackVueFolder=%1%
::   BlackVueFPS=10
@set BlackVueFPS=%2%
::   BlackVueInterval 0.1
@IF %BlackVueFPS%==30    ( set BlackVueInterval=0.033 )
@IF %BlackVueFPS%==10    ( set BlackVueInterval=0.1   )
@IF %BlackVueFPS%==5     ( set BlackVueInterval=0.2   )
@IF %BlackVueFPS%==2     ( set BlackVueInterval=0.5   )
@IF %BlackVueFPS%==1     ( set BlackVueInterval=1     )
@IF %BlackVueFPS%==0.5   ( set BlackVueInterval=2     )
@IF %BlackVueFPS%==0.2   ( set BlackVueInterval=5     )
@IF %BlackVueFPS%==0.1   ( set BlackVueInterval=10    )
@IF %BlackVueFPS%==0.033 ( set BlackVueInterval=30    ) 
ELSE ( set BlackVueInterval=0.1 )
::   --offset_angle 0
@set BlackVueOffsetAngle=%3%
::   --duplicate_distance 0.2
@set BlackVueDuplicateDistance=%4%
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
@echo %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%
@echo %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%
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
@echo %date% %time% # %MapiCamPhaseNum% BlackVueOffsetAngle        = %BlackVueOffsetAngle%              >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% BlackVueDuplicateDistance  = %BlackVueDuplicateDistance%        >> %MapiCamLOG%
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
@echo # [5] END   : MoveFOLDER                           #
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
@echo # [5] END   : CopyFOLDER (if not move)             #
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
