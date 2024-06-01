LIST foodFrom =  IO_food, IMAK_food, forestiers_food
VAR foodReceived = 0

==TREVILLE==
{foodFrom: ->back_with_food}
>>>DEBUG
{->start|}

=start
#knot
#4

#background: TREVILLE

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:gwen
#name:GWEN
#side:right
/
#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Gwen. La tempête n'a pas posé trop de problèmes chez vous?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh si, avec le village à moitié dans la mer, chaque tempête amène des soucis.
Les maisons les plus proches de l'eau on beaucoup subie. Celle de Phil menace de s'effondrer.
Et puis une partie de nos récoltes a pris l'eau. Il va falloir serrer la ceinture.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Vous ne voulez pas demander un peu d'aide aux gens des autres îles?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh non, pas besoin de les déranger. On va se débrouiller!

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Tu es sûre? Et si c'est moi qui leur demande?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Non non je te dis, on a encore plein de nourriture!

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
…

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Bon d'accord, on aurait bien besoin d'un petit coup de main.

>>ChangeMetric, treville_food, LOW, false
->END

=back_with_food

>>>DEBUG
#knot
#4

#background: TREVILLE

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:gwen
#name:GWEN
#side:right
/
#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
{Je ramène des bonnes nouvelles!|J'amène encore plus de nourriture!}

{foodFrom?IO_food:
J'ai du pain de l'Ile Ouest, Brianne a insisté pour que j'en prenne autant!
~foodReceived +=1
>>ChangeMetric, gwen_opinion, 5, true
~foodFrom -=IO_food
}
{foodFrom?IMAK_food:
Quelques légumes de la part de l'IMAK. Yoann avait pas grand-chose de plus à donner.
~foodReceived +=1
>>ChangeMetric, gwen_opinion, 5, true
~foodFrom -=IMAK_food
}

>>>DEBUG
#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
{Merci beaucoup! Ca me touche énormément tout ce soutien.|Oh encore! C'est super.}
>>>DEBUG
#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
{Tu est vraiment un ange. Ca me touche beaucoup.|Merci beaucoup Adriana, je ne sais pas quoi dire!}


{foodReceived >= 2:
Avec autant de nourriture, ça devrait nous laisser le temps de nous refaire. C'est parfait.
>>ChangeMetric, treville_food, NORMAL, false
}

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
A bientôt! Prenez soin de vous ici! Et dis moi si jamais tu as besoin de quoi que ce soit.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh ne t'inquiète pas! Merci encore!

{foodReceived >= 2:
>>EndOfSequence
}
->END

==IMAK==
{foodReceived <2:->start}

=start
#knot
#4

#background: IMAK

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right
/
#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Yoann. Vous n'auriez pas un peu de nourriture à filler aux gens de Tréville?
Iels ont perdu plein de bouffe avec la tempête. J'essaie de voir si on peut les aider.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Oh merde. Je vais voir ce qu'on a. Je vais trouver quelque chose.


#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Voilà, j'ai rassemblé quelques légumes. C'est pas grand-chose mais j'espère que ça pourra les aider.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Merci. Je vais leur amener. 

~foodFrom += IMAK_food

>>EndOfSequence
->END


==IO==
{foodReceived <2:->start}

=start
#knot
#4

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
Hey. La tempête à causé des problèmes à Tréville. Vous auriez pas un peu de nourriture à leur passer? C'est la galère là bas.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Bien sûr! On viens de finir une fournée de pain, je t'en met un sac entier!

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Parfait. 

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
On avait pas autant de tempêtes aussi grosses avant. Enfin il y en avait, mais tous les dix ans. Maintenant c'est chaque été.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Allez, je leur met un sac de plus! On va pas mourir de faim ici de toutes façons.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Merci Brianne! Je leur amène tout ça.

~foodFrom += IO_food
>>ChangeMetric, brianne_opinion, 5, true
>>EndOfSequence
->END

==ERWAN==
{foodReceived <3:->start}

=start
#knot
#4

#background: ERWAN

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:erwan
#name:ERWAN
#side:erwan
/
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Salut Adriana, qu'est ce qui t'amènes?

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai été voir Gwen, et iels sont dans la galère. La tempête a détruit une bonne partie de leurs récoltes.

Tu n'aurais pas un peu de nourriture à leur donner?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Hm… Malheureusement j'ai pas grand-chose en ce moment. 
J'irais leur filer un coup de main pour réparer les dégâts.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Je pense qu'iel pourrait bien en avoir besoin. Les bâtiments du village ne sont pas en très bon état.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
D'accord, j'irais alors.

>>ChangeMetric, erwan_stress, 10, true
>>EndOfSequence
->END










