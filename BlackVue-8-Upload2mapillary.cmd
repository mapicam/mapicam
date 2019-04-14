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


@set MapiCamPhaseNum=[8]
@set MapiCamLOG=mapicam-LOG.txt
@echo %date%%time% #                                                                                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% ############################################################### >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [8] START : Upload2Mapillary                                  >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] START : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
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
@echo # datetimefull = %datetimefull%                         #
@echo # MapiCamDate  = %MapiCamDate%                                     #
@echo # MapiCamTime  = %MapiCamTime%                                       #
@echo #                                                             #
@echo #-------------------------------------------------------------#
@echo #  YYYYMMDD HHMMSS (END)                                      #
@echo #-------------------------------------------------------------#
@echo.

@echo ---------------------------------------------------------------
@echo.
@echo https://github.com/mapillary/mapillary_tools
@echo.
@echo ---------------------------------------------------------------

setlocal enableextensions enabledelayedexpansion

@set MapiCamMapillaryTools=D:\mapicam\tools\mapillary\mapillary_tools.exe
:: BlackVueFolder=F:\BlackVue
:: ������������� ��������, ���� ����� (LNK) ����� ������������ � ������ ������ ������� ����� � ��� ��������� LNK
@set BlackVueFolder=%1%
:: --user_name velmyshanovnyi
@set MapiCamUsernameAtMapillary=%5%
@set uploadUserName=%5%
:: --duplicate_distance 0.2
@set uploadDuplicateDistance=%3%
:: --import_path "Record\jpg"
::                Record\jpg\.mapillary (��� �� �� ������ ����� � ������� �������)
@set uploadImportPath=Record\jpg
@set MapiCamLOG=%BlackVueFolder%\mapicam-LOG.txt

@echo.
@echo %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%
@echo %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%
@echo %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%
@echo %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%
@echo %MapiCamPhaseNum% uploadUserName             = %uploadUserName%
@echo %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%
@echo %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%
@echo %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath%
@echo %MapiCamPhaseNum% uploadDuplicateDistance    = %uploadDuplicateDistance%
@echo.
@echo %date%%time% # %MapiCamPhaseNum% MapiCamPhaseNum            = %MapiCamPhaseNum%                  >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamLOG                 = %MapiCamLOG%                       >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamMapillaryTools      = %MapiCamMapillaryTools%            >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% MapiCamUsernameAtMapillary = %MapiCamUsernameAtMapillary%       >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadUserName             = %uploadUserName%                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% BlackVueFolder             = %BlackVueFolder%                   >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadImportPath           = %uploadImportPath%                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                            = %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% uploadDuplicateDistance    = %uploadDuplicateDistance%          >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------

mkdir %BlackVueFolder%\Record
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg
cd %BlackVueFolder%\Record\jpg


@echo ---------------------------------------------------
@echo SEE CODE IF ERROR - @HTTP Error 403
:: HTTP error: HTTP Error 403: Forbidden on 20190403_182624_NF_000032.jpg, will attempt upload again for 49 more times
:: https://github.com/mapillary/mapillary_tools/issues/328
:: 
:: https://github.com/mapillary/mapillary_tools/issues/328
:: Steps to fix that are:
:: 
:: [1]DELETE .config -  Mapillary credentials by deleting .config file. Default is ~/.config/mapillary/config  --- For Win10 (%homedrive%\.config\mapillary)
:: �����ߪ�� ������ ����� ������������ (C:\Users\velmy\.config\mapillary\config)
:: REM cd c:\
:: REM cd %HOMEPATH%
:: REM DEL /F/Q/S %HOMEPATH%\.config\mapillary\*.* > NUL
:: REM DEL /F/Q/S %HOMEPATH%\.config\mapillary\* > NUL
:: REM RMDIR /Q/S %HOMEPATH%\.config\mapillary
:: REM %MapiCamMapillaryTools% authenticate --advanced --user_name %uploadUserName%
:: [2] RUN               process again on each folder re-authenticating when prompted
:: [3] UPLOAD            Upload reprocessed imagery.
:: 

:: %MapiCamMapillaryTools% authenticate --advanced --user_name %uploadUserName%

::echo %date%%time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% authenticate --advanced --user_name %uploadUserName% >> %MapiCamLOG%
::echo %MapiCamMapillaryTools% authenticate --advanced --user_name %uploadUserName% >> %MapiCamLOG%
::echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name XXX --user_email YYY --user_password ZZZ
:: ������� ��� ������� �����, ���� ����� �������������
:: �� ������ͪ: ������� �������� �� � ��� � ������ ��� ��������, � ���� � - �� ��������� ���� ���
:: %MapiCamMapillaryTools% authenticate --advanced --user_name %uploadUserName%




:: �������� ������� (� ��������� ����� ���� �������� ���� �����. ��� ������ ����� � 3 ���� ����� ����.)
:: --keep_original

:: �������� ExtraWarningError
:: --verbose

:: ��� ���������� ������������, �� ���� ��������� ������������ � ��������� (��������������� � ���)+(������������� ϲ��� --advanced)
:: --verbose --rerun

:: ���� � PATH �� ������ ����, �� ������� ����� �� ����
:: C:\ffmpeg\bin\mapillary_tools.exe

:: --flag_duplicates 
:: --duplicate_distance 0.5

:: --���������_�������� --���������_�������� (��������� ���������������� � ���). �������� �� ����� �� ������ ���� �� ���� ��� 0.5 ����� (�� ���������, �������, �������� �� �����/����)
:: --flag_duplicates --duplicate_distance 0.5
:: --flag_duplicates ����� ����в� � �� ���������������, ������ ����� ������ --duplicate_distance 0.2

:: ʳ������_������ 10 �� ʳ�����_����� 50
:: --number_threads 10 --max_attempts 50



@echo.
@echo ---------------------------------------------------------------
@echo upload             = ERROR-403: %MapiCamMapillaryTools% upload --import_path %BlackVueFolder%\%uploadImportPath%
:: �����!!! ��� UPLOAD: �� ����� ������� 
::     --number_threads
::     --max_attempts
::     --duplicate_distance
:: �� �������
:: %MapiCamMapillaryTools% upload -advanced --import_path "%BlackVueFolder%\%uploadImportPath%"
@echo process_and_upload = ERROR-403 ((
@echo process            = ...
@echo ---------------------------------------------------------------
@echo.

@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% ERROR-403: %MapiCamMapillaryTools% upload --import_path %BlackVueFolder%\%uploadImportPath% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% process_and_upload = RUN                                        >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% parametr =                                                      >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --number_threads 10 --max_attempts 50 --duplicate_distance %uploadDuplicateDistance% >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%



:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --duplicate_distance %uploadDuplicateDistance%
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --number_threads 10 --max_attempts 50 --duplicate_distance %uploadDuplicateDistance%
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --number_threads 10 --max_attempts 50 --duplicate_distance %uploadDuplicateDistance% >> %MapiCamLOG%

%MapiCamMapillaryTools% process_and_upload --advanced --import_path "%BlackVueFolder%\%uploadImportPath%" --user_name %uploadUserName% --number_threads 10 --max_attempts 2 --verbose --rerun --duplicate_distance %uploadDuplicateDistance% >> %MapiCamLOG% >> %MapiCamLOG%



@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% process_and_upload = COMPLETE :-)                               >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------------------
@echo process_and_upload = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.


:: ���� ����� ������������ - �� ������������ ���
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%uploadImportPath%" --user_name %uploadUserName% --number_threads 1 --max_attempts 2 --verbose --rerun --duplicate_distance %uploadDuplicateDistance%


@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] END   : Upload2Mapillary                                #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [9] NEXT  : CleanMapillaryCache                             #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.

@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [8] END   : Upload2Mapillary                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% # [9] NEXT  : ................                                # >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date%%time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: �� ������� ����� - �� �� ���� ��������� ������� �������!

cmd /k