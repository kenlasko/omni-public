@echo -on
set BIOS_PROCESS %0

if x%1 == x"" then
  echo Missing one or more parameters.
  goto err
endif

set BIOS_PARAMETER %1

compress.efi %1

if not %lasterror% == 0 then
  goto err
endif

if not exist compress.bin then
  echo Missing one or more files.
  goto err
endif

chglogo.efi compress.bin

if not %lasterror% == 0 then
  goto err
endif

goto end

:err
exit /b 0xc000000000000001

:end
