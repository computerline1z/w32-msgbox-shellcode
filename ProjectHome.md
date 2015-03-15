A 140 byte null-free shellcode for 32-bit versions of Windows 5.0-7.0 all service packs that shows a message box saying "Hello world!". Includes optional code that fixes stack alignment (adds 5 bytes) and [bypasses EAF](http://skypher.com/index.php/2010/11/17/bypassing-eaf/) (adds 31 bytes).

Features:
  * NULL Free
  * Windows version and service pack independant.
  * No assumptions are made about the values of registers.
  * "/3GB" compatible: pointers are not assume to be smaller than 0x80000000.
  * [DEP](http://skypher.com/wiki/index.php/DEP)/[ASLR](http://skypher.com/wiki/index.php/ASLR) compatible: data is not executed, code is not modified.
  * Windows 7 compatible: [kernel32](http://skypher.com/wiki/index.php/kernel32) is found based on the length of its name.