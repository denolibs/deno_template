:<<WINDOWS
  @echo off
  IF [%JUSTTERMINATE%] == [OKAY] (
    SET JUSTTERMINATE=
    PowerShell.exe -Command "$env:DEBUG='*'; deno run --allow-env .\lib\mod.ts"
  ) ELSE (
    SET JUSTTERMINATE=OKAY
    CALL %0 %* <NUL
  )
  exit /b
WINDOWS

#<<OTHEROS
  DEBUG=* deno run --allow-env ./lib/mod.ts
  exit;
OTHEROS

:///////////////////////////////////////////////////////////////
://                                                           //
:// Note: This is a multi-OS script to load our Deno module.  //
:// This file need to be marked executable on Linux/Mac.      //
:// $ chmod +x run.bat                                ~OzJD   //
://                                                           //
:// P.S. Windows IF avoids the "Terminate batch job (Y/N)?"   //
://                                                           //
:///////////////////////////////////////////////////////////////
