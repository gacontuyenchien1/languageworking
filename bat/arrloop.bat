@echo off
set variableNames[1]=JT_HOSTNAME
set variableNames[2]=JT_ORA_HOSTNAME

:main
    @rem call :testLoop
    @REM call :getValuesFromInc
    @REM call :testIf
    @REM call :testFunc
    set gVal1=unset
    call :getValues JT_ORA_HOSTNAME
    echo returnVal2: %gVal1%

    @REM call :testFunc
pause
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
        @REM echo ::getValues
        @REM set searchVal=JT_HOSTNAME
        set searchVal=%1
        @REM echo !searchVal!
        set file=C:\tmp\languageworking\bat\UnitTest.txt
        for /f "Tokens=1,2 Delims=," %%a in (
            'type "%file%"^|find /i "%searchVal%"'
        ) Do (
            set value=%%b
            echo !value!
            @REM remove redundants
            set value=!value:");=!
            set value=!value: "=!
            set value="!value!"
            echo getValues !value!
            
            goto :returnVal
            @REM goto :eof
            exit /b 0
        )
        :returnVal
        endlocal & ( set gVal1=%value% )
    endlocal
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
