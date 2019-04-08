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


:: зберегти оригінал (в тимчасовій папці буде створено копію файла. але процес займає в 3 рази більше часу.)
:: --keep_original

:: показати ExtraWarningError
:: --verbose

:: для повторного завантаження, чи коли попереднє завантаження з помилками (використовувати в парі)+(розташовувати ПІСЛЯ --advanced)
:: --verbose --rerun

:: якщо в PATH не зберігає шлях, то вказуємо лінком на ФАЙЛ
:: C:\ffmpeg\bin\mapillary_tools.exe

::   --flag_duplicates 
:: --duplicate_distance 0.5

:: --Позначати_дублікати --Дистанція_дублікатів (параметри використовуються в парі). Видаляти всі фотки які ближче одна до одної ніж 0.5 метра (це світлофори, зупинки, заправки та Старт/Стоп)
:: --flag_duplicates --duplicate_distance 0.5

:: Кількість_потоків 10 та Кількісь_спроб 50
:: --number_threads 100 --max_attempts 50

C:\ffmpeg\bin\mapillary_tools.exe process_and_upload --advanced --import_path "ALL" --user_name velmyshanovnyi


@echo .
@echo . ##### VSE ZALYLOSIA #####
@echo . 
@echo . C:\ffmpeg\bin\mapillary_tools.exe process_and_upload --advanced --import_path "A/adjusted" --user_name velmyshanovnyi --number_threads 1 --max_attempts 3 --verbose  --rerun --flag_duplicates --duplicate_distance 0.5
@echo .

pause
