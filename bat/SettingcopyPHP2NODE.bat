:: *******Begin SettingcopyPHP2NODE************
::   copy/convert PHP setting files
::   to Nodejs folders
:: *******End SettingcopyPHP2NODE**************
@echo off

:: Get values from init.inc
:: Replace values to init.js
set /a countNames=13

:: Names for getting values from inc file
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

:: Names for replacement
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
:: set incFilePath=%curPath%wwwroot\conf\test_init.inc
:: set templateFilePath=%curPath%wwwroot\conf\test_init.origin.js
:: set targetFilePath=%curPath%wwwroot\conf\test_init.js
set incFilePath=c:\inetpub\wwwroot\PHP\conf\init.inc
set templateFilePath=%curPath%wwwroot\conf\init.origin.js
set targetFilePath=%curPath%wwwroot\conf\init.js

set nodejsPath=%curPath%wwwroot\
set phpPath=c:\inetpub\wwwroot\PHP\
:main
    call :copyFiles

    :: GetAndReplace values to make init.js from init.inc
    set gVal1=unset
    call :getAndReplace
exit /b 0

:: Copy PHP setting files
:: to Nodejs folders
:copyFiles
    :: (#fortesting)copy %phpPath%bin\env.dat %curPath%env.dat
    if not exist %nodejsPath%bin\  mkdir %nodejsPath%bin\
    copy %phpPath%bin\env.dat %nodejsPath%bin\env.dat

    if not exist %nodejsPath%img_staff  mkdir %nodejsPath%img_staff
    robocopy /e %phpPath%img_staff %nodejsPath%img_staff

    if not exist %nodejsPath%img_map\  mkdir %nodejsPath%img_map\
    copy %phpPath%img_map\holeMap.jpg %nodejsPath%img_map\holeMap.jpg

    if not exist %nodejsPath%img_maptool\  mkdir %nodejsPath%img_maptool\
    copy %phpPath%img_maptool\baseMap.jpg %nodejsPath%img_maptool\baseMap.jpg

    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %nodejsPath%conf\init.origin.js %nodejsPath%conf\init.js

    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %phpPath%conf\ini.xml %nodejsPath%conf\ini.xml
exit /b 0

:: GetAndReplace values to make init.js from init.inc
:getAndReplace
    setlocal EnableDelayedExpansion
        :: Hard set for {APP_ROOT}
        set nodejsPathDoubleSlash=!nodejsPath:\=\\!
        call :replaceJSFile {!replaceNames[11]!},!nodejsPathDoubleSlash!
        :: Get all values to confValues array
        for /l %%i in (1,1,%countNames%) do (
            call :getValueFromFile ""!variableNames[%%i]!""
            :: echo returnVal2: !gVal1!
            set confValues[%%i]=!gVal1!
            echo confValues:%%i - !confValues[%%i]!

            :: Replace in the file
            set searchVal={!replaceNames[%%i]!}
            set newVal=!confValues[%%i]!
            call :replaceJSFile !searchVal!,!newVal!
        )
    endlocal
exit /b 0

:: Remove trailing and leading whitespace
:trim
    SetLocal EnableDelayedExpansion
    set Params=%*
    for /f "tokens=1*" %%a in ("!Params!") do EndLocal & set %1=%%b
exit /b 0

:: #searchEachLine Get Values from init.inc to confVals array
:getValueFromFile
    setlocal EnableDelayedExpansion
        set searchVal=%1
        echo searchVal !searchVal!
        for /f "Tokens=1,2 Delims=," %%a in (
            'type "%incFilePath%"^|find /i "%searchVal%"'
        ) Do (
            set value=%%b
            :: remove redundants
            call :trim value !value!
            set "value=!value:)=!"
            set "value=!value:;=!"
            set "value=!value: "="!"
            set "value=!value:"=!"
            set value="!value!"
            goto :returnVal
            exit /b 0
        )
        :returnVal
            endlocal & ( 
                set gVal1=%value%)
exit /b 0

:: Replace variable(%~1) with its value(%~2)
:replaceJSFile
    setlocal enableextensions disabledelayedexpansion
    set search=%~1
    set newValue=%~2
    for /f "delims=" %%i in ('type "%targetFilePath%" ^& break ^> "%targetFilePath%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%targetFilePath%" echo !line:%search%=%newValue%!
        endlocal
    )
exit /b 0
