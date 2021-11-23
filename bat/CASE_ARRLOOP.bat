@ECHO OFF
SET variableNames[1]=MOT
SET variableNames[2]=HAI

:main
    SET /A index=2
    ECHO %index%
    ECHO %variableNames[1]%
     
    SETLOCAL EnableDelayedExpansion
    CALL ECHO %%variableNames[%index%]%%
    ECHO !variableNames[%index%]!
    IF "!variableNames[%index%]!"=="HAI" (
        ECHO Yeah!!!
    ) ELSE (
        ECHO No!!!
    )

    SET curName=
    GOTO :testLoop
    ENDLOCAL
PAUSE
EXIT /B 0

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
   GOTO :SymLoop 
)
echo "The length of the array is" %x%
exit /b 0