cd %1%
setlocal enableextensions enabledelayedexpansion

mkdir Record
mkdir jpg

@echo D:\mapicam\tools\mapillary\mapillary_tools-050.exe upload --verbose --advanced --import_path "jpg" --number_threads 10 --max_attempts 100 >> mapillary_tools-upload.log

D:\mapicam\tools\mapillary\mapillary_tools-050.exe upload --verbose --advanced --import_path "jpg" --number_threads 10 --max_attempts 100



cmd /k
