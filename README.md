Gospace
======

A virtual workspace manager for Go.

Virtual workspaces let you isolate the dependencies from your different
projects by using a different `$GOPATH` for each of them.


Install
-------

Download `gospace` and add `source path/to/gospace` to your `.bashrc` or
`.zshrc` file - or whichever is appropriate on your platform.


Usage
-----

Once gospace is installed, you can enter a new or existing virtual workspace
by doing:

    gospace enter my_virtual_workspace

Once you're done working in that workspace, you can restore your previous
environment using:

    gospace exit

You can add the `$GOSPACE` environment variable to your command line to
know which Gospace is currently active.


Autocompletion
--------------

Gospace has built-in bash autocompletion.


### ZSH support ###

If you're using zsh, you'll need to enable compatibility support for bash
completion.

Add these lines to your `.zshrc` file, before you run `source gospace`:

    autoload bashcompinit
    bashcompinit


Running tests
-------------

To run the gospace test suite, run the following from the root of the project:

    bash runtests.sh


Thanks
------

Gospace was inspired by Python's virtualenv and virtualenvwrapper.
