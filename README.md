# Ğeconomicus
Ğeconomicus is a set of free graphics and tools to play a generic economy simulation based on 80 years human life expectancy or more, with different money systems, including a freedom money system like, as it is demonstrated in Relative Theory of Money (GPL v3) = a money system based on an Universal Dividend (see https://github.com/vtexier/theorie-relative-de-la-monnaie).

Ğeconomicus uses the Ğ caracter as it is defined by http://www.glibre.org

You are free to use the graphical tools, specific examples of rules, and any other contribution proposed here, under the GPL v3 licence.

You will find, and you can contribute in:

- SVG images you can adapt and print, or use in programs.
- Examples of different money rules to play.
- Examples of results you can compile to compare after playing in LibreOffice files.
- Project to code an online Ğeconomicus game.
- …

### Chat room
XMPP chatroom to join Ğeconomicus developpers online: ğ<a href="xmpp:ğeconomicus@muc.jappix.com">economicus@muc.jappix.com</a>

### Version
Ğeconomicus current version is 1.6

## Generation

### Generate cards

To change model of cards (front and back) and to generate all cards:

```bash
$ cd Geconomicus_cards
$ ./svg_generator.sh
```

To generate pgn ready to print at 300 dpi:

```bash
$ cd Geconomicus_cards/generated_svg
$ ./svg_to_pgn_generator.sh
```

To change model of the relative banknotes and to generate all of them:

```bash
$ cd Geconomicus_money
$ ./svg_banknote_generator.sh
```

To generate pgn ready to print at 300 dpi:

```bash
$ cd Geconomicus_money/generated_svg
$ ./svg_to_pgn_generator.sh
```

### Generate rules

[![Build Status](https://travis-ci.org/vtexier/Geconomicus.svg?branch=dev)](https://travis-ci.org/vtexier/Geconomicus)

#### Install Sphinx 1.3

Require Python 2.6+ or Python 3.3+
Require Sphinx 1.3+

On Ubuntu:

```bash
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

#### Generate HTML

```bash
    $ ./build.sh
```

The rules are generated in the `rst/build/html` folder.
