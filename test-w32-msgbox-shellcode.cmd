@ECHO OFF

ECHO     + Checking shellcode for NULL bytes:
ECHO       + w32-msgbox-shellcode.bin
CALL BETA3 h --nullfree w32-msgbox-shellcode.bin > nul
IF ERRORLEVEL 1 GOTO :FAILED
ECHO       + w32-msgbox-shellcode-esp.bin
CALL BETA3 h --nullfree w32-msgbox-shellcode-esp.bin > nul
IF ERRORLEVEL 1 GOTO :FAILED

ECHO     + Running shellcode:
ECHO       + w32-msgbox-shellcode.bin
w32-testival.exe [$]=ascii:w32-msgbox-shellcode.bin eip=$ --EH
ECHO       + w32-msgbox-shellcode-esp.bin
w32-testival.exe [$+800]=ascii:w32-msgbox-shellcode-esp.bin eip=$+800 esp=$+7FF --EH

EXIT /B 0

:FAILED
  ECHO     * Test failed!
  EXIT /B %ERRORLEVEL%