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
set testNodejsPath=wwwroot\test\bat\SettingCopyPHP2NODE\
setlocal EnableDelayedExpansion
if "%1"=="test" (
    echo SettingcopyPHP2NODE Test Mode11111111
    endlocal & ( 
        set incFilePath=%curPath%%testNodejsPath%wwwroot\conf\init.inc
        set templateFilePath=%curPath%%testNodejsPath%wwwroot\conf\init.origin.js
        set initJSFilePath=%curPath%%testNodejsPath%wwwroot\conf\init.js
        set nodejsPath=%curPath%%testNodejsPath%wwwroot\)
) else (
    echo SettingcopyPHP2NODE production Mode
    endlocal & ( 
        set incFilePath=c:\inetpub\wwwroot\PHP\conf\init.inc
        set templateFilePath=%curPath%wwwroot\conf\init.origin.js
        set initJSFilePath=%curPath%wwwroot\conf\init.js
        set nodejsPath=%curPath%wwwroot\)
)

echo. %incFilePath%
echo. %templateFilePath%
echo. %initJSFilePath%
echo. %nodejsPath%
set phpPath=c:\inetpub\wwwroot\PHP\
set iniXMLPath=%nodejsPath%conf\ini.xml
:main
    call :copyFiles
    :: GetAndReplace values to make init.js from init.inc
    set gVal1=unset
    call :getAndReplace
    call :convertFileToUTF8NoBom %initJSFilePath%

    :: Replace only at "PHP/img_staff" from ini.xml(Nodejs)
    echo "from ini.xml(Nodejs) replace: PHP/img_staff -> ../img_staff"
    call :replaceUsingPS PHP/img_staff,../img_staff,%iniXMLPath%
    call :convertFileToUTF8NoBom %iniXMLPath%
    :: Show windows-message after done
    if ERRORLEVEL 0 (
        call :windowOKMessage
    ) else (
        call :windowFAILMessage
    )
exit /b 0

:: Copy PHP setting files
:: to Nodejs folders
:copyFiles
    :: (#fortesting)copy %phpPath%bin\env.dat %curPath%env.dat
    :: 1
    if not exist %nodejsPath%bin\  mkdir %nodejsPath%bin\
    copy %phpPath%bin\env.dat %nodejsPath%bin\env.dat
    :: 2
    if not exist %nodejsPath%img_staff  mkdir %nodejsPath%img_staff
    robocopy /e %phpPath%img_staff %nodejsPath%img_staff
    :: 3
    if not exist %nodejsPath%img_map\  mkdir %nodejsPath%img_map\
    copy %phpPath%img_map\holeMap.jpg %nodejsPath%img_map\holeMap.jpg
    :: 4
    if not exist %nodejsPath%img_maptool\  mkdir %nodejsPath%img_maptool\
    copy %phpPath%img_maptool\baseMap.jpg %nodejsPath%img_maptool\baseMap.jpg
    :: 5
    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %nodejsPath%conf\init.origin.js %nodejsPath%conf\init.js
    :: 6
    if not exist %nodejsPath%conf\  mkdir %nodejsPath%conf\
    copy %phpPath%conf\ini.xml %nodejsPath%conf\ini.xml
exit /b 0

:: GetAndReplace values to make init.js from init.inc
:getAndReplace
    setlocal EnableDelayedExpansion
        :: Hard set for {APP_ROOT}
        set nodejsPathNoLastSlash=!nodejsPath:~0,-1!
        set nodejsPathDoubleSlash=!nodejsPathNoLastSlash:\=\\!
        call :replaceUsingPS {!replaceNames[11]!},!nodejsPathDoubleSlash!,!initJSFilePath!
        :: Get all values to confValues array
        for /l %%i in (1,1,%countNames%) do (
            call :getValueFromFile ""!variableNames[%%i]!""
            :: echo returnVal2: !gVal1!
            set confValues[%%i]=!gVal1!
            echo confValues:%%i - !confValues[%%i]!

            :: Replace in the file
            set searchVal={!replaceNames[%%i]!}
            set newVal=!confValues[%%i]!
            call :replaceUsingPS !searchVal!,!newVal!,!initJSFilePath!
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

:: Replace variable(%~1) with its value(%~2) in file(%~3)
:replaceUsingPS
    set search=%~1
    set newValue=%~2
    set fileReplace= %~3
    powershell -Command "(gc %fileReplace% -encoding utf8) -replace '%search%', '%newValue%' | Out-File -encoding utf8 %fileReplace%"
exit /b 0

:: Convert the file with file(%~1) to UTF8 No BOM
:convertFileToUTF8NoBom
    set filePath=%~1
    powershell -Command "$MyRawString = Get-Content -Raw %filePath%";$Utf8NoBomEncoding = New-Object System.Text.UTF8Encoding $False; [System.IO.File]::WriteAllLines('%filePath%', $MyRawString, $Utf8NoBomEncoding)
exit /b 0

:windowOKMessage
    %nodejsPath%bin\qmsg /i i /m "Copy and convert files from PHP to NODE SUCCESSFULLY!"
exit /b 0

:windowFAILMessage
    %nodejsPath%bin\qmsg /i i /m "Copy and convert files from PHP to NODE FAIL!"
exit /b 0
