

#Universal Binary Format and EEP8#

<pre>This is ubf-eep8, a framework for integrating UBF and EEP8.  This
repository depends on the ubf open source repository.


Quick Start Recipe
==================

To download, build, and test the ubf_eep8 application in one shot,
please follow this recipe:

    $ mkdir working-directory-name
    $ cd working-directory-name
    $ git clone git://github.com/norton/ubf-eep8.git ubf_eep8
    $ cd ubf_eep8
    $ ./rebar get-deps
    $ ./rebar clean
    $ ./rebar compile
    $ ./rebar eunit

For an alternative recipe with other "features" albeit more complex,
please read further.


To download
===========

1. Configure your e-mail and name for Git

    $ git config --global user.email "you@example.com"
    $ git config --global user.name "Your Name"

2. Install Repo

    $ mkdir -p ~/bin
    $ wget -O - https://github.com/android/tools_repo/raw/master/repo > ~/bin/repo
    $ perl -i.bak -pe 's!git://android.git.kernel.org/tools/repo.git!git://github.com/android/tools_repo.git!;' ~/bin/repo
    $ chmod a+x ~/bin/repo

    CAUTION: Since access to kernel.org has been shutdown due to
    hackers, fetch and replace repo tool with android's GitHub
    repository mirror.

3. Create working directory

    $ mkdir working-directory-name
    $ cd working-directory-name
    $ repo init -u git://github.com/norton/manifests.git -m ubf-eep8-default.xml

    NOTE: Your "Git" identity is needed during the init step.  Please
    enter the name and email of your GitHub account if you have one.
    Team members having read-write access are recommended to use "repo
    init -u git@github.com:norton/manifests.git -m
    ubf-eep8-default-rw.xml".

    TIP: If you want to checkout the latest development version of UBF
    EEP8, please append " -b dev" to the repo init command.

4. Download Git repositories

    $ cd working-directory-name
    $ repo sync

For futher information and help for related tools, please refer to the
following links:

- Erlang - http://www.erlang.org/
  * *R13B04 or newer, R14B03 has been tested most recently*
- Git - http://git-scm.com/
  * *Git 1.5.4 or newer, Git 1.7.6.1 has been tested recently*
  * _required for Repo and GitHub_
- GitHub - https://github.com
- Python - http://www.python.org
  * *Python 2.4 or newer, Python 2.7.1 has been tested most recently
     (CAUTION: Python 3.x might be too new)*
  * _required for Repo_
- Rebar - https://github.com/basho/rebar/wiki
- Repo - http://source.android.com/source/git-repo.html


To build - basic recipe
=======================

1. Get and install an erlang system
   http://www.erlang.org

2. Build UBF
   $ cd working-directory-name/src
   $ make compile

3. Run the unit tests
   $ cd working-directory-name/src
   $ make eunit


To build - optional features
============================

A. Dialyzer Testing _basic recipe_

   A.1. Build Dialyzer's PLT _(required once)_

   $ cd working-directory-name/src
   $ make build-plt

   TIP: Check Makefile and dialyzer's documentation for further
   information.

   A.2. Dialyze with specs

   $ cd working-directory-name/src
   $ make dialyze

   CAUTION: If you manually run dialyzer with the "-r" option, execute
   "make clean compile" first to avoid finding duplicate beam files
   underneath rebar's .eunit directory.  Check Makefile for further
   information.

   A.3. Dialyze without specs

   $ cd working-directory-name/src
   $ make dialyze-nospec


Documentation -- Where should I start?
======================================

This README is a good first step.  Check out and build using the "To
build" instructions above.

EEP8 samples and eunit tests can be found in the test/eunit directory.


What is UBF?
============

UBF is the "Universal Binary Format", designed and implemented by Joe
Armstrong.  UBF is a language for transporting and describing complex
data structures across a network.  It has three components:

   * UBF(A) is a "language neutral" data transport format, roughly
     equivalent to well-formed XML.

   * UBF(B) is a programming language for describing types in UBF(A)
     and protocols between clients and servers.  This layer is
     typically called the "protocol contract".  UBF(B) is roughly
     equivalent to Verified XML, XML-schemas, SOAP and WDSL.

   * UBF(C) is a meta-level protocol used between a UBF client and a
     UBF server.

See http://norton.github.com/ubf for further details.


What is EEP8?
=============

EEP8 is an extension to the Erlang language for declaring sets of
Erlang terms to form a particular type, effectively forming a specific
subtype of the set of all Erlang terms. Subsequently, these types can
be used to specify types of record fields and argument and return
values of functions.  See http://www.erlang.org/eeps/eep-0008.html for
full details.


Credits
=======

Many, many thanks to Joe Armstrong, UBF's designer and original
implementor.

Thanks to Kostis Sagonas and Tobias Lindahl, EEP8's designers and
implementors.

Gemini Mobile Technologies, Inc. has approved the release of this
repository under an MIT license.</pre>.
<pre>This is ubf-eep8, a framework for integrating UBF and EEP8.  This
repository depends on the ubf open source repository.


Quick Start Recipe
==================

To download, build, and test the ubf_eep8 application in one shot,
please follow this recipe:

    $ mkdir working-directory-name
    $ cd working-directory-name
    $ git clone git://github.com/norton/ubf-eep8.git ubf_eep8
    $ cd ubf_eep8
    $ ./rebar get-deps
    $ ./rebar clean
    $ ./rebar compile
    $ ./rebar eunit

For an alternative recipe with other "features" albeit more complex,
please read further.


To download
===========

1. Configure your e-mail and name for Git

    $ git config --global user.email "you@example.com"
    $ git config --global user.name "Your Name"

2. Install Repo

    $ mkdir -p ~/bin
    $ wget -O - https://github.com/android/tools_repo/raw/master/repo > ~/bin/repo
    $ perl -i.bak -pe 's!git://android.git.kernel.org/tools/repo.git!git://github.com/android/tools_repo.git!;' ~/bin/repo
    $ chmod a+x ~/bin/repo

    CAUTION: Since access to kernel.org has been shutdown due to
    hackers, fetch and replace repo tool with android's GitHub
    repository mirror.

3. Create working directory

    $ mkdir working-directory-name
    $ cd working-directory-name
    $ repo init -u git://github.com/norton/manifests.git -m ubf-eep8-default.xml

    NOTE: Your "Git" identity is needed during the init step.  Please
    enter the name and email of your GitHub account if you have one.
    Team members having read-write access are recommended to use "repo
    init -u git@github.com:norton/manifests.git -m
    ubf-eep8-default-rw.xml".

    TIP: If you want to checkout the latest development version of UBF
    EEP8, please append " -b dev" to the repo init command.

4. Download Git repositories

    $ cd working-directory-name
    $ repo sync

For futher information and help for related tools, please refer to the
following links:

- Erlang - http://www.erlang.org/
  * *R13B04 or newer, R14B03 has been tested most recently*
- Git - http://git-scm.com/
  * *Git 1.5.4 or newer, Git 1.7.6.1 has been tested recently*
  * _required for Repo and GitHub_
- GitHub - https://github.com
- Python - http://www.python.org
  * *Python 2.4 or newer, Python 2.7.1 has been tested most recently
     (CAUTION: Python 3.x might be too new)*
  * _required for Repo_
- Rebar - https://github.com/basho/rebar/wiki
- Repo - http://source.android.com/source/git-repo.html


To build - basic recipe
=======================

1. Get and install an erlang system
   http://www.erlang.org

2. Build UBF
   $ cd working-directory-name/src
   $ make compile

3. Run the unit tests
   $ cd working-directory-name/src
   $ make eunit


To build - optional features
============================

A. Dialyzer Testing _basic recipe_

   A.1. Build Dialyzer's PLT _(required once)_

   $ cd working-directory-name/src
   $ make build-plt

   TIP: Check Makefile and dialyzer's documentation for further
   information.

   A.2. Dialyze with specs

   $ cd working-directory-name/src
   $ make dialyze

   CAUTION: If you manually run dialyzer with the "-r" option, execute
   "make clean compile" first to avoid finding duplicate beam files
   underneath rebar's .eunit directory.  Check Makefile for further
   information.

   A.3. Dialyze without specs

   $ cd working-directory-name/src
   $ make dialyze-nospec


Documentation -- Where should I start?
======================================

This README is a good first step.  Check out and build using the "To
build" instructions above.

EEP8 samples and eunit tests can be found in the test/eunit directory.


What is UBF?
============

UBF is the "Universal Binary Format", designed and implemented by Joe
Armstrong.  UBF is a language for transporting and describing complex
data structures across a network.  It has three components:

   * UBF(A) is a "language neutral" data transport format, roughly
     equivalent to well-formed XML.

   * UBF(B) is a programming language for describing types in UBF(A)
     and protocols between clients and servers.  This layer is
     typically called the "protocol contract".  UBF(B) is roughly
     equivalent to Verified XML, XML-schemas, SOAP and WDSL.

   * UBF(C) is a meta-level protocol used between a UBF client and a
     UBF server.

See http://norton.github.com/ubf for further details.


What is EEP8?
=============

EEP8 is an extension to the Erlang language for declaring sets of
Erlang terms to form a particular type, effectively forming a specific
subtype of the set of all Erlang terms. Subsequently, these types can
be used to specify types of record fields and argument and return
values of functions.  See http://www.erlang.org/eeps/eep-0008.html for
full details.


Credits
=======

Many, many thanks to Joe Armstrong, UBF's designer and original
implementor.

Thanks to Kostis Sagonas and Tobias Lindahl, EEP8's designers and
implementors.

Gemini Mobile Technologies, Inc. has approved the release of this
repository under an MIT license.</pre>


##Modules##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="https://github.com/norton/ubf-eep8/blob/master/doc/eep8_contract_parser.md" class="module">eep8_contract_parser</a></td></tr>
<tr><td><a href="https://github.com/norton/ubf-eep8/blob/master/doc/eep8_types_builtin.md" class="module">eep8_types_builtin</a></td></tr>
<tr><td><a href="https://github.com/norton/ubf-eep8/blob/master/doc/eep8_types_predefined.md" class="module">eep8_types_predefined</a></td></tr></table>

