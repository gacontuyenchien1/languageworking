@echo off
@REM set /a countNames=13
@REM set variableNames[1]=JT_HOSTNAME
@REM set variableNames[2]=JT_ORA_HOSTNAME
@REM set variableNames[3]=TEST1

set /a countNames=13
Set variableNames[1]=JT_HOSTNAME
Set variableNames[2]=JT_ORA_HOSTNAME
Set variableNames[3]=PATH_FSX8000
Set variableNames[4]=ZDT_PORT
Set variableNames[5]=ZD_TOKUSHO_HOSTNAME
Set variableNames[6]=ZD_TOKUSHO_DIR
Set variableNames[7]=MAIN_HOSTNAME
Set variableNames[8]=HC_HOSTNAME
Set variableNames[9]=HC_TYPE
Set variableNames[10]=HCS_HOSTNAME
Set variableNames[11]=APP_ROOT
Set variableNames[12]=FTP_SERVER
Set variableNames[13]=HYPER_ACCESS

set confValues[1]=unset
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

    set gVal1=unset
    call :getAllValues
pause
exit /b 0

:getAllValues
    @REM for /l %%i in (1,1,%countNames%) do (
    @REM     call :getValues %%variableNames[%%i]%%
    @REM     echo returnVal2: %gVal1%
    @REM )
    setlocal EnableDelayedExpansion
        @REM Get all values to confValues array
        for /l %%i in (1,1,%countNames%) do (
            call :getValues !variableNames[%%i]!
            @REM echo returnVal2: !gVal1!
            set confValues[%%i]=!gVal1!
            echo confValues:%%i - !confValues[%%i]!

            @REM Replace in the file
            @REM set searchVal={!variableNames[%%i]!}
            @REM set newVal=!confValues[%%i]!
            @REM call :replaceJSFile !searchVal!,!newVal!
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
        @REM echo !searchVal!
        set file=C:\tmp\languageworking\bat\unittest\init.inc
        for /f "Tokens=1,2 Delims=," %%a in (
            'type "%file%"^|find /i "%searchVal%"'
        ) Do (
            set value=%%b
            @REM echo !value!
            @REM remove redundants
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
    set "textFile=C:\tmp\languageworking\bat\UnitTest1.txt"
    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo !line:%search%=%replace%!
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