LIST Adri = (default), has_letter, gave_letter

==IO==
{not(Adri?has_letter):->start}

=start
#knot
#3

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
Salut Adri! Ma pilote préférée!

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Belle gosse airlines, pour vous servir. Qu'est ce qu'il vous faudra?

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Justement, j'ai cette lettre que je voulais donner à Erwan. Tu passes avant Hemmuca, alors si tu peux la prendre ça m'arrange.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Moi tu m'écris jamais de lettres… ça m'attriste Brianne.

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #default
/
Ahah! Mais t'as fini de chouiner, je t'écrirais une lettre si tu veux!

#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #default
/
Non, c'est trop tard… mon cœur est déjà brisé…

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #default
/
Adieu Adriana.

#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
Adieu Brianne.

>>ChangeMetric, brianne_opinion, 10, true
>>EndOfSequence
~Adri = has_letter
->END

==ERWAN==

=receive_letter
#knot
#3

#background: ERWAN

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:erwan
#name:ERWAN
#side:right
/

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
C'est la factrice! J'ai du courrier pour un certain Erwan.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ah c'est toi Adriana… tu m'as fait peur. C'est de qui?

#c #erwan #not_speaking #default
/
#c #adriana #speaking #smiling
/
Mystère mystère…

#c #erwan #speaking #default
/
#c #adriana #not_speaking #smiling
/
…

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Bon ok, c'est de Brianne.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Merci beaucoup, c'est sympa de me l'avoir apportée…

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
De rien! A la prochaine Erwan.

>>ChangeMetric, erwan_opinion, 10, true
>>EndOfSequence

->END

