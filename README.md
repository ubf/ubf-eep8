

# Universal Binary Format and EEP8 #

Copyright (c) 2011-2014 by Joseph Wayne Norton

__Authors:__ Joseph Wayne Norton ([`norton@alum.mit.edu`](mailto:norton@alum.mit.edu)).
<p>This is UBF-EEP8, a framework for integrating UBF and EEP8.  This
repository depends on the UBF open source repository.</p>
<p><em>This repository is experimental in nature and not intended for
production usage.</em></p>

<h2 id="_quick_start_recipe">Quick Start Recipe</h2>

<p>To download, build, and test the ubf_eep8 application in one shot,
please follow this recipe:</p>


<pre><code>$ mkdir working-directory-name
$ cd working-directory-name
$ git clone https://github.com/ubf/ubf-eep8.git ubf_eep8
$ cd ubf_eep8
$ make deps clean compile test</code></pre>

<p>For an alternative recipe with other "features" albeit more complex,
please read further.</p>



<h2 id="_documentation">Documentation</h2>


<h3 id="_where_should_i_start">Where should I start?</h3>
<p>This README is a good first step.</p>
<p>The UBF User's Guide is the best next step.  Check out
<a href="http://ubf.github.com/ubf/ubf-user-guide.en.html">http://ubf.github.com/ubf/ubf-user-guide.en.html</a> for further
detailed information.</p>
<p>EEP8 samples and eunit tests can be found in the test/eunit directory.</p>


<h3 id="_what_is_ubf">What is UBF?</h3>
<p>UBF is the "Universal Binary Format", designed and implemented by Joe
Armstrong.  UBF is a language for transporting and describing complex
data structures across a network.  It has three components:</p>
<ul>
<li>
<p>
UBF(a) is a "language neutral" data transport format, roughly
  equivalent to well-formed XML.
</p>
</li>
<li>
<p>
UBF(b) is a programming language for describing types in UBF(a) and
  protocols between clients and servers.  This layer is typically
  called the "protocol contract".  UBF(b) is roughly equivalent to
  Verified XML, XML-schemas, SOAP and WDSL.
</p>
</li>
<li>
<p>
UBF(c) is a meta-level protocol used between a UBF client and a UBF
  server.
</p>
</li>
</ul>
<p>See <a href="http://ubf.github.com/ubf">http://ubf.github.com/ubf</a> for further details.</p>


<h3 id="_what_is_eep8">What is EEP8?</h3>
<p>EEP8 is an extension to the Erlang language for declaring sets of
Erlang terms to form a particular type, effectively forming a specific
subtype of the set of all Erlang terms. Subsequently, these types can
be used to specify types of record fields and argument and return
values of functions.  See <a href="http://www.erlang.org/eeps/eep-0008.html">http://www.erlang.org/eeps/eep-0008.html</a> for
full details.</p>




<h2 id="_to_download">To download</h2>

<ol class="arabic">
<li>
<p>
Configure your e-mail and name for Git
</p>


<pre><code>$ git config \--global user.email "you@example.com"
$ git config \--global user.name "Your Name"</code></pre>

</li>
<li>
<p>
Install Repo
</p>


<pre><code>$ mkdir -p ~/bin
$ wget -O - https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
$ chmod a+x ~/bin/repo</code></pre>

</li>
<li>
<p>
Create working directory
</p>


<pre><code>$ mkdir working-directory-name
$ cd working-directory-name
$ repo init -u https://github.com/ubf/manifests.git -m ubf-eep8-default.xml</code></pre>


<table><tr>
<td class="icon">
Note
</td>
<td class="content">Your "Git" identity is needed during the init step.  Please
enter the name and email of your GitHub account if you have one.  Team
members having read-write access are recommended to use "repo init -u
<a href="mailto:git@github.com">git@github.com</a>:ubf/manifests.git -m ubf-eep8-default-rw.xml".</td>
</tr></table>


<table><tr>
<td class="icon">
Tip
</td>
<td class="content">If you want to checkout the latest development version, please
append " -b dev" to the repo init command.</td>
</tr></table>

</li>
<li>
<p>
Download Git repositories
</p>


<pre><code>$ cd working-directory-name
$ repo sync</code></pre>

</li>
</ol>
<p>For further information and help for related tools, please refer to the
following links:</p>
<ul>
<li>
<p>
Erlang - <a href="http://www.erlang.org/">http://www.erlang.org/</a>
</p>
<ul>
<li>
<p>
<strong>R14B04 or newer, R16B has been tested most recently</strong>
</p>
</li>
</ul>
</li>
<li>
<p>
Git - <a href="http://git-scm.com/">http://git-scm.com/</a>
</p>
<ul>
<li>
<p>
<strong>Git 1.5.4 or newer, Git 1.8.2 has been tested most recently</strong>
</p>
</li>
<li>
<p>
<em>required for Repo and GitHub</em>
</p>
</li>
</ul>
</li>
<li>
<p>
GitHub - <a href="https://github.com">https://github.com</a>
</p>
</li>
<li>
<p>
Python - <a href="http://www.python.org">http://www.python.org</a>
</p>
<ul>
<li>
<p>
<strong>Python 2.4 or newer, Python 2.7.3 has been tested most recently
    (CAUTION: Python 3.x might be too new)</strong>
</p>
</li>
<li>
<p>
<em>required for Repo</em>
</p>
</li>
</ul>
</li>
<li>
<p>
Rebar - <a href="https://github.com/rebar/rebar/wiki">https://github.com/rebar/rebar/wiki</a>
</p>
</li>
<li>
<p>
Repo - <a href="http://source.android.com/source/git-repo.html">http://source.android.com/source/git-repo.html</a>
</p>
</li>
</ul>



<h2 id="_to_build_basic_recipe">To build - basic recipe</h2>

<ol class="arabic">
<li>
<p>
Get and install an erlang system <a href="http://www.erlang.org">http://www.erlang.org</a>
</p>
</li>
<li>
<p>
Build
</p>


<pre><code>$ cd working-directory-name
$ make compile</code></pre>

</li>
<li>
<p>
Run the unit tests
</p>


<pre><code>$ cd working-directory-name
$ make eunit</code></pre>

</li>
</ol>



<h2 id="_to_build_optional_features">To build - optional features</h2>

<ol class="upperalpha">
<li>
<p>
Dialyzer Testing <em>basic recipe</em>
</p>
<ol class="arabic">
<li>
<p>
Build Dialyzer's PLT <em>(required once)</em>
</p>


<pre><code>$ cd working-directory-name
$ make build-plt</code></pre>


<table><tr>
<td class="icon">
Tip
</td>
<td class="content">Check Makefile and dialyzer's documentation for further
information.</td>
</tr></table>

</li>
<li>
<p>
Dialyze with specs
</p>


<pre><code>$ cd working-directory-name
$ make dialyze</code></pre>


<table><tr>
<td class="icon">
Caution
</td>
<td class="content">If you manually run dialyzer with the "-r" option, execute
"make clean compile" first to avoid finding duplicate beam files
underneath rebar's .eunit directory.  Check Makefile for further
information.</td>
</tr></table>

</li>
<li>
<p>
Dialyze without specs
</p>


<pre><code>$ cd working-directory-name
$ make dialyze-nospec</code></pre>

</li>
</ol>
</li>
</ol>



<h2 id="_credits">Credits</h2>

<p>Many, many thanks to Joe Armstrong, UBF's designer and original
implementer.</p>
<p>Thanks to Kostis Sagonas and Tobias Lindahl, EEP8's designers and
implementers.</p>
<p>Gemini Mobile Technologies, Inc. has approved the release of this
repository under an MIT license.</p>




## Modules ##


<table width="100%" border="0" summary="list of modules">
<tr><td><a href="https://github.com/ubf/ubf-eep8/blob/master/doc/eep8_contract_parser.md" class="module">eep8_contract_parser</a></td></tr></table>

