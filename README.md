multirepo
=========

An easy to use tool to clone and manage multiple git repositories at once.

Inspired by [Google's repo][1].

Configuration
-------------

multirepo uses a manifest XML file, which enumerates the repos to manage. For each repo, you MUST provide thw following properties:

* a `url` in form of a GIT url, to clone the repo from
* a `branch` to checkout.
* a `path`, relative to the current directory, to clone the repo into. 
* a `rename`, that will be used instead of the repository's root folder (which is the default behaviour).
Here is an example:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
	<project url="git@server:git/project1" branch="master" path="../folder1" rename="folder2" />
	<project url="git@server:git/project2" branch="mybranch"/>
	<project url="git@server:git/project3" branch="mybranch" rename="app" />
</manifest>
```

The manifest file MUST comply to the following DTD schema file:

```xml
<?xml encoding="UTF-8"?>
<!ELEMENT manifest (project)+>
<!ATTLIST manifest
    xmlns CDATA #FIXED ''>
<!ELEMENT project EMPTY>
<!ATTLIST project
    xmlns CDATA #FIXED ''
    branch  #IMPLIED
    path  #IMPLIED
    rename  #IMPLIED
    url CDATA #REQUIRED>
```

Usage
-----

Simply run multirepo and pass the path of the manifest file as first argument:

```sh
multirepo /path/to/manifest.xml
```

For each project, if its `path` exists in the current directory, its `branch` will be checked out and pulled from its remote. If it doesn't exist, the repo will be cloned from its `url` in its `path`.

Installation
------------

On OSX, install it via [Homebrew][2] tap:

```sh
brew tap venator85/multirepo https://github.com/venator85/multirepo/
brew install multirepo
```

License
=======

    Copyright 2016 Alessio Bianchi

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.


 [1]: https://code.google.com/p/git-repo/
 [2]: http://brew.sh/