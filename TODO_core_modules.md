To be able to use Perl 5 modules we need to port the most-used core modules first.

This is a list of to-bo-ported modules, starting with:

<a href="#a">A</a> <a href="#b">B</a> <a href="#c">C</a> <a href="#d">D</a> <a href="#e">E</a> <a href="#f">F</a> <a href="#g">G</a> <a href="#h">H</a> <a href="#i">I</a> J K <a href="#l">L</a> <a href="#m">M</a> <a href="#n">N</a> <a href="#o">O</a> <a href="#p">P</a> Q <a href="#r">R</a> <a href="#s">S</a> <a href="#t">T</a> <a href="#u">U</a> V W <a href="#x">X</a> Y Z

Keys:
```
[ ] todo
[x] done
[s] stubbed
[-] not applicable
```

## A
```
[s] AnyDBM_File - provide framework for multiple DBMs
[s] App::Prove - Implements the prove command.
[s] App::Prove::State - State storage for the prove command.
[s] App::Prove::State::Result - Individual test suite results.
[s] App::Prove::State::Result::Test - Individual test results.
[s] Archive::Extract - A generic archive extracting mechanism
[s] Archive::Tar - module for manipulations of tar archives
[s] Archive::Tar::File - a subclass for in-memory extracted file from Archive::Tar
[s] Attribute::Handlers - Simpler definition of attribute handlers
[s] AutoLoader - load subroutines only on demand
[s] AutoSplit - split a package for autoloading
```

## B
```
[s] B - The Perl Compiler Backend
[s] B::Concise - Walk Perl syntax tree, printing concise info about ops
[s] B::Debug - Walk Perl syntax tree, printing debug info about ops
[s] B::Deparse - Perl compiler backend to produce perl code
[s] B::Lint - Perl lint
[s] B::Lint::Debug - Adds debugging stringification to B::
[s] B::Showlex - Show lexical variables used in functions or files
[s] B::Terse - Walk Perl syntax tree, printing terse info about ops
[s] B::Xref - Generates cross reference reports for Perl programs
[s] Benchmark - benchmark running times of Perl code
```

## C
```
[s] Carp - alternative warn and die for modules
[s] CGI - Handle Common Gateway Interface requests and responses
[s] CGI::Apache - Backward compatibility module for CGI.pm
[s] CGI::Carp - CGI routines for writing to the HTTPD (or other) error log
[s] CGI::Cookie - Interface to HTTP Cookies
[s] CGI::Fast - CGI Interface for Fast CGI
[s] CGI::Pretty - module to produce nicely formatted HTML code
[s] CGI::Push - Simple Interface to Server Push
[s] CGI::Switch - Backward compatibility module for defunct CGI::Switch
[s] CGI::Util - Internal utilities used by CGI module
[s] Class::Struct - declare struct-like datatypes as Perl classes
[s] Compress::Raw::Bzip2 - Low-Level Interface to bzip2 compression library
[s] Compress::Raw::Zlib - Low-Level Interface to zlib compression library
[s] Compress::Zlib - Interface to zlib compression library
[s] Config - access Perl configuration information
[s] Config::Extensions - hash lookup of which core extensions were built.
[s] CPAN - query, download and build perl modules from CPAN sites
[s] CPAN::Debug - internal debugging for CPAN.pm
[s] CPAN::Distroprefs - read and match distroprefs
[s] CPAN::FirstTime - Utility for CPAN::Config file Initialization
[s] CPAN::HandleConfig - internal configuration handling for CPAN.pm
[s] CPAN::Kwalify - Interface between CPAN.pm and Kwalify.pm
[s] CPAN::Nox - Wrapper around CPAN.pm without using any XS module
[s] CPAN::Queue - internal queue support for CPAN.pm
[s] CPAN::Tarzip - internal handling of tar archives for CPAN.pm
[s] CPAN::Version - utility functions to compare CPAN versions
[s] CPANPLUS - API & CLI access to the CPAN mirrors
[s] CPANPLUS::Backend - programmer's interface to CPANPLUS
[s] CPANPLUS::Backend::RV - return value objects
[s] CPANPLUS::Config - configuration defaults and heuristics for CPANPLUS
[s] CPANPLUS::Configure - configuration for CPANPLUS
[s] CPANPLUS::Dist - base class for plugins
[s] CPANPLUS::Dist::Autobundle - distribution class for installation snapshots
[s] CPANPLUS::Dist::Base - Base class for custom distribution classes
[s] CPANPLUS::Dist::Build - CPANPLUS plugin to install packages that use Build.PL
[s] CPANPLUS::Dist::Build::Constants - Constants for CPANPLUS::Dist::Build
[s] CPANPLUS::Dist::MM - distribution class for MakeMaker related modules
[s] CPANPLUS::Dist::Sample - Sample code to create your own Dist::* plugin
[s] CPANPLUS::Error - error handling for CPANPLUS
[s] CPANPLUS::Internals - CPANPLUS internals
[s] CPANPLUS::Internals::Extract - internals for archive extraction
[s] CPANPLUS::Internals::Fetch - internals for fetching files
[s] CPANPLUS::Internals::Report - internals for sending test reports
[s] CPANPLUS::Internals::Search - internals for searching for modules
[s] CPANPLUS::Internals::Source - internals for updating source files
[s] CPANPLUS::Internals::Source::Memory - In memory implementation
[s] CPANPLUS::Internals::Source::SQLite - SQLite implementation
[s] CPANPLUS::Internals::Utils - convenience functions for CPANPLUS
[s] CPANPLUS::Module - CPAN module objects for CPANPLUS
[s] CPANPLUS::Module::Author - CPAN author object for CPANPLUS
[s] CPANPLUS::Module::Author::Fake - dummy author object for CPANPLUS
[s] CPANPLUS::Module::Checksums - checking the checksum of a distribution
[s] CPANPLUS::Module::Fake - fake module object for internal use
[s] CPANPLUS::Selfupdate - self-updating for CPANPLUS
[s] CPANPLUS::Shell - base class for CPANPLUS shells
[s] CPANPLUS::Shell::Classic - CPAN.pm emulation for CPANPLUS
[s] CPANPLUS::Shell::Default - the default CPANPLUS shell
[s] CPANPLUS::Shell::Default::Plugins::CustomSource - add custom sources to CPANPLUS
[s] CPANPLUS::Shell::Default::Plugins::Remote - connect to a remote CPANPLUS
[s] CPANPLUS::Shell::Default::Plugins::Source - read in CPANPLUS commands
[x] Cwd - get pathname of current working directory
```

## D
```
[s] Data::Dumper - stringified perl data structures, suitable for both printing and eval
[s] DB - programmatic interface to the Perl debugging API
[s] DBM_Filter - Filter DBM keys/values
[s] DBM_Filter::compress - filter for DBM_Filter
[s] DBM_Filter::encode - filter for DBM_Filter
[s] DBM_Filter::int32 - filter for DBM_Filter
[s] DBM_Filter::null - filter for DBM_Filter
[s] DBM_Filter::utf8 - filter for DBM_Filter
[s] DB_File - Perl5 access to Berkeley DB version 1.x
[s] Devel::InnerPackage - find all the inner packages of a package
[s] Devel::Peek - A data debugging tool for the XS programmer
[s] Devel::PPPort - Perl/Pollution/Portability
[s] Devel::SelfStubber - generate stubs for a SelfLoading module
[s] Digest - Modules that calculate message digests
[s] Digest::base - Digest base class
[s] Digest::file - Calculate digests of files
[s] Digest::MD5 - Perl interface to the MD5 Algorithm
[s] Digest::SHA - Perl extension for SHA-1/224/256/384/512
[s] DirHandle - supply object methods for directory handles
[s] Dumpvalue - provides screen dump of Perl data.
[s] DynaLoader - Dynamically load C libraries into Perl code
```

## E
```
[s] Encode - character encodings in Perl
[s] Encode::Alias - alias definitions to encodings
[s] Encode::Byte - Single Byte Encodings
[s] Encode::CJKConstants - Internally used by Encode::??::ISO_2022_*
[s] Encode::CN - China-based Chinese Encodings
[s] Encode::CN::HZ - internally used by Encode::CN
[s] Encode::Config - internally used by Encode
[s] Encode::EBCDIC - EBCDIC Encodings
[s] Encode::Encoder - Object Oriented Encoder
[s] Encode::Encoding - Encode Implementation Base Class
[s] Encode::GSM0338 - ESTI GSM 03.38 Encoding
[s] Encode::Guess - Guesses encoding from data
[s] Encode::JP - Japanese Encodings
[s] Encode::JP::H2Z - internally used by Encode::JP::2022_JP*
[s] Encode::JP::JIS7 - internally used by Encode::JP
[s] Encode::KR - Korean Encodings
[s] Encode::KR::2022_KR - internally used by Encode::KR
[s] Encode::MIME::Header - MIME 'B' and 'Q' header encoding
[s] Encode::MIME::Name - internally used by Encode
[s] Encode::Symbol - Symbol Encodings
[s] Encode::TW - Taiwan-based Chinese Encodings
[s] Encode::Unicode - Various Unicode Transformation Formats
[s] Encode::Unicode::UTF7 - UTF-7 encoding
[s] English - use nice English (or awk) names for ugly punctuation variables
[s] Env - perl module that imports environment variables as scalars or arrays
[s] Errno - System errno constants
[s] Exporter - Implements default import method for modules
[s] Exporter::Heavy - Exporter guts
[s] ExtUtils::CBuilder - Compile and link C code for Perl modules
[s] ExtUtils::CBuilder::Platform::Windows - Builder class for Windows platforms
[s] ExtUtils::Command - utilities to replace common UNIX commands in Makefiles etc.
[s] ExtUtils::Command::MM - Commands for the MM's to use in Makefiles
[s] ExtUtils::Constant - generate XS code to import C header constants
[s] ExtUtils::Constant::Base - base class for ExtUtils::Constant objects
[s] ExtUtils::Constant::Utils - helper functions for ExtUtils::Constant
[s] ExtUtils::Constant::XS - generate C code for XS modules' constants.
[s] ExtUtils::Embed - Utilities for embedding Perl in C/C++ applications
[s] ExtUtils::Install - install files from here to there
[s] ExtUtils::Installed - Inventory management of installed modules
[s] ExtUtils::Liblist - determine libraries to use and how to use them
[s] ExtUtils::MakeMaker - Create a module Makefile
[s] ExtUtils::MakeMaker::Config - Wrapper around Config.pm
[s] ExtUtils::MakeMaker::FAQ - Frequently Asked Questions About MakeMaker
[s] ExtUtils::MakeMaker::Tutorial - Writing a module with MakeMaker
[s] ExtUtils::Manifest - utilities to write and check a MANIFEST file
[s] ExtUtils::Miniperl - write the C code for perlmain.c
[s] ExtUtils::Mkbootstrap - make a bootstrap file for use by DynaLoader
[s] ExtUtils::Mksymlists - write linker options files for dynamic extension
[s] ExtUtils::MM - OS adjusted ExtUtils::MakeMaker subclass
[s] ExtUtils::MM_AIX - AIX specific subclass of ExtUtils::MM_Unix
[s] ExtUtils::MM_Any - Platform-agnostic MM methods
[s] ExtUtils::MM_BeOS - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_Cygwin - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_Darwin - special behaviors for OS X
[s] ExtUtils::MM_DOS - DOS specific subclass of ExtUtils::MM_Unix
[s] ExtUtils::MM_MacOS - once produced Makefiles for MacOS Classic
[s] ExtUtils::MM_NW5 - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_OS2 - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_QNX - QNX specific subclass of ExtUtils::MM_Unix
[s] ExtUtils::MM_Unix - methods used by ExtUtils::MakeMaker
[s] ExtUtils::MM_UWIN - U/WIN specific subclass of ExtUtils::MM_Unix
[s] ExtUtils::MM_VMS - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_VOS - VOS specific subclass of ExtUtils::MM_Unix
[s] ExtUtils::MM_Win32 - methods to override UN*X behaviour in ExtUtils::MakeMaker
[s] ExtUtils::MM_Win95 - method to customize MakeMaker for Win9X
[s] ExtUtils::MY - ExtUtils::MakeMaker subclass for customization
[s] ExtUtils::Packlist - manage .packlist files
[s] ExtUtils::ParseXS - converts Perl XS code into C code
[s] ExtUtils::testlib - add blib/* directories to @INC
```

## F
```
[s] Fatal - Replace functions with equivalents which succeed or die
[s] Fcntl - load the C Fcntl.h defines
[s] File::Basename - Parse file paths into directory, filename and suffix.
[s] File::CheckTree - run many filetest checks on a tree
[s] File::Compare - Compare files or filehandles
[s] File::Copy - Copy files or filehandles
[s] File::DosGlob - DOS like globbing and then some
[s] File::Fetch - A generic file fetching mechanism
[s] File::Find - Traverse a directory tree.
[s] File::Glob - Perl extension for BSD glob routine
[s] File::GlobMapper - Extend File Glob to Allow Input and Output Files
[s] File::Path - Create or remove directory trees
[s] File::Spec - portably perform operations on file names
[s] File::Spec::Cygwin - methods for Cygwin file specs
[s] File::Spec::Epoc - methods for Epoc file specs
[s] File::Spec::Functions - portably perform operations on file names
[s] File::Spec::Mac - File::Spec for Mac OS (Classic)
[s] File::Spec::OS2 - methods for OS/2 file specs
[s] File::Spec::Unix - File::Spec for Unix, base for other File::Spec modules
[s] File::Spec::VMS - methods for VMS file specs
[s] File::Spec::Win32 - methods for Win32 file specs
[s] File::stat - by-name interface to Perl's built-in stat() functions
[s] File::Temp - return name and handle of a temporary file safely
[s] FileCache - keep more files open than the system permits
[s] FileHandle - supply object methods for filehandles
[s] Filter::Simple - Simplified source filtering
[s] Filter::Util::Call - Perl Source Filter Utility Module
[s] FindBin - Locate directory of original perl script
```

## G
```
[s] Getopt::Long - Extended processing of command line options
[s] Getopt::Std - Process single-character switches with switch clustering
```

## H
```
[s] Hash::Util - A selection of general-utility hash subroutines
[s] Hash::Util::FieldHash - Support for Inside-Out Classes
```

## I
```
[s] I18N::Collate - compare 8-bit scalar data according to the current locale
[s] I18N::Langinfo - query locale information
[s] I18N::LangTags - functions for dealing with RFC3066-style language tags
[s] I18N::LangTags::Detect - detect the user's language preferences
[s] I18N::LangTags::List - tags and names for human languages
[s] IO - load various IO modules
[s] IO::Compress::Base - Base Class for IO::Compress modules
[s] IO::Compress::Bzip2 - Write bzip2 files/buffers
[s] IO::Compress::Deflate - Write RFC 1950 files/buffers
[s] IO::Compress::Gzip - Write RFC 1952 files/buffers
[s] IO::Compress::RawDeflate - Write RFC 1951 files/buffers
[s] IO::Compress::Zip - Write zip files/buffers
[s] IO::Dir - supply object methods for directory handles
[s] IO::File - supply object methods for filehandles
[s] IO::Handle - supply object methods for I/O handles
[s] IO::Pipe - supply object methods for pipes
[s] IO::Poll - Object interface to system poll call
[s] IO::Seekable - supply seek based methods for I/O objects
[s] IO::Select - OO interface to the select system call
[s] IO::Socket - Object interface to socket communications
[s] IO::Socket::INET - Object interface for AF_INET domain sockets
[s] IO::Socket::UNIX - Object interface for AF_UNIX domain sockets
[s] IO::Uncompress::AnyInflate - Uncompress zlib-based (zip, gzip) file/buffer
[s] IO::Uncompress::AnyUncompress - Uncompress gzip, zip, bzip2 or lzop file/buffer
[s] IO::Uncompress::Base - Base Class for IO::Uncompress modules
[s] IO::Uncompress::Bunzip2 - Read bzip2 files/buffers
[s] IO::Uncompress::Gunzip - Read RFC 1952 files/buffers
[s] IO::Uncompress::Inflate - Read RFC 1950 files/buffers
[s] IO::Uncompress::RawInflate - Read RFC 1951 files/buffers
[s] IO::Uncompress::Unzip - Read zip files/buffers
[s] IO::Zlib - IO:: style interface to Compress::Zlib
[s] IPC::Cmd - finding and running system commands made easy
[s] IPC::Msg - SysV Msg IPC object class
[s] IPC::Open2 - open a process for both reading and writing using open2()
[s] IPC::Open3 - open a process for reading, writing, and error handling using open3()
[s] IPC::Semaphore - SysV Semaphore IPC object class
[s] IPC::SharedMem - SysV Shared Memory IPC object class
[s] IPC::SysV - System V IPC constants and system calls
```

## L
```
[s] List::Util - A selection of general-utility list subroutines
[s] List::Util::XS - Indicate if List::Util was compiled with a C compiler
[s] Locale::Country - standard codes for country identification
[s] Locale::Currency - standard codes for currency identification
[s] Locale::Language - standard codes for language identification
[s] Locale::Maketext - framework for localization
[s] Locale::Maketext::Guts - Deprecated module to load Locale::Maketext utf8 code
[s] Locale::Maketext::GutsLoader - Deprecated module to load Locale::Maketext utf8 code
[s] Locale::Maketext::Simple - Simple interface to Locale::Maketext::Lexicon
[s] Locale::Script - standard codes for script identification
[s] Log::Message - A generic message storing mechanism;
[s] Log::Message::Config - Configuration options for Log::Message
[s] Log::Message::Handlers - Message handlers for Log::Message
[s] Log::Message::Item - Message objects for Log::Message
[s] Log::Message::Simple - Simplified interface to Log::Message
```

## M
```
[s] Math::BigFloat - Arbitrary size floating point math package
[s] Math::BigInt - Arbitrary size integer/float math package
[s] Math::BigInt::Calc - Pure Perl module to support Math::BigInt
[s] Math::BigInt::CalcEmu - Emulate low-level math with BigInt code
[s] Math::BigInt::FastCalc - Math::BigInt::Calc with some XS for more speed
[s] Math::BigRat - Arbitrary big rational numbers
[s] Math::Complex - complex numbers and associated mathematical functions
[s] Math::Trig - trigonometric functions
[s] Memoize - Make functions faster by trading space for time
[s] Memoize::AnyDBM_File - glue to provide EXISTS for AnyDBM_File for Storable use
[s] Memoize::Expire - Plug-in module for automatic expiration of memoized values
[s] Memoize::ExpireFile - test for Memoize expiration semantics
[s] Memoize::ExpireTest - test for Memoize expiration semantics
[s] Memoize::NDBM_File - glue to provide EXISTS for NDBM_File for Storable use
[s] Memoize::SDBM_File - glue to provide EXISTS for SDBM_File for Storable use
[s] Memoize::Storable - store Memoized data in Storable database
[s] MIME::Base64 - Encoding and decoding of base64 strings
[s] MIME::QuotedPrint - Encoding and decoding of quoted-printable strings
[s] Module::Build - Build and install Perl modules
[s] Module::Build::Base - Default methods for Module::Build
[s] Module::Build::Compat - Compatibility with ExtUtils::MakeMaker
[s] Module::Build::ConfigData - Configuration for Module::Build
[s] Module::Build::Cookbook - Examples of Module::Build Usage
[s] Module::Build::ModuleInfo - DEPRECATED
[s] Module::Build::Notes - Create persistent distribution configuration modules
[s] Module::Build::Platform::aix - Builder class for AIX platform
[s] Module::Build::Platform::Amiga - Builder class for Amiga platforms
[s] Module::Build::Platform::cygwin - Builder class for Cygwin platform
[s] Module::Build::Platform::darwin - Builder class for Mac OS X platform
[s] Module::Build::Platform::Default - Stub class for unknown platforms
[s] Module::Build::Platform::EBCDIC - Builder class for EBCDIC platforms
[s] Module::Build::Platform::MacOS - Builder class for MacOS platforms
[s] Module::Build::Platform::MPEiX - Builder class for MPEiX platforms
[s] Module::Build::Platform::os2 - Builder class for OS/2 platform
[s] Module::Build::Platform::RiscOS - Builder class for RiscOS platforms
[s] Module::Build::Platform::Unix - Builder class for Unix platforms
[s] Module::Build::Platform::VMS - Builder class for VMS platforms
[s] Module::Build::Platform::VOS - Builder class for VOS platforms
[s] Module::Build::Platform::Windows - Builder class for Windows platforms
[s] Module::Build::PPMMaker - Perl Package Manager file creation
[s] Module::Build::Version - DEPRECATED
[s] Module::Build::YAML - DEPRECATED
[s] Module::CoreList - what modules shipped with versions of perl
[s] Module::Load - runtime require of both modules and files
[s] Module::Load::Conditional - Looking up module information / loading at runtime
[s] Module::Loaded - mark modules as loaded or unloaded
[s] Module::Pluggable - automatically give your module the ability to have plugins
[s] Module::Pluggable::Object - automatically give your module the ability to have plugins
```

## N
```
[s] NDBM_File - Tied access to ndbm files
[s] Net::Cmd - Network Command class (as used by FTP, SMTP etc)
[s] Net::Config - Local configuration data for libnet
[s] Net::Domain - Attempt to evaluate the current host's internet name and domain
[s] Net::FTP - FTP Client class
[s] Net::hostent - by-name interface to Perl's built-in gethost*() functions
[s] Net::netent - by-name interface to Perl's built-in getnet*() functions
[s] Net::Netrc - OO interface to users netrc file
[s] Net::NNTP - NNTP Client class
[s] Net::Ping - check a remote host for reachability
[s] Net::POP3 - Post Office Protocol 3 Client class (RFC1939)
[s] Net::protoent - by-name interface to Perl's built-in getproto*() functions
[s] Net::servent - by-name interface to Perl's built-in getserv*() functions
[s] Net::SMTP - Simple Mail Transfer Protocol Client
[s] Net::Time - time and daytime network client interface
[s] NEXT - Provide a pseudo-class NEXT (et al) that allows method redispatch
```

## O
```
[s] O - Generic interface to Perl Compiler backends
[s] Object::Accessor - interface to create per object accessors
[s] Opcode - Disable named opcodes when compiling perl code
```

## P
```
[s] Package::Constants - List all constants declared in a package
[s] Params::Check - A generic input parsing/checking mechanism.
[s] Parse::CPAN::Meta - Parse META.yml and META.json CPAN metadata files
[s] PerlIO - On demand loader for PerlIO layers and root of PerlIO::* name space
[s] PerlIO::encoding - encoding layer
[s] PerlIO::scalar - in-memory IO, scalar IO
[s] PerlIO::via - Helper class for PerlIO layers implemented in perl
[s] PerlIO::via::QuotedPrint - PerlIO layer for quoted-printable strings
[s] Pod::Checker - check pod documents for syntax errors
[s] Pod::Escapes - for resolving Pod E<...> sequences
[s] Pod::Find - find POD documents in directory trees
[s] Pod::Functions - Group Perl's functions a la perlfunc.pod
[s] Pod::Html - module to convert pod files to HTML
[s] Pod::InputObjects - objects representing POD input paragraphs, commands, etc.
[s] Pod::LaTeX - Convert Pod data to formatted Latex
[s] Pod::Man - Convert POD data to formatted *roff input
[s] Pod::ParseLink - Parse an L<> formatting code in POD text
[s] Pod::Parser - base class for creating POD filters and translators
[s] Pod::ParseUtils - helpers for POD parsing and conversion
[s] Pod::Perldoc - Look up Perl documentation in Pod format.
[s] Pod::Perldoc::BaseTo - Base for Pod::Perldoc formatters
[s] Pod::Perldoc::GetOptsOO - Customized option parser for Pod::Perldoc
[s] Pod::Perldoc::ToChecker - let Perldoc check Pod for errors
[s] Pod::Perldoc::ToMan - let Perldoc render Pod as man pages
[s] Pod::Perldoc::ToNroff - let Perldoc convert Pod to nroff
[s] Pod::Perldoc::ToPod - let Perldoc render Pod as ... Pod!
[s] Pod::Perldoc::ToRtf - let Perldoc render Pod as RTF
[s] Pod::Perldoc::ToText - let Perldoc render Pod as plaintext
[s] Pod::Perldoc::ToTk - let Perldoc use Tk::Pod to render Pod
[s] Pod::Perldoc::ToXml - let Perldoc render Pod as XML
[s] Pod::PlainText - Convert POD data to formatted ASCII text
[s] Pod::Select - extract selected sections of POD from input
[s] Pod::Simple - framework for parsing Pod
[s] Pod::Simple::Checker - check the Pod syntax of a document
[s] Pod::Simple::Debug - put Pod::Simple into trace/debug mode
[s] Pod::Simple::DumpAsText - dump Pod-parsing events as text
[s] Pod::Simple::DumpAsXML - turn Pod into XML
[s] Pod::Simple::HTML - convert Pod to HTML
[s] Pod::Simple::HTMLBatch - convert several Pod files to several HTML files
[s] Pod::Simple::LinkSection - represent "section" attributes of L codes
[s] Pod::Simple::Methody - turn Pod::Simple events into method calls
[s] Pod::Simple::PullParser - a pull-parser interface to parsing Pod
[s] Pod::Simple::PullParserEndToken - end-tokens from Pod::Simple::PullParser
[s] Pod::Simple::PullParserStartToken - start-tokens from Pod::Simple::PullParser
[s] Pod::Simple::PullParserTextToken - text-tokens from Pod::Simple::PullParser
[s] Pod::Simple::PullParserToken - tokens from Pod::Simple::PullParser
[s] Pod::Simple::RTF - format Pod as RTF
[s] Pod::Simple::Search - find POD documents in directory trees
[s] Pod::Simple::SimpleTree - parse Pod into a simple parse tree
[s] Pod::Simple::Text - format Pod as plaintext
[s] Pod::Simple::TextContent - get the text content of Pod
[s] Pod::Simple::XHTML - format Pod as validating XHTML
[s] Pod::Simple::XMLOutStream - turn Pod into XML
[s] Pod::Text - Convert POD data to formatted ASCII text
[s] Pod::Text::Color - Convert POD data to formatted color ASCII text
[s] Pod::Text::Overstrike - =for stopwords overstrike
[s] Pod::Text::Termcap - Convert POD data to ASCII text with format escapes
[s] Pod::Usage - print a usage message from embedded pod documentation
[s] POSIX - Perl interface to IEEE Std 1003.1
```

## S
```
[s] Safe - Compile and execute code in restricted compartments
[s] Scalar::Util - A selection of general-utility scalar subroutines
[s] SDBM_File - Tied access to sdbm files
[s] Search::Dict - look - search for key in dictionary file
[s] SelectSaver - save and restore selected file handle
[s] SelfLoader - load functions only on demand
[s] Socket - networking constants and support functions
[s] Storable - persistence for Perl data structures
[s] Symbol - manipulate Perl symbols and their names
[s] Sys::Hostname - Try every conceivable way to get hostname
[s] Sys::Syslog - Perl interface to the UNIX syslog(3) calls
```

## T
```
[s] TAP::Base - Base class that provides common functionality to TAP::Parser and TAP::Harness
[s] TAP::Formatter::Base - Base class for harness output delegates
[s] TAP::Formatter::Color - Run Perl test scripts with color
[s] TAP::Formatter::Console - Harness output delegate for default console output
[s] TAP::Formatter::Console::ParallelSession - Harness output delegate for parallel console output
[s] TAP::Formatter::Console::Session - Harness output delegate for default console output
[s] TAP::Formatter::File - Harness output delegate for file output
[s] TAP::Formatter::File::Session - Harness output delegate for file output
[s] TAP::Formatter::Session - Abstract base class for harness output delegate
[s] TAP::Harness - Run test scripts with statistics
[s] TAP::Object - Base class that provides common functionality to all TAP::* modules
[s] TAP::Parser - Parse TAP|Test::Harness::TAP output
[s] TAP::Parser::Aggregator - Aggregate TAP::Parser results
[s] TAP::Parser::Grammar - A grammar for the Test Anything Protocol.
[s] TAP::Parser::Iterator - Base class for TAP source iterators
[s] TAP::Parser::Iterator::Array - Iterator for array-based TAP sources
[s] TAP::Parser::Iterator::Process - Iterator for process-based TAP sources
[s] TAP::Parser::Iterator::Stream - Iterator for filehandle-based TAP sources
[s] TAP::Parser::IteratorFactory - Figures out which SourceHandler objects to use for a given Source
[s] TAP::Parser::Multiplexer - Multiplex multiple TAP::Parsers
[s] TAP::Parser::Result - Base class for TAP::Parser output objects
[s] TAP::Parser::Result::Bailout - Bailout result token.
[s] TAP::Parser::Result::Comment - Comment result token.
[s] TAP::Parser::Result::Plan - Plan result token.
[s] TAP::Parser::Result::Pragma - TAP pragma token.
[s] TAP::Parser::Result::Test - Test result token.
[s] TAP::Parser::Result::Unknown - Unknown result token.
[s] TAP::Parser::Result::Version - TAP syntax version token.
[s] TAP::Parser::Result::YAML - YAML result token.
[s] TAP::Parser::ResultFactory - Factory for creating TAP::Parser output objects
[s] TAP::Parser::Scheduler - Schedule tests during parallel testing
[s] TAP::Parser::Scheduler::Job - A single testing job.
[s] TAP::Parser::Scheduler::Spinner - A no-op job.
[s] TAP::Parser::Source - a TAP source & meta data about it
[s] TAP::Parser::Utils - Internal TAP::Parser utilities
[s] TAP::Parser::YAMLish::Reader - Read YAMLish data from iterator
[s] TAP::Parser::YAMLish::Writer - Write YAMLish data
[s] Term::ANSIColor - Color screen output using ANSI escape sequences
[s] Term::Cap - Perl termcap interface
[s] Term::Complete - Perl word completion module
[s] Term::ReadLine - Perl interface to various readline packages. If no real package is found, substitutes stubs instead of basic functions.
[s] Term::UI - Term::ReadLine UI made easy
[s] Term::UI::History - history function
[s] Test - provides a simple framework for writing test scripts
[s] Test::Builder - Backend for building test libraries
[s] Test::Builder::Module - Base class for test modules
[s] Test::Builder::Tester - test testsuites that have been built with Test::Builder
[s] Test::Builder::Tester::Color - turn on colour in Test::Builder::Tester
[s] Test::Harness - Run Perl standard test scripts with statistics
[s] Test::More - yet another framework for writing test scripts
[s] Test::Simple - Basic utilities for writing tests.
[s] Text::Abbrev - abbrev - create an abbreviation table from a list
[s] Text::Balanced - Extract delimited text sequences from strings.
[s] Text::ParseWords - parse text into an array of tokens or array of arrays
[s] Text::Soundex - Implementation of the soundex algorithm.
[s] Text::Tabs - expand and unexpand tabs like unix expand(1) and unexpand(1)
[s] Text::Wrap - line wrapping to form simple paragraphs
[s] Thread - Manipulate threads in Perl (for old code only)
[s] Thread::Queue - Thread-safe queues
[s] Thread::Semaphore - Thread-safe semaphores
[s] Tie::Array - base class for tied arrays
[s] Tie::File - Access the lines of a disk file via a Perl array
[s] Tie::Handle - base class definitions for tied handles
[s] Tie::Hash - base class definitions for tied hashes
[s] Tie::Hash::NamedCapture - Named regexp capture buffers
[s] Tie::Memoize - add data to hash when needed
[s] Tie::RefHash - use references as hash keys
[s] Tie::Scalar - base class definitions for tied scalars
[s] Tie::StdHandle - base class definitions for tied handles
[s] Tie::SubstrHash - Fixed-table-size, fixed-key-length hashing
[s] Time::gmtime - by-name interface to Perl's built-in gmtime() function
[s] Time::HiRes - High resolution alarm, sleep, gettimeofday, interval timers
[s] Time::Local - efficiently compute time from local and GMT time
[s] Time::localtime - by-name interface to Perl's built-in localtime() function
[s] Time::Piece - Object Oriented time objects
[s] Time::Seconds - a simple API to convert seconds to other date values
[s] Time::tm - internal object used by Time::gmtime and Time::localtime
```

## U
```
[s] Unicode::Collate - Unicode Collation Algorithm
[s] Unicode::Normalize - Unicode Normalization Forms
[s] Unicode::UCD - Unicode character database
[s] UNIVERSAL - base class for ALL classes (blessed references)
[s] User::grent - by-name interface to Perl's built-in getgr*() functions
[s] User::pwent - by-name interface to Perl's built-in getpw*() functions
```

## X
```
[s] XSLoader - Dynamically load C libraries into Perl code
```
