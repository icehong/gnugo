#terrible connection mistake.
loadsgf games/trevor/trevor_01.sgf 28
1 gg_genmove white
#? [G5]

#probably a screwed up fuseki library!
#CATEGORY=JOSEKI_DATABASE
#DIFFICULTY=1
loadsgf games/trevor/trevor_02.sgf
2 gg_genmove white
#? [!PASS]

# underlying reading problem
#Gunnar wrote:
#
#> ./gnugo --quiet -a -w -t -l ../regression/games/unsorted_03.sgf -L 29
#> --decide-string E4 -o vars.sgf
#> 
#> giving the result
#> 
#> | E4 cannot be attacked (874 variations)
#> 
#> So here's the problem. Usually GNU Go is quite strong at tactical
#> reading and it might be expected to read this position correctly.
#> Closer analysis of the vars.sgf file shows that GNU Go is confused by
#> a few meaningless stalling moves from white (like throwin at D5 and
#> atari at F6) and the corner ko potential. This can probably be fixed,
#> but it's not easy and it may involve complex tradeoffs between speed
#> and accuracy.
#
#If you increase the level, it sees the attack but misses that
#it is unconditional. It sees a ko in the corner after
#
#B:G4 W:F2 B:H2 W:H3 B:H4 W:H1 B:J3 etc.
#
#Dan
#CATEGORY=TACTICAL_READING
#DIFFICULTY=8
#PREDECESSOR=reading.tst.154
loadsgf games/trevor/trevor_03.sgf 28
3 gg_genmove white
#? [!E3]*

#simple edge block missed.
loadsgf games/trevor/trevor_04.sgf 30
4 gg_genmove white
#? [G1]

#E5 is the only move.  Is GnuGo playing somewhat randomly here?
#Dan said:
#Looking at unsorted test 5, a typical way to solve this would be
#to add an edge Joseki pattern, such as this:
#
#Pattern EJ84
#
#......       Atari before connecting
#..*...
#X.XO..
#.XO...
#......
#......
#------
#
#:8,J
#
#One should also add a pattern or two for followup. A pattern
#with type J is given a weight of 27 on a 19x19 board, which
#means that it is played automatically unless there is something
#really huge on the board.
#
#Unfortunately, this does not work. The problem is that the values of
#J patterns are scaled. From shapes.c:
#
#  if (class & CLASS_J) {
#    TRACE("...joseki standard move\n");
#    add_expand_territory_move(ti, tj);
#    TRACE("...expands territory\n");
#    add_expand_moyo_move(ti, tj);
#    TRACE("...expands moyo\n");
#    set_minimum_move_value(ti, tj, 27 * board_size / 19.0);
#    TRACE("... minimum move value %f\n", 27 * board_size / 19.0);
#  }
#CATEGORY=JOSEKI_DATABASE
#DIFFICULTY=8
loadsgf games/trevor/trevor_05.sgf 6
5 gg_genmove white
#? [E5]

#locally B9 is terrible.  There are other big moves on the board.
loadsgf games/trevor/trevor_06.sgf 22
6 gg_genmove white
#? [B7|C6|F5]

#B5 is certainly better than C5 here.  This is a terrible
#game for white, but it's hard to narrow down the obvious
#blunders.
#Per Dan:  This needs to be fixed. It is probably a
#matter of owl tuning and may require some thought.
#CATEGORY=OWL_TUNING
#DIFFICULTY=6
loadsgf games/trevor/trevor_07.sgf 32
7 gg_genmove white
#? [!C5]*

#Pattern missing here?  B8 is almost always better than B9.
loadsgf games/trevor/trevor_08.sgf 24
8 gg_genmove white
#? [!B9]

#E5 (or some defence of D4 worm) is necessary.
#Dan: This should be solved by a reading connection
#analyzer. Tristan Cazenave is working on such a project.
#This test should be moved to connections.tst.
#CATEGORY=DYNAMIC_CONNECTION
loadsgf games/trevor/trevor_09.sgf
9 gg_genmove white
#? [E5]*

#This is nearly trivial, it would seem!
loadsgf games/trevor/trevor_10.sgf
10 gg_genmove white
#? [E6]

#Yikes, gnugo can't play into here.  See also the next problem.
loadsgf games/trevor/trevor_11.sgf
11 gg_genmove white
#? [!B2]*

#J2 is terrible.  H1 leads at least to a Ko.
loadsgf games/trevor/trevor_12.sgf
12 gg_genmove black
#? [H1]

#E2 is obvious.
loadsgf games/trevor/trevor_13.sgf
13 gg_genmove black
#? [E2]

#Must protect double cut at C2 & E2
loadsgf games/trevor/trevor_14.sgf
14 gg_genmove white
#? [!PASS]*

#protecting at E7 is very necessary.
loadsgf games/trevor/trevor_15.sgf 
15 gg_genmove white
#? [E7]

# C1 looks best here.  A7 very unorthodox, and at least
# worse for ko threats.
loadsgf games/trevor/trevor_16.sgf 53
160 gg_genmove black
#? [!A7]*


# Protecting lower left group better.
loadsgf games/trevor/trevor_16.sgf 54
161 gg_genmove white
#? [B1]*

# W can live here unconditionally.
loadsgf games/trevor/trevor_16.sgf 58
162 gg_genmove white
#? [B1]

# If Black B9, White can't connect at C7.
loadsgf games/trevor/trevor_16.sgf 67
163 gg_genmove black
#? [B9]*

# Must connect dragons.
# B6 should be valued much much lower than B5
# Top moves:
#1. B5  32.93 [CORRECT!]
#2. B6  32.64 [NO, this is terrible, more like B7 & C7]
#3. B7  18.35
#4. C7  18.33
loadsgf games/trevor/trevor_17.sgf 22
170 gg_genmove white
#? [FAIL]*

# C8 is terrible.
loadsgf games/trevor/trevor_17.sgf 28
171 gg_genmove white
#? [!C8]*

# Snapback!
loadsgf games/trevor/trevor_18.sgf 32
180 gg_genmove white
#? [!A8]*

# Whoops, don't let go of the dragon's tail!
loadsgf games/trevor/trevor_19.sgf 12
190 gg_genmove white
#? [B7]*

# W should connect his two dragons.
loadsgf games/trevor/trevor_20.sgf 14
200 gg_genmove white
#? [D7|D4]*

# W can live on the right pretty easily (i.e. G8)
loadsgf games/trevor/trevor_20.sgf
201 gg_genmove white
#? [!PASS]

# W can live on the right pretty easily (i.e. G8)
# Black really does pass here, but eval.sh reports a PASSED result. (?)
loadsgf games/trevor/trevor_20.sgf
202 gg_genmove black
#? [!PASS]* 

# Huge negative sacrifice at D8.
loadsgf games/trevor/trevor_21.sgf 22
210 gg_genmove white
#? [!D8]

# In this case, the knight's move connection looks best.
# Black seems not to see the cut coming.
loadsgf games/trevor/trevor_22.sgf 23
220 gg_genmove black
#? [E8]*

# F2 is not really sente, nor useful if it were!
loadsgf games/trevor/trevor_23.sgf 27
230 gg_genmove black
#? [C2|B2]*


# Connect the dragons!  One eye is not enough, anyway.
# Thanks to Gunnar, for the random seed to force failure!
# See also owl.tst 221
loadsgf games/trevor/trevor_24.sgf 33
240 gg_genmove black 1
#? [E8|D8]


# G2 is a gift to white.
loadsgf games/trevor/trevor_25.sgf 31
250 gg_genmove black
#? [!G2]*

# G1 is another gift to white.
loadsgf games/trevor/trevor_25.sgf 33
251 gg_genmove black
#? [!G1]*


# Should connect further back, at least, but of course
# blocking at C1 is much bigger.
# 3.1.8 reports:
#  Move at C1 strategically or tactically unsafe
#  Move at F9 strategically or tactically unsafe
loadsgf games/trevor/trevor_26.sgf 33
260 gg_genmove black
#? [C1|F9]*

#Here's the problem:
#Top moves:
#1. F9  16.22
#2. A2  8.28
#Checking safety of a black move at F9
#Move at F9 would be a blunder.
loadsgf games/trevor/trevor_26.sgf 39
261 gg_genmove black
#? [F9]*


# Ack, protect the cut!
loadsgf games/trevor/trevor_27.sgf 35
270 gg_genmove black
#? [E6|D6]


# D5 misses a big problem cut.
loadsgf games/trevor/trevor_28.sgf 27
280 gg_genmove black
#? [D4]*

# F6 is much better and safer to boot than H6.
# culprit seems to be pattern LE4 (matches H6) - min. value 12.
# Perhaps need to replace H6 w/ F6?
loadsgf games/trevor/trevor_28.sgf 36
281 gg_genmove white
#? [F6]



# Yikes, short of liberties!
loadsgf games/trevor/trevor_29.sgf 54
290 gg_genmove white
#? [!A9]*


# Black A7 is a serious threat.  Also, white should at least 
# try to invade.
loadsgf games/trevor/trevor_30.sgf
300 gg_genmove white
#? [!PASS]

# Black A7 is a serious threat.  Also, white should at least 
# try to invade.
loadsgf games/trevor/trevor_30.sgf
301 gg_genmove black
#? [!PASS]

#CATEGORY=TACTICAL_READING
#DESCRIPTION=A7 remains a 7 point threat.
#SEVERITY=6
loadsgf games/trevor/trevor_30.sgf
black G3
302 gg_genmove white

#CATEGORY=OWL_TUNING
#DESCRIPTION=Black still dead after D1!
#SEVERITY=10
loadsgf games/trevor/trevor_31.sgf
310 gg_genmove black
#? [A8]*


loadsgf games/trevor/trevor_32.sgf
320 gg_genmove black
#? [J2]*
