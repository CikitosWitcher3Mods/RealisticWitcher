call packVariables.cmd
rem Copy Scripts
XCOPY %modPath%\scripts %modPath%\Packed\mod%modName%\content\scripts\ /e /s /y

rem Copying Mod To Witcher 3 Mods
XCOPY %modPath%\Packed\mod%modName% "%gamePath%\mods\mod%modName%\" /e /s /y
cd /d %modPath%