@echo off

mkdir backup

xcopy "%CD%" "%CD%"\backup

rem for /f "usebackq tokens=1 delims==" %%i in (`dir /b xxxxx_*.dat.gz`) do @set FOLDER=%%i
rem echo %FOLDER%
rem set HIDUKE=%FOLDER:~6,8%
rem echo %HIDUKE%

set HIDUKE=

set /P HIDUKE="Input yyyymmdd (e.g. 20190301): "

for /f "usebackq tokens=1 delims==" %%x in (`dir /b xxx_xxxxx_dtl_"%HIDUKE%"*.dat.gz`) do @7za.exe x %%x

rename xxx_xxxxx_dtl_"%HIDUKE%".dat xxx_xxxxx_dtl_"%HIDUKE%"_backup.dat

copy /b xxx_xxxxx_dtl_"%HIDUKE%"*.dat xxx_xxxxx_dtl_"%HIDUKE%".dat

rename xxx_xxxxx_dtl_"%HIDUKE%".dat.gz xxx_xxxxx_dtl_"%HIDUKE%"_backup.dat.gz

7za.exe a xxx_xxxxx_dtl_"%HIDUKE%".dat.gz xxx_xxxxx_dtl_"%HIDUKE%".dat

if not "%ERRORLEVEL%" == "0" (
  echo ファイルの圧縮に失敗しました
  pause
)
