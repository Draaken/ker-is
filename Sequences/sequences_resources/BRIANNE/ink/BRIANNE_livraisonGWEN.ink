LIST Adri = (default), spoke_to_brianne, gave_olive
/start
==IO==
{Adri?default: ->start}
{Adri?gave_olive:->second_visit}

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
Ah salut Adriana. Je reviens juste du chantier. On avance bien, mais c'est crevant. 
Tu venais pour quoi?

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Je pass..

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Ah mais je voulais te demander un truc! Tu peux amener ces sacs à Tréville? On vient de récolter les olives et on en a beaucoup trop. 
Je voulais en donner un peu aux amis de Tréville. Tu peux en garder pour toi aussi! 
->start_bis

=start_bis
#knot
#3

#background: IO

#characters:1

#id:adriana
#name:ADRIANA
#side:left

/
#c #adriana #speaking #default
/
Ah ok merci… 
Et elle est déjà repartie. Elle avait l'air occupée...
~Adri = spoke_to_brianne
->END

=second_visit
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
#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai vu Gwen à Tréville, je lui ai donné les olives. 

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Super, merci Adrianna. Qu'est-ce qu'on ferais sans toi.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Elle avait l'air déçue que je n'ai pas de message pour elle de ta part… 

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Ah oui? Mais j'imagine qu'elle ne t'as pas donné de message non plus?

#c #brianne #not_speaking #annoyed
/
#c #adriana #speaking #default
/
Euh… non, pas vraiment.

#c #brianne #speaking #annoyed
/
#c #adriana #not_speaking #default
/
C'est bien ce qu'il me semblait. C'est toujours à moi de prendre les devants.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Mais je ne veux pas t'impliquer dans tout ça Adri! Tu n'as pas à subir les histoires de deux vieilles dames.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #smiling
/
Je crois que je suis déjà impliquée…

>>ChangeMetric, brian_gwen_flirt, 5, true
>>ChangeMetric, brian_opinion, 10, true

>>EndOfSequence

->END

==TREVILLE==
{Adri?spoke_to_brianne:->A}
>>EndOfSequence

=A
#knot
#3

#background: TREVILLE

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:gwen
#name:GWEN
#side:right
/

#c #gwen #speaking #smiling
/
#c #adriana #not_speaking #default
/
La petite pilote est descendue du ciel. Quelle nouvelle tu nous amènes cette fois?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Pas de grandes révélation Gwen, mais j'ai quatre sacs d'olives pour le village. Tu m'aides à les décharger?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oui bien sûr. Et garde un sac, tu l'as bien mérité.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
T'as vu qui à l'Ile Ouest? C'est Brianne qui t'as donné ça?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Oui j'ai vu Brianne. Pourquoi?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Comme ça. Ça m'intéresse.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Et elle n'a rien dit à propos de moi?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Non je ne crois pas. Elle avais l'air très pressée.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Je comprend. Ce n'est pas important... Merci beaucoup Adriana! Tu reviens bientôt?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Bien sûr! Ciao!

>>ChangeMetric, gwen_opinion, 10, true
>>EndOfSequence
~Adri = gave_olive
->END

