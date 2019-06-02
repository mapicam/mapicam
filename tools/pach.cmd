:: додати до системного шляху наступні папки:
:: запускати цепй скрипт від імені адміністратора
:: -----------------------------------------
setx /M PATH "c:\ffmpeg\bin;%PATH%"
setx /M PATH "D:\mapicam\tools\csv2xlsx;%PATH%"
setx /M PATH "D:\mapicam\tools\exiftool;%PATH%"
setx /M PATH "D:\mapicam\tools\ffmpeg\bin;%PATH%"
setx /M PATH "D:\mapicam\tools\mapillary;%PATH%"
cmd /k
