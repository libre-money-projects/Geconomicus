# Ğeconomicus
Ğeconomicus is a set of free graphics and tools to play a generic economy simulation based on 80 years human life expectancy or more, with different money systems, inclunding a freedom money system like, as it is demonstrated in Relative Theory of Money (GPL v3) = a money system based on an Universal Dividend (see https://github.com/vtexier/theorie-relative-de-la-monnaie).

Ğeconomicus uses the Ğ caracter as it is defined by http://www.glibre.org

You are free to use the graphical tools, specificic examples of rules, and any other contribution proposed here, under the GPL v3 licence.

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

### Generation
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
