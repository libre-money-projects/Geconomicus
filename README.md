# Ğeconomicus
Ğeconomicus is a set of free graphics and rules to play a generic economy simulation based on 80 years human life expectancy or more, with different money systems.

It includes free money system like it is demonstrated in Relative Theory of Money (GPL v3) = a money system based on an Universal Dividend (see http://en.trm.creationmonetaire.info or http://trm.creationmonetaire.info).

Ğeconomicus uses the Ğ caracter as it is defined in http://www.glibre.org

You are free to use the graphical tools, specific examples of rules, and any other contribution proposed here, under the GPL v3 licence.

You will find, and you can contribute in:

- SVG images you can adapt and print, or use in programs.
- Examples of different money rules to play.
- Examples of results you can compile to compare after playing in LibreOffice files.

### Ğeconomicus HTML web pages inclunding online rules (french) and zip ready-to-print cards and banknotes

http://geconomicus.glibre.org

### Spread Ğeconomicus with latest release of Ğeconomicus HTML web pages and zip ready-to-print files.

https://github.com/vtexier/Geconomicus/releases/latest

### Chat room
XMPP chatroom to join Ğeconomicus developers online: <a href="xmpp:ğeconomicus@muc.jappix.com">ğeconomicus@muc.jappix.com</a>

### Generate rules with travis

[![Build Status](https://travis-ci.org/vtexier/Geconomicus.svg?branch=dev)](https://travis-ci.org/vtexier/Geconomicus)

#### Install Sphinx 1.3

Require Python 2.6+ or Python 3.3+
Require Sphinx 1.3+

On Ubuntu:

```bash
    $ sudo apt-get install inkscape
    $ sudo apt-get install imagemagick
    $ sudo apt-get install python-pip
    $ sudo pip install virtualenv
```
Create and activate a virtual environment for python:

```bash
    $ virtualenv -p /usr/bin/python3.4 venv
    $ source venv/bin/activate
```

Install Sphinx 1.3:

```bash
    $ pip install sphinx
```

To deactivate the environment in your shell:

```bash
    $ deactivate
```

#### build HTML

```bash
    $ ./build.sh
```

The Ğeconomicus HTML web pages are generated in the `rst/build/html` folder.

## ICC profile

We use the `PSOcoated_v3` icc profile, downloaded at http://www.eci.org/en/downloads

Locate or create the folder `.local/share/color/icc` and put the profile in it.
Open `Inkscape > Document Properties > Color Management` and link the profile.

Choose colors in the CMS tab with the `PSOcoated_v3` icc profile selected.
