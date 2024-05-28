/start
==IO==
{~->A|->B|->C}
=A

#knot
#1

#background: IO

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:brianne
#name:BRIANNE
#side:right
/

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Brianne, je ne te dérange pas?

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Un petit peu. Je suis en train de faire plein de choses à la fois. Mais tu peux repasser plus tard.

>>EndOfSequence
->END


=B

#knot
#1

#background: IO

#characters:1

#id:adriana
#name:ADRIANA
#side:left
/

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
On dirait qu'il n'y a personne dans le coin… iels doivent être en train de bosser.

>>EndOfSequence
->END

=C

#knot
#1

#background: IO

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:brianne
#name:BRIANNE
#side:right
/

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Ah c'est toi Adrianna. Tu tombes au mauvais moment, j'allais partir. Tu peux repasser plus tard si tu veux me voir.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Je repasserais alors.

>>EndOfSequence
->END
