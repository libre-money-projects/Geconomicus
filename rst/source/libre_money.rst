Monnaie libre
=============

La monnaie libre est une monnaie dont tous les utilisateurs sont co-créateurs, à parts égales. La monnaie est créée sous
la forme d'un Dividende Universel (DU) régulier. Celui-ci peut être journalier, hebdomadaire ou mensuel,
mais doit respecter un accroissement de la masse monétaire de 10 % par an.

Mais compter les prix en unités dans une monnaie en accroissement constant est peu pratique, on préférera donc compter en DU.
On appelle cela "compter en relatif". En relatif, la masse monétaire moyenne par individu reste constante en DU.
La monnaie est alors un flux constant ne connaissant pas de pénurie.

L'utilisation d'une monnaie libre se fait grâce au roulement des couleurs des billets définis plus haut.

Au début du jeu il est conseillé de démarrer directement la partie en distribuant les trois couleurs à chaque joueur
(2 billets de chacune des couleurs) afin d'entrer directement en jeu à partir d'une économie déjà monétisée.

A chaque nouveau tour, l'animateur fait tourner les marqueurs de billets sur la feuille d'aide. La couleur en attente devient
la couleur supérieure.

Il distribue alors 2 nouveaux billets de la valeur supérieure (qui est la couleur qui était en attente) à chaque joueur,
et récupère tous les billets de la valeur la plus faible qui devient à son tour la valeur en attente jusqu'au tour suivant.

Il y a donc ainsi toujours 3 couleurs de billets en jeu valant respectivement 1/2 DU, 1 DU, et 2 DU, qui « glissent » (ou « tournent »)
à chaque tour, la couleur médiane étant donc le DU de référence en vigueur lors d'un tour.

Les valeurs monétaires des cartes se fondent sur le DU de référence en vigueur, et les cartes de valeur la plus basse
(le plus souvent ce seront les cartes de niveau bronze pour les cartes standards Ğeconomicus), valent chacune 3 DU.

::

    Important :
    il est interdit de troquer une carte contre une autre.
    Les joueurs doivent toujours avoir la monnaie suffisante
    pour acheter la carte qu'il désire !


Comme on distribue 2 billets supplémentaires de couleur haute  à chaque tour, et que l'on élimine les billets de couleur basse,
on aura donc une moyenne de DU distribué par joueur, pour 3 couleurs égale à :

::

    2 (1/2 DU +1 DU + 2 DU) = 7 DU

Donc un « pouvoir d'achat » moyen distribué de (2 cartes valeurs + 1 DU) / joueur.

::

    Il est possible de démarrer en distribuant une seule couleur,
    mais cela n'a pas d'intérêt si ce n'est retarder
    la monétisation de 2 tours et biaiser ainsi le résultat.
    Le tour initial ne correspond pas en effet à l'arrivée progressive
    de nouveaux entrants remplaçant des sortants, mais au premier tour
    de mesure d'une économie supposée tourner déjà depuis longtemps.


Info technique
--------------

À noter que, quel que soit le nombre « n + 1 » de couleurs, donc 1 en attente et
« n » en jeu on a un nombre x de DU (compté par exemple sur la valeur la plus basse) :

::

    x DU = 1 + 2 + 4 + … + 2 × n - 1


Qui reste stable entre deux tours, puisque le 1 sortira du jeu, les puissances seront décalées à gauche,
et la couleur en attente entre en remplaçant la couleur la plus haute pour 2 × n - 1 DU ( 23 - 1 = 4 DU avec 3 couleurs).

Et cela revient à multiplier la valeur quantitative de la monnaie par 2 = (1 + 10 %)⁸.
D'où le fait que l'on simule 8 ans (puissance 8) à chaque tour,
pour un taux de renouvellement équivalent de 10 % / an, et donc en 10 tours 100 % des hommes sont renouvelés.
