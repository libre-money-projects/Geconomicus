# Ğeconomicus
Ğeconomicus is a generic free economic game under GPLv3, that includes a set of free graphics, files and rules allowing to play a generic economy simulation based on 80 years human life expectancy or more, with different money systems.

You will find, and you can contribute in:

- SVG images you can adapt and print, or use in programs.
- Examples of different money rules to play.
- Examples of results in LibreOffice Calc.
- HTML full website including all necessary to play, you can install in your own server

#### Ğeconomicus HTML

Web pages including online rules (french) and zip ready-to-print cards and banknotes : http://geconomicus.glibre.org

#### Ğeconomicus latest release

Spread Ğeconomicus, download and install Ğeconomicus HTML web pages and ready-to-print cards and banknotes on your own server : https://github.com/galuel/Geconomicus/releases/latest

#### XMPP Chat room

XMPP chatroom to join Ğeconomicus developers online: ğeconomicus@muc.jappix.com

You can study and install [Jabber/XMPP free clients softwares](http://xmpp.org/software/clients.html).

#### Contributions

Ğeconomicus was inspired by several economic games like [La Corbeille](https://github.com/Valeureux/LaCorbeille-Trading-Floor) another free game under GPL v3, Monopoly™, La bonne paye™, online MMORPG that include also specific money that every time is created following specific rules.

Ğeconomicus adds another dimension to any economic game based on its principles : limited lifetime of the players, rotation of the money and rotation of the values, in order to be able to simulate at least a life expectancy game time (near 80 years in Europe in 2016), where players can die and be born again, and where money and economical values can follow this entire cycle.

It includes free money system like it is demonstrated in Relative Theory of Money (GPL v3) = a money system based on a Universal Dividend (see http://en.trm.creationmonetaire.info or http://trm.creationmonetaire.info), money debt, and other money systems in order to compare their impact in the final result.

Ğeconomicus uses the Ğ caracter as it's defined in http://www.glibre.org

# Generate HTML with travis

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
    (venv) $ pip install sphinx==1.3
    (venv) $ pip install sphinx-intl
```

#### build HTML

```bash
    (venv) $ ./build.sh
```

The Ğeconomicus HTML web pages are generated in the `rst/build/html` folder.

#### After build, to deactivate and remove the virtual environment in your shell:

```bash
    (venv) $ deactivate
    $ virtualenv --clear venv
```

# ICC profile

We use the `PSOcoated_v3` icc profile, downloaded at http://www.eci.org/en/downloads

Locate or create the folder `.local/share/color/icc` and put the profile in it.
Open `Inkscape > Document Properties > Color Management` and link the profile.

Choose colors in the CMS tab with the `PSOcoated_v3` icc profile selected.

## Translation

### Build in english (US)

```bash
    (venv) $ ./build_en_US.sh
```

To do after the standard french build. Does not generate cards/banknotes.

### When rst files are modified...

Re-generate pot files in `build/locale`

```bash
    (venv) $ cd rst
    (venv) $ make gettext
```

Re-generate po files from pot files in `source/locale`

```bash
    (venv) $ cd rst
    (venv) $ sphinx-intl update -p build/locale -d source/locale/ -l en_US
```
