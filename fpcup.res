        ��  ��                  'D  8   F I L E   F P C U P _ I N I           	        ; fpcup.ini
; =========
; This file contains setup instructions for external modules,
; e.g. packages that can be downloaded from svn,hg or git repositories.

; ==============================================================================
; Note: to specify your own options apart from modules, have a look at the
; settings.ini sample file.
; You can use fpcup --inifile=settings.ini to run with those options.
; ==============================================================================

; Available macros:
; $(FPCDIR) Base directory for FPC installation
; $(LAZARUSDIR) Base directory for Lazarus installation
; $(LAZARUSPRIMARYCONFIGPATH) Path where configuration for Lazarus is stored
; ... and you can define your own, like below:
[ALIASfpcURL]
2.7.1=http://svn.freepascal.org/svn/fpc/trunk/
trunk=http://svn.freepascal.org/svn/fpc/trunk/
; Fixes to latest stable:
2.6.3=http://svn.freepascal.org/svn/fpc/branches/fixes_2_6
fixes=http://svn.freepascal.org/svn/fpc/branches/fixes_2_6
; Latest stable:
2.6.2=http://svn.freepascal.org/svn/fpc/tags/release_2_6_2
; Previous stable:
2.6.0=http://svn.freepascal.org/svn/fpc/tags/release_2_6_0

[ALIASlazURL]
; Development:
trunk=http://svn.freepascal.org/svn/lazarus/trunk
1.1=http://svn.freepascal.org/svn/lazarus/trunk
; Latest stable:
1.0.10=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_10
; Previous stables
1.0.8=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_8
1.0.6=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_6
1.0.4=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_4
1.0.2=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0_2
1.0=http://svn.freepascal.org/svn/lazarus/tags/lazarus_1_0

[FPCUPModule1]
; These IDE packages can be handy when developing
; they were selected by the fpcup maintainers.
; Please feel free to add your own.
Name=suggestedpackages
Description="Selection of various IDE packages that can be handy when developing"
Enabled=1
; Note: the next lines show you can use either Windows \ or Unix / in a path
; .... but not both in the same line

; To add a package to the list, use AddPackage<n>
; You will need to recompile the IDE, e.g. using the USERIDE sequence in fpcup
; (which is done for you in the default setup)
; DBF components:
AddPackage1=$(lazarusdir)\components\tdbf\dbflaz.lpk
;Apparently not a GUI package?? fpcunitconsolerunner.lpk
; FPC unit test package; handy when creating/running tests:
AddPackage2=$(lazarusdir)/components/fpcunit/ide/fpcunitide.lpk
;Apparently not a GUI package?? fpcunittestrunner.lpk
; Build daemon/service applications:
AddPackage3=$(lazarusdir)\components\daemon\lazdaemon.lpk
; Lazarus data dictionary support; handy with lazdatadesktop
AddPackage4=$(lazarusdir)\components\datadict\lazdatadict.lpk
; Dataset export package:
AddPackage5=$(lazarusdir)\components\dbexport\lazdbexport.lpk
; Reporting
; You can add the lazreport pdf export package if you want
AddPackage6=$(lazarusdir)\components\lazreport\source\lazreport.lpk
; Leakview: allows you to view heaptrc reports:
AddPackage7=$(lazarusdir)\components\leakview\leakview.lpk
; AggPas backend for TAChart
; note: held back because problems with tachartaxisutils on linux x64 (Nov 2012)
;AddPackage8=$(lazarusdir)\components\tachart\tachartaggpas.lpk
; won't compile...: tachartfpvectorial
; TAChart.  you might want to add some backend packages
;AddPackage9=$(lazarusdir)\components\tachart\tachartlazaruspkg.lpk
; Rx components; additional GUI components
AddPackage10=$(lazarusdir)\components\rx\rx.lpk
; This shows that you can add a package by name instead of full path
AddPackage11=cody
; SDF dataset support
AddPackage12=$(lazarusdir)\components\sdf\sdflaz.lpk

[FPCUPModule2]
; A CHM help viewer is required in order to view CHM help from within Lazarus
; Note: since 1.0.x, lhelp is automatically built as required by Lazarus.
; As running make clean/make distclean for x64 LCL compilation on Windows removes
; lhelp.exe and Lazarus doesn't appear to be smart enough to compile it again, let's
; just disable this altogether.
Name=lhelp
Description="lhelp CHM help viewer for Lazarus, and associated package. NOTE: this module is not needed since Lazarus 1.0"
Enabled=0
Workingdir=$(lazarusdir)/components/chmhelp/lhelp
; Build the lhelp program:
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/components/chmhelp/lhelp/lhelp.lpr
; ... and add the chm help package to the IDE.
; We specify the full path to make sure it is in the known list of packages, even if we did not build bigide before:
AddPackage1=$(lazarusdir)\components\chmhelp\packages\idehelp\chmhelppkg.lpk
; Use the RegisterHelpViewer to register the executable as a Lazarus help viewer.
RegisterHelpViewer=$(Workingdir)/$(name)

[FPCUPModule3]
Name=lazdatadesktop
Description="A database helper tool for Lazarus. Will be registered in External Tools"
Enabled=1
Workingdir=$(lazarusdir)/tools/lazdatadesktop
InstallExecute1=$(lazarusdir)/lazbuild  --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/tools/lazdatadesktop/lazdatadesktop.lpr
RegisterExternalTool=$(lazarusdir)/tools/lazdatadesktop/lazdatadesktop
;Additional RegisterExternalTool* commands:
;RegisterExternalToolCmdLineParams=string
;RegisterExternalToolWorkingDirectory=string
;RegisterExternalToolScanOutputForFPCMessages=0|1
;RegisterExternalToolScanOutputForMakeMessages=0|1
;RegisterExternalToolHideMainForm=0|1

[FPCUPModule4]
; Can be used as an external tool in Lazarus
Name=doceditor
Description"Lazarus DocEditor; used to edit fpdoc (FPC and Lazarus) documentation files. Will be registered as an external tool"
Enabled=1
Workingdir=$(lazarusdir)/doceditor
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/doceditor/lazde.lpr
RegisterExternalTool=$(lazarusdir)/doceditor/lazde

[FPCUPModule5]
; includes fpspreadsheet etc. You can also enable individual parts (see e.g. below for fpspreadsheet)
Name=lazarus_ccr
Description="Lazarus Code and Components Repository; contains many packages, e.g. fpspreadsheet."
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazarus-ccr/svn
UnInstall=rm -Rf $(Installdir)

[FPCUPModule6]
; http://wiki.lazarus.freepascal.org/FPSpreadsheet
Name=fpspreadsheet
Description="The fpSpreadsheet library offers a convenient way to generate and read spreadsheet documents"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazarus-ccr/svn/components/fpspreadsheet
; Compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/laz_fpspreadsheet.lpk
; ... and mark them for installation into Lazarus:
AddPackage1=$(Installdir)/laz_fpspreadsheet.lpk
AddPackage2=$(Installdir)/laz_fpspreadsheet_visual.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule7]
; Handy if you want to edit it, and if you want to show pop up
; hints in Lazarus
Name=fpcdocs
Description="fpcdocs contains the source code for FPC documentation. Handy for tooltips/hints in the IDE"
Enabled=1
Installdir=$(fpcdir)/../extras/$(name)
; RegisterLazDocPath registers the path with xml documentation file
; in Lazarus so you get updated hints when hovering over a keyword
RegisterLazDocPath=$(fpcdir)/../extras/$(name)
SVNURL=http://svn.freepascal.org/svn/fpcdocs/trunk
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule8]
; Note: could also be generated by
; make tools
; (which requires LCL+nogui widgetset, e.g. provided by lazbuild)
Name=lazres
Description="Lazarus resource file creator"
Enabled=1
Workingdir=$(lazarusdir)/tools
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(lazarusdir)/tools/lazres.lpi

[FPCUPModule9]
; http://www.ararat.cz/synapse/doku.php
Name=synapsetrunk
Description="Synapse networking library. Development/trunk version"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/synalist/code/trunk
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/laz_synapse.lpk
;Not a design-time package, so don't do this:
;AddPackage1=$(Installdir)/laz_synapse.lpk
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule10]
Name=pascalsane
Description="Bindings to the SANE *nix scanner library"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/PascalSane/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule11]
Name=leptonica
Description="Leptonica (layout recognition) library bindings"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/leptonica/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule12]
; new version 3 is rewritten... see bug:
; https://code.google.com/p/tesseract-ocr/issues/detail?id=362
Name=tesseract
Description="Tesseract OCR library interface (probably for old 2.04 version)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=http://ocrivist.googlecode.com/svn/tessintf/
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule13]
; Note: has not been tested; perhaps won't work with Tesseract 3
; might also be easier to run TProcess to call CLI executables
Name=OCRivist
Description="OCRivist program for OCR. Requires (and will install) leptonica, tesseract, pascalsane"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
; Demo/main program:
SVNURL=http://ocrivist.googlecode.com/svn/trunk/
Requires=pascalsane,leptonica,tesseract
UnInstall1=rm -Rf $(Installdir)

[FPCUPModule14]
; If the bigide sequence fails to permanently mark these for installation
; we can try it this way.
Name=bigidepackages
Description="BigIDE packages: the packages that will be used in a big ide build. NOTE: not needed for normal fpcup installs."
Enabled=0
; This demonstrates that you can add packages by name instead of filename
AddPackage1=chmhelppkg
AddPackage2=dbflaz
AddPackage3=externhelp
AddPackage4=fpcunitide
AddPackage5=instantfpclaz
AddPackage6=jcfidelazarus
AddPackage7=leakview
AddPackage8=memdslaz
// this seems to not work??
AddPackage9=printer4lazarus
AddPackage10=printers4lazide
AddPackage11=projtemplates
// this seems to not work??
AddPackage12=runtimetypeinfocontrols
AddPackage13=sdflaz
AddPackage14=sqldblaz
// Tachart seems to be broken now and then, but I suppose we'd better leave it in:
AddPackage15=tachartlazaruspkg
AddPackage16=todolistlaz
AddPackage17=turbopoweripro

[FPCUPModule15]
; See
; http://http://zeos.firmos.at/
; http://wiki.lazarus.freepascal.org/ZeosDBO
Name=zeostesting
Description="Zeos database components (testing branch => seem the most reliable)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/zeoslib/code-0/branches/testing/
UnInstall1=rm -Rf $(Installdir)
AddPackage1=$(Installdir)\packages\lazarus\zcomponent.lpk

[FPCUPModule16]
; See:
;http://lazarus.freepascal.org/index.php/topic,16736.0.html
;http://sourceforge.net/projects/kzdesktop/
Name=kzdesktop
Description="kzdesktop: change the Lazarus IDE layout into a tabbed layout"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/kzdesktop/code/trunk
UnInstall1=rm -Rf $(Installdir)
AddPackage1=$(Installdir)\kzdesktop_ide.lpk

[FPCUPModule17]
; There are some rx controls incorporated into Lazarus; others are
; still part of a separate project in Lazarus CCR
; http://wiki.lazarus.freepascal.org/rx
Name=rx
Description="RX controls (part of ccr, not the Lazarus ones)"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=https://lazarus-ccr.svn.sourceforge.net/svnroot/lazarus-ccr/components/rx
; Compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/rxnew.lpk
; ... and mark the visual package for installation into Lazarus:
AddPackage1=$(Installdir)/dcl_rx_ctrl.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule18]
; also bgrabitmap package
Name=lazpaint
Description="LazPaint painting program with layer support etc"
Enabled=0
Installdir=$(fpcdir)/../extras/$(name)
SVNURL=svn://svn.code.sf.net/p/lazpaint/code/
AddPackage1=$(Installdir)/bgrabitmap/bgrabitmappack.lpk
UnInstall=rm -Rf $(Installdir)

[FPCUPModule19]
; Create Lazarus Windows installer
Name=installerlazwin
Description="This module creates a Lazarus Windows installer"
; For the installer, we place some SVN directories below the installdir;
; the user need not worry about these.
; Note: the output setup executable will not be put there.
Installdir=$(fpcdir)/../$(name)
Enabled=0
CreateInstaller1=Windows
Uninstall=rm -Rf $(Installdir)

[FPCUPModule20]
; lnet FPC/Lazarus package
; see http://wiki.lazarus.freepascal.org/lNet
; Removed from default install list as it is not available on OSX
Name=lnet
Description="lnet is a small network library, an alternative to e.g. Synapse"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
; we only want the trunk branch as otherwise we'd get all old releases
SVNURL=http://svn.freepascal.org/svn/fpcprojects/lnet/trunk
; compile the non-visual package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/lazaruspackage/lnetbase.lpk
; and mark the visual package for installation:
AddPackage1=$(Installdir)\lazaruspackage\lnetvisual.lpk
; no idea if there are .lpks that may need to be installed. Please update if using this.
; InstallExecute1=
; AddPackage1=
UnInstall=rm -Rf $(Installdir)

[FPCUPModule21]
; fpcup source code itself
Name=fpcup
Description="fpcup source code itself. Requires mercurial/hg to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
HGURL=https://bitbucket.org/reiniero/fpcup
; We need to have a working hgversion first...
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/hgversion.lpi
; .... then compile fpcup
InstallExecute2=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/fpcup.lpi
UnInstall=rm -Rf $(Installdir)

[FPCUPModule22]
; Vampyre imaging library
Name=vampyre
Description="Vampyre imaging library. Requires mercurial/hg to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
HGURL=http://imaginglib.hg.sourceforge.net:8000/hgroot/imaginglib/imaginglib
; compile vampyre package
InstallExecute1=$(lazarusdir)/lazbuild --primary-config-path=$(LazarusPrimaryConfigPath) $(Installdir)/Extras/IdePackages/vampyreimagingpackage.lpk
; or use AddPackage if it is a designtime package (todo: check)
UnInstall=rm -Rf $(Installdir)

[FPCUpModule23]
Name=tiopf
Description="tiOPF object-persistence framework. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://git.code.sf.net/p/fpgui/code       
UnInstall=rm -Rf $(Installdir)

[FPCUPModule24]
Name=lazpackager
Description="Packaging addin for creating Debian packages from your Lazarus project. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/prof7bit/LazPackager.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule25]
Name=ljgridutils
Description="JSON saving/loading from grid. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/silvioprog/ljgridutils.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule26]
Name=brookframework
Description="Brook web application server framework. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/silvioprog/brookframework.git
UnInstall=rm -Rf $(Installdir)

[FPCUPModule27]
Name=greyhound
Description="An ORM (database persistence) framework for FPC/Lazarus. Requires git to be installed."
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/mdbs99/Greyhound.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule28]
Name=mupdf
Description="Experimental bindings for the mupdf pdf visualization library. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=https://github.com/blestan/lazmupdf.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule29]
; formerly in the tiopf 3rdparty repository
Name=fblib
Description="Non-GUI Firebird data acces library. Requires git to be installed"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://github.com/graemeg/firebird-lib.git
UnInstall=rm -Rf $(Installdir)

[FPCUpModule30]
; http://wiki.lazarus.freepascal.org/BGRAControls#Overview
Name=bgracontrols
Description="Custom drawn controls. Requires (and will install) bgrabitmap (in lazpaint)"
Installdir=$(fpcdir)/../extras/$(name)
AddPackage1=$(Installdir)/bgracontrols.lpk
Requires=lazpaint
Enabled=0
SVNURL=https://bgracontrols.svn.sourceforge.net/svnroot/bgracontrols
UnInstall=rm -Rf $(Installdir)

[FPCUPModule31]
; Simple Graph component being ported from Delphi
Name=simplegraph
Description="Simple Graph component being ported from Delphi"
Installdir=$(fpcdir)/../extras/$(name)
Enabled=0
GITURL=git://git.code.sf.net/p/evssimplegraph/code evssimplegraph-code
UnInstall=rm -Rf $(Installdir)
 |  <   F I L E   S E T T I N G S _ I N I         	        ; example settings for fpcup
; use e.g. 
; fpcup --inifile=settings.ini --inisection=devfull
; to compile with the options specified in that section

[general]
; update only version of devfull
; Uses FPC trunk instead of the default:
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
; Compiles with debug options:
fpcopt="-g -gl -O1"
lazopt="-g -gl -O1"
; Use our own names to avoid overwiting defaults
fpcuplinkname=fpcuptrunkdebug
lazlinkname=lazarus_fpctrunk
; Keeps changes you made to the svn checkout:
keeplocalchanges=true
; You can enable/disable modules specified in fpcup.ini:
fpspreadsheet=1
mupdf=0
; Limit compile to getting new fpc, but not a new Lazarus
; and build the essentials
only=FPCGetOnly,FPCBuildOnly,lazbuild,bigide,useride
; if on windows, don't build the crosscompiler
skip=crosswin32-64
; No additional packages will be built - only rebuilt automatically
; as the ide is recompiled

[devfull]
; Full download & compile
; Uses FPC trunk instead of the default:
fpcurl=http://svn.freepascal.org/svn/fpc/trunk
; Compiles with debug options:
fpcopt="-g -gl -O1"
lazopt="-g -gl -O1"
; Use our own names to avoid overwiting defaults
fpcuplinkname=fpcuptrunkdebug
lazlinkname=lazarus_fpctrunk
; Keeps changes you made to the svn checkout:
keeplocalchanges=true
; You can enable/disable modules specified in fpcup.ini:
fpspreadsheet=1
mupdf=0
