call packVariables.cmd
cd /d "%modKitPath%"
call wcc_lite uncook -indir="%gamePath%\DLC\bob\content\bundles"  -outdir=%modPath%\UnpackedBOB -skiperrors -imgfmt=tga -unbundleonly