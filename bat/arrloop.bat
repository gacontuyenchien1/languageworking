:: *******Begin SettingcopyPHP2NODE************
::   copy/convert PHP setting files
::   to Nodejs folders
:: *******End SettingcopyPHP2NODE**************

@echo off

:: Get values from init.inc
:: Replace values to init.js
set /a countNames=13
@REM set variableNames[1]=JT_HOSTNAME
@REM set variableNames[2]=JT_ORA_HOSTNAME
@REM set variableNames[3]=PATH_FSX8000
@REM set variableNames[4]=ZDT_PORT
@REM set variableNames[5]=ZD_TOKUSHO_HOSTNAME
@REM set variableNames[6]=ZD_TOKUSHO_DIR
@REM set variableNames[7]=MAIN_HOSTNAME
@REM set variableNames[8]=HC_HOSTNAME
@REM set variableNames[9]=HC_TYPE
@REM set variableNames[10]=HCS_HOSTNAME
@REM set variableNames[11]=APP_ROOT
@REM set variableNames[12]=FTP_SERVER
@REM set variableNames[13]=HYPER_ACCESS

@REM Names for getting values from inc file
set variableNames[1]=JT_HOSTNAME
set variableNames[2]=HC_HOSTNAME
set variableNames[3]=HC_HOSTNAME
set variableNames[4]=ZDT_PORT
set variableNames[5]=ZD_TOKUSHO_HOSTNAME
set variableNames[6]=ZD_TOKUSHO_DIR
set variableNames[7]=MAIN_HOSTNAME
set variableNames[8]=HC_HOSTNAME
set variableNames[9]=HC_TYPE
set variableNames[10]=HCS_HOSTNAME
set variableNames[11]=APP_ROOT
set variableNames[12]=FTP_SERVER
set variableNames[13]=HYPER_ACCESS

@REM Names for replacement
set replaceNames[1]=JT_HOSTNAME
set replaceNames[2]=HC_HOSTNAME
set replaceNames[3]=HC_HOSTNAME
set replaceNames[4]=ZDT_PORT
set replaceNames[5]=ZD_TOKUSHO_HOSTNAME
set replaceNames[6]=ZD_TOKUSHO_DIR
set replaceNames[7]=MAIN_HOSTNAME
set replaceNames[8]=HC_HOSTNAME
set replaceNames[9]=HC_TYPE
set replaceNames[10]=HCS_HOSTNAME
set replaceNames[11]=APP_ROOT
set replaceNames[12]=HCFTP_SERVER
set replaceNames[13]=USE_HYPER

set confValues[1]=unset

set curPath=%~dp0
@REM set incFilePath=c:\inetpub\wwwroot\PHP\conf\init.inc
set incFilePath=%curPath%wwwroot\conf\test_init.inc
set templateFilePath=%curPath%wwwroot\conf\test_init.origin.js
set targetFilePath=%curPath%wwwroot\conf\test_init.js
set nodejsPath=%curPath%wwwroot\
set phpPath=c:\inetpub\wwwroot\PHP\
:main
    @rem call :testLoop
    @REM call :getValuesFromInc
    @REM call :testIf
    @REM call :testFunc

    @REM set gVal1=unset
    @REM call :getValues JT_ORA_HOSTNAME
    @REM echo returnVal2: %gVal1%

    @REM call :testReplaceSpecialChar

    @REM call :replaceJSFile {JT_HOSTNAME},trongdz
    @REM for /l %%i in (1,1,%countNames%) do call echo %%i- %%confValues[%%i]%%

    call :copyFiles
    @REM set gVal1=unset
    @REM call :getAllValues
pause
exit /b 0

:: Copy PHP setting files
:: to Nodejs folders
:copyFiles
    @REM (#fortesting)copy %phpPath%bin\env.dat %curPath%env.dat
    if not exist %nodejsPath%bin\  mkdir %nodejsPath%bin\
    copy %phpPath%bin\env.dat %nodejsPath%bin\env.dat

    if not exist %nodejsPath%img_staff  mkdir %nodejsPath%img_staff
    robocopy /e %phpPath%img_staff %nodejsPath%img_staff

    if not exist %nodejsPath%img_map\  mkdir %nodejsPath%img_map\
    copy %phpPath%img_map\holeMap.jpg %nodejsPath%img_map\holeMap.jpg

    if not exist %nodejsPath%img_maptool\  mkdir %nodejsPath%img_maptool\
    copy %phpPath%img_maptool\baseMap.jpg %nodejsPath%img_maptool\baseMap.jpg

    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %phpPath%conf\init.inc %nodejsPath%conf\init.js

    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %phpPath%conf\ini.xml %nodejsPath%conf\ini.xml
exit /b 0

:getAllValues
    setlocal EnableDelayedExpansion
        @REM Get all values to confValues array
        for /l %%i in (1,1,%countNames%) do (
            call :getValues ""!variableNames[%%i]!""
            @REM echo returnVal2: !gVal1!
            set confValues[%%i]=!gVal1!
            echo confValues:%%i - !confValues[%%i]!

            @REM Replace in the file
            set searchVal={!replaceNames[%%i]!}
            set newVal=!confValues[%%i]!
            call :replaceJSFile !searchVal!,!newVal!
        )
        @REM for /l %%i in (1,1,%countNames%) do call echo %%i- !confValues[%%i]!
        @REM replace in the file
        @REM for /l %%i in (1,1,%countNames%) do (
        @REM     set searchVal={!variableNames[%%i]!}
        @REM     set newVal=!confValues[%%i]!
        @REM     @REM echo. replace: !searchVal!,!newVal!
        @REM     call :replaceJSFile !searchVal!,!newVal!
        @REM )
    endlocal
exit /b 0

@REM Remove trailing and leading whitespace
:trim
    SetLocal EnableDelayedExpansion
    set Params=%*
    for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
exit /b

:testFunc
    SETLOCAL
    CALL :SetValue value1,value2
    echo %value1%
    echo %value2%
    endlocal
EXIT /B %ERRORLEVEL%

:SetValue
set "%~1=5"
set "%~2=10"
EXIT /B 0

:testIf
    set /A index=2
    echo index: %index%
    echo variableNames[1]: %variableNames[1]%
     
    setlocal EnableDelayedExpansion
    call echo using 4 percent icon: %%variableNames[%index%]%%
    echo using `!a[%b%]!`: !variableNames[%index%]!
    if "!variableNames[%index%]!"=="JT_ORA_HOSTNAME" (
        echo Yeah, if is working!!!
    ) else (
        echo No, if is not working!!!
    )

    set curName=!variableNames[%index%]!
    echo curName: %curName%
    endlocal
exit /b 0

@REM #searchEachLine Get Values from init.inc to confVals array
:getValuesFromInc
    echo ::getValuesFromInc
    set /a curGettingID=1
    setlocal EnableDelayedExpansion
        set file=C:\tmp\languageworking\bat\UnitTest.txt
        for /f "tokens=1,2  Delims=," %%a in (%file%) do (
            echo.
            set key=%%~a
            @REM echo !key!
            set searchVal=!variableNames[%curGettingID%]!
            echo searchVal !searchVal!
            set keyChanged=!key:%searchVal%=!
            echo keyChanged: !keyChanged!
            if not x"!key:!searchVal!=!"==x"!key!" (
                echo If is good
            	set Val=%%~b
            	set confVals[!curGettingID!]=!Val!
            	set /A curGettingID+=1
            )
        )

        echo Number of processed arguments: %curGettingID%
        for /l %%i in (1,1,%curGettingID%) do echo %%i- !confVals[%%i]!
    endlocal
exit /b 0

:getValues
    setlocal EnableDelayedExpansion
        @REM echo.
        @REM echo ::called getValues
        @REM set searchVal=JT_HOSTNAME
        set searchVal=%1
        echo searchVal !searchVal!
        @REM set file=C:\tmp\languageworking\bat\unittest\init.inc
        for /f "Tokens=1,2 Delims=," %%a in (
            'type "%incFilePath%"^|find /i "%searchVal%"'
        ) Do (
            set value=%%b
            @REM echo !value!
            @REM remove redundants
            call :trim value !value!
            set "value=!value:)=!"
            set "value=!value:;=!"
            set "value=!value: "="!"
            set "value=!value:"=!"
            set value="!value!"
            @REM echo getValues !value!
            goto :returnVal
            exit /b 0
        )
        :returnVal
            endlocal & ( 
                set gVal1=%value%)
goto :eof

:testLoop
set Arr[0]=1 
set Arr[1]=2 
set Arr[2]=3 
set Arr[3]=4 
set /a x=0
:SymLoop 

if defined Arr[%x%] ( 
   call echo %%Arr[%x%]%% 
   set /a "x+=1"
   goto :SymLoop 
)
echo "The length of the array is" %x%
exit /b 0

:replaceJSFile
    setlocal enableextensions disabledelayedexpansion
    set search=%~1
    set replace=%~2
    @REM set search={JT_HOSTNAME}
    @REM set replace=trongdz
    @REM set "targetFilePath=C:\tmp\languageworking\bat\UnitTest1.txt"
    for /f "delims=" %%i in ('type "%targetFilePath%" ^& break ^> "%targetFilePath%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%targetFilePath%" echo !line:%search%=%replace%!
        endlocal
    )
exit /b 0

:testReplaceSpecialChar
    setlocal EnableDelayedExpansion
        set str=abcd);
        echo strbefore: !str!
        set str=!str:)=!
        echo strafter: !str!
    endlocal
exit /b 0
