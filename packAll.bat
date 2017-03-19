call packVariables.cmd
rem ==== Clearing Folders"
rmdir "%gamePath%\mods\mod%modName%\" /s /q
rmdir %modPath%\Packed\mod%modName%\content\ /s /q

rem Packing 
cd /d "%modKitPath%"
call wcc_lite pack -dir=%modPath%\Cooked -outdir=%modPath%\Packed\mod%modName%\content\

rem Copy Scripts
XCOPY %modPath%\scripts %modPath%\Packed\mod%modName%\content\scripts\ /e /s /y

rem ==== Generate metadata
call wcc_lite metadatastore -path=%modPath%\Packed\mod%modName%\content\

rem Copying Mod To Witcher 3 Mods
XCOPY %modPath%\Packed\mod%modName% "%gamePath%\mods\mod%modName%\" /e /s /y
cd /d %modPath%