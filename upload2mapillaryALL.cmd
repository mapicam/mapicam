@echo off
@echo . ############################################
@echo .
@echo . https://github.com/mapillary/mapillary_tools
@echo .
@echo . ############################################
@echo .
@echo . C:\ffmpeg\bin\mapillary_tools.exe process_and_upload --advanced --import_path "A/adjusted" --user_name velmyshanovnyi --number_threads 100 --max_attempts 50 --verbose  --rerun --flag_duplicates --duplicate_distance 0.5
@echo .
@echo . ############################################
@echo .

pause

:: C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name XXX --user_email YYY --user_password ZZZ
C:\ffmpeg\bin\mapillary_tools.exe  --advanced authenticate --user_name velmyshanovnyi

pause


:: �������� ������� (� ��������� ����� ���� �������� ���� �����. ��� ������ ����� � 3 ���� ����� ����.)
:: --keep_original

:: �������� ExtraWarningError
:: --verbose

:: ��� ���������� ������������, �� ���� �������� ������������ � ��������� (��������������� � ���)+(������������� ϲ��� --advanced)
:: --verbose --rerun

:: ���� � PATH �� ������ ����, �� ������� ����� �� ����
:: C:\ffmpeg\bin\mapillary_tools.exe

::   --flag_duplicates 
:: --duplicate_distance 0.5

:: --���������_�������� --���������_�������� (��������� ���������������� � ���). �������� �� ����� �� ������ ���� �� ���� �� 0.5 ����� (�� ���������, �������, �������� �� �����/����)
:: --flag_duplicates --duplicate_distance 0.5

:: ʳ������_������ 10 �� ʳ�����_����� 50
:: --number_threads 100 --max_attempts 50

C:\ffmpeg\bin\mapillary_tools.exe process_and_upload --advanced --import_path "ALL" --user_name velmyshanovnyi


@echo .
@echo . ##### VSE ZALYLOSIA #####
@echo . 
@echo . C:\ffmpeg\bin\mapillary_tools.exe process_and_upload --advanced --import_path "A/adjusted" --user_name velmyshanovnyi --number_threads 1 --max_attempts 3 --verbose  --rerun --flag_duplicates --duplicate_distance 0.5
@echo .

pause
