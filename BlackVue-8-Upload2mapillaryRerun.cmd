cd %1%
@set MapiCamPhaseNum=[8]
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
mkdir %BlackVueFolder%\Record\%BlackVueFPS%fps
mkdir %BlackVueFolder%\Record\gpx
mkdir %BlackVueFolder%\Record\jpg


@echo ---------------------------------------------------
@echo SEE CODE IF ERROR - @HTTP Error 403
:: HTTP error: HTTP Error 403: Forbidden on 20190403_182624_NF_000032.jpg, will attempt upload again for 49 more times
:: https://github.com/mapillary/mapillary_tools/issues/328
:: Steps to fix that are:
:: 
:: [1] DELETE .config -  Mapillary credentials by deleting .config file. Default is ~/.config/mapillary/config  --- For Win10 (%homedrive%\.config\mapillary)
:: �����ߪ�� ������ ����� ������������ (C:\Users\velmy\.config\mapillary\config)
:: cd c:\
:: cd %HOMEPATH%
:: DEL /F/Q/S %HOMEPATH%\.config\mapillary\*.* > NUL
:: DEL /F/Q/S %HOMEPATH%\.config\mapillary\* > NUL
:: RMDIR /Q/S %HOMEPATH%\.config\mapillary

:: [2] RUN               process again on each folder re-authenticating when prompted
:: %MapiCamMapillaryTools% authenticate --advanced --help
:: %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary%
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --help
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --user_name velmyshanovnyi
:: [3] UPLOAD            Upload reprocessed imagery.
:: 

::echo %date%%time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary% >> %MapiCamLOG%
::echo %MapiCamMapillaryTools% authenticate --advanced --user_name %MapiCamUsernameAtMapillary%                                  >> %MapiCamLOG%
::echo %date%%time% # %MapiCamPhaseNum%                                                                                          >> %MapiCamLOG%
:: D:\mapicam\tools\mapillary\mapillary_tools.exe  --advanced authenticate --user_name XXX --user_email YYY --user_password ZZZ
:: ������� ��� ������� �����, ���� ����� �������������
:: �� ������ͪ: ������� �������� �� � ��� � ������ ��� ��������, � ���� � - �� ��������� ���� ���
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --help
:: D:\mapicam\tools\mapillary\mapillary_tools.exe authenticate --advanced --user_name velmyshanovnyi --help




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
@echo IF upload = ERROR-403 USE version 0.4.2 - TRUE // version 0.5.0 - FALSE //  %MapiCamMapillaryTools% upload --verbose --advanced --import_path "%BlackVueFolder%\%uploadImportPath%"  --number_threads 5 --max_attempts 100
:: �����!!! ��� UPLOAD: �� ����� ������� 
::     --number_threads
::     --max_attempts
::     --duplicate_distance
:: �� �������
:: %MapiCamMapillaryTools% upload -advanced --import_path "%BlackVueFolder%\%uploadImportPath%"
@echo process            = ...
@echo ---------------------------------------------------------------
@echo.


@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% upload = RUN                                                    >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% parametr =                                                      >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% %MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --rerun --import_path "%BlackVueFolder%\%uploadImportPath%" --geotag_source_path "%BlackVueFolder%\Record\gpx\0\interpolate.gpx" --user_name %MapiCamUsernameAtMapillary% --offset_angle %BlackVueOffsetAngle% --cutoff_distance 1000 --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --video_sample_interval %BlackVueInterval% --list_file_status --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG% >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%

@echo on
:: D:\mapicam\tools\mapillary\mapillary_tools.exe process_and_upload --advanced --help
%MapiCamMapillaryTools% process_and_upload --advanced --help
%MapiCamMapillaryTools% process_and_upload --advanced --help             
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%                                                                   >> %MapiCamLOG%
%MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --rerun --import_path "%BlackVueFolder%\%uploadImportPath%" --geotag_source_path "%BlackVueFolder%\Record\gpx\0\interpolate.gpx" --user_name %MapiCamUsernameAtMapillary% --offset_angle %BlackVueOffsetAngle% --cutoff_distance 1000 --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --video_sample_interval %BlackVueInterval% --list_file_status --device_make "Blackvue" --device_model "DR900S-1CH" --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%
@echo off
:: %MapiCamMapillaryTools% process_and_upload --advanced --version --verbose --import_path "%BlackVueFolder%\%uploadImportPath%" --rerun --user_name %MapiCamUsernameAtMapillary%  --offset_angle 0 --cutoff_distance 10000 --interpolate_directions --duplicate_distance %BlackVueDuplicateDistance% --move_duplicates --move_uploaded --list_file_status --overwrite_all_EXIF_tags --overwrite_EXIF_time_tag --overwrite_EXIF_gps_tag --overwrite_EXIF_direction_tag --overwrite_EXIF_orientation_tag --number_threads 1 --max_attempts 100 >> %MapiCamLOG%

@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% upload = COMPLETE :-)                                           >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
@echo.
@echo ---------------------------------------------------------------
@echo upload = COMPLETE :-)
@echo ---------------------------------------------------------------
@echo.

:: ���� ����� ������������ - �� ������������ ���
:: %MapiCamMapillaryTools% process_and_upload --advanced --import_path "%uploadImportPath%" --user_name %MapiCamUsernameAtMapillary% --number_threads 1 --max_attempts 2 --verbose --rerun --duplicate_distance %BlackVueDuplicateDistance%

@echo.
@echo.
@echo.
@echo ###############################################################
@echo #                                                             #
@echo # [8] END   : Upload2Mapillary ReRUN                          #
@echo #                                                             #
@echo ###############################################################
@echo #                                                             #
@echo # [9] NEXT  : CleanMapillaryCache                             #
@echo #                                                             #
@echo ###############################################################
@echo.
@echo.
@echo.

@RMDIR %BlackVueFolder%\%MapiCamPhaseNum%-PROCESSED
@MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-TRUE
@MKDIR %BlackVueFolder%\%MapiCamPhaseNum%-UPLOAD-2-MAPILLARY-COMPLETE

@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [8] END   : Upload2Mapillary ReRUN                          # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% # [9] NEXT  : ................                                # >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum% --------------------------------------------------------------- >> %MapiCamLOG%
@echo %date% %time% # %MapiCamPhaseNum%                                                                 >> %MapiCamLOG%
:: �� ������� ����� - �� �� ���� ��������� ������� �������!
cmd /k
