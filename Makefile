NQP       := nqp-p
PARROT    := parrot
PERL      := perl
PERL6     := PERL6LIB=lib perl6-p
RM_F      := $(PERL) -MExtUtils::Command -e rm_f
CP        := $(PERL) -MExtUtils::Command -e cp
MKPATH    := $(PERL) -MExtUtils::Command -e mkpath
NQPLIB    := $(shell $(NQP) -e 'my %conf := pir::getinterp__P()[pir::const::IGLOBALS_CONFIG_HASH]; print(%conf<libdir> ~ %conf<versiondir> ~ "/languages/nqp");')
P6LIB     := $(shell $(PERL6) -e 'print %*CUSTOM_LIB<perl>')

# We need to tweak that some day
HAS_ICU    = 0

# NOTE: eventually, we should remove --keep-exit-code and --fudge
#       as the goal is that all tests must pass without fudge
HARNESS_WITH_FUDGE = $(PERL) t/harness --fudge --keep-exit-code --add_use_v5 --icu=$(HAS_ICU)

all: blib/Perl5.pbc lib/Perl5/Config.pbc lib/Perl5/Terms.pbc \
	lib/Perl5/constant.pbc lib/Perl5/Cwd.pbc lib/Perl5/lib.pbc lib/Perl5/mro.pbc lib/Perl5/overload.pbc lib/Perl5/TestInit.pbc \
	lib/Perl5/AnyDBM_File.pbc lib/Perl5/App/Prove.pbc lib/Perl5/App/Prove/State.pbc lib/Perl5/App/Prove/State/Result.pbc lib/Perl5/App/Prove/State/Result/Test.pbc lib/Perl5/Archive/Extract.pbc lib/Perl5/Archive/Tar.pbc lib/Perl5/Archive/Tar/File.pbc lib/Perl5/Attribute/Handlers.pbc lib/Perl5/AutoLoader.pbc lib/Perl5/AutoSplit.pbc lib/Perl5/B.pbc lib/Perl5/B/Concise.pbc lib/Perl5/B/Debug.pbc lib/Perl5/B/Deparse.pbc lib/Perl5/B/Lint.pbc lib/Perl5/B/Lint/Debug.pbc lib/Perl5/B/Showlex.pbc lib/Perl5/B/Terse.pbc lib/Perl5/B/Xref.pbc lib/Perl5/Benchmark.pbc lib/Perl5/Carp.pbc lib/Perl5/CGI.pbc lib/Perl5/CGI/Apache.pbc lib/Perl5/CGI/Carp.pbc lib/Perl5/CGI/Cookie.pbc lib/Perl5/CGI/Fast.pbc lib/Perl5/CGI/Pretty.pbc lib/Perl5/CGI/Push.pbc lib/Perl5/CGI/Switch.pbc lib/Perl5/CGI/Util.pbc lib/Perl5/Class/Struct.pbc lib/Perl5/Compress/Raw/Bzip2.pbc lib/Perl5/Compress/Raw/Zlib.pbc lib/Perl5/Compress/Zlib.pbc lib/Perl5/Config/Extensions.pbc lib/Perl5/CPAN.pbc lib/Perl5/CPAN/Debug.pbc lib/Perl5/CPAN/Distroprefs.pbc lib/Perl5/CPAN/FirstTime.pbc lib/Perl5/CPAN/HandleConfig.pbc lib/Perl5/CPAN/Kwalify.pbc lib/Perl5/CPAN/Nox.pbc lib/Perl5/CPAN/Queue.pbc lib/Perl5/CPAN/Tarzip.pbc lib/Perl5/CPAN/Version.pbc lib/Perl5/CPANPLUS.pbc lib/Perl5/CPANPLUS/Backend.pbc lib/Perl5/CPANPLUS/Backend/RV.pbc lib/Perl5/CPANPLUS/Config.pbc lib/Perl5/CPANPLUS/Configure.pbc lib/Perl5/CPANPLUS/Dist.pbc lib/Perl5/CPANPLUS/Dist/Autobundle.pbc lib/Perl5/CPANPLUS/Dist/Base.pbc lib/Perl5/CPANPLUS/Dist/Build.pbc lib/Perl5/CPANPLUS/Dist/Build/Constants.pbc lib/Perl5/CPANPLUS/Dist/MM.pbc lib/Perl5/CPANPLUS/Dist/Sample.pbc lib/Perl5/CPANPLUS/Error.pbc lib/Perl5/CPANPLUS/Internals.pbc lib/Perl5/CPANPLUS/Internals/Extract.pbc lib/Perl5/CPANPLUS/Internals/Fetch.pbc lib/Perl5/CPANPLUS/Internals/Report.pbc lib/Perl5/CPANPLUS/Internals/Search.pbc lib/Perl5/CPANPLUS/Internals/Source.pbc lib/Perl5/CPANPLUS/Internals/Source/Memory.pbc lib/Perl5/CPANPLUS/Internals/Source/SQLite.pbc lib/Perl5/CPANPLUS/Internals/Utils.pbc lib/Perl5/CPANPLUS/Module.pbc lib/Perl5/CPANPLUS/Module/Author.pbc lib/Perl5/CPANPLUS/Module/Author/Fake.pbc lib/Perl5/CPANPLUS/Module/Checksums.pbc lib/Perl5/CPANPLUS/Module/Fake.pbc lib/Perl5/CPANPLUS/Selfupdate.pbc lib/Perl5/CPANPLUS/Shell.pbc lib/Perl5/CPANPLUS/Shell/Classic.pbc lib/Perl5/CPANPLUS/Shell/Default.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pbc lib/Perl5/Data/Dumper.pbc lib/Perl5/DB.pbc lib/Perl5/DBM_Filter.pbc lib/Perl5/DBM_Filter/compress.pbc lib/Perl5/DBM_Filter/encode.pbc lib/Perl5/DBM_Filter/int32.pbc lib/Perl5/DBM_Filter/null.pbc lib/Perl5/DBM_Filter/utf8.pbc lib/Perl5/DB_File.pbc lib/Perl5/Devel/InnerPackage.pbc lib/Perl5/Devel/Peek.pbc lib/Perl5/Devel/PPPort.pbc lib/Perl5/Devel/SelfStubber.pbc lib/Perl5/Digest.pbc lib/Perl5/Digest/base.pbc lib/Perl5/Digest/file.pbc lib/Perl5/Digest/MD5.pbc lib/Perl5/Digest/SHA.pbc lib/Perl5/DirHandle.pbc lib/Perl5/Dumpvalue.pbc lib/Perl5/DynaLoader.pbc lib/Perl5/Encode.pbc lib/Perl5/Encode/Alias.pbc lib/Perl5/Encode/Byte.pbc lib/Perl5/Encode/CJKConstants.pbc lib/Perl5/Encode/CN.pbc lib/Perl5/Encode/CN/HZ.pbc lib/Perl5/Encode/Config.pbc lib/Perl5/Encode/EBCDIC.pbc lib/Perl5/Encode/Encoder.pbc lib/Perl5/Encode/Encoding.pbc lib/Perl5/Encode/GSM0338.pbc lib/Perl5/Encode/Guess.pbc lib/Perl5/Encode/JP.pbc lib/Perl5/Encode/JP/H2Z.pbc lib/Perl5/Encode/JP/JIS7.pbc lib/Perl5/Encode/KR.pbc lib/Perl5/Encode/KR/2022_KR.pbc lib/Perl5/Encode/MIME/Header.pbc lib/Perl5/Encode/MIME/Name.pbc lib/Perl5/Encode/Symbol.pbc lib/Perl5/Encode/TW.pbc lib/Perl5/Encode/Unicode.pbc lib/Perl5/Encode/Unicode/UTF7.pbc lib/Perl5/Env.pbc lib/Perl5/Errno.pbc lib/Perl5/Exporter.pbc lib/Perl5/Exporter/Heavy.pbc lib/Perl5/ExtUtils/CBuilder.pbc lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pbc lib/Perl5/ExtUtils/Command.pbc lib/Perl5/ExtUtils/Command/MM.pbc lib/Perl5/ExtUtils/Constant.pbc lib/Perl5/ExtUtils/Constant/Base.pbc lib/Perl5/ExtUtils/Constant/Utils.pbc lib/Perl5/ExtUtils/Constant/XS.pbc lib/Perl5/ExtUtils/Embed.pbc lib/Perl5/ExtUtils/Install.pbc lib/Perl5/ExtUtils/Installed.pbc lib/Perl5/ExtUtils/Liblist.pbc lib/Perl5/ExtUtils/MakeMaker.pbc lib/Perl5/ExtUtils/MakeMaker/Config.pbc lib/Perl5/ExtUtils/MakeMaker/FAQ.pbc lib/Perl5/ExtUtils/MakeMaker/Tutorial.pbc lib/Perl5/ExtUtils/Manifest.pbc lib/Perl5/ExtUtils/Miniperl.pbc lib/Perl5/ExtUtils/Mkbootstrap.pbc lib/Perl5/ExtUtils/Mksymlists.pbc lib/Perl5/ExtUtils/MM.pbc lib/Perl5/ExtUtils/MM_AIX.pbc lib/Perl5/ExtUtils/MM_Any.pbc lib/Perl5/ExtUtils/MM_BeOS.pbc lib/Perl5/ExtUtils/MM_Cygwin.pbc lib/Perl5/ExtUtils/MM_Darwin.pbc lib/Perl5/ExtUtils/MM_DOS.pbc lib/Perl5/ExtUtils/MM_MacOS.pbc lib/Perl5/ExtUtils/MM_NW5.pbc lib/Perl5/ExtUtils/MM_OS2.pbc lib/Perl5/ExtUtils/MM_QNX.pbc lib/Perl5/ExtUtils/MM_Unix.pbc lib/Perl5/ExtUtils/MM_UWIN.pbc lib/Perl5/ExtUtils/MM_VMS.pbc lib/Perl5/ExtUtils/MM_VOS.pbc lib/Perl5/ExtUtils/MM_Win32.pbc lib/Perl5/ExtUtils/MM_Win95.pbc lib/Perl5/ExtUtils/MY.pbc lib/Perl5/ExtUtils/Packlist.pbc lib/Perl5/ExtUtils/ParseXS.pbc lib/Perl5/ExtUtils/testlib.pbc lib/Perl5/Fatal.pbc lib/Perl5/Fcntl.pbc lib/Perl5/File/Basename.pbc lib/Perl5/File/CheckTree.pbc lib/Perl5/File/Compare.pbc lib/Perl5/File/Copy.pbc lib/Perl5/File/DosGlob.pbc lib/Perl5/File/Fetch.pbc lib/Perl5/File/Find.pbc lib/Perl5/File/Glob.pbc lib/Perl5/File/GlobMapper.pbc lib/Perl5/File/Path.pbc lib/Perl5/File/Spec.pbc lib/Perl5/File/Spec/Cygwin.pbc lib/Perl5/File/Spec/Epoc.pbc lib/Perl5/File/Spec/Functions.pbc lib/Perl5/File/Spec/Mac.pbc lib/Perl5/File/Spec/OS2.pbc lib/Perl5/File/Spec/Unix.pbc lib/Perl5/File/Spec/VMS.pbc lib/Perl5/File/Spec/Win32.pbc lib/Perl5/File/stat.pbc lib/Perl5/File/Temp.pbc lib/Perl5/FileCache.pbc lib/Perl5/FileHandle.pbc lib/Perl5/Filter/Simple.pbc lib/Perl5/Filter/Util/Call.pbc lib/Perl5/FindBin.pbc lib/Perl5/Getopt/Long.pbc lib/Perl5/Getopt/Std.pbc lib/Perl5/Hash/Util.pbc lib/Perl5/Hash/Util/FieldHash.pbc lib/Perl5/I18N/Collate.pbc lib/Perl5/I18N/Langinfo.pbc lib/Perl5/I18N/LangTags.pbc lib/Perl5/I18N/LangTags/Detect.pbc lib/Perl5/I18N/LangTags/List.pbc lib/Perl5/IO.pbc lib/Perl5/IO/Compress/Base.pbc lib/Perl5/IO/Compress/Bzip2.pbc lib/Perl5/IO/Compress/Deflate.pbc lib/Perl5/IO/Compress/Gzip.pbc lib/Perl5/IO/Compress/RawDeflate.pbc lib/Perl5/IO/Compress/Zip.pbc lib/Perl5/IO/Dir.pbc lib/Perl5/IO/File.pbc lib/Perl5/IO/Handle.pbc lib/Perl5/IO/Pipe.pbc lib/Perl5/IO/Poll.pbc lib/Perl5/IO/Seekable.pbc lib/Perl5/IO/Select.pbc lib/Perl5/IO/Socket.pbc lib/Perl5/IO/Socket/INET.pbc lib/Perl5/IO/Socket/UNIX.pbc lib/Perl5/IO/Uncompress/AnyInflate.pbc lib/Perl5/IO/Uncompress/AnyUncompress.pbc lib/Perl5/IO/Uncompress/Base.pbc lib/Perl5/IO/Uncompress/Bunzip2.pbc lib/Perl5/IO/Uncompress/Gunzip.pbc lib/Perl5/IO/Uncompress/Inflate.pbc lib/Perl5/IO/Uncompress/RawInflate.pbc lib/Perl5/IO/Uncompress/Unzip.pbc lib/Perl5/IO/Zlib.pbc lib/Perl5/IPC/Cmd.pbc lib/Perl5/IPC/Msg.pbc lib/Perl5/IPC/Open2.pbc lib/Perl5/IPC/Open3.pbc lib/Perl5/IPC/Semaphore.pbc lib/Perl5/IPC/SharedMem.pbc lib/Perl5/IPC/SysV.pbc lib/Perl5/List/Util.pbc lib/Perl5/List/Util/XS.pbc lib/Perl5/Locale/Country.pbc lib/Perl5/Locale/Currency.pbc lib/Perl5/Locale/Language.pbc lib/Perl5/Locale/Maketext.pbc lib/Perl5/Locale/Maketext/Guts.pbc lib/Perl5/Locale/Maketext/GutsLoader.pbc lib/Perl5/Locale/Maketext/Simple.pbc lib/Perl5/Locale/Script.pbc lib/Perl5/Log/Message.pbc lib/Perl5/Log/Message/Config.pbc lib/Perl5/Log/Message/Handlers.pbc lib/Perl5/Log/Message/Item.pbc lib/Perl5/Log/Message/Simple.pbc lib/Perl5/Math/BigFloat.pbc lib/Perl5/Math/BigInt.pbc lib/Perl5/Math/BigInt/Calc.pbc lib/Perl5/Math/BigInt/CalcEmu.pbc lib/Perl5/Math/BigInt/FastCalc.pbc lib/Perl5/Math/BigRat.pbc lib/Perl5/Math/Complex.pbc lib/Perl5/Math/Trig.pbc lib/Perl5/Memoize.pbc lib/Perl5/Memoize/AnyDBM_File.pbc lib/Perl5/Memoize/Expire.pbc lib/Perl5/Memoize/ExpireFile.pbc lib/Perl5/Memoize/ExpireTest.pbc lib/Perl5/Memoize/NDBM_File.pbc lib/Perl5/Memoize/SDBM_File.pbc lib/Perl5/Memoize/Storable.pbc lib/Perl5/MIME/Base64.pbc lib/Perl5/MIME/QuotedPrint.pbc lib/Perl5/Module/Build.pbc lib/Perl5/Module/Build/Base.pbc lib/Perl5/Module/Build/Compat.pbc lib/Perl5/Module/Build/ConfigData.pbc lib/Perl5/Module/Build/Cookbook.pbc lib/Perl5/Module/Build/ModuleInfo.pbc lib/Perl5/Module/Build/Notes.pbc lib/Perl5/Module/Build/Platform/aix.pbc lib/Perl5/Module/Build/Platform/Amiga.pbc lib/Perl5/Module/Build/Platform/cygwin.pbc lib/Perl5/Module/Build/Platform/darwin.pbc lib/Perl5/Module/Build/Platform/Default.pbc lib/Perl5/Module/Build/Platform/EBCDIC.pbc lib/Perl5/Module/Build/Platform/MacOS.pbc lib/Perl5/Module/Build/Platform/MPEiX.pbc lib/Perl5/Module/Build/Platform/os2.pbc lib/Perl5/Module/Build/Platform/RiscOS.pbc lib/Perl5/Module/Build/Platform/Unix.pbc lib/Perl5/Module/Build/Platform/VMS.pbc lib/Perl5/Module/Build/Platform/VOS.pbc lib/Perl5/Module/Build/Platform/Windows.pbc lib/Perl5/Module/Build/PPMMaker.pbc lib/Perl5/Module/Build/Version.pbc lib/Perl5/Module/Build/YAML.pbc lib/Perl5/Module/CoreList.pbc lib/Perl5/Module/Load.pbc lib/Perl5/Module/Load/Conditional.pbc lib/Perl5/Module/Loaded.pbc lib/Perl5/Module/Pluggable.pbc lib/Perl5/Module/Pluggable/Object.pbc lib/Perl5/NDBM_File.pbc lib/Perl5/Net/Cmd.pbc lib/Perl5/Net/Config.pbc lib/Perl5/Net/Domain.pbc lib/Perl5/Net/FTP.pbc lib/Perl5/Net/hostent.pbc lib/Perl5/Net/netent.pbc lib/Perl5/Net/Netrc.pbc lib/Perl5/Net/NNTP.pbc lib/Perl5/Net/Ping.pbc lib/Perl5/Net/POP3.pbc lib/Perl5/Net/protoent.pbc lib/Perl5/Net/servent.pbc lib/Perl5/Net/SMTP.pbc lib/Perl5/Net/Time.pbc lib/Perl5/NEXT.pbc lib/Perl5/O.pbc lib/Perl5/Object/Accessor.pbc lib/Perl5/Opcode.pbc lib/Perl5/Package/Constants.pbc lib/Perl5/Params/Check.pbc lib/Perl5/Parse/CPAN/Meta.pbc lib/Perl5/PerlIO.pbc lib/Perl5/PerlIO/encoding.pbc lib/Perl5/PerlIO/scalar.pbc lib/Perl5/PerlIO/via.pbc lib/Perl5/PerlIO/via/QuotedPrint.pbc lib/Perl5/Pod/Checker.pbc lib/Perl5/Pod/Escapes.pbc lib/Perl5/Pod/Find.pbc lib/Perl5/Pod/Functions.pbc lib/Perl5/Pod/Html.pbc lib/Perl5/Pod/InputObjects.pbc lib/Perl5/Pod/LaTeX.pbc lib/Perl5/Pod/Man.pbc lib/Perl5/Pod/ParseLink.pbc lib/Perl5/Pod/Parser.pbc lib/Perl5/Pod/ParseUtils.pbc lib/Perl5/Pod/Perldoc.pbc lib/Perl5/Pod/Perldoc/BaseTo.pbc lib/Perl5/Pod/Perldoc/GetOptsOO.pbc lib/Perl5/Pod/Perldoc/ToChecker.pbc lib/Perl5/Pod/Perldoc/ToMan.pbc lib/Perl5/Pod/Perldoc/ToNroff.pbc lib/Perl5/Pod/Perldoc/ToPod.pbc lib/Perl5/Pod/Perldoc/ToRtf.pbc lib/Perl5/Pod/Perldoc/ToText.pbc lib/Perl5/Pod/Perldoc/ToTk.pbc lib/Perl5/Pod/Perldoc/ToXml.pbc lib/Perl5/Pod/PlainText.pbc lib/Perl5/Pod/Select.pbc lib/Perl5/Pod/Simple.pbc lib/Perl5/Pod/Simple/Checker.pbc lib/Perl5/Pod/Simple/Debug.pbc lib/Perl5/Pod/Simple/DumpAsText.pbc lib/Perl5/Pod/Simple/DumpAsXML.pbc lib/Perl5/Pod/Simple/HTML.pbc lib/Perl5/Pod/Simple/HTMLBatch.pbc lib/Perl5/Pod/Simple/LinkSection.pbc lib/Perl5/Pod/Simple/Methody.pbc lib/Perl5/Pod/Simple/PullParser.pbc lib/Perl5/Pod/Simple/PullParserEndToken.pbc lib/Perl5/Pod/Simple/PullParserStartToken.pbc lib/Perl5/Pod/Simple/PullParserTextToken.pbc lib/Perl5/Pod/Simple/PullParserToken.pbc lib/Perl5/Pod/Simple/RTF.pbc lib/Perl5/Pod/Simple/Search.pbc lib/Perl5/Pod/Simple/SimpleTree.pbc lib/Perl5/Pod/Simple/Text.pbc lib/Perl5/Pod/Simple/TextContent.pbc lib/Perl5/Pod/Simple/XHTML.pbc lib/Perl5/Pod/Simple/XMLOutStream.pbc lib/Perl5/Pod/Text.pbc lib/Perl5/Pod/Text/Color.pbc lib/Perl5/Pod/Text/Overstrike.pbc lib/Perl5/Pod/Text/Termcap.pbc lib/Perl5/Pod/Usage.pbc lib/Perl5/POSIX.pbc lib/Perl5/Safe.pbc lib/Perl5/Scalar/Util.pbc lib/Perl5/SDBM_File.pbc lib/Perl5/Search/Dict.pbc lib/Perl5/SelectSaver.pbc lib/Perl5/SelfLoader.pbc lib/Perl5/Socket.pbc lib/Perl5/Storable.pbc lib/Perl5/Symbol.pbc lib/Perl5/Sys/Hostname.pbc lib/Perl5/Sys/Syslog.pbc lib/Perl5/TAP/Base.pbc lib/Perl5/TAP/Formatter/Base.pbc lib/Perl5/TAP/Formatter/Color.pbc lib/Perl5/TAP/Formatter/Console.pbc lib/Perl5/TAP/Formatter/Console/ParallelSession.pbc lib/Perl5/TAP/Formatter/Console/Session.pbc lib/Perl5/TAP/Formatter/File.pbc lib/Perl5/TAP/Formatter/File/Session.pbc lib/Perl5/TAP/Formatter/Session.pbc lib/Perl5/TAP/Harness.pbc lib/Perl5/TAP/Object.pbc lib/Perl5/TAP/Parser.pbc lib/Perl5/TAP/Parser/Aggregator.pbc lib/Perl5/TAP/Parser/Grammar.pbc lib/Perl5/TAP/Parser/Iterator.pbc lib/Perl5/TAP/Parser/Iterator/Array.pbc lib/Perl5/TAP/Parser/Iterator/Process.pbc lib/Perl5/TAP/Parser/Iterator/Stream.pbc lib/Perl5/TAP/Parser/IteratorFactory.pbc lib/Perl5/TAP/Parser/Multiplexer.pbc lib/Perl5/TAP/Parser/Result.pbc lib/Perl5/TAP/Parser/Result/Bailout.pbc lib/Perl5/TAP/Parser/Result/Comment.pbc lib/Perl5/TAP/Parser/Result/Plan.pbc lib/Perl5/TAP/Parser/Result/Pragma.pbc lib/Perl5/TAP/Parser/Result/Test.pbc lib/Perl5/TAP/Parser/Result/Unknown.pbc lib/Perl5/TAP/Parser/Result/Version.pbc lib/Perl5/TAP/Parser/Result/YAML.pbc lib/Perl5/TAP/Parser/ResultFactory.pbc lib/Perl5/TAP/Parser/Scheduler.pbc lib/Perl5/TAP/Parser/Scheduler/Job.pbc lib/Perl5/TAP/Parser/Scheduler/Spinner.pbc lib/Perl5/TAP/Parser/Source.pbc lib/Perl5/TAP/Parser/Utils.pbc lib/Perl5/TAP/Parser/YAMLish/Reader.pbc lib/Perl5/TAP/Parser/YAMLish/Writer.pbc lib/Perl5/Term/ANSIColor.pbc lib/Perl5/Term/Cap.pbc lib/Perl5/Term/Complete.pbc lib/Perl5/Term/ReadLine.pbc lib/Perl5/Term/UI.pbc lib/Perl5/Term/UI/History.pbc lib/Perl5/Test.pbc lib/Perl5/Test/Builder.pbc lib/Perl5/Test/Builder/Module.pbc lib/Perl5/Test/Builder/Tester.pbc lib/Perl5/Test/Builder/Tester/Color.pbc lib/Perl5/Test/Harness.pbc lib/Perl5/Test/More.pbc lib/Perl5/Test/Simple.pbc lib/Perl5/Text/Abbrev.pbc lib/Perl5/Text/Balanced.pbc lib/Perl5/Text/ParseWords.pbc lib/Perl5/Text/Soundex.pbc lib/Perl5/Text/Tabs.pbc lib/Perl5/Text/Wrap.pbc lib/Perl5/Thread.pbc lib/Perl5/Thread/Queue.pbc lib/Perl5/Thread/Semaphore.pbc lib/Perl5/Tie/Array.pbc lib/Perl5/Tie/File.pbc lib/Perl5/Tie/Handle.pbc lib/Perl5/Tie/Hash.pbc lib/Perl5/Tie/Hash/NamedCapture.pbc lib/Perl5/Tie/Memoize.pbc lib/Perl5/Tie/RefHash.pbc lib/Perl5/Tie/Scalar.pbc lib/Perl5/Tie/StdHandle.pbc lib/Perl5/Tie/SubstrHash.pbc lib/Perl5/Time/gmtime.pbc lib/Perl5/Time/HiRes.pbc lib/Perl5/Time/Local.pbc lib/Perl5/Time/localtime.pbc lib/Perl5/Time/Piece.pbc lib/Perl5/Time/Seconds.pbc lib/Perl5/Time/tm.pbc lib/Perl5/Unicode/Collate.pbc lib/Perl5/Unicode/Normalize.pbc lib/Perl5/Unicode/UCD.pbc lib/Perl5/UNIVERSAL.pbc lib/Perl5/User/grent.pbc lib/Perl5/User/pwent.pbc lib/Perl5/XSLoader.pbc 

# core

core-install: blib/Perl5.pbc
	$(MKPATH) $(NQPLIB)/lib/Perl5/
	$(CP) blib/Perl5/*.pbc $(NQPLIB)/lib/Perl5/
	$(MKPATH) $(P6LIB)/lib/
	$(CP) lib/Perl5.pbc $(P6LIB)/lib/

blib/Perl5/World.pbc: lib/Perl5/World.nqp
	@$(MKPATH) blib/Perl5
	$(NQP) --vmlibs=perl6_ops --target=pir --output=lib/Perl5/World.pir lib/Perl5/World.nqp
	$(PARROT) -o blib/Perl5/World.pbc lib/Perl5/World.pir

blib/Perl5/Actions.pbc: blib/Perl5/World.pbc lib/Perl5/Actions.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --stagestats --output=lib/Perl5/Actions.pir lib/Perl5/Actions.nqp
	$(PARROT) -o blib/Perl5/Actions.pbc lib/Perl5/Actions.pir

blib/Perl5/Grammar.pbc: blib/Perl5/Actions.pbc lib/Perl5/Grammar.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --stagestats --output=lib/Perl5/Grammar.pir lib/Perl5/Grammar.nqp
	$(PARROT) -o blib/Perl5/Grammar.pbc lib/Perl5/Grammar.pir

blib/Perl5/ModuleLoader.pbc: lib/Perl5/ModuleLoader.nqp
	$(NQP) --vmlibs=perl6_ops --target=pir --output=lib/Perl5/ModuleLoader.pir lib/Perl5/ModuleLoader.nqp
	$(PARROT) -o blib/Perl5/ModuleLoader.pbc lib/Perl5/ModuleLoader.pir

blib/Perl5.pbc: lib/Perl5.nqp blib/Perl5/World.pbc blib/Perl5/Actions.pbc blib/Perl5/Grammar.pbc blib/Perl5/ModuleLoader.pbc
	$(NQP) --vmlibs=perl6_ops --target=pir --output=lib/Perl5.pir lib/Perl5.nqp
	$(PARROT) -o blib/Perl5.pbc lib/Perl5.pir

# pragmas

# modules

lib/Perl5/Terms.pbc: lib/Perl5/warnings.pbc lib/Perl5/Terms.pm
	$(PERL6) --target=pir --stagestats --output=lib/Perl5/Terms.pir lib/Perl5/Terms.pm
	$(PARROT) -o lib/Perl5/Terms.pbc lib/Perl5/Terms.pir

lib/Perl5/Config.pbc: lib/Perl5/Terms.pbc lib/Perl5/Config.pm
	$(PERL6) --target=pir --stagestats --output=lib/Perl5/Config.pir lib/Perl5/Config.pm
	$(PARROT) -o lib/Perl5/Config.pbc lib/Perl5/Config.pir

lib/Perl5/constant.pbc: lib/Perl5/constant.pm
	@echo Compiling constant
	@$(PERL6) --target=pir --output=lib/Perl5/constant.pir lib/Perl5/constant.pm
	@$(PARROT) -o lib/Perl5/constant.pbc lib/Perl5/constant.pir

lib/Perl5/Cwd.pbc: lib/Perl5/Cwd.pm
	@echo Compiling Cwd
	@$(PERL6) --target=pir --output=lib/Perl5/Cwd.pir lib/Perl5/Cwd.pm
	@$(PARROT) -o lib/Perl5/Cwd.pbc lib/Perl5/Cwd.pir

lib/Perl5/AnyDBM_File.pbc: lib/Perl5/AnyDBM_File.pm
	@echo Compiling AnyDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/AnyDBM_File.pir lib/Perl5/AnyDBM_File.pm
	@$(PARROT) -o lib/Perl5/AnyDBM_File.pbc lib/Perl5/AnyDBM_File.pir

lib/Perl5/App/Prove.pbc: lib/Perl5/App/Prove.pm
	@echo Compiling App::Prove
	@$(PERL6) --target=pir --output=lib/Perl5/App/Prove.pir lib/Perl5/App/Prove.pm
	@$(PARROT) -o lib/Perl5/App/Prove.pbc lib/Perl5/App/Prove.pir

lib/Perl5/App/Prove/State.pbc: lib/Perl5/App/Prove/State.pm
	@echo Compiling App::Prove::State
	@$(PERL6) --target=pir --output=lib/Perl5/App/Prove/State.pir lib/Perl5/App/Prove/State.pm
	@$(PARROT) -o lib/Perl5/App/Prove/State.pbc lib/Perl5/App/Prove/State.pir

lib/Perl5/App/Prove/State/Result.pbc: lib/Perl5/App/Prove/State/Result.pm
	@echo Compiling App::Prove::State::Result
	@$(PERL6) --target=pir --output=lib/Perl5/App/Prove/State/Result.pir lib/Perl5/App/Prove/State/Result.pm
	@$(PARROT) -o lib/Perl5/App/Prove/State/Result.pbc lib/Perl5/App/Prove/State/Result.pir

lib/Perl5/App/Prove/State/Result/Test.pbc: lib/Perl5/App/Prove/State/Result/Test.pm
	@echo Compiling App::Prove::State::Result::Test
	@$(PERL6) --target=pir --output=lib/Perl5/App/Prove/State/Result/Test.pir lib/Perl5/App/Prove/State/Result/Test.pm
	@$(PARROT) -o lib/Perl5/App/Prove/State/Result/Test.pbc lib/Perl5/App/Prove/State/Result/Test.pir

lib/Perl5/Archive/Extract.pbc: lib/Perl5/Archive/Extract.pm
	@echo Compiling Archive::Extract
	@$(PERL6) --target=pir --output=lib/Perl5/Archive/Extract.pir lib/Perl5/Archive/Extract.pm
	@$(PARROT) -o lib/Perl5/Archive/Extract.pbc lib/Perl5/Archive/Extract.pir

lib/Perl5/Archive/Tar.pbc: lib/Perl5/Archive/Tar.pm
	@echo Compiling Archive::Tar
	@$(PERL6) --target=pir --output=lib/Perl5/Archive/Tar.pir lib/Perl5/Archive/Tar.pm
	@$(PARROT) -o lib/Perl5/Archive/Tar.pbc lib/Perl5/Archive/Tar.pir

lib/Perl5/Archive/Tar/File.pbc: lib/Perl5/Archive/Tar/File.pm
	@echo Compiling Archive::Tar::File
	@$(PERL6) --target=pir --output=lib/Perl5/Archive/Tar/File.pir lib/Perl5/Archive/Tar/File.pm
	@$(PARROT) -o lib/Perl5/Archive/Tar/File.pbc lib/Perl5/Archive/Tar/File.pir

lib/Perl5/Attribute/Handlers.pbc: lib/Perl5/Attribute/Handlers.pm
	@echo Compiling Attribute::Handlers
	@$(PERL6) --target=pir --output=lib/Perl5/Attribute/Handlers.pir lib/Perl5/Attribute/Handlers.pm
	@$(PARROT) -o lib/Perl5/Attribute/Handlers.pbc lib/Perl5/Attribute/Handlers.pir

lib/Perl5/AutoLoader.pbc: lib/Perl5/AutoLoader.pm
	@echo Compiling AutoLoader
	@$(PERL6) --target=pir --output=lib/Perl5/AutoLoader.pir lib/Perl5/AutoLoader.pm
	@$(PARROT) -o lib/Perl5/AutoLoader.pbc lib/Perl5/AutoLoader.pir

lib/Perl5/AutoSplit.pbc: lib/Perl5/AutoSplit.pm
	@echo Compiling AutoSplit
	@$(PERL6) --target=pir --output=lib/Perl5/AutoSplit.pir lib/Perl5/AutoSplit.pm
	@$(PARROT) -o lib/Perl5/AutoSplit.pbc lib/Perl5/AutoSplit.pir

lib/Perl5/B.pbc: lib/Perl5/B.pm
	@echo Compiling B
	@$(PERL6) --target=pir --output=lib/Perl5/B.pir lib/Perl5/B.pm
	@$(PARROT) -o lib/Perl5/B.pbc lib/Perl5/B.pir

lib/Perl5/B/Concise.pbc: lib/Perl5/B/Concise.pm
	@echo Compiling B::Concise
	@$(PERL6) --target=pir --output=lib/Perl5/B/Concise.pir lib/Perl5/B/Concise.pm
	@$(PARROT) -o lib/Perl5/B/Concise.pbc lib/Perl5/B/Concise.pir

lib/Perl5/B/Debug.pbc: lib/Perl5/B/Debug.pm
	@echo Compiling B::Debug
	@$(PERL6) --target=pir --output=lib/Perl5/B/Debug.pir lib/Perl5/B/Debug.pm
	@$(PARROT) -o lib/Perl5/B/Debug.pbc lib/Perl5/B/Debug.pir

lib/Perl5/B/Deparse.pbc: lib/Perl5/B/Deparse.pm
	@echo Compiling B::Deparse
	@$(PERL6) --target=pir --output=lib/Perl5/B/Deparse.pir lib/Perl5/B/Deparse.pm
	@$(PARROT) -o lib/Perl5/B/Deparse.pbc lib/Perl5/B/Deparse.pir

lib/Perl5/B/Lint.pbc: lib/Perl5/B/Lint.pm
	@echo Compiling B::Lint
	@$(PERL6) --target=pir --output=lib/Perl5/B/Lint.pir lib/Perl5/B/Lint.pm
	@$(PARROT) -o lib/Perl5/B/Lint.pbc lib/Perl5/B/Lint.pir

lib/Perl5/B/Lint/Debug.pbc: lib/Perl5/B/Lint/Debug.pm
	@echo Compiling B::Lint::Debug
	@$(PERL6) --target=pir --output=lib/Perl5/B/Lint/Debug.pir lib/Perl5/B/Lint/Debug.pm
	@$(PARROT) -o lib/Perl5/B/Lint/Debug.pbc lib/Perl5/B/Lint/Debug.pir

lib/Perl5/B/Showlex.pbc: lib/Perl5/B/Showlex.pm
	@echo Compiling B::Showlex
	@$(PERL6) --target=pir --output=lib/Perl5/B/Showlex.pir lib/Perl5/B/Showlex.pm
	@$(PARROT) -o lib/Perl5/B/Showlex.pbc lib/Perl5/B/Showlex.pir

lib/Perl5/B/Terse.pbc: lib/Perl5/B/Terse.pm
	@echo Compiling B::Terse
	@$(PERL6) --target=pir --output=lib/Perl5/B/Terse.pir lib/Perl5/B/Terse.pm
	@$(PARROT) -o lib/Perl5/B/Terse.pbc lib/Perl5/B/Terse.pir

lib/Perl5/B/Xref.pbc: lib/Perl5/B/Xref.pm
	@echo Compiling B::Xref
	@$(PERL6) --target=pir --output=lib/Perl5/B/Xref.pir lib/Perl5/B/Xref.pm
	@$(PARROT) -o lib/Perl5/B/Xref.pbc lib/Perl5/B/Xref.pir

lib/Perl5/Benchmark.pbc: lib/Perl5/Benchmark.pm
	@echo Compiling Benchmark
	@$(PERL6) --target=pir --output=lib/Perl5/Benchmark.pir lib/Perl5/Benchmark.pm
	@$(PARROT) -o lib/Perl5/Benchmark.pbc lib/Perl5/Benchmark.pir

lib/Perl5/Carp.pbc: lib/Perl5/Carp.pm
	@echo Compiling Carp
	@$(PERL6) --target=pir --output=lib/Perl5/Carp.pir lib/Perl5/Carp.pm
	@$(PARROT) -o lib/Perl5/Carp.pbc lib/Perl5/Carp.pir

lib/Perl5/CGI.pbc: lib/Perl5/CGI.pm
	@echo Compiling CGI
	@$(PERL6) --target=pir --output=lib/Perl5/CGI.pir lib/Perl5/CGI.pm
	@$(PARROT) -o lib/Perl5/CGI.pbc lib/Perl5/CGI.pir

lib/Perl5/CGI/Apache.pbc: lib/Perl5/CGI/Apache.pm
	@echo Compiling CGI::Apache
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Apache.pir lib/Perl5/CGI/Apache.pm
	@$(PARROT) -o lib/Perl5/CGI/Apache.pbc lib/Perl5/CGI/Apache.pir

lib/Perl5/CGI/Carp.pbc: lib/Perl5/CGI/Carp.pm
	@echo Compiling CGI::Carp
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Carp.pir lib/Perl5/CGI/Carp.pm
	@$(PARROT) -o lib/Perl5/CGI/Carp.pbc lib/Perl5/CGI/Carp.pir

lib/Perl5/CGI/Cookie.pbc: lib/Perl5/CGI/Cookie.pm
	@echo Compiling CGI::Cookie
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Cookie.pir lib/Perl5/CGI/Cookie.pm
	@$(PARROT) -o lib/Perl5/CGI/Cookie.pbc lib/Perl5/CGI/Cookie.pir

lib/Perl5/CGI/Fast.pbc: lib/Perl5/CGI/Fast.pm
	@echo Compiling CGI::Fast
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Fast.pir lib/Perl5/CGI/Fast.pm
	@$(PARROT) -o lib/Perl5/CGI/Fast.pbc lib/Perl5/CGI/Fast.pir

lib/Perl5/CGI/Pretty.pbc: lib/Perl5/CGI/Pretty.pm
	@echo Compiling CGI::Pretty
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Pretty.pir lib/Perl5/CGI/Pretty.pm
	@$(PARROT) -o lib/Perl5/CGI/Pretty.pbc lib/Perl5/CGI/Pretty.pir

lib/Perl5/CGI/Push.pbc: lib/Perl5/CGI/Push.pm
	@echo Compiling CGI::Push
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Push.pir lib/Perl5/CGI/Push.pm
	@$(PARROT) -o lib/Perl5/CGI/Push.pbc lib/Perl5/CGI/Push.pir

lib/Perl5/CGI/Switch.pbc: lib/Perl5/CGI/Switch.pm
	@echo Compiling CGI::Switch
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Switch.pir lib/Perl5/CGI/Switch.pm
	@$(PARROT) -o lib/Perl5/CGI/Switch.pbc lib/Perl5/CGI/Switch.pir

lib/Perl5/CGI/Util.pbc: lib/Perl5/CGI/Util.pm
	@echo Compiling CGI::Util
	@$(PERL6) --target=pir --output=lib/Perl5/CGI/Util.pir lib/Perl5/CGI/Util.pm
	@$(PARROT) -o lib/Perl5/CGI/Util.pbc lib/Perl5/CGI/Util.pir

lib/Perl5/Class/Struct.pbc: lib/Perl5/Class/Struct.pm
	@echo Compiling Class::Struct
	@$(PERL6) --target=pir --output=lib/Perl5/Class/Struct.pir lib/Perl5/Class/Struct.pm
	@$(PARROT) -o lib/Perl5/Class/Struct.pbc lib/Perl5/Class/Struct.pir

lib/Perl5/Compress/Raw/Bzip2.pbc: lib/Perl5/Compress/Raw/Bzip2.pm
	@echo Compiling Compress::Raw::Bzip2
	@$(PERL6) --target=pir --output=lib/Perl5/Compress/Raw/Bzip2.pir lib/Perl5/Compress/Raw/Bzip2.pm
	@$(PARROT) -o lib/Perl5/Compress/Raw/Bzip2.pbc lib/Perl5/Compress/Raw/Bzip2.pir

lib/Perl5/Compress/Raw/Zlib.pbc: lib/Perl5/Compress/Raw/Zlib.pm
	@echo Compiling Compress::Raw::Zlib
	@$(PERL6) --target=pir --output=lib/Perl5/Compress/Raw/Zlib.pir lib/Perl5/Compress/Raw/Zlib.pm
	@$(PARROT) -o lib/Perl5/Compress/Raw/Zlib.pbc lib/Perl5/Compress/Raw/Zlib.pir

lib/Perl5/Compress/Zlib.pbc: lib/Perl5/Compress/Zlib.pm
	@echo Compiling Compress::Zlib
	@$(PERL6) --target=pir --output=lib/Perl5/Compress/Zlib.pir lib/Perl5/Compress/Zlib.pm
	@$(PARROT) -o lib/Perl5/Compress/Zlib.pbc lib/Perl5/Compress/Zlib.pir

lib/Perl5/Config/Extensions.pbc: lib/Perl5/Config/Extensions.pm
	@echo Compiling Config::Extensions
	@$(PERL6) --target=pir --output=lib/Perl5/Config/Extensions.pir lib/Perl5/Config/Extensions.pm
	@$(PARROT) -o lib/Perl5/Config/Extensions.pbc lib/Perl5/Config/Extensions.pir

lib/Perl5/CPAN.pbc: lib/Perl5/CPAN.pm
	@echo Compiling CPAN
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN.pir lib/Perl5/CPAN.pm
	@$(PARROT) -o lib/Perl5/CPAN.pbc lib/Perl5/CPAN.pir

lib/Perl5/CPAN/Debug.pbc: lib/Perl5/CPAN/Debug.pm
	@echo Compiling CPAN::Debug
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Debug.pir lib/Perl5/CPAN/Debug.pm
	@$(PARROT) -o lib/Perl5/CPAN/Debug.pbc lib/Perl5/CPAN/Debug.pir

lib/Perl5/CPAN/Distroprefs.pbc: lib/Perl5/CPAN/Distroprefs.pm
	@echo Compiling CPAN::Distroprefs
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Distroprefs.pir lib/Perl5/CPAN/Distroprefs.pm
	@$(PARROT) -o lib/Perl5/CPAN/Distroprefs.pbc lib/Perl5/CPAN/Distroprefs.pir

lib/Perl5/CPAN/FirstTime.pbc: lib/Perl5/CPAN/FirstTime.pm
	@echo Compiling CPAN::FirstTime
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/FirstTime.pir lib/Perl5/CPAN/FirstTime.pm
	@$(PARROT) -o lib/Perl5/CPAN/FirstTime.pbc lib/Perl5/CPAN/FirstTime.pir

lib/Perl5/CPAN/HandleConfig.pbc: lib/Perl5/CPAN/HandleConfig.pm
	@echo Compiling CPAN::HandleConfig
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/HandleConfig.pir lib/Perl5/CPAN/HandleConfig.pm
	@$(PARROT) -o lib/Perl5/CPAN/HandleConfig.pbc lib/Perl5/CPAN/HandleConfig.pir

lib/Perl5/CPAN/Kwalify.pbc: lib/Perl5/CPAN/Kwalify.pm
	@echo Compiling CPAN::Kwalify
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Kwalify.pir lib/Perl5/CPAN/Kwalify.pm
	@$(PARROT) -o lib/Perl5/CPAN/Kwalify.pbc lib/Perl5/CPAN/Kwalify.pir

lib/Perl5/CPAN/Nox.pbc: lib/Perl5/CPAN/Nox.pm
	@echo Compiling CPAN::Nox
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Nox.pir lib/Perl5/CPAN/Nox.pm
	@$(PARROT) -o lib/Perl5/CPAN/Nox.pbc lib/Perl5/CPAN/Nox.pir

lib/Perl5/CPAN/Queue.pbc: lib/Perl5/CPAN/Queue.pm
	@echo Compiling CPAN::Queue
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Queue.pir lib/Perl5/CPAN/Queue.pm
	@$(PARROT) -o lib/Perl5/CPAN/Queue.pbc lib/Perl5/CPAN/Queue.pir

lib/Perl5/CPAN/Tarzip.pbc: lib/Perl5/CPAN/Tarzip.pm
	@echo Compiling CPAN::Tarzip
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Tarzip.pir lib/Perl5/CPAN/Tarzip.pm
	@$(PARROT) -o lib/Perl5/CPAN/Tarzip.pbc lib/Perl5/CPAN/Tarzip.pir

lib/Perl5/CPAN/Version.pbc: lib/Perl5/CPAN/Version.pm
	@echo Compiling CPAN::Version
	@$(PERL6) --target=pir --output=lib/Perl5/CPAN/Version.pir lib/Perl5/CPAN/Version.pm
	@$(PARROT) -o lib/Perl5/CPAN/Version.pbc lib/Perl5/CPAN/Version.pir

lib/Perl5/CPANPLUS.pbc: lib/Perl5/CPANPLUS.pm
	@echo Compiling CPANPLUS
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS.pir lib/Perl5/CPANPLUS.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS.pbc lib/Perl5/CPANPLUS.pir

lib/Perl5/CPANPLUS/Backend.pbc: lib/Perl5/CPANPLUS/Backend.pm
	@echo Compiling CPANPLUS::Backend
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Backend.pir lib/Perl5/CPANPLUS/Backend.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Backend.pbc lib/Perl5/CPANPLUS/Backend.pir

lib/Perl5/CPANPLUS/Backend/RV.pbc: lib/Perl5/CPANPLUS/Backend/RV.pm
	@echo Compiling CPANPLUS::Backend::RV
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Backend/RV.pir lib/Perl5/CPANPLUS/Backend/RV.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Backend/RV.pbc lib/Perl5/CPANPLUS/Backend/RV.pir

lib/Perl5/CPANPLUS/Config.pbc: lib/Perl5/CPANPLUS/Config.pm
	@echo Compiling CPANPLUS::Config
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Config.pir lib/Perl5/CPANPLUS/Config.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Config.pbc lib/Perl5/CPANPLUS/Config.pir

lib/Perl5/CPANPLUS/Configure.pbc: lib/Perl5/CPANPLUS/Configure.pm
	@echo Compiling CPANPLUS::Configure
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Configure.pir lib/Perl5/CPANPLUS/Configure.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Configure.pbc lib/Perl5/CPANPLUS/Configure.pir

lib/Perl5/CPANPLUS/Dist.pbc: lib/Perl5/CPANPLUS/Dist.pm
	@echo Compiling CPANPLUS::Dist
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist.pir lib/Perl5/CPANPLUS/Dist.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist.pbc lib/Perl5/CPANPLUS/Dist.pir

lib/Perl5/CPANPLUS/Dist/Autobundle.pbc: lib/Perl5/CPANPLUS/Dist/Autobundle.pm
	@echo Compiling CPANPLUS::Dist::Autobundle
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/Autobundle.pir lib/Perl5/CPANPLUS/Dist/Autobundle.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/Autobundle.pbc lib/Perl5/CPANPLUS/Dist/Autobundle.pir

lib/Perl5/CPANPLUS/Dist/Base.pbc: lib/Perl5/CPANPLUS/Dist/Base.pm
	@echo Compiling CPANPLUS::Dist::Base
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/Base.pir lib/Perl5/CPANPLUS/Dist/Base.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/Base.pbc lib/Perl5/CPANPLUS/Dist/Base.pir

lib/Perl5/CPANPLUS/Dist/Build.pbc: lib/Perl5/CPANPLUS/Dist/Build.pm
	@echo Compiling CPANPLUS::Dist::Build
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/Build.pir lib/Perl5/CPANPLUS/Dist/Build.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/Build.pbc lib/Perl5/CPANPLUS/Dist/Build.pir

lib/Perl5/CPANPLUS/Dist/Build/Constants.pbc: lib/Perl5/CPANPLUS/Dist/Build/Constants.pm
	@echo Compiling CPANPLUS::Dist::Build::Constants
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/Build/Constants.pir lib/Perl5/CPANPLUS/Dist/Build/Constants.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/Build/Constants.pbc lib/Perl5/CPANPLUS/Dist/Build/Constants.pir

lib/Perl5/CPANPLUS/Dist/MM.pbc: lib/Perl5/CPANPLUS/Dist/MM.pm
	@echo Compiling CPANPLUS::Dist::MM
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/MM.pir lib/Perl5/CPANPLUS/Dist/MM.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/MM.pbc lib/Perl5/CPANPLUS/Dist/MM.pir

lib/Perl5/CPANPLUS/Dist/Sample.pbc: lib/Perl5/CPANPLUS/Dist/Sample.pm
	@echo Compiling CPANPLUS::Dist::Sample
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Dist/Sample.pir lib/Perl5/CPANPLUS/Dist/Sample.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Dist/Sample.pbc lib/Perl5/CPANPLUS/Dist/Sample.pir

lib/Perl5/CPANPLUS/Error.pbc: lib/Perl5/CPANPLUS/Error.pm
	@echo Compiling CPANPLUS::Error
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Error.pir lib/Perl5/CPANPLUS/Error.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Error.pbc lib/Perl5/CPANPLUS/Error.pir

lib/Perl5/CPANPLUS/Internals.pbc: lib/Perl5/CPANPLUS/Internals.pm
	@echo Compiling CPANPLUS::Internals
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals.pir lib/Perl5/CPANPLUS/Internals.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals.pbc lib/Perl5/CPANPLUS/Internals.pir

lib/Perl5/CPANPLUS/Internals/Extract.pbc: lib/Perl5/CPANPLUS/Internals/Extract.pm
	@echo Compiling CPANPLUS::Internals::Extract
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Extract.pir lib/Perl5/CPANPLUS/Internals/Extract.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Extract.pbc lib/Perl5/CPANPLUS/Internals/Extract.pir

lib/Perl5/CPANPLUS/Internals/Fetch.pbc: lib/Perl5/CPANPLUS/Internals/Fetch.pm
	@echo Compiling CPANPLUS::Internals::Fetch
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Fetch.pir lib/Perl5/CPANPLUS/Internals/Fetch.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Fetch.pbc lib/Perl5/CPANPLUS/Internals/Fetch.pir

lib/Perl5/CPANPLUS/Internals/Report.pbc: lib/Perl5/CPANPLUS/Internals/Report.pm
	@echo Compiling CPANPLUS::Internals::Report
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Report.pir lib/Perl5/CPANPLUS/Internals/Report.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Report.pbc lib/Perl5/CPANPLUS/Internals/Report.pir

lib/Perl5/CPANPLUS/Internals/Search.pbc: lib/Perl5/CPANPLUS/Internals/Search.pm
	@echo Compiling CPANPLUS::Internals::Search
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Search.pir lib/Perl5/CPANPLUS/Internals/Search.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Search.pbc lib/Perl5/CPANPLUS/Internals/Search.pir

lib/Perl5/CPANPLUS/Internals/Source.pbc: lib/Perl5/CPANPLUS/Internals/Source.pm
	@echo Compiling CPANPLUS::Internals::Source
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Source.pir lib/Perl5/CPANPLUS/Internals/Source.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Source.pbc lib/Perl5/CPANPLUS/Internals/Source.pir

lib/Perl5/CPANPLUS/Internals/Source/Memory.pbc: lib/Perl5/CPANPLUS/Internals/Source/Memory.pm
	@echo Compiling CPANPLUS::Internals::Source::Memory
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Source/Memory.pir lib/Perl5/CPANPLUS/Internals/Source/Memory.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Source/Memory.pbc lib/Perl5/CPANPLUS/Internals/Source/Memory.pir

lib/Perl5/CPANPLUS/Internals/Source/SQLite.pbc: lib/Perl5/CPANPLUS/Internals/Source/SQLite.pm
	@echo Compiling CPANPLUS::Internals::Source::SQLite
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Source/SQLite.pir lib/Perl5/CPANPLUS/Internals/Source/SQLite.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Source/SQLite.pbc lib/Perl5/CPANPLUS/Internals/Source/SQLite.pir

lib/Perl5/CPANPLUS/Internals/Utils.pbc: lib/Perl5/CPANPLUS/Internals/Utils.pm
	@echo Compiling CPANPLUS::Internals::Utils
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Internals/Utils.pir lib/Perl5/CPANPLUS/Internals/Utils.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Internals/Utils.pbc lib/Perl5/CPANPLUS/Internals/Utils.pir

lib/Perl5/CPANPLUS/Module.pbc: lib/Perl5/CPANPLUS/Module.pm
	@echo Compiling CPANPLUS::Module
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Module.pir lib/Perl5/CPANPLUS/Module.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Module.pbc lib/Perl5/CPANPLUS/Module.pir

lib/Perl5/CPANPLUS/Module/Author.pbc: lib/Perl5/CPANPLUS/Module/Author.pm
	@echo Compiling CPANPLUS::Module::Author
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Module/Author.pir lib/Perl5/CPANPLUS/Module/Author.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Module/Author.pbc lib/Perl5/CPANPLUS/Module/Author.pir

lib/Perl5/CPANPLUS/Module/Author/Fake.pbc: lib/Perl5/CPANPLUS/Module/Author/Fake.pm
	@echo Compiling CPANPLUS::Module::Author::Fake
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Module/Author/Fake.pir lib/Perl5/CPANPLUS/Module/Author/Fake.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Module/Author/Fake.pbc lib/Perl5/CPANPLUS/Module/Author/Fake.pir

lib/Perl5/CPANPLUS/Module/Checksums.pbc: lib/Perl5/CPANPLUS/Module/Checksums.pm
	@echo Compiling CPANPLUS::Module::Checksums
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Module/Checksums.pir lib/Perl5/CPANPLUS/Module/Checksums.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Module/Checksums.pbc lib/Perl5/CPANPLUS/Module/Checksums.pir

lib/Perl5/CPANPLUS/Module/Fake.pbc: lib/Perl5/CPANPLUS/Module/Fake.pm
	@echo Compiling CPANPLUS::Module::Fake
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Module/Fake.pir lib/Perl5/CPANPLUS/Module/Fake.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Module/Fake.pbc lib/Perl5/CPANPLUS/Module/Fake.pir

lib/Perl5/CPANPLUS/Selfupdate.pbc: lib/Perl5/CPANPLUS/Selfupdate.pm
	@echo Compiling CPANPLUS::Selfupdate
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Selfupdate.pir lib/Perl5/CPANPLUS/Selfupdate.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Selfupdate.pbc lib/Perl5/CPANPLUS/Selfupdate.pir

lib/Perl5/CPANPLUS/Shell.pbc: lib/Perl5/CPANPLUS/Shell.pm
	@echo Compiling CPANPLUS::Shell
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell.pir lib/Perl5/CPANPLUS/Shell.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell.pbc lib/Perl5/CPANPLUS/Shell.pir

lib/Perl5/CPANPLUS/Shell/Classic.pbc: lib/Perl5/CPANPLUS/Shell/Classic.pm
	@echo Compiling CPANPLUS::Shell::Classic
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell/Classic.pir lib/Perl5/CPANPLUS/Shell/Classic.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell/Classic.pbc lib/Perl5/CPANPLUS/Shell/Classic.pir

lib/Perl5/CPANPLUS/Shell/Default.pbc: lib/Perl5/CPANPLUS/Shell/Default.pm
	@echo Compiling CPANPLUS::Shell::Default
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell/Default.pir lib/Perl5/CPANPLUS/Shell/Default.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell/Default.pbc lib/Perl5/CPANPLUS/Shell/Default.pir

lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pbc: lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pm
	@echo Compiling CPANPLUS::Shell::Default::Plugins::CustomSource
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pir lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource.pir

lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pbc: lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pm
	@echo Compiling CPANPLUS::Shell::Default::Plugins::Remote
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pir lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote.pir

lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pbc: lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pm
	@echo Compiling CPANPLUS::Shell::Default::Plugins::Source
	@$(PERL6) --target=pir --output=lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pir lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pm
	@$(PARROT) -o lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pbc lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source.pir

lib/Perl5/Data/Dumper.pbc: lib/Perl5/Data/Dumper.pm
	@echo Compiling Data::Dumper
	@$(PERL6) --target=pir --output=lib/Perl5/Data/Dumper.pir lib/Perl5/Data/Dumper.pm
	@$(PARROT) -o lib/Perl5/Data/Dumper.pbc lib/Perl5/Data/Dumper.pir

lib/Perl5/DB.pbc: lib/Perl5/DB.pm
	@echo Compiling DB
	@$(PERL6) --target=pir --output=lib/Perl5/DB.pir lib/Perl5/DB.pm
	@$(PARROT) -o lib/Perl5/DB.pbc lib/Perl5/DB.pir

lib/Perl5/DBM_Filter.pbc: lib/Perl5/DBM_Filter.pm
	@echo Compiling DBM_Filter
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter.pir lib/Perl5/DBM_Filter.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter.pbc lib/Perl5/DBM_Filter.pir

lib/Perl5/DBM_Filter/compress.pbc: lib/Perl5/DBM_Filter/compress.pm
	@echo Compiling DBM_Filter::compress
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter/compress.pir lib/Perl5/DBM_Filter/compress.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter/compress.pbc lib/Perl5/DBM_Filter/compress.pir

lib/Perl5/DBM_Filter/encode.pbc: lib/Perl5/DBM_Filter/encode.pm
	@echo Compiling DBM_Filter::encode
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter/encode.pir lib/Perl5/DBM_Filter/encode.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter/encode.pbc lib/Perl5/DBM_Filter/encode.pir

lib/Perl5/DBM_Filter/int32.pbc: lib/Perl5/DBM_Filter/int32.pm
	@echo Compiling DBM_Filter::int32
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter/int32.pir lib/Perl5/DBM_Filter/int32.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter/int32.pbc lib/Perl5/DBM_Filter/int32.pir

lib/Perl5/DBM_Filter/null.pbc: lib/Perl5/DBM_Filter/null.pm
	@echo Compiling DBM_Filter::null
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter/null.pir lib/Perl5/DBM_Filter/null.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter/null.pbc lib/Perl5/DBM_Filter/null.pir

lib/Perl5/DBM_Filter/utf8.pbc: lib/Perl5/DBM_Filter/utf8.pm
	@echo Compiling DBM_Filter::utf8
	@$(PERL6) --target=pir --output=lib/Perl5/DBM_Filter/utf8.pir lib/Perl5/DBM_Filter/utf8.pm
	@$(PARROT) -o lib/Perl5/DBM_Filter/utf8.pbc lib/Perl5/DBM_Filter/utf8.pir

lib/Perl5/DB_File.pbc: lib/Perl5/DB_File.pm
	@echo Compiling DB_File
	@$(PERL6) --target=pir --output=lib/Perl5/DB_File.pir lib/Perl5/DB_File.pm
	@$(PARROT) -o lib/Perl5/DB_File.pbc lib/Perl5/DB_File.pir

lib/Perl5/Devel/InnerPackage.pbc: lib/Perl5/Devel/InnerPackage.pm
	@echo Compiling Devel::InnerPackage
	@$(PERL6) --target=pir --output=lib/Perl5/Devel/InnerPackage.pir lib/Perl5/Devel/InnerPackage.pm
	@$(PARROT) -o lib/Perl5/Devel/InnerPackage.pbc lib/Perl5/Devel/InnerPackage.pir

lib/Perl5/Devel/Peek.pbc: lib/Perl5/Devel/Peek.pm
	@echo Compiling Devel::Peek
	@$(PERL6) --target=pir --output=lib/Perl5/Devel/Peek.pir lib/Perl5/Devel/Peek.pm
	@$(PARROT) -o lib/Perl5/Devel/Peek.pbc lib/Perl5/Devel/Peek.pir

lib/Perl5/Devel/PPPort.pbc: lib/Perl5/Devel/PPPort.pm
	@echo Compiling Devel::PPPort
	@$(PERL6) --target=pir --output=lib/Perl5/Devel/PPPort.pir lib/Perl5/Devel/PPPort.pm
	@$(PARROT) -o lib/Perl5/Devel/PPPort.pbc lib/Perl5/Devel/PPPort.pir

lib/Perl5/Devel/SelfStubber.pbc: lib/Perl5/Devel/SelfStubber.pm
	@echo Compiling Devel::SelfStubber
	@$(PERL6) --target=pir --output=lib/Perl5/Devel/SelfStubber.pir lib/Perl5/Devel/SelfStubber.pm
	@$(PARROT) -o lib/Perl5/Devel/SelfStubber.pbc lib/Perl5/Devel/SelfStubber.pir

lib/Perl5/Digest.pbc: lib/Perl5/Digest.pm
	@echo Compiling Digest
	@$(PERL6) --target=pir --output=lib/Perl5/Digest.pir lib/Perl5/Digest.pm
	@$(PARROT) -o lib/Perl5/Digest.pbc lib/Perl5/Digest.pir

lib/Perl5/Digest/base.pbc: lib/Perl5/Digest/base.pm
	@echo Compiling Digest::base
	@$(PERL6) --target=pir --output=lib/Perl5/Digest/base.pir lib/Perl5/Digest/base.pm
	@$(PARROT) -o lib/Perl5/Digest/base.pbc lib/Perl5/Digest/base.pir

lib/Perl5/Digest/file.pbc: lib/Perl5/Digest/file.pm
	@echo Compiling Digest::file
	@$(PERL6) --target=pir --output=lib/Perl5/Digest/file.pir lib/Perl5/Digest/file.pm
	@$(PARROT) -o lib/Perl5/Digest/file.pbc lib/Perl5/Digest/file.pir

lib/Perl5/Digest/MD5.pbc: lib/Perl5/Digest/MD5.pm
	@echo Compiling Digest::MD5
	@$(PERL6) --target=pir --output=lib/Perl5/Digest/MD5.pir lib/Perl5/Digest/MD5.pm
	@$(PARROT) -o lib/Perl5/Digest/MD5.pbc lib/Perl5/Digest/MD5.pir

lib/Perl5/Digest/SHA.pbc: lib/Perl5/Digest/SHA.pm
	@echo Compiling Digest::SHA
	@$(PERL6) --target=pir --output=lib/Perl5/Digest/SHA.pir lib/Perl5/Digest/SHA.pm
	@$(PARROT) -o lib/Perl5/Digest/SHA.pbc lib/Perl5/Digest/SHA.pir

lib/Perl5/DirHandle.pbc: lib/Perl5/DirHandle.pm
	@echo Compiling DirHandle
	@$(PERL6) --target=pir --output=lib/Perl5/DirHandle.pir lib/Perl5/DirHandle.pm
	@$(PARROT) -o lib/Perl5/DirHandle.pbc lib/Perl5/DirHandle.pir

lib/Perl5/Dumpvalue.pbc: lib/Perl5/Dumpvalue.pm
	@echo Compiling Dumpvalue
	@$(PERL6) --target=pir --output=lib/Perl5/Dumpvalue.pir lib/Perl5/Dumpvalue.pm
	@$(PARROT) -o lib/Perl5/Dumpvalue.pbc lib/Perl5/Dumpvalue.pir

lib/Perl5/DynaLoader.pbc: lib/Perl5/DynaLoader.pm
	@echo Compiling DynaLoader
	@$(PERL6) --target=pir --output=lib/Perl5/DynaLoader.pir lib/Perl5/DynaLoader.pm
	@$(PARROT) -o lib/Perl5/DynaLoader.pbc lib/Perl5/DynaLoader.pir

lib/Perl5/Encode.pbc: lib/Perl5/Encode.pm
	@echo Compiling Encode
	@$(PERL6) --target=pir --output=lib/Perl5/Encode.pir lib/Perl5/Encode.pm
	@$(PARROT) -o lib/Perl5/Encode.pbc lib/Perl5/Encode.pir

lib/Perl5/Encode/Alias.pbc: lib/Perl5/Encode/Alias.pm
	@echo Compiling Encode::Alias
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Alias.pir lib/Perl5/Encode/Alias.pm
	@$(PARROT) -o lib/Perl5/Encode/Alias.pbc lib/Perl5/Encode/Alias.pir

lib/Perl5/Encode/Byte.pbc: lib/Perl5/Encode/Byte.pm
	@echo Compiling Encode::Byte
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Byte.pir lib/Perl5/Encode/Byte.pm
	@$(PARROT) -o lib/Perl5/Encode/Byte.pbc lib/Perl5/Encode/Byte.pir

lib/Perl5/Encode/CJKConstants.pbc: lib/Perl5/Encode/CJKConstants.pm
	@echo Compiling Encode::CJKConstants
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/CJKConstants.pir lib/Perl5/Encode/CJKConstants.pm
	@$(PARROT) -o lib/Perl5/Encode/CJKConstants.pbc lib/Perl5/Encode/CJKConstants.pir

lib/Perl5/Encode/CN.pbc: lib/Perl5/Encode/CN.pm
	@echo Compiling Encode::CN
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/CN.pir lib/Perl5/Encode/CN.pm
	@$(PARROT) -o lib/Perl5/Encode/CN.pbc lib/Perl5/Encode/CN.pir

lib/Perl5/Encode/CN/HZ.pbc: lib/Perl5/Encode/CN/HZ.pm
	@echo Compiling Encode::CN::HZ
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/CN/HZ.pir lib/Perl5/Encode/CN/HZ.pm
	@$(PARROT) -o lib/Perl5/Encode/CN/HZ.pbc lib/Perl5/Encode/CN/HZ.pir

lib/Perl5/Encode/Config.pbc: lib/Perl5/Encode/Config.pm
	@echo Compiling Encode::Config
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Config.pir lib/Perl5/Encode/Config.pm
	@$(PARROT) -o lib/Perl5/Encode/Config.pbc lib/Perl5/Encode/Config.pir

lib/Perl5/Encode/EBCDIC.pbc: lib/Perl5/Encode/EBCDIC.pm
	@echo Compiling Encode::EBCDIC
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/EBCDIC.pir lib/Perl5/Encode/EBCDIC.pm
	@$(PARROT) -o lib/Perl5/Encode/EBCDIC.pbc lib/Perl5/Encode/EBCDIC.pir

lib/Perl5/Encode/Encoder.pbc: lib/Perl5/Encode/Encoder.pm
	@echo Compiling Encode::Encoder
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Encoder.pir lib/Perl5/Encode/Encoder.pm
	@$(PARROT) -o lib/Perl5/Encode/Encoder.pbc lib/Perl5/Encode/Encoder.pir

lib/Perl5/Encode/Encoding.pbc: lib/Perl5/Encode/Encoding.pm
	@echo Compiling Encode::Encoding
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Encoding.pir lib/Perl5/Encode/Encoding.pm
	@$(PARROT) -o lib/Perl5/Encode/Encoding.pbc lib/Perl5/Encode/Encoding.pir

lib/Perl5/Encode/GSM0338.pbc: lib/Perl5/Encode/GSM0338.pm
	@echo Compiling Encode::GSM0338
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/GSM0338.pir lib/Perl5/Encode/GSM0338.pm
	@$(PARROT) -o lib/Perl5/Encode/GSM0338.pbc lib/Perl5/Encode/GSM0338.pir

lib/Perl5/Encode/Guess.pbc: lib/Perl5/Encode/Guess.pm
	@echo Compiling Encode::Guess
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Guess.pir lib/Perl5/Encode/Guess.pm
	@$(PARROT) -o lib/Perl5/Encode/Guess.pbc lib/Perl5/Encode/Guess.pir

lib/Perl5/Encode/JP.pbc: lib/Perl5/Encode/JP.pm
	@echo Compiling Encode::JP
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/JP.pir lib/Perl5/Encode/JP.pm
	@$(PARROT) -o lib/Perl5/Encode/JP.pbc lib/Perl5/Encode/JP.pir

lib/Perl5/Encode/JP/H2Z.pbc: lib/Perl5/Encode/JP/H2Z.pm
	@echo Compiling Encode::JP::H2Z
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/JP/H2Z.pir lib/Perl5/Encode/JP/H2Z.pm
	@$(PARROT) -o lib/Perl5/Encode/JP/H2Z.pbc lib/Perl5/Encode/JP/H2Z.pir

lib/Perl5/Encode/JP/JIS7.pbc: lib/Perl5/Encode/JP/JIS7.pm
	@echo Compiling Encode::JP::JIS7
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/JP/JIS7.pir lib/Perl5/Encode/JP/JIS7.pm
	@$(PARROT) -o lib/Perl5/Encode/JP/JIS7.pbc lib/Perl5/Encode/JP/JIS7.pir

lib/Perl5/Encode/KR.pbc: lib/Perl5/Encode/KR.pm
	@echo Compiling Encode::KR
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/KR.pir lib/Perl5/Encode/KR.pm
	@$(PARROT) -o lib/Perl5/Encode/KR.pbc lib/Perl5/Encode/KR.pir

lib/Perl5/Encode/KR/2022_KR.pbc: lib/Perl5/Encode/KR/2022_KR.pm
	@echo Compiling Encode::KR::2022_KR
	#~ @$(PERL6) --target=pir --output=lib/Perl5/Encode/KR/2022_KR.pir lib/Perl5/Encode/KR/2022_KR.pm
	#~ @$(PARROT) -o lib/Perl5/Encode/KR/2022_KR.pbc lib/Perl5/Encode/KR/2022_KR.pir

lib/Perl5/Encode/MIME/Header.pbc: lib/Perl5/Encode/MIME/Header.pm
	@echo Compiling Encode::MIME::Header
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/MIME/Header.pir lib/Perl5/Encode/MIME/Header.pm
	@$(PARROT) -o lib/Perl5/Encode/MIME/Header.pbc lib/Perl5/Encode/MIME/Header.pir

lib/Perl5/Encode/MIME/Name.pbc: lib/Perl5/Encode/MIME/Name.pm
	@echo Compiling Encode::MIME::Name
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/MIME/Name.pir lib/Perl5/Encode/MIME/Name.pm
	@$(PARROT) -o lib/Perl5/Encode/MIME/Name.pbc lib/Perl5/Encode/MIME/Name.pir

lib/Perl5/Encode/Symbol.pbc: lib/Perl5/Encode/Symbol.pm
	@echo Compiling Encode::Symbol
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Symbol.pir lib/Perl5/Encode/Symbol.pm
	@$(PARROT) -o lib/Perl5/Encode/Symbol.pbc lib/Perl5/Encode/Symbol.pir

lib/Perl5/Encode/TW.pbc: lib/Perl5/Encode/TW.pm
	@echo Compiling Encode::TW
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/TW.pir lib/Perl5/Encode/TW.pm
	@$(PARROT) -o lib/Perl5/Encode/TW.pbc lib/Perl5/Encode/TW.pir

lib/Perl5/Encode/Unicode.pbc: lib/Perl5/Encode/Unicode.pm
	@echo Compiling Encode::Unicode
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Unicode.pir lib/Perl5/Encode/Unicode.pm
	@$(PARROT) -o lib/Perl5/Encode/Unicode.pbc lib/Perl5/Encode/Unicode.pir

lib/Perl5/Encode/Unicode/UTF7.pbc: lib/Perl5/Encode/Unicode/UTF7.pm
	@echo Compiling Encode::Unicode::UTF7
	@$(PERL6) --target=pir --output=lib/Perl5/Encode/Unicode/UTF7.pir lib/Perl5/Encode/Unicode/UTF7.pm
	@$(PARROT) -o lib/Perl5/Encode/Unicode/UTF7.pbc lib/Perl5/Encode/Unicode/UTF7.pir

lib/Perl5/English.pbc: lib/Perl5/Terms.pbc lib/Perl5/English.pm
	$(PERL6) --target=pir --stagestats --output=lib/Perl5/English.pir lib/Perl5/English.pm
	$(PARROT) -o lib/Perl5/English.pbc lib/Perl5/English.pir

lib/Perl5/Env.pbc: lib/Perl5/Env.pm
	@echo Compiling Env
	@$(PERL6) --target=pir --output=lib/Perl5/Env.pir lib/Perl5/Env.pm
	@$(PARROT) -o lib/Perl5/Env.pbc lib/Perl5/Env.pir

lib/Perl5/Errno.pbc: lib/Perl5/Errno.pm
	@echo Compiling Errno
	@$(PERL6) --target=pir --output=lib/Perl5/Errno.pir lib/Perl5/Errno.pm
	@$(PARROT) -o lib/Perl5/Errno.pbc lib/Perl5/Errno.pir

lib/Perl5/Exporter.pbc: lib/Perl5/Exporter.pm
	@echo Compiling Exporter
	@$(PERL6) --target=pir --output=lib/Perl5/Exporter.pir lib/Perl5/Exporter.pm
	@$(PARROT) -o lib/Perl5/Exporter.pbc lib/Perl5/Exporter.pir

lib/Perl5/Exporter/Heavy.pbc: lib/Perl5/Exporter/Heavy.pm
	@echo Compiling Exporter::Heavy
	@$(PERL6) --target=pir --output=lib/Perl5/Exporter/Heavy.pir lib/Perl5/Exporter/Heavy.pm
	@$(PARROT) -o lib/Perl5/Exporter/Heavy.pbc lib/Perl5/Exporter/Heavy.pir

lib/Perl5/ExtUtils/CBuilder.pbc: lib/Perl5/ExtUtils/CBuilder.pm
	@echo Compiling ExtUtils::CBuilder
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/CBuilder.pir lib/Perl5/ExtUtils/CBuilder.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/CBuilder.pbc lib/Perl5/ExtUtils/CBuilder.pir

lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pbc: lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pm
	@echo Compiling ExtUtils::CBuilder::Platform::Windows
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pir lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pbc lib/Perl5/ExtUtils/CBuilder/Platform/Windows.pir

lib/Perl5/ExtUtils/Command.pbc: lib/Perl5/ExtUtils/Command.pm
	@echo Compiling ExtUtils::Command
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Command.pir lib/Perl5/ExtUtils/Command.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Command.pbc lib/Perl5/ExtUtils/Command.pir

lib/Perl5/ExtUtils/Command/MM.pbc: lib/Perl5/ExtUtils/Command/MM.pm
	@echo Compiling ExtUtils::Command::MM
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Command/MM.pir lib/Perl5/ExtUtils/Command/MM.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Command/MM.pbc lib/Perl5/ExtUtils/Command/MM.pir

lib/Perl5/ExtUtils/Constant.pbc: lib/Perl5/ExtUtils/Constant.pm
	@echo Compiling ExtUtils::Constant
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Constant.pir lib/Perl5/ExtUtils/Constant.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Constant.pbc lib/Perl5/ExtUtils/Constant.pir

lib/Perl5/ExtUtils/Constant/Base.pbc: lib/Perl5/ExtUtils/Constant/Base.pm
	@echo Compiling ExtUtils::Constant::Base
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Constant/Base.pir lib/Perl5/ExtUtils/Constant/Base.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Constant/Base.pbc lib/Perl5/ExtUtils/Constant/Base.pir

lib/Perl5/ExtUtils/Constant/Utils.pbc: lib/Perl5/ExtUtils/Constant/Utils.pm
	@echo Compiling ExtUtils::Constant::Utils
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Constant/Utils.pir lib/Perl5/ExtUtils/Constant/Utils.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Constant/Utils.pbc lib/Perl5/ExtUtils/Constant/Utils.pir

lib/Perl5/ExtUtils/Constant/XS.pbc: lib/Perl5/ExtUtils/Constant/XS.pm
	@echo Compiling ExtUtils::Constant::XS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Constant/XS.pir lib/Perl5/ExtUtils/Constant/XS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Constant/XS.pbc lib/Perl5/ExtUtils/Constant/XS.pir

lib/Perl5/ExtUtils/Embed.pbc: lib/Perl5/ExtUtils/Embed.pm
	@echo Compiling ExtUtils::Embed
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Embed.pir lib/Perl5/ExtUtils/Embed.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Embed.pbc lib/Perl5/ExtUtils/Embed.pir

lib/Perl5/ExtUtils/Install.pbc: lib/Perl5/ExtUtils/Install.pm
	@echo Compiling ExtUtils::Install
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Install.pir lib/Perl5/ExtUtils/Install.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Install.pbc lib/Perl5/ExtUtils/Install.pir

lib/Perl5/ExtUtils/Installed.pbc: lib/Perl5/ExtUtils/Installed.pm
	@echo Compiling ExtUtils::Installed
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Installed.pir lib/Perl5/ExtUtils/Installed.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Installed.pbc lib/Perl5/ExtUtils/Installed.pir

lib/Perl5/ExtUtils/Liblist.pbc: lib/Perl5/ExtUtils/Liblist.pm
	@echo Compiling ExtUtils::Liblist
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Liblist.pir lib/Perl5/ExtUtils/Liblist.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Liblist.pbc lib/Perl5/ExtUtils/Liblist.pir

lib/Perl5/ExtUtils/MakeMaker.pbc: lib/Perl5/ExtUtils/MakeMaker.pm
	@echo Compiling ExtUtils::MakeMaker
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MakeMaker.pir lib/Perl5/ExtUtils/MakeMaker.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MakeMaker.pbc lib/Perl5/ExtUtils/MakeMaker.pir

lib/Perl5/ExtUtils/MakeMaker/Config.pbc: lib/Perl5/ExtUtils/MakeMaker/Config.pm
	@echo Compiling ExtUtils::MakeMaker::Config
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MakeMaker/Config.pir lib/Perl5/ExtUtils/MakeMaker/Config.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MakeMaker/Config.pbc lib/Perl5/ExtUtils/MakeMaker/Config.pir

lib/Perl5/ExtUtils/MakeMaker/FAQ.pbc: lib/Perl5/ExtUtils/MakeMaker/FAQ.pm
	@echo Compiling ExtUtils::MakeMaker::FAQ
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MakeMaker/FAQ.pir lib/Perl5/ExtUtils/MakeMaker/FAQ.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MakeMaker/FAQ.pbc lib/Perl5/ExtUtils/MakeMaker/FAQ.pir

lib/Perl5/ExtUtils/MakeMaker/Tutorial.pbc: lib/Perl5/ExtUtils/MakeMaker/Tutorial.pm
	@echo Compiling ExtUtils::MakeMaker::Tutorial
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MakeMaker/Tutorial.pir lib/Perl5/ExtUtils/MakeMaker/Tutorial.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MakeMaker/Tutorial.pbc lib/Perl5/ExtUtils/MakeMaker/Tutorial.pir

lib/Perl5/ExtUtils/Manifest.pbc: lib/Perl5/ExtUtils/Manifest.pm
	@echo Compiling ExtUtils::Manifest
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Manifest.pir lib/Perl5/ExtUtils/Manifest.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Manifest.pbc lib/Perl5/ExtUtils/Manifest.pir

lib/Perl5/ExtUtils/Miniperl.pbc: lib/Perl5/ExtUtils/Miniperl.pm
	@echo Compiling ExtUtils::Miniperl
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Miniperl.pir lib/Perl5/ExtUtils/Miniperl.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Miniperl.pbc lib/Perl5/ExtUtils/Miniperl.pir

lib/Perl5/ExtUtils/Mkbootstrap.pbc: lib/Perl5/ExtUtils/Mkbootstrap.pm
	@echo Compiling ExtUtils::Mkbootstrap
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Mkbootstrap.pir lib/Perl5/ExtUtils/Mkbootstrap.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Mkbootstrap.pbc lib/Perl5/ExtUtils/Mkbootstrap.pir

lib/Perl5/ExtUtils/Mksymlists.pbc: lib/Perl5/ExtUtils/Mksymlists.pm
	@echo Compiling ExtUtils::Mksymlists
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Mksymlists.pir lib/Perl5/ExtUtils/Mksymlists.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Mksymlists.pbc lib/Perl5/ExtUtils/Mksymlists.pir

lib/Perl5/ExtUtils/MM.pbc: lib/Perl5/ExtUtils/MM.pm
	@echo Compiling ExtUtils::MM
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM.pir lib/Perl5/ExtUtils/MM.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM.pbc lib/Perl5/ExtUtils/MM.pir

lib/Perl5/ExtUtils/MM_AIX.pbc: lib/Perl5/ExtUtils/MM_AIX.pm
	@echo Compiling ExtUtils::MM_AIX
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_AIX.pir lib/Perl5/ExtUtils/MM_AIX.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_AIX.pbc lib/Perl5/ExtUtils/MM_AIX.pir

lib/Perl5/ExtUtils/MM_Any.pbc: lib/Perl5/ExtUtils/MM_Any.pm
	@echo Compiling ExtUtils::MM_Any
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Any.pir lib/Perl5/ExtUtils/MM_Any.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Any.pbc lib/Perl5/ExtUtils/MM_Any.pir

lib/Perl5/ExtUtils/MM_BeOS.pbc: lib/Perl5/ExtUtils/MM_BeOS.pm
	@echo Compiling ExtUtils::MM_BeOS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_BeOS.pir lib/Perl5/ExtUtils/MM_BeOS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_BeOS.pbc lib/Perl5/ExtUtils/MM_BeOS.pir

lib/Perl5/ExtUtils/MM_Cygwin.pbc: lib/Perl5/ExtUtils/MM_Cygwin.pm
	@echo Compiling ExtUtils::MM_Cygwin
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Cygwin.pir lib/Perl5/ExtUtils/MM_Cygwin.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Cygwin.pbc lib/Perl5/ExtUtils/MM_Cygwin.pir

lib/Perl5/ExtUtils/MM_Darwin.pbc: lib/Perl5/ExtUtils/MM_Darwin.pm
	@echo Compiling ExtUtils::MM_Darwin
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Darwin.pir lib/Perl5/ExtUtils/MM_Darwin.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Darwin.pbc lib/Perl5/ExtUtils/MM_Darwin.pir

lib/Perl5/ExtUtils/MM_DOS.pbc: lib/Perl5/ExtUtils/MM_DOS.pm
	@echo Compiling ExtUtils::MM_DOS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_DOS.pir lib/Perl5/ExtUtils/MM_DOS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_DOS.pbc lib/Perl5/ExtUtils/MM_DOS.pir

lib/Perl5/ExtUtils/MM_MacOS.pbc: lib/Perl5/ExtUtils/MM_MacOS.pm
	@echo Compiling ExtUtils::MM_MacOS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_MacOS.pir lib/Perl5/ExtUtils/MM_MacOS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_MacOS.pbc lib/Perl5/ExtUtils/MM_MacOS.pir

lib/Perl5/ExtUtils/MM_NW5.pbc: lib/Perl5/ExtUtils/MM_NW5.pm
	@echo Compiling ExtUtils::MM_NW5
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_NW5.pir lib/Perl5/ExtUtils/MM_NW5.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_NW5.pbc lib/Perl5/ExtUtils/MM_NW5.pir

lib/Perl5/ExtUtils/MM_OS2.pbc: lib/Perl5/ExtUtils/MM_OS2.pm
	@echo Compiling ExtUtils::MM_OS2
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_OS2.pir lib/Perl5/ExtUtils/MM_OS2.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_OS2.pbc lib/Perl5/ExtUtils/MM_OS2.pir

lib/Perl5/ExtUtils/MM_QNX.pbc: lib/Perl5/ExtUtils/MM_QNX.pm
	@echo Compiling ExtUtils::MM_QNX
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_QNX.pir lib/Perl5/ExtUtils/MM_QNX.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_QNX.pbc lib/Perl5/ExtUtils/MM_QNX.pir

lib/Perl5/ExtUtils/MM_Unix.pbc: lib/Perl5/ExtUtils/MM_Unix.pm
	@echo Compiling ExtUtils::MM_Unix
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Unix.pir lib/Perl5/ExtUtils/MM_Unix.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Unix.pbc lib/Perl5/ExtUtils/MM_Unix.pir

lib/Perl5/ExtUtils/MM_UWIN.pbc: lib/Perl5/ExtUtils/MM_UWIN.pm
	@echo Compiling ExtUtils::MM_UWIN
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_UWIN.pir lib/Perl5/ExtUtils/MM_UWIN.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_UWIN.pbc lib/Perl5/ExtUtils/MM_UWIN.pir

lib/Perl5/ExtUtils/MM_VMS.pbc: lib/Perl5/ExtUtils/MM_VMS.pm
	@echo Compiling ExtUtils::MM_VMS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_VMS.pir lib/Perl5/ExtUtils/MM_VMS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_VMS.pbc lib/Perl5/ExtUtils/MM_VMS.pir

lib/Perl5/ExtUtils/MM_VOS.pbc: lib/Perl5/ExtUtils/MM_VOS.pm
	@echo Compiling ExtUtils::MM_VOS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_VOS.pir lib/Perl5/ExtUtils/MM_VOS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_VOS.pbc lib/Perl5/ExtUtils/MM_VOS.pir

lib/Perl5/ExtUtils/MM_Win32.pbc: lib/Perl5/ExtUtils/MM_Win32.pm
	@echo Compiling ExtUtils::MM_Win32
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Win32.pir lib/Perl5/ExtUtils/MM_Win32.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Win32.pbc lib/Perl5/ExtUtils/MM_Win32.pir

lib/Perl5/ExtUtils/MM_Win95.pbc: lib/Perl5/ExtUtils/MM_Win95.pm
	@echo Compiling ExtUtils::MM_Win95
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MM_Win95.pir lib/Perl5/ExtUtils/MM_Win95.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MM_Win95.pbc lib/Perl5/ExtUtils/MM_Win95.pir

lib/Perl5/ExtUtils/MY.pbc: lib/Perl5/ExtUtils/MY.pm
	@echo Compiling ExtUtils::MY
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/MY.pir lib/Perl5/ExtUtils/MY.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/MY.pbc lib/Perl5/ExtUtils/MY.pir

lib/Perl5/ExtUtils/Packlist.pbc: lib/Perl5/ExtUtils/Packlist.pm
	@echo Compiling ExtUtils::Packlist
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/Packlist.pir lib/Perl5/ExtUtils/Packlist.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/Packlist.pbc lib/Perl5/ExtUtils/Packlist.pir

lib/Perl5/ExtUtils/ParseXS.pbc: lib/Perl5/ExtUtils/ParseXS.pm
	@echo Compiling ExtUtils::ParseXS
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/ParseXS.pir lib/Perl5/ExtUtils/ParseXS.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/ParseXS.pbc lib/Perl5/ExtUtils/ParseXS.pir

lib/Perl5/ExtUtils/testlib.pbc: lib/Perl5/ExtUtils/testlib.pm
	@echo Compiling ExtUtils::testlib
	@$(PERL6) --target=pir --output=lib/Perl5/ExtUtils/testlib.pir lib/Perl5/ExtUtils/testlib.pm
	@$(PARROT) -o lib/Perl5/ExtUtils/testlib.pbc lib/Perl5/ExtUtils/testlib.pir

lib/Perl5/Fatal.pbc: lib/Perl5/Fatal.pm
	@echo Compiling Fatal
	@$(PERL6) --target=pir --output=lib/Perl5/Fatal.pir lib/Perl5/Fatal.pm
	@$(PARROT) -o lib/Perl5/Fatal.pbc lib/Perl5/Fatal.pir

lib/Perl5/Fcntl.pbc: lib/Perl5/Fcntl.pm
	@echo Compiling Fcntl
	@$(PERL6) --target=pir --output=lib/Perl5/Fcntl.pir lib/Perl5/Fcntl.pm
	@$(PARROT) -o lib/Perl5/Fcntl.pbc lib/Perl5/Fcntl.pir

lib/Perl5/File/Basename.pbc: lib/Perl5/File/Basename.pm
	@echo Compiling File::Basename
	@$(PERL6) --target=pir --output=lib/Perl5/File/Basename.pir lib/Perl5/File/Basename.pm
	@$(PARROT) -o lib/Perl5/File/Basename.pbc lib/Perl5/File/Basename.pir

lib/Perl5/File/CheckTree.pbc: lib/Perl5/File/CheckTree.pm
	@echo Compiling File::CheckTree
	@$(PERL6) --target=pir --output=lib/Perl5/File/CheckTree.pir lib/Perl5/File/CheckTree.pm
	@$(PARROT) -o lib/Perl5/File/CheckTree.pbc lib/Perl5/File/CheckTree.pir

lib/Perl5/File/Compare.pbc: lib/Perl5/File/Compare.pm
	@echo Compiling File::Compare
	@$(PERL6) --target=pir --output=lib/Perl5/File/Compare.pir lib/Perl5/File/Compare.pm
	@$(PARROT) -o lib/Perl5/File/Compare.pbc lib/Perl5/File/Compare.pir

lib/Perl5/File/Copy.pbc: lib/Perl5/File/Copy.pm
	@echo Compiling File::Copy
	@$(PERL6) --target=pir --output=lib/Perl5/File/Copy.pir lib/Perl5/File/Copy.pm
	@$(PARROT) -o lib/Perl5/File/Copy.pbc lib/Perl5/File/Copy.pir

lib/Perl5/File/DosGlob.pbc: lib/Perl5/File/DosGlob.pm
	@echo Compiling File::DosGlob
	@$(PERL6) --target=pir --output=lib/Perl5/File/DosGlob.pir lib/Perl5/File/DosGlob.pm
	@$(PARROT) -o lib/Perl5/File/DosGlob.pbc lib/Perl5/File/DosGlob.pir

lib/Perl5/File/Fetch.pbc: lib/Perl5/File/Fetch.pm
	@echo Compiling File::Fetch
	@$(PERL6) --target=pir --output=lib/Perl5/File/Fetch.pir lib/Perl5/File/Fetch.pm
	@$(PARROT) -o lib/Perl5/File/Fetch.pbc lib/Perl5/File/Fetch.pir

lib/Perl5/File/Find.pbc: lib/Perl5/File/Find.pm
	@echo Compiling File::Find
	@$(PERL6) --target=pir --output=lib/Perl5/File/Find.pir lib/Perl5/File/Find.pm
	@$(PARROT) -o lib/Perl5/File/Find.pbc lib/Perl5/File/Find.pir

lib/Perl5/File/Glob.pbc: lib/Perl5/File/Glob.pm
	@echo Compiling File::Glob
	@$(PERL6) --target=pir --output=lib/Perl5/File/Glob.pir lib/Perl5/File/Glob.pm
	@$(PARROT) -o lib/Perl5/File/Glob.pbc lib/Perl5/File/Glob.pir

lib/Perl5/File/GlobMapper.pbc: lib/Perl5/File/GlobMapper.pm
	@echo Compiling File::GlobMapper
	@$(PERL6) --target=pir --output=lib/Perl5/File/GlobMapper.pir lib/Perl5/File/GlobMapper.pm
	@$(PARROT) -o lib/Perl5/File/GlobMapper.pbc lib/Perl5/File/GlobMapper.pir

lib/Perl5/File/Path.pbc: lib/Perl5/File/Path.pm
	@echo Compiling File::Path
	@$(PERL6) --target=pir --output=lib/Perl5/File/Path.pir lib/Perl5/File/Path.pm
	@$(PARROT) -o lib/Perl5/File/Path.pbc lib/Perl5/File/Path.pir

lib/Perl5/File/Spec.pbc: lib/Perl5/File/Spec.pm
	@echo Compiling File::Spec
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec.pir lib/Perl5/File/Spec.pm
	@$(PARROT) -o lib/Perl5/File/Spec.pbc lib/Perl5/File/Spec.pir

lib/Perl5/File/Spec/Cygwin.pbc: lib/Perl5/File/Spec/Cygwin.pm
	@echo Compiling File::Spec::Cygwin
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Cygwin.pir lib/Perl5/File/Spec/Cygwin.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Cygwin.pbc lib/Perl5/File/Spec/Cygwin.pir

lib/Perl5/File/Spec/Epoc.pbc: lib/Perl5/File/Spec/Epoc.pm
	@echo Compiling File::Spec::Epoc
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Epoc.pir lib/Perl5/File/Spec/Epoc.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Epoc.pbc lib/Perl5/File/Spec/Epoc.pir

lib/Perl5/File/Spec/Functions.pbc: lib/Perl5/File/Spec/Functions.pm
	@echo Compiling File::Spec::Functions
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Functions.pir lib/Perl5/File/Spec/Functions.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Functions.pbc lib/Perl5/File/Spec/Functions.pir

lib/Perl5/File/Spec/Mac.pbc: lib/Perl5/File/Spec/Mac.pm
	@echo Compiling File::Spec::Mac
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Mac.pir lib/Perl5/File/Spec/Mac.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Mac.pbc lib/Perl5/File/Spec/Mac.pir

lib/Perl5/File/Spec/OS2.pbc: lib/Perl5/File/Spec/OS2.pm
	@echo Compiling File::Spec::OS2
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/OS2.pir lib/Perl5/File/Spec/OS2.pm
	@$(PARROT) -o lib/Perl5/File/Spec/OS2.pbc lib/Perl5/File/Spec/OS2.pir

lib/Perl5/File/Spec/Unix.pbc: lib/Perl5/File/Spec/Unix.pm
	@echo Compiling File::Spec::Unix
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Unix.pir lib/Perl5/File/Spec/Unix.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Unix.pbc lib/Perl5/File/Spec/Unix.pir

lib/Perl5/File/Spec/VMS.pbc: lib/Perl5/File/Spec/VMS.pm
	@echo Compiling File::Spec::VMS
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/VMS.pir lib/Perl5/File/Spec/VMS.pm
	@$(PARROT) -o lib/Perl5/File/Spec/VMS.pbc lib/Perl5/File/Spec/VMS.pir

lib/Perl5/File/Spec/Win32.pbc: lib/Perl5/File/Spec/Win32.pm
	@echo Compiling File::Spec::Win32
	@$(PERL6) --target=pir --output=lib/Perl5/File/Spec/Win32.pir lib/Perl5/File/Spec/Win32.pm
	@$(PARROT) -o lib/Perl5/File/Spec/Win32.pbc lib/Perl5/File/Spec/Win32.pir

lib/Perl5/File/stat.pbc: lib/Perl5/File/stat.pm
	@echo Compiling File::stat
	@$(PERL6) --target=pir --output=lib/Perl5/File/stat.pir lib/Perl5/File/stat.pm
	@$(PARROT) -o lib/Perl5/File/stat.pbc lib/Perl5/File/stat.pir

lib/Perl5/File/Temp.pbc: lib/Perl5/File/Temp.pm
	@echo Compiling File::Temp
	@$(PERL6) --target=pir --output=lib/Perl5/File/Temp.pir lib/Perl5/File/Temp.pm
	@$(PARROT) -o lib/Perl5/File/Temp.pbc lib/Perl5/File/Temp.pir

lib/Perl5/FileCache.pbc: lib/Perl5/FileCache.pm
	@echo Compiling FileCache
	@$(PERL6) --target=pir --output=lib/Perl5/FileCache.pir lib/Perl5/FileCache.pm
	@$(PARROT) -o lib/Perl5/FileCache.pbc lib/Perl5/FileCache.pir

lib/Perl5/FileHandle.pbc: lib/Perl5/FileHandle.pm
	@echo Compiling FileHandle
	@$(PERL6) --target=pir --output=lib/Perl5/FileHandle.pir lib/Perl5/FileHandle.pm
	@$(PARROT) -o lib/Perl5/FileHandle.pbc lib/Perl5/FileHandle.pir

lib/Perl5/Filter/Simple.pbc: lib/Perl5/Filter/Simple.pm
	@echo Compiling Filter::Simple
	@$(PERL6) --target=pir --output=lib/Perl5/Filter/Simple.pir lib/Perl5/Filter/Simple.pm
	@$(PARROT) -o lib/Perl5/Filter/Simple.pbc lib/Perl5/Filter/Simple.pir

lib/Perl5/Filter/Util/Call.pbc: lib/Perl5/Filter/Util/Call.pm
	@echo Compiling Filter::Util::Call
	@$(PERL6) --target=pir --output=lib/Perl5/Filter/Util/Call.pir lib/Perl5/Filter/Util/Call.pm
	@$(PARROT) -o lib/Perl5/Filter/Util/Call.pbc lib/Perl5/Filter/Util/Call.pir

lib/Perl5/FindBin.pbc: lib/Perl5/FindBin.pm
	@echo Compiling FindBin
	@$(PERL6) --target=pir --output=lib/Perl5/FindBin.pir lib/Perl5/FindBin.pm
	@$(PARROT) -o lib/Perl5/FindBin.pbc lib/Perl5/FindBin.pir

lib/Perl5/Getopt/Long.pbc: lib/Perl5/Getopt/Long.pm
	@echo Compiling Getopt::Long
	@$(PERL6) --target=pir --output=lib/Perl5/Getopt/Long.pir lib/Perl5/Getopt/Long.pm
	@$(PARROT) -o lib/Perl5/Getopt/Long.pbc lib/Perl5/Getopt/Long.pir

lib/Perl5/Getopt/Std.pbc: lib/Perl5/Getopt/Std.pm
	@echo Compiling Getopt::Std
	@$(PERL6) --target=pir --output=lib/Perl5/Getopt/Std.pir lib/Perl5/Getopt/Std.pm
	@$(PARROT) -o lib/Perl5/Getopt/Std.pbc lib/Perl5/Getopt/Std.pir

lib/Perl5/Hash/Util.pbc: lib/Perl5/Hash/Util.pm
	@echo Compiling Hash::Util
	@$(PERL6) --target=pir --output=lib/Perl5/Hash/Util.pir lib/Perl5/Hash/Util.pm
	@$(PARROT) -o lib/Perl5/Hash/Util.pbc lib/Perl5/Hash/Util.pir

lib/Perl5/Hash/Util/FieldHash.pbc: lib/Perl5/Hash/Util/FieldHash.pm
	@echo Compiling Hash::Util::FieldHash
	@$(PERL6) --target=pir --output=lib/Perl5/Hash/Util/FieldHash.pir lib/Perl5/Hash/Util/FieldHash.pm
	@$(PARROT) -o lib/Perl5/Hash/Util/FieldHash.pbc lib/Perl5/Hash/Util/FieldHash.pir

lib/Perl5/I18N/Collate.pbc: lib/Perl5/I18N/Collate.pm
	@echo Compiling I18N::Collate
	@$(PERL6) --target=pir --output=lib/Perl5/I18N/Collate.pir lib/Perl5/I18N/Collate.pm
	@$(PARROT) -o lib/Perl5/I18N/Collate.pbc lib/Perl5/I18N/Collate.pir

lib/Perl5/I18N/Langinfo.pbc: lib/Perl5/I18N/Langinfo.pm
	@echo Compiling I18N::Langinfo
	@$(PERL6) --target=pir --output=lib/Perl5/I18N/Langinfo.pir lib/Perl5/I18N/Langinfo.pm
	@$(PARROT) -o lib/Perl5/I18N/Langinfo.pbc lib/Perl5/I18N/Langinfo.pir

lib/Perl5/I18N/LangTags.pbc: lib/Perl5/I18N/LangTags.pm
	@echo Compiling I18N::LangTags
	@$(PERL6) --target=pir --output=lib/Perl5/I18N/LangTags.pir lib/Perl5/I18N/LangTags.pm
	@$(PARROT) -o lib/Perl5/I18N/LangTags.pbc lib/Perl5/I18N/LangTags.pir

lib/Perl5/I18N/LangTags/Detect.pbc: lib/Perl5/I18N/LangTags/Detect.pm
	@echo Compiling I18N::LangTags::Detect
	@$(PERL6) --target=pir --output=lib/Perl5/I18N/LangTags/Detect.pir lib/Perl5/I18N/LangTags/Detect.pm
	@$(PARROT) -o lib/Perl5/I18N/LangTags/Detect.pbc lib/Perl5/I18N/LangTags/Detect.pir

lib/Perl5/I18N/LangTags/List.pbc: lib/Perl5/I18N/LangTags/List.pm
	@echo Compiling I18N::LangTags::List
	@$(PERL6) --target=pir --output=lib/Perl5/I18N/LangTags/List.pir lib/Perl5/I18N/LangTags/List.pm
	@$(PARROT) -o lib/Perl5/I18N/LangTags/List.pbc lib/Perl5/I18N/LangTags/List.pir

lib/Perl5/IO.pbc: lib/Perl5/IO.pm
	@echo Compiling IO
	@$(PERL6) --target=pir --output=lib/Perl5/IO.pir lib/Perl5/IO.pm
	@$(PARROT) -o lib/Perl5/IO.pbc lib/Perl5/IO.pir

lib/Perl5/IO/Compress/Base.pbc: lib/Perl5/IO/Compress/Base.pm
	@echo Compiling IO::Compress::Base
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/Base.pir lib/Perl5/IO/Compress/Base.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/Base.pbc lib/Perl5/IO/Compress/Base.pir

lib/Perl5/IO/Compress/Bzip2.pbc: lib/Perl5/IO/Compress/Bzip2.pm
	@echo Compiling IO::Compress::Bzip2
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/Bzip2.pir lib/Perl5/IO/Compress/Bzip2.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/Bzip2.pbc lib/Perl5/IO/Compress/Bzip2.pir

lib/Perl5/IO/Compress/Deflate.pbc: lib/Perl5/IO/Compress/Deflate.pm
	@echo Compiling IO::Compress::Deflate
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/Deflate.pir lib/Perl5/IO/Compress/Deflate.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/Deflate.pbc lib/Perl5/IO/Compress/Deflate.pir

lib/Perl5/IO/Compress/Gzip.pbc: lib/Perl5/IO/Compress/Gzip.pm
	@echo Compiling IO::Compress::Gzip
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/Gzip.pir lib/Perl5/IO/Compress/Gzip.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/Gzip.pbc lib/Perl5/IO/Compress/Gzip.pir

lib/Perl5/IO/Compress/RawDeflate.pbc: lib/Perl5/IO/Compress/RawDeflate.pm
	@echo Compiling IO::Compress::RawDeflate
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/RawDeflate.pir lib/Perl5/IO/Compress/RawDeflate.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/RawDeflate.pbc lib/Perl5/IO/Compress/RawDeflate.pir

lib/Perl5/IO/Compress/Zip.pbc: lib/Perl5/IO/Compress/Zip.pm
	@echo Compiling IO::Compress::Zip
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Compress/Zip.pir lib/Perl5/IO/Compress/Zip.pm
	@$(PARROT) -o lib/Perl5/IO/Compress/Zip.pbc lib/Perl5/IO/Compress/Zip.pir

lib/Perl5/IO/Dir.pbc: lib/Perl5/IO/Dir.pm
	@echo Compiling IO::Dir
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Dir.pir lib/Perl5/IO/Dir.pm
	@$(PARROT) -o lib/Perl5/IO/Dir.pbc lib/Perl5/IO/Dir.pir

lib/Perl5/IO/File.pbc: lib/Perl5/IO/File.pm
	@echo Compiling IO::File
	@$(PERL6) --target=pir --output=lib/Perl5/IO/File.pir lib/Perl5/IO/File.pm
	@$(PARROT) -o lib/Perl5/IO/File.pbc lib/Perl5/IO/File.pir

lib/Perl5/IO/Handle.pbc: lib/Perl5/IO/Handle.pm
	@echo Compiling IO::Handle
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Handle.pir lib/Perl5/IO/Handle.pm
	@$(PARROT) -o lib/Perl5/IO/Handle.pbc lib/Perl5/IO/Handle.pir

lib/Perl5/IO/Pipe.pbc: lib/Perl5/IO/Pipe.pm
	@echo Compiling IO::Pipe
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Pipe.pir lib/Perl5/IO/Pipe.pm
	@$(PARROT) -o lib/Perl5/IO/Pipe.pbc lib/Perl5/IO/Pipe.pir

lib/Perl5/IO/Poll.pbc: lib/Perl5/IO/Poll.pm
	@echo Compiling IO::Poll
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Poll.pir lib/Perl5/IO/Poll.pm
	@$(PARROT) -o lib/Perl5/IO/Poll.pbc lib/Perl5/IO/Poll.pir

lib/Perl5/IO/Seekable.pbc: lib/Perl5/IO/Seekable.pm
	@echo Compiling IO::Seekable
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Seekable.pir lib/Perl5/IO/Seekable.pm
	@$(PARROT) -o lib/Perl5/IO/Seekable.pbc lib/Perl5/IO/Seekable.pir

lib/Perl5/IO/Select.pbc: lib/Perl5/IO/Select.pm
	@echo Compiling IO::Select
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Select.pir lib/Perl5/IO/Select.pm
	@$(PARROT) -o lib/Perl5/IO/Select.pbc lib/Perl5/IO/Select.pir

lib/Perl5/IO/Socket.pbc: lib/Perl5/IO/Socket.pm
	@echo Compiling IO::Socket
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Socket.pir lib/Perl5/IO/Socket.pm
	@$(PARROT) -o lib/Perl5/IO/Socket.pbc lib/Perl5/IO/Socket.pir

lib/Perl5/IO/Socket/INET.pbc: lib/Perl5/IO/Socket/INET.pm
	@echo Compiling IO::Socket::INET
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Socket/INET.pir lib/Perl5/IO/Socket/INET.pm
	@$(PARROT) -o lib/Perl5/IO/Socket/INET.pbc lib/Perl5/IO/Socket/INET.pir

lib/Perl5/IO/Socket/UNIX.pbc: lib/Perl5/IO/Socket/UNIX.pm
	@echo Compiling IO::Socket::UNIX
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Socket/UNIX.pir lib/Perl5/IO/Socket/UNIX.pm
	@$(PARROT) -o lib/Perl5/IO/Socket/UNIX.pbc lib/Perl5/IO/Socket/UNIX.pir

lib/Perl5/IO/Uncompress/AnyInflate.pbc: lib/Perl5/IO/Uncompress/AnyInflate.pm
	@echo Compiling IO::Uncompress::AnyInflate
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/AnyInflate.pir lib/Perl5/IO/Uncompress/AnyInflate.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/AnyInflate.pbc lib/Perl5/IO/Uncompress/AnyInflate.pir

lib/Perl5/IO/Uncompress/AnyUncompress.pbc: lib/Perl5/IO/Uncompress/AnyUncompress.pm
	@echo Compiling IO::Uncompress::AnyUncompress
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/AnyUncompress.pir lib/Perl5/IO/Uncompress/AnyUncompress.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/AnyUncompress.pbc lib/Perl5/IO/Uncompress/AnyUncompress.pir

lib/Perl5/IO/Uncompress/Base.pbc: lib/Perl5/IO/Uncompress/Base.pm
	@echo Compiling IO::Uncompress::Base
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/Base.pir lib/Perl5/IO/Uncompress/Base.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/Base.pbc lib/Perl5/IO/Uncompress/Base.pir

lib/Perl5/IO/Uncompress/Bunzip2.pbc: lib/Perl5/IO/Uncompress/Bunzip2.pm
	@echo Compiling IO::Uncompress::Bunzip2
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/Bunzip2.pir lib/Perl5/IO/Uncompress/Bunzip2.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/Bunzip2.pbc lib/Perl5/IO/Uncompress/Bunzip2.pir

lib/Perl5/IO/Uncompress/Gunzip.pbc: lib/Perl5/IO/Uncompress/Gunzip.pm
	@echo Compiling IO::Uncompress::Gunzip
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/Gunzip.pir lib/Perl5/IO/Uncompress/Gunzip.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/Gunzip.pbc lib/Perl5/IO/Uncompress/Gunzip.pir

lib/Perl5/IO/Uncompress/Inflate.pbc: lib/Perl5/IO/Uncompress/Inflate.pm
	@echo Compiling IO::Uncompress::Inflate
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/Inflate.pir lib/Perl5/IO/Uncompress/Inflate.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/Inflate.pbc lib/Perl5/IO/Uncompress/Inflate.pir

lib/Perl5/IO/Uncompress/RawInflate.pbc: lib/Perl5/IO/Uncompress/RawInflate.pm
	@echo Compiling IO::Uncompress::RawInflate
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/RawInflate.pir lib/Perl5/IO/Uncompress/RawInflate.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/RawInflate.pbc lib/Perl5/IO/Uncompress/RawInflate.pir

lib/Perl5/IO/Uncompress/Unzip.pbc: lib/Perl5/IO/Uncompress/Unzip.pm
	@echo Compiling IO::Uncompress::Unzip
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Uncompress/Unzip.pir lib/Perl5/IO/Uncompress/Unzip.pm
	@$(PARROT) -o lib/Perl5/IO/Uncompress/Unzip.pbc lib/Perl5/IO/Uncompress/Unzip.pir

lib/Perl5/IO/Zlib.pbc: lib/Perl5/IO/Zlib.pm
	@echo Compiling IO::Zlib
	@$(PERL6) --target=pir --output=lib/Perl5/IO/Zlib.pir lib/Perl5/IO/Zlib.pm
	@$(PARROT) -o lib/Perl5/IO/Zlib.pbc lib/Perl5/IO/Zlib.pir

lib/Perl5/IPC/Cmd.pbc: lib/Perl5/IPC/Cmd.pm
	@echo Compiling IPC::Cmd
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/Cmd.pir lib/Perl5/IPC/Cmd.pm
	@$(PARROT) -o lib/Perl5/IPC/Cmd.pbc lib/Perl5/IPC/Cmd.pir

lib/Perl5/IPC/Msg.pbc: lib/Perl5/IPC/Msg.pm
	@echo Compiling IPC::Msg
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/Msg.pir lib/Perl5/IPC/Msg.pm
	@$(PARROT) -o lib/Perl5/IPC/Msg.pbc lib/Perl5/IPC/Msg.pir

lib/Perl5/IPC/Open2.pbc: lib/Perl5/IPC/Open2.pm
	@echo Compiling IPC::Open2
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/Open2.pir lib/Perl5/IPC/Open2.pm
	@$(PARROT) -o lib/Perl5/IPC/Open2.pbc lib/Perl5/IPC/Open2.pir

lib/Perl5/IPC/Open3.pbc: lib/Perl5/IPC/Open3.pm
	@echo Compiling IPC::Open3
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/Open3.pir lib/Perl5/IPC/Open3.pm
	@$(PARROT) -o lib/Perl5/IPC/Open3.pbc lib/Perl5/IPC/Open3.pir

lib/Perl5/IPC/Semaphore.pbc: lib/Perl5/IPC/Semaphore.pm
	@echo Compiling IPC::Semaphore
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/Semaphore.pir lib/Perl5/IPC/Semaphore.pm
	@$(PARROT) -o lib/Perl5/IPC/Semaphore.pbc lib/Perl5/IPC/Semaphore.pir

lib/Perl5/IPC/SharedMem.pbc: lib/Perl5/IPC/SharedMem.pm
	@echo Compiling IPC::SharedMem
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/SharedMem.pir lib/Perl5/IPC/SharedMem.pm
	@$(PARROT) -o lib/Perl5/IPC/SharedMem.pbc lib/Perl5/IPC/SharedMem.pir

lib/Perl5/IPC/SysV.pbc: lib/Perl5/IPC/SysV.pm
	@echo Compiling IPC::SysV
	@$(PERL6) --target=pir --output=lib/Perl5/IPC/SysV.pir lib/Perl5/IPC/SysV.pm
	@$(PARROT) -o lib/Perl5/IPC/SysV.pbc lib/Perl5/IPC/SysV.pir

lib/Perl5/lib.pbc: lib/Perl5/lib.pm
	@echo Compiling lib
	@$(PERL6) --target=pir --output=lib/Perl5/lib.pir lib/Perl5/lib.pm
	@$(PARROT) -o lib/Perl5/lib.pbc lib/Perl5/lib.pir

lib/Perl5/List/Util.pbc: lib/Perl5/List/Util.pm
	@echo Compiling List::Util
	@$(PERL6) --target=pir --output=lib/Perl5/List/Util.pir lib/Perl5/List/Util.pm
	@$(PARROT) -o lib/Perl5/List/Util.pbc lib/Perl5/List/Util.pir

lib/Perl5/List/Util/XS.pbc: lib/Perl5/List/Util/XS.pm
	@echo Compiling List::Util::XS
	@$(PERL6) --target=pir --output=lib/Perl5/List/Util/XS.pir lib/Perl5/List/Util/XS.pm
	@$(PARROT) -o lib/Perl5/List/Util/XS.pbc lib/Perl5/List/Util/XS.pir

lib/Perl5/Locale/Country.pbc: lib/Perl5/Locale/Country.pm
	@echo Compiling Locale::Country
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Country.pir lib/Perl5/Locale/Country.pm
	@$(PARROT) -o lib/Perl5/Locale/Country.pbc lib/Perl5/Locale/Country.pir

lib/Perl5/Locale/Currency.pbc: lib/Perl5/Locale/Currency.pm
	@echo Compiling Locale::Currency
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Currency.pir lib/Perl5/Locale/Currency.pm
	@$(PARROT) -o lib/Perl5/Locale/Currency.pbc lib/Perl5/Locale/Currency.pir

lib/Perl5/Locale/Language.pbc: lib/Perl5/Locale/Language.pm
	@echo Compiling Locale::Language
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Language.pir lib/Perl5/Locale/Language.pm
	@$(PARROT) -o lib/Perl5/Locale/Language.pbc lib/Perl5/Locale/Language.pir

lib/Perl5/Locale/Maketext.pbc: lib/Perl5/Locale/Maketext.pm
	@echo Compiling Locale::Maketext
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Maketext.pir lib/Perl5/Locale/Maketext.pm
	@$(PARROT) -o lib/Perl5/Locale/Maketext.pbc lib/Perl5/Locale/Maketext.pir

lib/Perl5/Locale/Maketext/Guts.pbc: lib/Perl5/Locale/Maketext/Guts.pm
	@echo Compiling Locale::Maketext::Guts
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Maketext/Guts.pir lib/Perl5/Locale/Maketext/Guts.pm
	@$(PARROT) -o lib/Perl5/Locale/Maketext/Guts.pbc lib/Perl5/Locale/Maketext/Guts.pir

lib/Perl5/Locale/Maketext/GutsLoader.pbc: lib/Perl5/Locale/Maketext/GutsLoader.pm
	@echo Compiling Locale::Maketext::GutsLoader
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Maketext/GutsLoader.pir lib/Perl5/Locale/Maketext/GutsLoader.pm
	@$(PARROT) -o lib/Perl5/Locale/Maketext/GutsLoader.pbc lib/Perl5/Locale/Maketext/GutsLoader.pir

lib/Perl5/Locale/Maketext/Simple.pbc: lib/Perl5/Locale/Maketext/Simple.pm
	@echo Compiling Locale::Maketext::Simple
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Maketext/Simple.pir lib/Perl5/Locale/Maketext/Simple.pm
	@$(PARROT) -o lib/Perl5/Locale/Maketext/Simple.pbc lib/Perl5/Locale/Maketext/Simple.pir

lib/Perl5/Locale/Script.pbc: lib/Perl5/Locale/Script.pm
	@echo Compiling Locale::Script
	@$(PERL6) --target=pir --output=lib/Perl5/Locale/Script.pir lib/Perl5/Locale/Script.pm
	@$(PARROT) -o lib/Perl5/Locale/Script.pbc lib/Perl5/Locale/Script.pir

lib/Perl5/Log/Message.pbc: lib/Perl5/Log/Message.pm
	@echo Compiling Log::Message
	@$(PERL6) --target=pir --output=lib/Perl5/Log/Message.pir lib/Perl5/Log/Message.pm
	@$(PARROT) -o lib/Perl5/Log/Message.pbc lib/Perl5/Log/Message.pir

lib/Perl5/Log/Message/Config.pbc: lib/Perl5/Log/Message/Config.pm
	@echo Compiling Log::Message::Config
	@$(PERL6) --target=pir --output=lib/Perl5/Log/Message/Config.pir lib/Perl5/Log/Message/Config.pm
	@$(PARROT) -o lib/Perl5/Log/Message/Config.pbc lib/Perl5/Log/Message/Config.pir

lib/Perl5/Log/Message/Handlers.pbc: lib/Perl5/Log/Message/Handlers.pm
	@echo Compiling Log::Message::Handlers
	@$(PERL6) --target=pir --output=lib/Perl5/Log/Message/Handlers.pir lib/Perl5/Log/Message/Handlers.pm
	@$(PARROT) -o lib/Perl5/Log/Message/Handlers.pbc lib/Perl5/Log/Message/Handlers.pir

lib/Perl5/Log/Message/Item.pbc: lib/Perl5/Log/Message/Item.pm
	@echo Compiling Log::Message::Item
	@$(PERL6) --target=pir --output=lib/Perl5/Log/Message/Item.pir lib/Perl5/Log/Message/Item.pm
	@$(PARROT) -o lib/Perl5/Log/Message/Item.pbc lib/Perl5/Log/Message/Item.pir

lib/Perl5/Log/Message/Simple.pbc: lib/Perl5/Log/Message/Simple.pm
	@echo Compiling Log::Message::Simple
	@$(PERL6) --target=pir --output=lib/Perl5/Log/Message/Simple.pir lib/Perl5/Log/Message/Simple.pm
	@$(PARROT) -o lib/Perl5/Log/Message/Simple.pbc lib/Perl5/Log/Message/Simple.pir

lib/Perl5/Math/BigFloat.pbc: lib/Perl5/Math/BigFloat.pm
	@echo Compiling Math::BigFloat
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigFloat.pir lib/Perl5/Math/BigFloat.pm
	@$(PARROT) -o lib/Perl5/Math/BigFloat.pbc lib/Perl5/Math/BigFloat.pir

lib/Perl5/Math/BigInt.pbc: lib/Perl5/Math/BigInt.pm
	@echo Compiling Math::BigInt
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigInt.pir lib/Perl5/Math/BigInt.pm
	@$(PARROT) -o lib/Perl5/Math/BigInt.pbc lib/Perl5/Math/BigInt.pir

lib/Perl5/Math/BigInt/Calc.pbc: lib/Perl5/Math/BigInt/Calc.pm
	@echo Compiling Math::BigInt::Calc
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigInt/Calc.pir lib/Perl5/Math/BigInt/Calc.pm
	@$(PARROT) -o lib/Perl5/Math/BigInt/Calc.pbc lib/Perl5/Math/BigInt/Calc.pir

lib/Perl5/Math/BigInt/CalcEmu.pbc: lib/Perl5/Math/BigInt/CalcEmu.pm
	@echo Compiling Math::BigInt::CalcEmu
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigInt/CalcEmu.pir lib/Perl5/Math/BigInt/CalcEmu.pm
	@$(PARROT) -o lib/Perl5/Math/BigInt/CalcEmu.pbc lib/Perl5/Math/BigInt/CalcEmu.pir

lib/Perl5/Math/BigInt/FastCalc.pbc: lib/Perl5/Math/BigInt/FastCalc.pm
	@echo Compiling Math::BigInt::FastCalc
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigInt/FastCalc.pir lib/Perl5/Math/BigInt/FastCalc.pm
	@$(PARROT) -o lib/Perl5/Math/BigInt/FastCalc.pbc lib/Perl5/Math/BigInt/FastCalc.pir

lib/Perl5/Math/BigRat.pbc: lib/Perl5/Math/BigRat.pm
	@echo Compiling Math::BigRat
	@$(PERL6) --target=pir --output=lib/Perl5/Math/BigRat.pir lib/Perl5/Math/BigRat.pm
	@$(PARROT) -o lib/Perl5/Math/BigRat.pbc lib/Perl5/Math/BigRat.pir

lib/Perl5/Math/Complex.pbc: lib/Perl5/Math/Complex.pm
	@echo Compiling Math::Complex
	@$(PERL6) --target=pir --output=lib/Perl5/Math/Complex.pir lib/Perl5/Math/Complex.pm
	@$(PARROT) -o lib/Perl5/Math/Complex.pbc lib/Perl5/Math/Complex.pir

lib/Perl5/Math/Trig.pbc: lib/Perl5/Math/Trig.pm
	@echo Compiling Math::Trig
	@$(PERL6) --target=pir --output=lib/Perl5/Math/Trig.pir lib/Perl5/Math/Trig.pm
	@$(PARROT) -o lib/Perl5/Math/Trig.pbc lib/Perl5/Math/Trig.pir

lib/Perl5/Memoize.pbc: lib/Perl5/Memoize.pm
	@echo Compiling Memoize
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize.pir lib/Perl5/Memoize.pm
	@$(PARROT) -o lib/Perl5/Memoize.pbc lib/Perl5/Memoize.pir

lib/Perl5/Memoize/AnyDBM_File.pbc: lib/Perl5/Memoize/AnyDBM_File.pm
	@echo Compiling Memoize::AnyDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/AnyDBM_File.pir lib/Perl5/Memoize/AnyDBM_File.pm
	@$(PARROT) -o lib/Perl5/Memoize/AnyDBM_File.pbc lib/Perl5/Memoize/AnyDBM_File.pir

lib/Perl5/Memoize/Expire.pbc: lib/Perl5/Memoize/Expire.pm
	@echo Compiling Memoize::Expire
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/Expire.pir lib/Perl5/Memoize/Expire.pm
	@$(PARROT) -o lib/Perl5/Memoize/Expire.pbc lib/Perl5/Memoize/Expire.pir

lib/Perl5/Memoize/ExpireFile.pbc: lib/Perl5/Memoize/ExpireFile.pm
	@echo Compiling Memoize::ExpireFile
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/ExpireFile.pir lib/Perl5/Memoize/ExpireFile.pm
	@$(PARROT) -o lib/Perl5/Memoize/ExpireFile.pbc lib/Perl5/Memoize/ExpireFile.pir

lib/Perl5/Memoize/ExpireTest.pbc: lib/Perl5/Memoize/ExpireTest.pm
	@echo Compiling Memoize::ExpireTest
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/ExpireTest.pir lib/Perl5/Memoize/ExpireTest.pm
	@$(PARROT) -o lib/Perl5/Memoize/ExpireTest.pbc lib/Perl5/Memoize/ExpireTest.pir

lib/Perl5/Memoize/NDBM_File.pbc: lib/Perl5/Memoize/NDBM_File.pm
	@echo Compiling Memoize::NDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/NDBM_File.pir lib/Perl5/Memoize/NDBM_File.pm
	@$(PARROT) -o lib/Perl5/Memoize/NDBM_File.pbc lib/Perl5/Memoize/NDBM_File.pir

lib/Perl5/Memoize/SDBM_File.pbc: lib/Perl5/Memoize/SDBM_File.pm
	@echo Compiling Memoize::SDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/SDBM_File.pir lib/Perl5/Memoize/SDBM_File.pm
	@$(PARROT) -o lib/Perl5/Memoize/SDBM_File.pbc lib/Perl5/Memoize/SDBM_File.pir

lib/Perl5/Memoize/Storable.pbc: lib/Perl5/Memoize/Storable.pm
	@echo Compiling Memoize::Storable
	@$(PERL6) --target=pir --output=lib/Perl5/Memoize/Storable.pir lib/Perl5/Memoize/Storable.pm
	@$(PARROT) -o lib/Perl5/Memoize/Storable.pbc lib/Perl5/Memoize/Storable.pir

lib/Perl5/MIME/Base64.pbc: lib/Perl5/MIME/Base64.pm
	@echo Compiling MIME::Base64
	@$(PERL6) --target=pir --output=lib/Perl5/MIME/Base64.pir lib/Perl5/MIME/Base64.pm
	@$(PARROT) -o lib/Perl5/MIME/Base64.pbc lib/Perl5/MIME/Base64.pir

lib/Perl5/MIME/QuotedPrint.pbc: lib/Perl5/MIME/QuotedPrint.pm
	@echo Compiling MIME::QuotedPrint
	@$(PERL6) --target=pir --output=lib/Perl5/MIME/QuotedPrint.pir lib/Perl5/MIME/QuotedPrint.pm
	@$(PARROT) -o lib/Perl5/MIME/QuotedPrint.pbc lib/Perl5/MIME/QuotedPrint.pir

lib/Perl5/Module/Build.pbc: lib/Perl5/Module/Build.pm
	@echo Compiling Module::Build
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build.pir lib/Perl5/Module/Build.pm
	@$(PARROT) -o lib/Perl5/Module/Build.pbc lib/Perl5/Module/Build.pir

lib/Perl5/Module/Build/Base.pbc: lib/Perl5/Module/Build/Base.pm
	@echo Compiling Module::Build::Base
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Base.pir lib/Perl5/Module/Build/Base.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Base.pbc lib/Perl5/Module/Build/Base.pir

lib/Perl5/Module/Build/Compat.pbc: lib/Perl5/Module/Build/Compat.pm
	@echo Compiling Module::Build::Compat
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Compat.pir lib/Perl5/Module/Build/Compat.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Compat.pbc lib/Perl5/Module/Build/Compat.pir

lib/Perl5/Module/Build/ConfigData.pbc: lib/Perl5/Module/Build/ConfigData.pm
	@echo Compiling Module::Build::ConfigData
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/ConfigData.pir lib/Perl5/Module/Build/ConfigData.pm
	@$(PARROT) -o lib/Perl5/Module/Build/ConfigData.pbc lib/Perl5/Module/Build/ConfigData.pir

lib/Perl5/Module/Build/Cookbook.pbc: lib/Perl5/Module/Build/Cookbook.pm
	@echo Compiling Module::Build::Cookbook
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Cookbook.pir lib/Perl5/Module/Build/Cookbook.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Cookbook.pbc lib/Perl5/Module/Build/Cookbook.pir

lib/Perl5/Module/Build/ModuleInfo.pbc: lib/Perl5/Module/Build/ModuleInfo.pm
	@echo Compiling Module::Build::ModuleInfo
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/ModuleInfo.pir lib/Perl5/Module/Build/ModuleInfo.pm
	@$(PARROT) -o lib/Perl5/Module/Build/ModuleInfo.pbc lib/Perl5/Module/Build/ModuleInfo.pir

lib/Perl5/Module/Build/Notes.pbc: lib/Perl5/Module/Build/Notes.pm
	@echo Compiling Module::Build::Notes
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Notes.pir lib/Perl5/Module/Build/Notes.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Notes.pbc lib/Perl5/Module/Build/Notes.pir

lib/Perl5/Module/Build/Platform/aix.pbc: lib/Perl5/Module/Build/Platform/aix.pm
	@echo Compiling Module::Build::Platform::aix
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/aix.pir lib/Perl5/Module/Build/Platform/aix.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/aix.pbc lib/Perl5/Module/Build/Platform/aix.pir

lib/Perl5/Module/Build/Platform/Amiga.pbc: lib/Perl5/Module/Build/Platform/Amiga.pm
	@echo Compiling Module::Build::Platform::Amiga
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/Amiga.pir lib/Perl5/Module/Build/Platform/Amiga.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/Amiga.pbc lib/Perl5/Module/Build/Platform/Amiga.pir

lib/Perl5/Module/Build/Platform/cygwin.pbc: lib/Perl5/Module/Build/Platform/cygwin.pm
	@echo Compiling Module::Build::Platform::cygwin
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/cygwin.pir lib/Perl5/Module/Build/Platform/cygwin.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/cygwin.pbc lib/Perl5/Module/Build/Platform/cygwin.pir

lib/Perl5/Module/Build/Platform/darwin.pbc: lib/Perl5/Module/Build/Platform/darwin.pm
	@echo Compiling Module::Build::Platform::darwin
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/darwin.pir lib/Perl5/Module/Build/Platform/darwin.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/darwin.pbc lib/Perl5/Module/Build/Platform/darwin.pir

lib/Perl5/Module/Build/Platform/Default.pbc: lib/Perl5/Module/Build/Platform/Default.pm
	@echo Compiling Module::Build::Platform::Default
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/Default.pir lib/Perl5/Module/Build/Platform/Default.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/Default.pbc lib/Perl5/Module/Build/Platform/Default.pir

lib/Perl5/Module/Build/Platform/EBCDIC.pbc: lib/Perl5/Module/Build/Platform/EBCDIC.pm
	@echo Compiling Module::Build::Platform::EBCDIC
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/EBCDIC.pir lib/Perl5/Module/Build/Platform/EBCDIC.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/EBCDIC.pbc lib/Perl5/Module/Build/Platform/EBCDIC.pir

lib/Perl5/Module/Build/Platform/MacOS.pbc: lib/Perl5/Module/Build/Platform/MacOS.pm
	@echo Compiling Module::Build::Platform::MacOS
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/MacOS.pir lib/Perl5/Module/Build/Platform/MacOS.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/MacOS.pbc lib/Perl5/Module/Build/Platform/MacOS.pir

lib/Perl5/Module/Build/Platform/MPEiX.pbc: lib/Perl5/Module/Build/Platform/MPEiX.pm
	@echo Compiling Module::Build::Platform::MPEiX
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/MPEiX.pir lib/Perl5/Module/Build/Platform/MPEiX.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/MPEiX.pbc lib/Perl5/Module/Build/Platform/MPEiX.pir

lib/Perl5/Module/Build/Platform/os2.pbc: lib/Perl5/Module/Build/Platform/os2.pm
	@echo Compiling Module::Build::Platform::os2
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/os2.pir lib/Perl5/Module/Build/Platform/os2.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/os2.pbc lib/Perl5/Module/Build/Platform/os2.pir

lib/Perl5/Module/Build/Platform/RiscOS.pbc: lib/Perl5/Module/Build/Platform/RiscOS.pm
	@echo Compiling Module::Build::Platform::RiscOS
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/RiscOS.pir lib/Perl5/Module/Build/Platform/RiscOS.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/RiscOS.pbc lib/Perl5/Module/Build/Platform/RiscOS.pir

lib/Perl5/Module/Build/Platform/Unix.pbc: lib/Perl5/Module/Build/Platform/Unix.pm
	@echo Compiling Module::Build::Platform::Unix
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/Unix.pir lib/Perl5/Module/Build/Platform/Unix.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/Unix.pbc lib/Perl5/Module/Build/Platform/Unix.pir

lib/Perl5/Module/Build/Platform/VMS.pbc: lib/Perl5/Module/Build/Platform/VMS.pm
	@echo Compiling Module::Build::Platform::VMS
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/VMS.pir lib/Perl5/Module/Build/Platform/VMS.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/VMS.pbc lib/Perl5/Module/Build/Platform/VMS.pir

lib/Perl5/Module/Build/Platform/VOS.pbc: lib/Perl5/Module/Build/Platform/VOS.pm
	@echo Compiling Module::Build::Platform::VOS
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/VOS.pir lib/Perl5/Module/Build/Platform/VOS.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/VOS.pbc lib/Perl5/Module/Build/Platform/VOS.pir

lib/Perl5/Module/Build/Platform/Windows.pbc: lib/Perl5/Module/Build/Platform/Windows.pm
	@echo Compiling Module::Build::Platform::Windows
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Platform/Windows.pir lib/Perl5/Module/Build/Platform/Windows.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Platform/Windows.pbc lib/Perl5/Module/Build/Platform/Windows.pir

lib/Perl5/Module/Build/PPMMaker.pbc: lib/Perl5/Module/Build/PPMMaker.pm
	@echo Compiling Module::Build::PPMMaker
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/PPMMaker.pir lib/Perl5/Module/Build/PPMMaker.pm
	@$(PARROT) -o lib/Perl5/Module/Build/PPMMaker.pbc lib/Perl5/Module/Build/PPMMaker.pir

lib/Perl5/Module/Build/Version.pbc: lib/Perl5/Module/Build/Version.pm
	@echo Compiling Module::Build::Version
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/Version.pir lib/Perl5/Module/Build/Version.pm
	@$(PARROT) -o lib/Perl5/Module/Build/Version.pbc lib/Perl5/Module/Build/Version.pir

lib/Perl5/Module/Build/YAML.pbc: lib/Perl5/Module/Build/YAML.pm
	@echo Compiling Module::Build::YAML
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Build/YAML.pir lib/Perl5/Module/Build/YAML.pm
	@$(PARROT) -o lib/Perl5/Module/Build/YAML.pbc lib/Perl5/Module/Build/YAML.pir

lib/Perl5/Module/CoreList.pbc: lib/Perl5/Module/CoreList.pm
	@echo Compiling Module::CoreList
	@$(PERL6) --target=pir --output=lib/Perl5/Module/CoreList.pir lib/Perl5/Module/CoreList.pm
	@$(PARROT) -o lib/Perl5/Module/CoreList.pbc lib/Perl5/Module/CoreList.pir

lib/Perl5/Module/Load.pbc: lib/Perl5/Module/Load.pm
	@echo Compiling Module::Load
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Load.pir lib/Perl5/Module/Load.pm
	@$(PARROT) -o lib/Perl5/Module/Load.pbc lib/Perl5/Module/Load.pir

lib/Perl5/Module/Load/Conditional.pbc: lib/Perl5/Module/Load/Conditional.pm
	@echo Compiling Module::Load::Conditional
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Load/Conditional.pir lib/Perl5/Module/Load/Conditional.pm
	@$(PARROT) -o lib/Perl5/Module/Load/Conditional.pbc lib/Perl5/Module/Load/Conditional.pir

lib/Perl5/Module/Loaded.pbc: lib/Perl5/Module/Loaded.pm
	@echo Compiling Module::Loaded
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Loaded.pir lib/Perl5/Module/Loaded.pm
	@$(PARROT) -o lib/Perl5/Module/Loaded.pbc lib/Perl5/Module/Loaded.pir

lib/Perl5/Module/Pluggable.pbc: lib/Perl5/Module/Pluggable.pm
	@echo Compiling Module::Pluggable
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Pluggable.pir lib/Perl5/Module/Pluggable.pm
	@$(PARROT) -o lib/Perl5/Module/Pluggable.pbc lib/Perl5/Module/Pluggable.pir

lib/Perl5/Module/Pluggable/Object.pbc: lib/Perl5/Module/Pluggable/Object.pm
	@echo Compiling Module::Pluggable::Object
	@$(PERL6) --target=pir --output=lib/Perl5/Module/Pluggable/Object.pir lib/Perl5/Module/Pluggable/Object.pm
	@$(PARROT) -o lib/Perl5/Module/Pluggable/Object.pbc lib/Perl5/Module/Pluggable/Object.pir

lib/Perl5/mro.pbc: lib/Perl5/mro.pm
	@echo Compiling mro
	@$(PERL6) --target=pir --output=lib/Perl5/mro.pir lib/Perl5/mro.pm
	@$(PARROT) -o lib/Perl5/mro.pbc lib/Perl5/mro.pir

lib/Perl5/NDBM_File.pbc: lib/Perl5/NDBM_File.pm
	@echo Compiling NDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/NDBM_File.pir lib/Perl5/NDBM_File.pm
	@$(PARROT) -o lib/Perl5/NDBM_File.pbc lib/Perl5/NDBM_File.pir

lib/Perl5/Net/Cmd.pbc: lib/Perl5/Net/Cmd.pm
	@echo Compiling Net::Cmd
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Cmd.pir lib/Perl5/Net/Cmd.pm
	@$(PARROT) -o lib/Perl5/Net/Cmd.pbc lib/Perl5/Net/Cmd.pir

lib/Perl5/Net/Config.pbc: lib/Perl5/Net/Config.pm
	@echo Compiling Net::Config
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Config.pir lib/Perl5/Net/Config.pm
	@$(PARROT) -o lib/Perl5/Net/Config.pbc lib/Perl5/Net/Config.pir

lib/Perl5/Net/Domain.pbc: lib/Perl5/Net/Domain.pm
	@echo Compiling Net::Domain
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Domain.pir lib/Perl5/Net/Domain.pm
	@$(PARROT) -o lib/Perl5/Net/Domain.pbc lib/Perl5/Net/Domain.pir

lib/Perl5/Net/FTP.pbc: lib/Perl5/Net/FTP.pm
	@echo Compiling Net::FTP
	@$(PERL6) --target=pir --output=lib/Perl5/Net/FTP.pir lib/Perl5/Net/FTP.pm
	@$(PARROT) -o lib/Perl5/Net/FTP.pbc lib/Perl5/Net/FTP.pir

lib/Perl5/Net/hostent.pbc: lib/Perl5/Net/hostent.pm
	@echo Compiling Net::hostent
	@$(PERL6) --target=pir --output=lib/Perl5/Net/hostent.pir lib/Perl5/Net/hostent.pm
	@$(PARROT) -o lib/Perl5/Net/hostent.pbc lib/Perl5/Net/hostent.pir

lib/Perl5/Net/netent.pbc: lib/Perl5/Net/netent.pm
	@echo Compiling Net::netent
	@$(PERL6) --target=pir --output=lib/Perl5/Net/netent.pir lib/Perl5/Net/netent.pm
	@$(PARROT) -o lib/Perl5/Net/netent.pbc lib/Perl5/Net/netent.pir

lib/Perl5/Net/Netrc.pbc: lib/Perl5/Net/Netrc.pm
	@echo Compiling Net::Netrc
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Netrc.pir lib/Perl5/Net/Netrc.pm
	@$(PARROT) -o lib/Perl5/Net/Netrc.pbc lib/Perl5/Net/Netrc.pir

lib/Perl5/Net/NNTP.pbc: lib/Perl5/Net/NNTP.pm
	@echo Compiling Net::NNTP
	@$(PERL6) --target=pir --output=lib/Perl5/Net/NNTP.pir lib/Perl5/Net/NNTP.pm
	@$(PARROT) -o lib/Perl5/Net/NNTP.pbc lib/Perl5/Net/NNTP.pir

lib/Perl5/Net/Ping.pbc: lib/Perl5/Net/Ping.pm
	@echo Compiling Net::Ping
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Ping.pir lib/Perl5/Net/Ping.pm
	@$(PARROT) -o lib/Perl5/Net/Ping.pbc lib/Perl5/Net/Ping.pir

lib/Perl5/Net/POP3.pbc: lib/Perl5/Net/POP3.pm
	@echo Compiling Net::POP3
	@$(PERL6) --target=pir --output=lib/Perl5/Net/POP3.pir lib/Perl5/Net/POP3.pm
	@$(PARROT) -o lib/Perl5/Net/POP3.pbc lib/Perl5/Net/POP3.pir

lib/Perl5/Net/protoent.pbc: lib/Perl5/Net/protoent.pm
	@echo Compiling Net::protoent
	@$(PERL6) --target=pir --output=lib/Perl5/Net/protoent.pir lib/Perl5/Net/protoent.pm
	@$(PARROT) -o lib/Perl5/Net/protoent.pbc lib/Perl5/Net/protoent.pir

lib/Perl5/Net/servent.pbc: lib/Perl5/Net/servent.pm
	@echo Compiling Net::servent
	@$(PERL6) --target=pir --output=lib/Perl5/Net/servent.pir lib/Perl5/Net/servent.pm
	@$(PARROT) -o lib/Perl5/Net/servent.pbc lib/Perl5/Net/servent.pir

lib/Perl5/Net/SMTP.pbc: lib/Perl5/Net/SMTP.pm
	@echo Compiling Net::SMTP
	@$(PERL6) --target=pir --output=lib/Perl5/Net/SMTP.pir lib/Perl5/Net/SMTP.pm
	@$(PARROT) -o lib/Perl5/Net/SMTP.pbc lib/Perl5/Net/SMTP.pir

lib/Perl5/Net/Time.pbc: lib/Perl5/Net/Time.pm
	@echo Compiling Net::Time
	@$(PERL6) --target=pir --output=lib/Perl5/Net/Time.pir lib/Perl5/Net/Time.pm
	@$(PARROT) -o lib/Perl5/Net/Time.pbc lib/Perl5/Net/Time.pir

lib/Perl5/NEXT.pbc: lib/Perl5/NEXT.pm
	@echo Compiling NEXT
	@$(PERL6) --target=pir --output=lib/Perl5/NEXT.pir lib/Perl5/NEXT.pm
	@$(PARROT) -o lib/Perl5/NEXT.pbc lib/Perl5/NEXT.pir

lib/Perl5/O.pbc: lib/Perl5/O.pm
	@echo Compiling O
	@$(PERL6) --target=pir --output=lib/Perl5/O.pir lib/Perl5/O.pm
	@$(PARROT) -o lib/Perl5/O.pbc lib/Perl5/O.pir

lib/Perl5/Object/Accessor.pbc: lib/Perl5/Object/Accessor.pm
	@echo Compiling Object::Accessor
	@$(PERL6) --target=pir --output=lib/Perl5/Object/Accessor.pir lib/Perl5/Object/Accessor.pm
	@$(PARROT) -o lib/Perl5/Object/Accessor.pbc lib/Perl5/Object/Accessor.pir

lib/Perl5/Opcode.pbc: lib/Perl5/Opcode.pm
	@echo Compiling Opcode
	@$(PERL6) --target=pir --output=lib/Perl5/Opcode.pir lib/Perl5/Opcode.pm
	@$(PARROT) -o lib/Perl5/Opcode.pbc lib/Perl5/Opcode.pir

lib/Perl5/overload.pbc: lib/Perl5/overload.pm
	@echo Compiling overload
	@$(PERL6) --target=pir --output=lib/Perl5/overload.pir lib/Perl5/overload.pm
	@$(PARROT) -o lib/Perl5/overload.pbc lib/Perl5/overload.pir

lib/Perl5/Package/Constants.pbc: lib/Perl5/Package/Constants.pm
	@echo Compiling Package::Constants
	@$(PERL6) --target=pir --output=lib/Perl5/Package/Constants.pir lib/Perl5/Package/Constants.pm
	@$(PARROT) -o lib/Perl5/Package/Constants.pbc lib/Perl5/Package/Constants.pir

lib/Perl5/Params/Check.pbc: lib/Perl5/Params/Check.pm
	@echo Compiling Params::Check
	@$(PERL6) --target=pir --output=lib/Perl5/Params/Check.pir lib/Perl5/Params/Check.pm
	@$(PARROT) -o lib/Perl5/Params/Check.pbc lib/Perl5/Params/Check.pir

lib/Perl5/Parse/CPAN/Meta.pbc: lib/Perl5/Parse/CPAN/Meta.pm
	@echo Compiling Parse::CPAN::Meta
	@$(PERL6) --target=pir --output=lib/Perl5/Parse/CPAN/Meta.pir lib/Perl5/Parse/CPAN/Meta.pm
	@$(PARROT) -o lib/Perl5/Parse/CPAN/Meta.pbc lib/Perl5/Parse/CPAN/Meta.pir

lib/Perl5/PerlIO.pbc: lib/Perl5/PerlIO.pm
	@echo Compiling PerlIO
	@$(PERL6) --target=pir --output=lib/Perl5/PerlIO.pir lib/Perl5/PerlIO.pm
	@$(PARROT) -o lib/Perl5/PerlIO.pbc lib/Perl5/PerlIO.pir

lib/Perl5/PerlIO/encoding.pbc: lib/Perl5/PerlIO/encoding.pm
	@echo Compiling PerlIO::encoding
	@$(PERL6) --target=pir --output=lib/Perl5/PerlIO/encoding.pir lib/Perl5/PerlIO/encoding.pm
	@$(PARROT) -o lib/Perl5/PerlIO/encoding.pbc lib/Perl5/PerlIO/encoding.pir

lib/Perl5/PerlIO/scalar.pbc: lib/Perl5/PerlIO/scalar.pm
	@echo Compiling PerlIO::scalar
	@$(PERL6) --target=pir --output=lib/Perl5/PerlIO/scalar.pir lib/Perl5/PerlIO/scalar.pm
	@$(PARROT) -o lib/Perl5/PerlIO/scalar.pbc lib/Perl5/PerlIO/scalar.pir

lib/Perl5/PerlIO/via.pbc: lib/Perl5/PerlIO/via.pm
	@echo Compiling PerlIO::via
	@$(PERL6) --target=pir --output=lib/Perl5/PerlIO/via.pir lib/Perl5/PerlIO/via.pm
	@$(PARROT) -o lib/Perl5/PerlIO/via.pbc lib/Perl5/PerlIO/via.pir

lib/Perl5/PerlIO/via/QuotedPrint.pbc: lib/Perl5/PerlIO/via/QuotedPrint.pm
	@echo Compiling PerlIO::via::QuotedPrint
	@$(PERL6) --target=pir --output=lib/Perl5/PerlIO/via/QuotedPrint.pir lib/Perl5/PerlIO/via/QuotedPrint.pm
	@$(PARROT) -o lib/Perl5/PerlIO/via/QuotedPrint.pbc lib/Perl5/PerlIO/via/QuotedPrint.pir

lib/Perl5/Pod/Checker.pbc: lib/Perl5/Pod/Checker.pm
	@echo Compiling Pod::Checker
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Checker.pir lib/Perl5/Pod/Checker.pm
	@$(PARROT) -o lib/Perl5/Pod/Checker.pbc lib/Perl5/Pod/Checker.pir

lib/Perl5/Pod/Escapes.pbc: lib/Perl5/Pod/Escapes.pm
	@echo Compiling Pod::Escapes
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Escapes.pir lib/Perl5/Pod/Escapes.pm
	@$(PARROT) -o lib/Perl5/Pod/Escapes.pbc lib/Perl5/Pod/Escapes.pir

lib/Perl5/Pod/Find.pbc: lib/Perl5/Pod/Find.pm
	@echo Compiling Pod::Find
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Find.pir lib/Perl5/Pod/Find.pm
	@$(PARROT) -o lib/Perl5/Pod/Find.pbc lib/Perl5/Pod/Find.pir

lib/Perl5/Pod/Functions.pbc: lib/Perl5/Pod/Functions.pm
	@echo Compiling Pod::Functions
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Functions.pir lib/Perl5/Pod/Functions.pm
	@$(PARROT) -o lib/Perl5/Pod/Functions.pbc lib/Perl5/Pod/Functions.pir

lib/Perl5/Pod/Html.pbc: lib/Perl5/Pod/Html.pm
	@echo Compiling Pod::Html
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Html.pir lib/Perl5/Pod/Html.pm
	@$(PARROT) -o lib/Perl5/Pod/Html.pbc lib/Perl5/Pod/Html.pir

lib/Perl5/Pod/InputObjects.pbc: lib/Perl5/Pod/InputObjects.pm
	@echo Compiling Pod::InputObjects
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/InputObjects.pir lib/Perl5/Pod/InputObjects.pm
	@$(PARROT) -o lib/Perl5/Pod/InputObjects.pbc lib/Perl5/Pod/InputObjects.pir

lib/Perl5/Pod/LaTeX.pbc: lib/Perl5/Pod/LaTeX.pm
	@echo Compiling Pod::LaTeX
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/LaTeX.pir lib/Perl5/Pod/LaTeX.pm
	@$(PARROT) -o lib/Perl5/Pod/LaTeX.pbc lib/Perl5/Pod/LaTeX.pir

lib/Perl5/Pod/Man.pbc: lib/Perl5/Pod/Man.pm
	@echo Compiling Pod::Man
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Man.pir lib/Perl5/Pod/Man.pm
	@$(PARROT) -o lib/Perl5/Pod/Man.pbc lib/Perl5/Pod/Man.pir

lib/Perl5/Pod/ParseLink.pbc: lib/Perl5/Pod/ParseLink.pm
	@echo Compiling Pod::ParseLink
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/ParseLink.pir lib/Perl5/Pod/ParseLink.pm
	@$(PARROT) -o lib/Perl5/Pod/ParseLink.pbc lib/Perl5/Pod/ParseLink.pir

lib/Perl5/Pod/Parser.pbc: lib/Perl5/Pod/Parser.pm
	@echo Compiling Pod::Parser
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Parser.pir lib/Perl5/Pod/Parser.pm
	@$(PARROT) -o lib/Perl5/Pod/Parser.pbc lib/Perl5/Pod/Parser.pir

lib/Perl5/Pod/ParseUtils.pbc: lib/Perl5/Pod/ParseUtils.pm
	@echo Compiling Pod::ParseUtils
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/ParseUtils.pir lib/Perl5/Pod/ParseUtils.pm
	@$(PARROT) -o lib/Perl5/Pod/ParseUtils.pbc lib/Perl5/Pod/ParseUtils.pir

lib/Perl5/Pod/Perldoc.pbc: lib/Perl5/Pod/Perldoc.pm
	@echo Compiling Pod::Perldoc
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc.pir lib/Perl5/Pod/Perldoc.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc.pbc lib/Perl5/Pod/Perldoc.pir

lib/Perl5/Pod/Perldoc/BaseTo.pbc: lib/Perl5/Pod/Perldoc/BaseTo.pm
	@echo Compiling Pod::Perldoc::BaseTo
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/BaseTo.pir lib/Perl5/Pod/Perldoc/BaseTo.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/BaseTo.pbc lib/Perl5/Pod/Perldoc/BaseTo.pir

lib/Perl5/Pod/Perldoc/GetOptsOO.pbc: lib/Perl5/Pod/Perldoc/GetOptsOO.pm
	@echo Compiling Pod::Perldoc::GetOptsOO
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/GetOptsOO.pir lib/Perl5/Pod/Perldoc/GetOptsOO.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/GetOptsOO.pbc lib/Perl5/Pod/Perldoc/GetOptsOO.pir

lib/Perl5/Pod/Perldoc/ToChecker.pbc: lib/Perl5/Pod/Perldoc/ToChecker.pm
	@echo Compiling Pod::Perldoc::ToChecker
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToChecker.pir lib/Perl5/Pod/Perldoc/ToChecker.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToChecker.pbc lib/Perl5/Pod/Perldoc/ToChecker.pir

lib/Perl5/Pod/Perldoc/ToMan.pbc: lib/Perl5/Pod/Perldoc/ToMan.pm
	@echo Compiling Pod::Perldoc::ToMan
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToMan.pir lib/Perl5/Pod/Perldoc/ToMan.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToMan.pbc lib/Perl5/Pod/Perldoc/ToMan.pir

lib/Perl5/Pod/Perldoc/ToNroff.pbc: lib/Perl5/Pod/Perldoc/ToNroff.pm
	@echo Compiling Pod::Perldoc::ToNroff
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToNroff.pir lib/Perl5/Pod/Perldoc/ToNroff.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToNroff.pbc lib/Perl5/Pod/Perldoc/ToNroff.pir

lib/Perl5/Pod/Perldoc/ToPod.pbc: lib/Perl5/Pod/Perldoc/ToPod.pm
	@echo Compiling Pod::Perldoc::ToPod
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToPod.pir lib/Perl5/Pod/Perldoc/ToPod.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToPod.pbc lib/Perl5/Pod/Perldoc/ToPod.pir

lib/Perl5/Pod/Perldoc/ToRtf.pbc: lib/Perl5/Pod/Perldoc/ToRtf.pm
	@echo Compiling Pod::Perldoc::ToRtf
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToRtf.pir lib/Perl5/Pod/Perldoc/ToRtf.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToRtf.pbc lib/Perl5/Pod/Perldoc/ToRtf.pir

lib/Perl5/Pod/Perldoc/ToText.pbc: lib/Perl5/Pod/Perldoc/ToText.pm
	@echo Compiling Pod::Perldoc::ToText
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToText.pir lib/Perl5/Pod/Perldoc/ToText.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToText.pbc lib/Perl5/Pod/Perldoc/ToText.pir

lib/Perl5/Pod/Perldoc/ToTk.pbc: lib/Perl5/Pod/Perldoc/ToTk.pm
	@echo Compiling Pod::Perldoc::ToTk
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToTk.pir lib/Perl5/Pod/Perldoc/ToTk.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToTk.pbc lib/Perl5/Pod/Perldoc/ToTk.pir

lib/Perl5/Pod/Perldoc/ToXml.pbc: lib/Perl5/Pod/Perldoc/ToXml.pm
	@echo Compiling Pod::Perldoc::ToXml
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Perldoc/ToXml.pir lib/Perl5/Pod/Perldoc/ToXml.pm
	@$(PARROT) -o lib/Perl5/Pod/Perldoc/ToXml.pbc lib/Perl5/Pod/Perldoc/ToXml.pir

lib/Perl5/Pod/PlainText.pbc: lib/Perl5/Pod/PlainText.pm
	@echo Compiling Pod::PlainText
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/PlainText.pir lib/Perl5/Pod/PlainText.pm
	@$(PARROT) -o lib/Perl5/Pod/PlainText.pbc lib/Perl5/Pod/PlainText.pir

lib/Perl5/Pod/Select.pbc: lib/Perl5/Pod/Select.pm
	@echo Compiling Pod::Select
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Select.pir lib/Perl5/Pod/Select.pm
	@$(PARROT) -o lib/Perl5/Pod/Select.pbc lib/Perl5/Pod/Select.pir

lib/Perl5/Pod/Simple.pbc: lib/Perl5/Pod/Simple.pm
	@echo Compiling Pod::Simple
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple.pir lib/Perl5/Pod/Simple.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple.pbc lib/Perl5/Pod/Simple.pir

lib/Perl5/Pod/Simple/Checker.pbc: lib/Perl5/Pod/Simple/Checker.pm
	@echo Compiling Pod::Simple::Checker
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/Checker.pir lib/Perl5/Pod/Simple/Checker.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/Checker.pbc lib/Perl5/Pod/Simple/Checker.pir

lib/Perl5/Pod/Simple/Debug.pbc: lib/Perl5/Pod/Simple/Debug.pm
	@echo Compiling Pod::Simple::Debug
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/Debug.pir lib/Perl5/Pod/Simple/Debug.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/Debug.pbc lib/Perl5/Pod/Simple/Debug.pir

lib/Perl5/Pod/Simple/DumpAsText.pbc: lib/Perl5/Pod/Simple/DumpAsText.pm
	@echo Compiling Pod::Simple::DumpAsText
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/DumpAsText.pir lib/Perl5/Pod/Simple/DumpAsText.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/DumpAsText.pbc lib/Perl5/Pod/Simple/DumpAsText.pir

lib/Perl5/Pod/Simple/DumpAsXML.pbc: lib/Perl5/Pod/Simple/DumpAsXML.pm
	@echo Compiling Pod::Simple::DumpAsXML
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/DumpAsXML.pir lib/Perl5/Pod/Simple/DumpAsXML.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/DumpAsXML.pbc lib/Perl5/Pod/Simple/DumpAsXML.pir

lib/Perl5/Pod/Simple/HTML.pbc: lib/Perl5/Pod/Simple/HTML.pm
	@echo Compiling Pod::Simple::HTML
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/HTML.pir lib/Perl5/Pod/Simple/HTML.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/HTML.pbc lib/Perl5/Pod/Simple/HTML.pir

lib/Perl5/Pod/Simple/HTMLBatch.pbc: lib/Perl5/Pod/Simple/HTMLBatch.pm
	@echo Compiling Pod::Simple::HTMLBatch
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/HTMLBatch.pir lib/Perl5/Pod/Simple/HTMLBatch.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/HTMLBatch.pbc lib/Perl5/Pod/Simple/HTMLBatch.pir

lib/Perl5/Pod/Simple/LinkSection.pbc: lib/Perl5/Pod/Simple/LinkSection.pm
	@echo Compiling Pod::Simple::LinkSection
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/LinkSection.pir lib/Perl5/Pod/Simple/LinkSection.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/LinkSection.pbc lib/Perl5/Pod/Simple/LinkSection.pir

lib/Perl5/Pod/Simple/Methody.pbc: lib/Perl5/Pod/Simple/Methody.pm
	@echo Compiling Pod::Simple::Methody
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/Methody.pir lib/Perl5/Pod/Simple/Methody.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/Methody.pbc lib/Perl5/Pod/Simple/Methody.pir

lib/Perl5/Pod/Simple/PullParser.pbc: lib/Perl5/Pod/Simple/PullParser.pm
	@echo Compiling Pod::Simple::PullParser
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/PullParser.pir lib/Perl5/Pod/Simple/PullParser.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/PullParser.pbc lib/Perl5/Pod/Simple/PullParser.pir

lib/Perl5/Pod/Simple/PullParserEndToken.pbc: lib/Perl5/Pod/Simple/PullParserEndToken.pm
	@echo Compiling Pod::Simple::PullParserEndToken
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/PullParserEndToken.pir lib/Perl5/Pod/Simple/PullParserEndToken.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/PullParserEndToken.pbc lib/Perl5/Pod/Simple/PullParserEndToken.pir

lib/Perl5/Pod/Simple/PullParserStartToken.pbc: lib/Perl5/Pod/Simple/PullParserStartToken.pm
	@echo Compiling Pod::Simple::PullParserStartToken
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/PullParserStartToken.pir lib/Perl5/Pod/Simple/PullParserStartToken.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/PullParserStartToken.pbc lib/Perl5/Pod/Simple/PullParserStartToken.pir

lib/Perl5/Pod/Simple/PullParserTextToken.pbc: lib/Perl5/Pod/Simple/PullParserTextToken.pm
	@echo Compiling Pod::Simple::PullParserTextToken
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/PullParserTextToken.pir lib/Perl5/Pod/Simple/PullParserTextToken.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/PullParserTextToken.pbc lib/Perl5/Pod/Simple/PullParserTextToken.pir

lib/Perl5/Pod/Simple/PullParserToken.pbc: lib/Perl5/Pod/Simple/PullParserToken.pm
	@echo Compiling Pod::Simple::PullParserToken
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/PullParserToken.pir lib/Perl5/Pod/Simple/PullParserToken.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/PullParserToken.pbc lib/Perl5/Pod/Simple/PullParserToken.pir

lib/Perl5/Pod/Simple/RTF.pbc: lib/Perl5/Pod/Simple/RTF.pm
	@echo Compiling Pod::Simple::RTF
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/RTF.pir lib/Perl5/Pod/Simple/RTF.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/RTF.pbc lib/Perl5/Pod/Simple/RTF.pir

lib/Perl5/Pod/Simple/Search.pbc: lib/Perl5/Pod/Simple/Search.pm
	@echo Compiling Pod::Simple::Search
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/Search.pir lib/Perl5/Pod/Simple/Search.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/Search.pbc lib/Perl5/Pod/Simple/Search.pir

lib/Perl5/Pod/Simple/SimpleTree.pbc: lib/Perl5/Pod/Simple/SimpleTree.pm
	@echo Compiling Pod::Simple::SimpleTree
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/SimpleTree.pir lib/Perl5/Pod/Simple/SimpleTree.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/SimpleTree.pbc lib/Perl5/Pod/Simple/SimpleTree.pir

lib/Perl5/Pod/Simple/Text.pbc: lib/Perl5/Pod/Simple/Text.pm
	@echo Compiling Pod::Simple::Text
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/Text.pir lib/Perl5/Pod/Simple/Text.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/Text.pbc lib/Perl5/Pod/Simple/Text.pir

lib/Perl5/Pod/Simple/TextContent.pbc: lib/Perl5/Pod/Simple/TextContent.pm
	@echo Compiling Pod::Simple::TextContent
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/TextContent.pir lib/Perl5/Pod/Simple/TextContent.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/TextContent.pbc lib/Perl5/Pod/Simple/TextContent.pir

lib/Perl5/Pod/Simple/XHTML.pbc: lib/Perl5/Pod/Simple/XHTML.pm
	@echo Compiling Pod::Simple::XHTML
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/XHTML.pir lib/Perl5/Pod/Simple/XHTML.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/XHTML.pbc lib/Perl5/Pod/Simple/XHTML.pir

lib/Perl5/Pod/Simple/XMLOutStream.pbc: lib/Perl5/Pod/Simple/XMLOutStream.pm
	@echo Compiling Pod::Simple::XMLOutStream
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Simple/XMLOutStream.pir lib/Perl5/Pod/Simple/XMLOutStream.pm
	@$(PARROT) -o lib/Perl5/Pod/Simple/XMLOutStream.pbc lib/Perl5/Pod/Simple/XMLOutStream.pir

lib/Perl5/Pod/Text.pbc: lib/Perl5/Pod/Text.pm
	@echo Compiling Pod::Text
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Text.pir lib/Perl5/Pod/Text.pm
	@$(PARROT) -o lib/Perl5/Pod/Text.pbc lib/Perl5/Pod/Text.pir

lib/Perl5/Pod/Text/Color.pbc: lib/Perl5/Pod/Text/Color.pm
	@echo Compiling Pod::Text::Color
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Text/Color.pir lib/Perl5/Pod/Text/Color.pm
	@$(PARROT) -o lib/Perl5/Pod/Text/Color.pbc lib/Perl5/Pod/Text/Color.pir

lib/Perl5/Pod/Text/Overstrike.pbc: lib/Perl5/Pod/Text/Overstrike.pm
	@echo Compiling Pod::Text::Overstrike
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Text/Overstrike.pir lib/Perl5/Pod/Text/Overstrike.pm
	@$(PARROT) -o lib/Perl5/Pod/Text/Overstrike.pbc lib/Perl5/Pod/Text/Overstrike.pir

lib/Perl5/Pod/Text/Termcap.pbc: lib/Perl5/Pod/Text/Termcap.pm
	@echo Compiling Pod::Text::Termcap
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Text/Termcap.pir lib/Perl5/Pod/Text/Termcap.pm
	@$(PARROT) -o lib/Perl5/Pod/Text/Termcap.pbc lib/Perl5/Pod/Text/Termcap.pir

lib/Perl5/Pod/Usage.pbc: lib/Perl5/Pod/Usage.pm
	@echo Compiling Pod::Usage
	@$(PERL6) --target=pir --output=lib/Perl5/Pod/Usage.pir lib/Perl5/Pod/Usage.pm
	@$(PARROT) -o lib/Perl5/Pod/Usage.pbc lib/Perl5/Pod/Usage.pir

lib/Perl5/POSIX.pbc: lib/Perl5/POSIX.pm
	@echo Compiling POSIX
	@$(PERL6) --target=pir --output=lib/Perl5/POSIX.pir lib/Perl5/POSIX.pm
	@$(PARROT) -o lib/Perl5/POSIX.pbc lib/Perl5/POSIX.pir

lib/Perl5/Safe.pbc: lib/Perl5/Safe.pm
	@echo Compiling Safe
	@$(PERL6) --target=pir --output=lib/Perl5/Safe.pir lib/Perl5/Safe.pm
	@$(PARROT) -o lib/Perl5/Safe.pbc lib/Perl5/Safe.pir

lib/Perl5/Scalar/Util.pbc: lib/Perl5/Scalar/Util.pm
	@echo Compiling Scalar::Util
	@$(PERL6) --target=pir --output=lib/Perl5/Scalar/Util.pir lib/Perl5/Scalar/Util.pm
	@$(PARROT) -o lib/Perl5/Scalar/Util.pbc lib/Perl5/Scalar/Util.pir

lib/Perl5/SDBM_File.pbc: lib/Perl5/SDBM_File.pm
	@echo Compiling SDBM_File
	@$(PERL6) --target=pir --output=lib/Perl5/SDBM_File.pir lib/Perl5/SDBM_File.pm
	@$(PARROT) -o lib/Perl5/SDBM_File.pbc lib/Perl5/SDBM_File.pir

lib/Perl5/Search/Dict.pbc: lib/Perl5/Search/Dict.pm
	@echo Compiling Search::Dict
	@$(PERL6) --target=pir --output=lib/Perl5/Search/Dict.pir lib/Perl5/Search/Dict.pm
	@$(PARROT) -o lib/Perl5/Search/Dict.pbc lib/Perl5/Search/Dict.pir

lib/Perl5/SelectSaver.pbc: lib/Perl5/SelectSaver.pm
	@echo Compiling SelectSaver
	@$(PERL6) --target=pir --output=lib/Perl5/SelectSaver.pir lib/Perl5/SelectSaver.pm
	@$(PARROT) -o lib/Perl5/SelectSaver.pbc lib/Perl5/SelectSaver.pir

lib/Perl5/SelfLoader.pbc: lib/Perl5/SelfLoader.pm
	@echo Compiling SelfLoader
	@$(PERL6) --target=pir --output=lib/Perl5/SelfLoader.pir lib/Perl5/SelfLoader.pm
	@$(PARROT) -o lib/Perl5/SelfLoader.pbc lib/Perl5/SelfLoader.pir

lib/Perl5/Socket.pbc: lib/Perl5/Socket.pm
	@echo Compiling Socket
	@$(PERL6) --target=pir --output=lib/Perl5/Socket.pir lib/Perl5/Socket.pm
	@$(PARROT) -o lib/Perl5/Socket.pbc lib/Perl5/Socket.pir

lib/Perl5/Storable.pbc: lib/Perl5/Storable.pm
	@echo Compiling Storable
	@$(PERL6) --target=pir --output=lib/Perl5/Storable.pir lib/Perl5/Storable.pm
	@$(PARROT) -o lib/Perl5/Storable.pbc lib/Perl5/Storable.pir

lib/Perl5/Symbol.pbc: lib/Perl5/Symbol.pm
	@echo Compiling Symbol
	@$(PERL6) --target=pir --output=lib/Perl5/Symbol.pir lib/Perl5/Symbol.pm
	@$(PARROT) -o lib/Perl5/Symbol.pbc lib/Perl5/Symbol.pir

lib/Perl5/Sys/Hostname.pbc: lib/Perl5/Sys/Hostname.pm
	@echo Compiling Sys::Hostname
	@$(PERL6) --target=pir --output=lib/Perl5/Sys/Hostname.pir lib/Perl5/Sys/Hostname.pm
	@$(PARROT) -o lib/Perl5/Sys/Hostname.pbc lib/Perl5/Sys/Hostname.pir

lib/Perl5/Sys/Syslog.pbc: lib/Perl5/Sys/Syslog.pm
	@echo Compiling Sys::Syslog
	@$(PERL6) --target=pir --output=lib/Perl5/Sys/Syslog.pir lib/Perl5/Sys/Syslog.pm
	@$(PARROT) -o lib/Perl5/Sys/Syslog.pbc lib/Perl5/Sys/Syslog.pir

lib/Perl5/TAP/Base.pbc: lib/Perl5/TAP/Base.pm
	@echo Compiling TAP::Base
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Base.pir lib/Perl5/TAP/Base.pm
	@$(PARROT) -o lib/Perl5/TAP/Base.pbc lib/Perl5/TAP/Base.pir

lib/Perl5/TAP/Formatter/Base.pbc: lib/Perl5/TAP/Formatter/Base.pm
	@echo Compiling TAP::Formatter::Base
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Base.pir lib/Perl5/TAP/Formatter/Base.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Base.pbc lib/Perl5/TAP/Formatter/Base.pir

lib/Perl5/TAP/Formatter/Color.pbc: lib/Perl5/TAP/Formatter/Color.pm
	@echo Compiling TAP::Formatter::Color
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Color.pir lib/Perl5/TAP/Formatter/Color.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Color.pbc lib/Perl5/TAP/Formatter/Color.pir

lib/Perl5/TAP/Formatter/Console.pbc: lib/Perl5/TAP/Formatter/Console.pm
	@echo Compiling TAP::Formatter::Console
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Console.pir lib/Perl5/TAP/Formatter/Console.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Console.pbc lib/Perl5/TAP/Formatter/Console.pir

lib/Perl5/TAP/Formatter/Console/ParallelSession.pbc: lib/Perl5/TAP/Formatter/Console/ParallelSession.pm
	@echo Compiling TAP::Formatter::Console::ParallelSession
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Console/ParallelSession.pir lib/Perl5/TAP/Formatter/Console/ParallelSession.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Console/ParallelSession.pbc lib/Perl5/TAP/Formatter/Console/ParallelSession.pir

lib/Perl5/TAP/Formatter/Console/Session.pbc: lib/Perl5/TAP/Formatter/Console/Session.pm
	@echo Compiling TAP::Formatter::Console::Session
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Console/Session.pir lib/Perl5/TAP/Formatter/Console/Session.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Console/Session.pbc lib/Perl5/TAP/Formatter/Console/Session.pir

lib/Perl5/TAP/Formatter/File.pbc: lib/Perl5/TAP/Formatter/File.pm
	@echo Compiling TAP::Formatter::File
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/File.pir lib/Perl5/TAP/Formatter/File.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/File.pbc lib/Perl5/TAP/Formatter/File.pir

lib/Perl5/TAP/Formatter/File/Session.pbc: lib/Perl5/TAP/Formatter/File/Session.pm
	@echo Compiling TAP::Formatter::File::Session
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/File/Session.pir lib/Perl5/TAP/Formatter/File/Session.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/File/Session.pbc lib/Perl5/TAP/Formatter/File/Session.pir

lib/Perl5/TAP/Formatter/Session.pbc: lib/Perl5/TAP/Formatter/Session.pm
	@echo Compiling TAP::Formatter::Session
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Formatter/Session.pir lib/Perl5/TAP/Formatter/Session.pm
	@$(PARROT) -o lib/Perl5/TAP/Formatter/Session.pbc lib/Perl5/TAP/Formatter/Session.pir

lib/Perl5/TAP/Harness.pbc: lib/Perl5/TAP/Harness.pm
	@echo Compiling TAP::Harness
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Harness.pir lib/Perl5/TAP/Harness.pm
	@$(PARROT) -o lib/Perl5/TAP/Harness.pbc lib/Perl5/TAP/Harness.pir

lib/Perl5/TAP/Object.pbc: lib/Perl5/TAP/Object.pm
	@echo Compiling TAP::Object
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Object.pir lib/Perl5/TAP/Object.pm
	@$(PARROT) -o lib/Perl5/TAP/Object.pbc lib/Perl5/TAP/Object.pir

lib/Perl5/TAP/Parser.pbc: lib/Perl5/TAP/Parser.pm
	@echo Compiling TAP::Parser
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser.pir lib/Perl5/TAP/Parser.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser.pbc lib/Perl5/TAP/Parser.pir

lib/Perl5/TAP/Parser/Aggregator.pbc: lib/Perl5/TAP/Parser/Aggregator.pm
	@echo Compiling TAP::Parser::Aggregator
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Aggregator.pir lib/Perl5/TAP/Parser/Aggregator.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Aggregator.pbc lib/Perl5/TAP/Parser/Aggregator.pir

lib/Perl5/TAP/Parser/Grammar.pbc: lib/Perl5/TAP/Parser/Grammar.pm
	@echo Compiling TAP::Parser::Grammar
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Grammar.pir lib/Perl5/TAP/Parser/Grammar.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Grammar.pbc lib/Perl5/TAP/Parser/Grammar.pir

lib/Perl5/TAP/Parser/Iterator.pbc: lib/Perl5/TAP/Parser/Iterator.pm
	@echo Compiling TAP::Parser::Iterator
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Iterator.pir lib/Perl5/TAP/Parser/Iterator.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Iterator.pbc lib/Perl5/TAP/Parser/Iterator.pir

lib/Perl5/TAP/Parser/Iterator/Array.pbc: lib/Perl5/TAP/Parser/Iterator/Array.pm
	@echo Compiling TAP::Parser::Iterator::Array
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Iterator/Array.pir lib/Perl5/TAP/Parser/Iterator/Array.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Iterator/Array.pbc lib/Perl5/TAP/Parser/Iterator/Array.pir

lib/Perl5/TAP/Parser/Iterator/Process.pbc: lib/Perl5/TAP/Parser/Iterator/Process.pm
	@echo Compiling TAP::Parser::Iterator::Process
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Iterator/Process.pir lib/Perl5/TAP/Parser/Iterator/Process.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Iterator/Process.pbc lib/Perl5/TAP/Parser/Iterator/Process.pir

lib/Perl5/TAP/Parser/Iterator/Stream.pbc: lib/Perl5/TAP/Parser/Iterator/Stream.pm
	@echo Compiling TAP::Parser::Iterator::Stream
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Iterator/Stream.pir lib/Perl5/TAP/Parser/Iterator/Stream.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Iterator/Stream.pbc lib/Perl5/TAP/Parser/Iterator/Stream.pir

lib/Perl5/TAP/Parser/IteratorFactory.pbc: lib/Perl5/TAP/Parser/IteratorFactory.pm
	@echo Compiling TAP::Parser::IteratorFactory
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/IteratorFactory.pir lib/Perl5/TAP/Parser/IteratorFactory.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/IteratorFactory.pbc lib/Perl5/TAP/Parser/IteratorFactory.pir

lib/Perl5/TAP/Parser/Multiplexer.pbc: lib/Perl5/TAP/Parser/Multiplexer.pm
	@echo Compiling TAP::Parser::Multiplexer
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Multiplexer.pir lib/Perl5/TAP/Parser/Multiplexer.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Multiplexer.pbc lib/Perl5/TAP/Parser/Multiplexer.pir

lib/Perl5/TAP/Parser/Result.pbc: lib/Perl5/TAP/Parser/Result.pm
	@echo Compiling TAP::Parser::Result
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result.pir lib/Perl5/TAP/Parser/Result.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result.pbc lib/Perl5/TAP/Parser/Result.pir

lib/Perl5/TAP/Parser/Result/Bailout.pbc: lib/Perl5/TAP/Parser/Result/Bailout.pm
	@echo Compiling TAP::Parser::Result::Bailout
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Bailout.pir lib/Perl5/TAP/Parser/Result/Bailout.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Bailout.pbc lib/Perl5/TAP/Parser/Result/Bailout.pir

lib/Perl5/TAP/Parser/Result/Comment.pbc: lib/Perl5/TAP/Parser/Result/Comment.pm
	@echo Compiling TAP::Parser::Result::Comment
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Comment.pir lib/Perl5/TAP/Parser/Result/Comment.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Comment.pbc lib/Perl5/TAP/Parser/Result/Comment.pir

lib/Perl5/TAP/Parser/Result/Plan.pbc: lib/Perl5/TAP/Parser/Result/Plan.pm
	@echo Compiling TAP::Parser::Result::Plan
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Plan.pir lib/Perl5/TAP/Parser/Result/Plan.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Plan.pbc lib/Perl5/TAP/Parser/Result/Plan.pir

lib/Perl5/TAP/Parser/Result/Pragma.pbc: lib/Perl5/TAP/Parser/Result/Pragma.pm
	@echo Compiling TAP::Parser::Result::Pragma
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Pragma.pir lib/Perl5/TAP/Parser/Result/Pragma.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Pragma.pbc lib/Perl5/TAP/Parser/Result/Pragma.pir

lib/Perl5/TAP/Parser/Result/Test.pbc: lib/Perl5/TAP/Parser/Result/Test.pm
	@echo Compiling TAP::Parser::Result::Test
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Test.pir lib/Perl5/TAP/Parser/Result/Test.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Test.pbc lib/Perl5/TAP/Parser/Result/Test.pir

lib/Perl5/TAP/Parser/Result/Unknown.pbc: lib/Perl5/TAP/Parser/Result/Unknown.pm
	@echo Compiling TAP::Parser::Result::Unknown
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Unknown.pir lib/Perl5/TAP/Parser/Result/Unknown.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Unknown.pbc lib/Perl5/TAP/Parser/Result/Unknown.pir

lib/Perl5/TAP/Parser/Result/Version.pbc: lib/Perl5/TAP/Parser/Result/Version.pm
	@echo Compiling TAP::Parser::Result::Version
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/Version.pir lib/Perl5/TAP/Parser/Result/Version.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/Version.pbc lib/Perl5/TAP/Parser/Result/Version.pir

lib/Perl5/TAP/Parser/Result/YAML.pbc: lib/Perl5/TAP/Parser/Result/YAML.pm
	@echo Compiling TAP::Parser::Result::YAML
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Result/YAML.pir lib/Perl5/TAP/Parser/Result/YAML.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Result/YAML.pbc lib/Perl5/TAP/Parser/Result/YAML.pir

lib/Perl5/TAP/Parser/ResultFactory.pbc: lib/Perl5/TAP/Parser/ResultFactory.pm
	@echo Compiling TAP::Parser::ResultFactory
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/ResultFactory.pir lib/Perl5/TAP/Parser/ResultFactory.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/ResultFactory.pbc lib/Perl5/TAP/Parser/ResultFactory.pir

lib/Perl5/TAP/Parser/Scheduler.pbc: lib/Perl5/TAP/Parser/Scheduler.pm
	@echo Compiling TAP::Parser::Scheduler
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Scheduler.pir lib/Perl5/TAP/Parser/Scheduler.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Scheduler.pbc lib/Perl5/TAP/Parser/Scheduler.pir

lib/Perl5/TAP/Parser/Scheduler/Job.pbc: lib/Perl5/TAP/Parser/Scheduler/Job.pm
	@echo Compiling TAP::Parser::Scheduler::Job
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Scheduler/Job.pir lib/Perl5/TAP/Parser/Scheduler/Job.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Scheduler/Job.pbc lib/Perl5/TAP/Parser/Scheduler/Job.pir

lib/Perl5/TAP/Parser/Scheduler/Spinner.pbc: lib/Perl5/TAP/Parser/Scheduler/Spinner.pm
	@echo Compiling TAP::Parser::Scheduler::Spinner
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Scheduler/Spinner.pir lib/Perl5/TAP/Parser/Scheduler/Spinner.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Scheduler/Spinner.pbc lib/Perl5/TAP/Parser/Scheduler/Spinner.pir

lib/Perl5/TAP/Parser/Source.pbc: lib/Perl5/TAP/Parser/Source.pm
	@echo Compiling TAP::Parser::Source
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Source.pir lib/Perl5/TAP/Parser/Source.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Source.pbc lib/Perl5/TAP/Parser/Source.pir

lib/Perl5/TAP/Parser/Utils.pbc: lib/Perl5/TAP/Parser/Utils.pm
	@echo Compiling TAP::Parser::Utils
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/Utils.pir lib/Perl5/TAP/Parser/Utils.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/Utils.pbc lib/Perl5/TAP/Parser/Utils.pir

lib/Perl5/TAP/Parser/YAMLish/Reader.pbc: lib/Perl5/TAP/Parser/YAMLish/Reader.pm
	@echo Compiling TAP::Parser::YAMLish::Reader
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/YAMLish/Reader.pir lib/Perl5/TAP/Parser/YAMLish/Reader.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/YAMLish/Reader.pbc lib/Perl5/TAP/Parser/YAMLish/Reader.pir

lib/Perl5/TAP/Parser/YAMLish/Writer.pbc: lib/Perl5/TAP/Parser/YAMLish/Writer.pm
	@echo Compiling TAP::Parser::YAMLish::Writer
	@$(PERL6) --target=pir --output=lib/Perl5/TAP/Parser/YAMLish/Writer.pir lib/Perl5/TAP/Parser/YAMLish/Writer.pm
	@$(PARROT) -o lib/Perl5/TAP/Parser/YAMLish/Writer.pbc lib/Perl5/TAP/Parser/YAMLish/Writer.pir

lib/Perl5/Term/ANSIColor.pbc: lib/Perl5/Term/ANSIColor.pm
	@echo Compiling Term::ANSIColor
	@$(PERL6) --target=pir --output=lib/Perl5/Term/ANSIColor.pir lib/Perl5/Term/ANSIColor.pm
	@$(PARROT) -o lib/Perl5/Term/ANSIColor.pbc lib/Perl5/Term/ANSIColor.pir

lib/Perl5/Term/Cap.pbc: lib/Perl5/Term/Cap.pm
	@echo Compiling Term::Cap
	@$(PERL6) --target=pir --output=lib/Perl5/Term/Cap.pir lib/Perl5/Term/Cap.pm
	@$(PARROT) -o lib/Perl5/Term/Cap.pbc lib/Perl5/Term/Cap.pir

lib/Perl5/Term/Complete.pbc: lib/Perl5/Term/Complete.pm
	@echo Compiling Term::Complete
	@$(PERL6) --target=pir --output=lib/Perl5/Term/Complete.pir lib/Perl5/Term/Complete.pm
	@$(PARROT) -o lib/Perl5/Term/Complete.pbc lib/Perl5/Term/Complete.pir

lib/Perl5/Term/ReadLine.pbc: lib/Perl5/Term/ReadLine.pm
	@echo Compiling Term::ReadLine
	@$(PERL6) --target=pir --output=lib/Perl5/Term/ReadLine.pir lib/Perl5/Term/ReadLine.pm
	@$(PARROT) -o lib/Perl5/Term/ReadLine.pbc lib/Perl5/Term/ReadLine.pir

lib/Perl5/Term/UI.pbc: lib/Perl5/Term/UI.pm
	@echo Compiling Term::UI
	@$(PERL6) --target=pir --output=lib/Perl5/Term/UI.pir lib/Perl5/Term/UI.pm
	@$(PARROT) -o lib/Perl5/Term/UI.pbc lib/Perl5/Term/UI.pir

lib/Perl5/Term/UI/History.pbc: lib/Perl5/Term/UI/History.pm
	@echo Compiling Term::UI::History
	@$(PERL6) --target=pir --output=lib/Perl5/Term/UI/History.pir lib/Perl5/Term/UI/History.pm
	@$(PARROT) -o lib/Perl5/Term/UI/History.pbc lib/Perl5/Term/UI/History.pir

lib/Perl5/Test.pbc: lib/Perl5/Test.pm
	@echo Compiling Test
	@$(PERL6) --target=pir --output=lib/Perl5/Test.pir lib/Perl5/Test.pm
	@$(PARROT) -o lib/Perl5/Test.pbc lib/Perl5/Test.pir

lib/Perl5/Test/Builder.pbc: lib/Perl5/Test/Builder.pm
	@echo Compiling Test::Builder
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Builder.pir lib/Perl5/Test/Builder.pm
	@$(PARROT) -o lib/Perl5/Test/Builder.pbc lib/Perl5/Test/Builder.pir

lib/Perl5/Test/Builder/Module.pbc: lib/Perl5/Test/Builder/Module.pm
	@echo Compiling Test::Builder::Module
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Builder/Module.pir lib/Perl5/Test/Builder/Module.pm
	@$(PARROT) -o lib/Perl5/Test/Builder/Module.pbc lib/Perl5/Test/Builder/Module.pir

lib/Perl5/Test/Builder/Tester.pbc: lib/Perl5/Test/Builder/Tester.pm
	@echo Compiling Test::Builder::Tester
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Builder/Tester.pir lib/Perl5/Test/Builder/Tester.pm
	@$(PARROT) -o lib/Perl5/Test/Builder/Tester.pbc lib/Perl5/Test/Builder/Tester.pir

lib/Perl5/Test/Builder/Tester/Color.pbc: lib/Perl5/Test/Builder/Tester/Color.pm
	@echo Compiling Test::Builder::Tester::Color
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Builder/Tester/Color.pir lib/Perl5/Test/Builder/Tester/Color.pm
	@$(PARROT) -o lib/Perl5/Test/Builder/Tester/Color.pbc lib/Perl5/Test/Builder/Tester/Color.pir

lib/Perl5/Test/Harness.pbc: lib/Perl5/Test/Harness.pm
	@echo Compiling Test::Harness
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Harness.pir lib/Perl5/Test/Harness.pm
	@$(PARROT) -o lib/Perl5/Test/Harness.pbc lib/Perl5/Test/Harness.pir

lib/Perl5/Test/More.pbc: lib/Perl5/Test/More.pm
	@echo Compiling Test::More
	@$(PERL6) --target=pir --output=lib/Perl5/Test/More.pir lib/Perl5/Test/More.pm
	@$(PARROT) -o lib/Perl5/Test/More.pbc lib/Perl5/Test/More.pir

lib/Perl5/Test/Simple.pbc: lib/Perl5/Test/Simple.pm
	@echo Compiling Test::Simple
	@$(PERL6) --target=pir --output=lib/Perl5/Test/Simple.pir lib/Perl5/Test/Simple.pm
	@$(PARROT) -o lib/Perl5/Test/Simple.pbc lib/Perl5/Test/Simple.pir

lib/Perl5/TestInit.pbc: lib/Perl5/TestInit.pm
	@echo Compiling TestInit
	@$(PERL6) --target=pir --output=lib/Perl5/TestInit.pir lib/Perl5/TestInit.pm
	@$(PARROT) -o lib/Perl5/TestInit.pbc lib/Perl5/TestInit.pir

lib/Perl5/Text/Abbrev.pbc: lib/Perl5/Text/Abbrev.pm
	@echo Compiling Text::Abbrev
	@$(PERL6) --target=pir --output=lib/Perl5/Text/Abbrev.pir lib/Perl5/Text/Abbrev.pm
	@$(PARROT) -o lib/Perl5/Text/Abbrev.pbc lib/Perl5/Text/Abbrev.pir

lib/Perl5/Text/Balanced.pbc: lib/Perl5/Text/Balanced.pm
	@echo Compiling Text::Balanced
	@$(PERL6) --target=pir --output=lib/Perl5/Text/Balanced.pir lib/Perl5/Text/Balanced.pm
	@$(PARROT) -o lib/Perl5/Text/Balanced.pbc lib/Perl5/Text/Balanced.pir

lib/Perl5/Text/ParseWords.pbc: lib/Perl5/Text/ParseWords.pm
	@echo Compiling Text::ParseWords
	@$(PERL6) --target=pir --output=lib/Perl5/Text/ParseWords.pir lib/Perl5/Text/ParseWords.pm
	@$(PARROT) -o lib/Perl5/Text/ParseWords.pbc lib/Perl5/Text/ParseWords.pir

lib/Perl5/Text/Soundex.pbc: lib/Perl5/Text/Soundex.pm
	@echo Compiling Text::Soundex
	@$(PERL6) --target=pir --output=lib/Perl5/Text/Soundex.pir lib/Perl5/Text/Soundex.pm
	@$(PARROT) -o lib/Perl5/Text/Soundex.pbc lib/Perl5/Text/Soundex.pir

lib/Perl5/Text/Tabs.pbc: lib/Perl5/Text/Tabs.pm
	@echo Compiling Text::Tabs
	@$(PERL6) --target=pir --output=lib/Perl5/Text/Tabs.pir lib/Perl5/Text/Tabs.pm
	@$(PARROT) -o lib/Perl5/Text/Tabs.pbc lib/Perl5/Text/Tabs.pir

lib/Perl5/Text/Wrap.pbc: lib/Perl5/Text/Wrap.pm
	@echo Compiling Text::Wrap
	@$(PERL6) --target=pir --output=lib/Perl5/Text/Wrap.pir lib/Perl5/Text/Wrap.pm
	@$(PARROT) -o lib/Perl5/Text/Wrap.pbc lib/Perl5/Text/Wrap.pir

lib/Perl5/Thread.pbc: lib/Perl5/Thread.pm
	@echo Compiling Thread
	@$(PERL6) --target=pir --output=lib/Perl5/Thread.pir lib/Perl5/Thread.pm
	@$(PARROT) -o lib/Perl5/Thread.pbc lib/Perl5/Thread.pir

lib/Perl5/Thread/Queue.pbc: lib/Perl5/Thread/Queue.pm
	@echo Compiling Thread::Queue
	@$(PERL6) --target=pir --output=lib/Perl5/Thread/Queue.pir lib/Perl5/Thread/Queue.pm
	@$(PARROT) -o lib/Perl5/Thread/Queue.pbc lib/Perl5/Thread/Queue.pir

lib/Perl5/Thread/Semaphore.pbc: lib/Perl5/Thread/Semaphore.pm
	@echo Compiling Thread::Semaphore
	@$(PERL6) --target=pir --output=lib/Perl5/Thread/Semaphore.pir lib/Perl5/Thread/Semaphore.pm
	@$(PARROT) -o lib/Perl5/Thread/Semaphore.pbc lib/Perl5/Thread/Semaphore.pir

lib/Perl5/Tie/Array.pbc: lib/Perl5/Tie/Array.pm
	@echo Compiling Tie::Array
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Array.pir lib/Perl5/Tie/Array.pm
	@$(PARROT) -o lib/Perl5/Tie/Array.pbc lib/Perl5/Tie/Array.pir

lib/Perl5/Tie/File.pbc: lib/Perl5/Tie/File.pm
	@echo Compiling Tie::File
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/File.pir lib/Perl5/Tie/File.pm
	@$(PARROT) -o lib/Perl5/Tie/File.pbc lib/Perl5/Tie/File.pir

lib/Perl5/Tie/Handle.pbc: lib/Perl5/Tie/Handle.pm
	@echo Compiling Tie::Handle
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Handle.pir lib/Perl5/Tie/Handle.pm
	@$(PARROT) -o lib/Perl5/Tie/Handle.pbc lib/Perl5/Tie/Handle.pir

lib/Perl5/Tie/Hash.pbc: lib/Perl5/Tie/Hash.pm
	@echo Compiling Tie::Hash
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Hash.pir lib/Perl5/Tie/Hash.pm
	@$(PARROT) -o lib/Perl5/Tie/Hash.pbc lib/Perl5/Tie/Hash.pir

lib/Perl5/Tie/Hash/NamedCapture.pbc: lib/Perl5/Tie/Hash/NamedCapture.pm
	@echo Compiling Tie::Hash::NamedCapture
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Hash/NamedCapture.pir lib/Perl5/Tie/Hash/NamedCapture.pm
	@$(PARROT) -o lib/Perl5/Tie/Hash/NamedCapture.pbc lib/Perl5/Tie/Hash/NamedCapture.pir

lib/Perl5/Tie/Memoize.pbc: lib/Perl5/Tie/Memoize.pm
	@echo Compiling Tie::Memoize
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Memoize.pir lib/Perl5/Tie/Memoize.pm
	@$(PARROT) -o lib/Perl5/Tie/Memoize.pbc lib/Perl5/Tie/Memoize.pir

lib/Perl5/Tie/RefHash.pbc: lib/Perl5/Tie/RefHash.pm
	@echo Compiling Tie::RefHash
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/RefHash.pir lib/Perl5/Tie/RefHash.pm
	@$(PARROT) -o lib/Perl5/Tie/RefHash.pbc lib/Perl5/Tie/RefHash.pir

lib/Perl5/Tie/Scalar.pbc: lib/Perl5/Tie/Scalar.pm
	@echo Compiling Tie::Scalar
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/Scalar.pir lib/Perl5/Tie/Scalar.pm
	@$(PARROT) -o lib/Perl5/Tie/Scalar.pbc lib/Perl5/Tie/Scalar.pir

lib/Perl5/Tie/StdHandle.pbc: lib/Perl5/Tie/StdHandle.pm
	@echo Compiling Tie::StdHandle
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/StdHandle.pir lib/Perl5/Tie/StdHandle.pm
	@$(PARROT) -o lib/Perl5/Tie/StdHandle.pbc lib/Perl5/Tie/StdHandle.pir

lib/Perl5/Tie/SubstrHash.pbc: lib/Perl5/Tie/SubstrHash.pm
	@echo Compiling Tie::SubstrHash
	@$(PERL6) --target=pir --output=lib/Perl5/Tie/SubstrHash.pir lib/Perl5/Tie/SubstrHash.pm
	@$(PARROT) -o lib/Perl5/Tie/SubstrHash.pbc lib/Perl5/Tie/SubstrHash.pir

lib/Perl5/Time/gmtime.pbc: lib/Perl5/Time/gmtime.pm
	@echo Compiling Time::gmtime
	@$(PERL6) --target=pir --output=lib/Perl5/Time/gmtime.pir lib/Perl5/Time/gmtime.pm
	@$(PARROT) -o lib/Perl5/Time/gmtime.pbc lib/Perl5/Time/gmtime.pir

lib/Perl5/Time/HiRes.pbc: lib/Perl5/Time/HiRes.pm
	@echo Compiling Time::HiRes
	@$(PERL6) --target=pir --output=lib/Perl5/Time/HiRes.pir lib/Perl5/Time/HiRes.pm
	@$(PARROT) -o lib/Perl5/Time/HiRes.pbc lib/Perl5/Time/HiRes.pir

lib/Perl5/Time/Local.pbc: lib/Perl5/Time/Local.pm
	@echo Compiling Time::Local
	@$(PERL6) --target=pir --output=lib/Perl5/Time/Local.pir lib/Perl5/Time/Local.pm
	@$(PARROT) -o lib/Perl5/Time/Local.pbc lib/Perl5/Time/Local.pir

lib/Perl5/Time/localtime.pbc: lib/Perl5/Time/localtime.pm
	@echo Compiling Time::localtime
	@$(PERL6) --target=pir --output=lib/Perl5/Time/localtime.pir lib/Perl5/Time/localtime.pm
	@$(PARROT) -o lib/Perl5/Time/localtime.pbc lib/Perl5/Time/localtime.pir

lib/Perl5/Time/Piece.pbc: lib/Perl5/Time/Piece.pm
	@echo Compiling Time::Piece
	@$(PERL6) --target=pir --output=lib/Perl5/Time/Piece.pir lib/Perl5/Time/Piece.pm
	@$(PARROT) -o lib/Perl5/Time/Piece.pbc lib/Perl5/Time/Piece.pir

lib/Perl5/Time/Seconds.pbc: lib/Perl5/Time/Seconds.pm
	@echo Compiling Time::Seconds
	@$(PERL6) --target=pir --output=lib/Perl5/Time/Seconds.pir lib/Perl5/Time/Seconds.pm
	@$(PARROT) -o lib/Perl5/Time/Seconds.pbc lib/Perl5/Time/Seconds.pir

lib/Perl5/Time/tm.pbc: lib/Perl5/Time/tm.pm
	@echo Compiling Time::tm
	@$(PERL6) --target=pir --output=lib/Perl5/Time/tm.pir lib/Perl5/Time/tm.pm
	@$(PARROT) -o lib/Perl5/Time/tm.pbc lib/Perl5/Time/tm.pir

lib/Perl5/Unicode/Collate.pbc: lib/Perl5/Unicode/Collate.pm
	@echo Compiling Unicode::Collate
	@$(PERL6) --target=pir --output=lib/Perl5/Unicode/Collate.pir lib/Perl5/Unicode/Collate.pm
	@$(PARROT) -o lib/Perl5/Unicode/Collate.pbc lib/Perl5/Unicode/Collate.pir

lib/Perl5/Unicode/Normalize.pbc: lib/Perl5/Unicode/Normalize.pm
	@echo Compiling Unicode::Normalize
	@$(PERL6) --target=pir --output=lib/Perl5/Unicode/Normalize.pir lib/Perl5/Unicode/Normalize.pm
	@$(PARROT) -o lib/Perl5/Unicode/Normalize.pbc lib/Perl5/Unicode/Normalize.pir

lib/Perl5/Unicode/UCD.pbc: lib/Perl5/Unicode/UCD.pm
	@echo Compiling Unicode::UCD
	@$(PERL6) --target=pir --output=lib/Perl5/Unicode/UCD.pir lib/Perl5/Unicode/UCD.pm
	@$(PARROT) -o lib/Perl5/Unicode/UCD.pbc lib/Perl5/Unicode/UCD.pir

lib/Perl5/UNIVERSAL.pbc: lib/Perl5/UNIVERSAL.pm
	@echo Compiling UNIVERSAL
	@$(PERL6) --target=pir --output=lib/Perl5/UNIVERSAL.pir lib/Perl5/UNIVERSAL.pm
	@$(PARROT) -o lib/Perl5/UNIVERSAL.pbc lib/Perl5/UNIVERSAL.pir

lib/Perl5/User/grent.pbc: lib/Perl5/User/grent.pm
	@echo Compiling User::grent
	@$(PERL6) --target=pir --output=lib/Perl5/User/grent.pir lib/Perl5/User/grent.pm
	@$(PARROT) -o lib/Perl5/User/grent.pbc lib/Perl5/User/grent.pir

lib/Perl5/User/pwent.pbc: lib/Perl5/User/pwent.pm
	@echo Compiling User::pwent
	@$(PERL6) --target=pir --output=lib/Perl5/User/pwent.pir lib/Perl5/User/pwent.pm
	@$(PARROT) -o lib/Perl5/User/pwent.pbc lib/Perl5/User/pwent.pir

lib/Perl5/warnings.pbc: lib/Perl5/warnings.pm
	@echo Compiling warnings
	@$(PERL6) --target=pir --output=lib/Perl5/warnings.pir lib/Perl5/warnings.pm
	@$(PARROT) -o lib/Perl5/warnings.pbc lib/Perl5/warnings.pir

lib/Perl5/XSLoader.pbc: lib/Perl5/XSLoader.pm
	@echo Compiling XSLoader
	@$(PERL6) --target=pir --output=lib/Perl5/XSLoader.pir lib/Perl5/XSLoader.pm
	@$(PARROT) -o lib/Perl5/XSLoader.pbc lib/Perl5/XSLoader.pir

clean:
	$(RM_F) lib/*.pbc lib/*.pir lib/Perl5/*.pbc lib/Perl5/*.pir

install: all core-install
	$(MKPATH) $(P6LIB)/lib/Perl5/App/Prove/State/Result/Test
	$(MKPATH) $(P6LIB)/lib/Perl5/Archive/Extract
	$(MKPATH) $(P6LIB)/lib/Perl5/Archive/Tar/File
	$(MKPATH) $(P6LIB)/lib/Perl5/Attribute/Handlers
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Concise
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Debug
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Deparse
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Lint/Debug
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Showlex
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Terse
	$(MKPATH) $(P6LIB)/lib/Perl5/B/Xref
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Apache
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Carp
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Cookie
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Fast
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Pretty
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Push
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Switch
	$(MKPATH) $(P6LIB)/lib/Perl5/CGI/Util
	$(MKPATH) $(P6LIB)/lib/Perl5/Class/Struct
	$(MKPATH) $(P6LIB)/lib/Perl5/Compress/Raw/Bzip2
	$(MKPATH) $(P6LIB)/lib/Perl5/Compress/Raw/Zlib
	$(MKPATH) $(P6LIB)/lib/Perl5/Compress/Zlib
	$(MKPATH) $(P6LIB)/lib/Perl5/Config/Extensions
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Debug
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Distroprefs
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/FirstTime
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/HandleConfig
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Kwalify
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Nox
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Queue
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Tarzip
	$(MKPATH) $(P6LIB)/lib/Perl5/CPAN/Version
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Backend/RV
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Config
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Configure
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Dist/Autobundle
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Dist/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Dist/Build/Constants
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Dist/MM
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Dist/Sample
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Error
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Extract
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Fetch
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Report
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Search
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Source/Memory
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Source/SQLite
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Internals/Utils
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Module/Author/Fake
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Module/Checksums
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Module/Fake
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Selfupdate
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Shell/Classic
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Shell/Default/Plugins/CustomSource
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Shell/Default/Plugins/Remote
	$(MKPATH) $(P6LIB)/lib/Perl5/CPANPLUS/Shell/Default/Plugins/Source
	$(MKPATH) $(P6LIB)/lib/Perl5/Data/Dumper
	$(MKPATH) $(P6LIB)/lib/Perl5/DBM_Filter/compress
	$(MKPATH) $(P6LIB)/lib/Perl5/DBM_Filter/encode
	$(MKPATH) $(P6LIB)/lib/Perl5/DBM_Filter/int32
	$(MKPATH) $(P6LIB)/lib/Perl5/DBM_Filter/null
	$(MKPATH) $(P6LIB)/lib/Perl5/DBM_Filter/utf8
	$(MKPATH) $(P6LIB)/lib/Perl5/Devel/InnerPackage
	$(MKPATH) $(P6LIB)/lib/Perl5/Devel/Peek
	$(MKPATH) $(P6LIB)/lib/Perl5/Devel/PPPort
	$(MKPATH) $(P6LIB)/lib/Perl5/Devel/SelfStubber
	$(MKPATH) $(P6LIB)/lib/Perl5/Digest/base
	$(MKPATH) $(P6LIB)/lib/Perl5/Digest/file
	$(MKPATH) $(P6LIB)/lib/Perl5/Digest/MD5
	$(MKPATH) $(P6LIB)/lib/Perl5/Digest/SHA
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Alias
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Byte
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/CJKConstants
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/CN
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/CN/HZ
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Config
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/EBCDIC
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Encoder
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Encoding
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/GSM0338
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Guess
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/JP
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/JP/H2Z
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/JP/JIS7
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/KR
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/KR/2022_KR
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/MIME/Header
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/MIME/Name
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Symbol
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/TW
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Unicode
	$(MKPATH) $(P6LIB)/lib/Perl5/Encode/Unicode/UTF7
	$(MKPATH) $(P6LIB)/lib/Perl5/Exporter/Heavy
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/CBuilder/Platform/Windows
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Command/MM
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Constant/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Constant/Utils
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Constant/XS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Embed
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Install
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Installed
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Liblist
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MakeMaker/Config
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MakeMaker/FAQ
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MakeMaker/Tutorial
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Manifest
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Miniperl
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Mkbootstrap
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Mksymlists
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_AIX
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Any
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_BeOS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Cygwin
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Darwin
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_DOS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_MacOS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_NW5
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_OS2
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_QNX
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Unix
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_UWIN
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_VMS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_VOS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Win32
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MM_Win95
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/MY
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/Packlist
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/ParseXS
	$(MKPATH) $(P6LIB)/lib/Perl5/ExtUtils/testlib
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Basename
	$(MKPATH) $(P6LIB)/lib/Perl5/File/CheckTree
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Compare
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Copy
	$(MKPATH) $(P6LIB)/lib/Perl5/File/DosGlob
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Fetch
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Find
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Glob
	$(MKPATH) $(P6LIB)/lib/Perl5/File/GlobMapper
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Path
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Cygwin
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Epoc
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Functions
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Mac
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/OS2
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Unix
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/VMS
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Spec/Win32
	$(MKPATH) $(P6LIB)/lib/Perl5/File/stat
	$(MKPATH) $(P6LIB)/lib/Perl5/File/Temp
	$(MKPATH) $(P6LIB)/lib/Perl5/Filter/Simple
	$(MKPATH) $(P6LIB)/lib/Perl5/Filter/Util/Call
	$(MKPATH) $(P6LIB)/lib/Perl5/Getopt/Long
	$(MKPATH) $(P6LIB)/lib/Perl5/Getopt/Std
	$(MKPATH) $(P6LIB)/lib/Perl5/Hash/Util/FieldHash
	$(MKPATH) $(P6LIB)/lib/Perl5/I18N/Collate
	$(MKPATH) $(P6LIB)/lib/Perl5/I18N/Langinfo
	$(MKPATH) $(P6LIB)/lib/Perl5/I18N/LangTags/Detect
	$(MKPATH) $(P6LIB)/lib/Perl5/I18N/LangTags/List
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/Bzip2
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/Deflate
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/Gzip
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/RawDeflate
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Compress/Zip
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Dir
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/File
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Handle
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Pipe
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Poll
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Seekable
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Select
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Socket
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Socket/INET
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Socket/UNIX
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/AnyInflate
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/AnyUncompress
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/Bunzip2
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/Gunzip
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/Inflate
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/RawInflate
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Uncompress/Unzip
	$(MKPATH) $(P6LIB)/lib/Perl5/IO/Zlib
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/Cmd
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/Msg
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/Open2
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/Open3
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/Semaphore
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/SharedMem
	$(MKPATH) $(P6LIB)/lib/Perl5/IPC/SysV
	$(MKPATH) $(P6LIB)/lib/Perl5/List/Util/XS
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Country
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Currency
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Language
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Maketext/Guts
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Maketext/GutsLoader
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Maketext/Simple
	$(MKPATH) $(P6LIB)/lib/Perl5/Locale/Script
	$(MKPATH) $(P6LIB)/lib/Perl5/Log/Message/Config
	$(MKPATH) $(P6LIB)/lib/Perl5/Log/Message/Handlers
	$(MKPATH) $(P6LIB)/lib/Perl5/Log/Message/Item
	$(MKPATH) $(P6LIB)/lib/Perl5/Log/Message/Simple
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/BigFloat
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/BigInt/Calc
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/BigInt/CalcEmu
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/BigInt/FastCalc
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/BigRat
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/Complex
	$(MKPATH) $(P6LIB)/lib/Perl5/Math/Trig
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/AnyDBM_File
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/Expire
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/ExpireFile
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/ExpireTest
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/NDBM_File
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/SDBM_File
	$(MKPATH) $(P6LIB)/lib/Perl5/Memoize/Storable
	$(MKPATH) $(P6LIB)/lib/Perl5/MIME/Base64
	$(MKPATH) $(P6LIB)/lib/Perl5/MIME/QuotedPrint
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Compat
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/ConfigData
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Cookbook
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/ModuleInfo
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Notes
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/aix
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/Amiga
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/cygwin
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/darwin
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/Default
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/EBCDIC
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/MacOS
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/MPEiX
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/os2
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/RiscOS
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/Unix
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/VMS
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/VOS
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Platform/Windows
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/PPMMaker
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/Version
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Build/YAML
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/CoreList
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Load/Conditional
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Loaded
	$(MKPATH) $(P6LIB)/lib/Perl5/Module/Pluggable/Object
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Cmd
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Config
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Domain
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/FTP
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/hostent
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/netent
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Netrc
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/NNTP
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Ping
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/POP3
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/protoent
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/servent
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/SMTP
	$(MKPATH) $(P6LIB)/lib/Perl5/Net/Time
	$(MKPATH) $(P6LIB)/lib/Perl5/Object/Accessor
	$(MKPATH) $(P6LIB)/lib/Perl5/Package/Constants
	$(MKPATH) $(P6LIB)/lib/Perl5/Params/Check
	$(MKPATH) $(P6LIB)/lib/Perl5/Parse/CPAN/Meta
	$(MKPATH) $(P6LIB)/lib/Perl5/PerlIO/encoding
	$(MKPATH) $(P6LIB)/lib/Perl5/PerlIO/scalar
	$(MKPATH) $(P6LIB)/lib/Perl5/PerlIO/via/QuotedPrint
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Checker
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Escapes
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Find
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Functions
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Html
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/InputObjects
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/LaTeX
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Man
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/ParseLink
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Parser
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/ParseUtils
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/BaseTo
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/GetOptsOO
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToChecker
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToMan
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToNroff
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToPod
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToRtf
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToText
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToTk
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Perldoc/ToXml
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/PlainText
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Select
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/Checker
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/Debug
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/DumpAsText
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/DumpAsXML
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/HTML
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/HTMLBatch
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/LinkSection
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/Methody
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/PullParser
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/PullParserEndToken
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/PullParserStartToken
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/PullParserTextToken
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/PullParserToken
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/RTF
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/Search
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/SimpleTree
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/Text
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/TextContent
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/XHTML
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Simple/XMLOutStream
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Text/Color
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Text/Overstrike
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Text/Termcap
	$(MKPATH) $(P6LIB)/lib/Perl5/Pod/Usage
	$(MKPATH) $(P6LIB)/lib/Perl5/Scalar/Util
	$(MKPATH) $(P6LIB)/lib/Perl5/Search/Dict
	$(MKPATH) $(P6LIB)/lib/Perl5/Sys/Hostname
	$(MKPATH) $(P6LIB)/lib/Perl5/Sys/Syslog
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/Base
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/Color
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/Console/ParallelSession
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/Console/Session
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/File/Session
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Formatter/Session
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Harness
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Object
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Aggregator
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Grammar
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Iterator/Array
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Iterator/Process
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Iterator/Stream
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/IteratorFactory
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Multiplexer
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Bailout
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Comment
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Plan
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Pragma
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Test
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Unknown
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/Version
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Result/YAML
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/ResultFactory
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Scheduler/Job
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Scheduler/Spinner
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Source
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/Utils
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/YAMLish/Reader
	$(MKPATH) $(P6LIB)/lib/Perl5/TAP/Parser/YAMLish/Writer
	$(MKPATH) $(P6LIB)/lib/Perl5/Term/ANSIColor
	$(MKPATH) $(P6LIB)/lib/Perl5/Term/Cap
	$(MKPATH) $(P6LIB)/lib/Perl5/Term/Complete
	$(MKPATH) $(P6LIB)/lib/Perl5/Term/ReadLine
	$(MKPATH) $(P6LIB)/lib/Perl5/Term/UI/History
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/Builder/Module
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/Builder/Tester
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/Builder/Tester/Color
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/Harness
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/More
	$(MKPATH) $(P6LIB)/lib/Perl5/Test/Simple
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/Abbrev
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/Balanced
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/ParseWords
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/Soundex
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/Tabs
	$(MKPATH) $(P6LIB)/lib/Perl5/Text/Wrap
	$(MKPATH) $(P6LIB)/lib/Perl5/Thread/Queue
	$(MKPATH) $(P6LIB)/lib/Perl5/Thread/Semaphore
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/Array
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/File
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/Handle
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/Hash/NamedCapture
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/Memoize
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/RefHash
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/Scalar
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/StdHandle
	$(MKPATH) $(P6LIB)/lib/Perl5/Tie/SubstrHash
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/gmtime
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/HiRes
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/Local
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/localtime
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/Piece
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/Seconds
	$(MKPATH) $(P6LIB)/lib/Perl5/Time/tm
	$(MKPATH) $(P6LIB)/lib/Perl5/Unicode/Collate
	$(MKPATH) $(P6LIB)/lib/Perl5/Unicode/Normalize
	$(MKPATH) $(P6LIB)/lib/Perl5/Unicode/UCD
	$(MKPATH) $(P6LIB)/lib/Perl5/User/grent
	$(MKPATH) $(P6LIB)/lib/Perl5/User/pwent
	$(CP) lib/Perl5/*.pbc $(P6LIB)/lib/Perl5/

uninstall:
	$(RM_F) $(NQPLIB)/lib/Perl5.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/Actions.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/Grammar.pbc
	$(RM_F) $(NQPLIB)/lib/Perl5/World.pbc

test: install
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) $(test_file) --verbosity=9

testable : all spectest_checkout spectest_update

spectest_checkout : t
t :
	git clone git://github.com/rakudo-p5/roast5.git t/spec
	-cd t/spec/ && git config remote.origin.pushurl git@github.com:rakudo-p5/roast5.git

spectest_update :
	-cd t && git pull

spectest: install testable t/spectest.data
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) --tests-from-file=t/spectest.data

fulltest: install testable t/spectest.data
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) t/spec/*/*.t t/v5/*.t

summary: core-install
	V5DEBUG=0 perl t/test_summary

t/v5/*.t t/spec/*/*.t:
	V5DEBUG=0 $(HARNESS_WITH_FUDGE) --verbosity=1 $@
