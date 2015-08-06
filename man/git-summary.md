git-summary(1) -- Show repository summary
=========================================

## SYNOPSIS

`git-summary` [--line] [&lt;commitish&gt;]

## DESCRIPTION

Shows a summary of the repository.

## OPTIONS

  &lt;commitish&gt;
  
  Summarize only the range of commits included in the &lt;commitish&gt;.

  --line

  Summarize with lines other than commits

## EXAMPLES

  Outputs a repo summary:

    $ git summary

    project  : express
    repo age : 10 months ago
    commits  : 1893
    active   : 93 days
    files    : 111
    authors  :
     1285 visionmedia
      478 Tj Holowaychuk
       48 Aaron Heckmann
       34 csausdev
       26 ciaranj
        6 Guillermo Rauch
        3 Nick Poulden
        2 Brian McKinney
        2 Benny Wong
        1 Justin Lilly
        1 James Herdman
        1 Adam Sanderson
        1 Viktor Kelemen
        1 Gregory Ritter
        1 Greg Ritter
        1 ewoudj
        1 isaacs
        1 Matt Colyer

  This command can also take a commitish, and will print a summary for the range
  of commits included in the commitish:

    $ git summary v42..

  For --line options, you can get result calculate by line rather than commit

    $ git summary --line

    project  : git-extras
    lines    : 16004
    authors  :
    7757 hemanth.hm                48.5%
    1019 spacewander               6.4%
     916 CJ                        5.7%
     768 Jonhnny Weslley           4.8%
     711 Mark Eissler              4.4%
     678 timfeirg                  4.2%
     474 Ivan Malopinsky           3.0%
     387 nickl-                    2.4%
     368 Tj Holowaychuk            2.3%
     337 Paul Schreiber            2.1%
     269 Jesús Espino              1.7%
     266 wooorm                    1.7%
     236 Chris Hall                1.5%
     217 TJ Holowaychuk            1.4%
     205 Leila Muhtasib            1.3%
     178 Hemanth.HM                1.1%
     107 Niklas Fiekas             0.7%
      80 Andy                      0.5%
      74 soffolk                   0.5%
      68 Julio Napurí              0.4%
      67 Philipp Klose             0.4%
      66 Sasha Khamkov             0.4%
      66 Nate Jones                0.4%
      65 Kenneth Reitz             0.4%
      64 Rico Sta. Cruz            0.4%
      49 Bruno Sutic               0.3%
      36 chernjie                  0.2%
      35 Titus Wormer              0.2%
      35 Michael Komitee           0.2%
      33 David Hartmann            0.2%
      28 Kevin Woo                 0.2%
      27 Todd Wolfson              0.2%
      22 David Baumgold            0.1%
      22 Carl Casbolt              0.1%
      18 Ciro Nunes                0.1%
      18 Andrew Starr-Bochicchio   0.1%
      16 Valérian Galliat          0.1%
      16 Riceball LEE              0.1%
      16 Damian Krzeminski         0.1%
      12 nulltask                  0.1%
      12 Richard Littauer          0.1%
      11 Jesse Sipprell            0.1%
      10 meza                      0.1%
      10 dead-horse                0.1%
       9 Kylie McClain             0.1%
       9 Camille Reynders          0.1%
       8 Jon Ander Peñalba         0.0%
       8 Guillaume Seren           0.0%
       8 Adam Parkin               0.0%
       7 Newell Zhu                0.0%
       7 Florian H                 0.0%
       7 Andre Cerqueira           0.0%
       6 zeroDivisible             0.0%
       6 Rasmus Wriedt Larsen      0.0%
       6 Konstantin Schukraft      0.0%
       5 Dan Jackson               0.0%
       4 jykntr                    0.0%
       3 phigoro                   0.0%
       3 eszabpt                   0.0%
       3 Raphael Fleischlin        0.0%
       3 Curtis McEnroe            0.0%
       3 Balazs Nadasdi            0.0%
       3 Alex McHale               0.0%
       2 Not Committed Yet         0.0%
       2 Joshua Appelman           0.0%
       2 Evan Grim                 0.0%
       2 Dave James Miller         0.0%
       2 Alexander Krasnukhin      0.0%
       2 Aggelos Orfanakos         0.0%
       1 Wil Moore III             0.0%
       1 TweeKane                  0.0%
       1 Tony                      0.0%
       1 Ryan Bohn                 0.0%
       1 Rob Kennedy               0.0%
       1 Phally                    0.0%
       1 Moritz Grauel             0.0%
       1 Jonathan "Duke" Leto      0.0%
       1 Jianjin Fan               0.0%
       1 Jean Jordaan              0.0%
       1 Jan Krueger               0.0%
       1 Hogan Long                0.0%
       1 Dung Quang                0.0%
       1 Brandon Zylstra           0.0%
       1 Aurélien Scoubeau         0.0%

## AUTHOR

Written by Tj Holowaychuk &lt;<tj@vision-media.ca>&gt;

## REPORTING BUGS

&lt;<https://github.com/tj/git-extras/issues>&gt;

## SEE ALSO

&lt;<https://github.com/tj/git-extras>&gt;
