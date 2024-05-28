LIST Brianne = (default), seen_adri, bored
LIST Gwen = (default), seen_adri
/start

===function DEBUG===
    ~return ">>>DEBUG BRIANNE_materiauxIO local metrics: Brianne:{Brianne}  / Gwen:{Gwen}"




==IO==
{DEBUG()}
{Brianne?Brianne.default && Gwen?Gwen.default :->start}
{Gwen?Gwen.default && Brianne?Brianne.seen_adri: {->no_delivery|}}
{Gwen?Gwen.seen_adri && Brianne>=Brianne.seen_adri:->delivery}
{Gwen?Gwen.seen_adri && Brianne?Brianne.default:->delivery_not_seen_brianne}

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
Hey Adriana. On a un problème. Hemmuca devais nous ramener des vitres de Tréville, pour les nouvelles baraques.
Phil avait pas fini de les préparer et Hemmuca devait partir… enfin bref! 
Tu pourrais passer là bas et nous les ramener? Faudra faire un peu gaffe, c'est fragile.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Ok, je vais chercher ça. Il y en a beaucoup?

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Non, non, c'est pas énorme. On a déjà reçu une partie il y a quelques semaines.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Ok, à plus tard alors!

~Brianne = Brianne.seen_adri
->END

=no_delivery
>>>DEBUG wrongway
#knot
#2

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
Salut! Tu ramènes déjà les vitres?

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Je ne suis pas encore passée à Tréville, je repasse plus tard!

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Ok. A plus tard.

->END

=delivery
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
Et voilà la livraison express, avec une cargaison presque intact!

#c #brianne #speaking #angry
/
#c #adriana #not_speaking #default
/
Adriana t'as cassé des vitres?

#c #brianne #not_speaking #angry
/
#c #adriana #speaking #smiling
/
Il y en a au moins la moitié en bon état, t'inquiète pas!

#c #brianne #speaking #angry
/
#c #adriana #not_speaking #smiling
/
Tu te fous de ma gueule?

#c #brianne #not_speaking #angry
/
#c #adriana #speaking #smiling
/
Oui. Elles vont très bien tes vitres, t'inquiète pas. J'ai bien fait attention.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #smiling
/
T'auras ma peau avec tes conneries… 
Mais merci pour la livraison. Je sais pas comment on ferait sans Phil et son atelier. Et sans toi et Hemmuca pour faire les livraisons.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Bah. Vous trouveriez un moyen. Vous avez bien des bateaux.

Au fait, j'ai vu Gwen à Tréville. Elle m'a donné une lettre pour toi.

#c #brianne #speaking #blush
/
#c #adriana #not_speaking #default
/
Oh. Merci… Je vais… je… merci Adriana.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #smiling
/
Aucun souci. Je te laisse avec ta lettre alors. A bientôt!

>>ChangeMetric, IO_building, 10, true
>>ChangeMetric, brianne_opinion, 15, true
>>ChangeMetric, brianne_gwen_flirt, 10, true
>>EndOfSequence
->END

=delivery_not_seen_brianne
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
Et voilà la livraison express, avec une cargaison presque intact!

#c #brianne #speaking #angry
/
#c #adriana #not_speaking #default
/
Adriana t'as cassé des vitres?

#c #brianne #not_speaking #angry
/
#c #adriana #speaking #smiling
/
Il y en a au moins la moitié en bon état, t'inquiète pas!

#c #brianne #speaking #angry
/
#c #adriana #not_speaking #smiling
/
Tu te fous de ma gueule?

#c #brianne #not_speaking #angry
/
#c #adriana #speaking #smiling
/
Oui. Elles vont très bien tes vitres, t'inquiète pas. J'ai bien fait attention.

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #smiling
/
T'auras ma peau avec tes conneries… 
Mais merci pour la livraison. Ca va bien nous être utile pour continuer les travaux.

#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
C'est pour les nouvelles maisons? Ca avance bien?

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Ca va à son rythme. Il y a des hauts et des bas, mais ça progresse. Phil nous aide beaucoup avec tout ce qu'il nous envoie.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Au fait, j'ai vu Gwen à Tréville. Elle m'a donné une lettre pour toi.

#c #brianne #speaking #shocked
/
#c #adriana #not_speaking #default
/
Oh. Merci… Je vais… je… merci Adriana.

#c #brianne #not_speaking #blush
/
#c #adriana #speaking #smiling
/
Aucun souci. Je te laisse avec ta lettre alors. A bientôt!

>>ChangeMetric, IO_building, 10, true
>>ChangeMetric, brianne_opinion, 15, true
>>ChangeMetric, brianne_gwen_flirt, 10, true
>>EndOfSequence
->END

==TREVILLE==
{DEBUG()}
{Brianne>=Brianne.seen_adri:->pickup}
{Brianne?Brianne.default:->start}

=pickup
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

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Salut Adriana, tu viens chercher les vitres pour l'Île Ouest? On a ça de prêt dans le coin je crois.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Oui c'est ça. Phil n'est pas là?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Non, mais il m'a montré ce qu'il fallait te donner. Voilà…, tu m'aides à les charger?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Brianne m'avais dit qu'il n'y en avait pas beaucoup, mais ça fait quand même un paquet.

#c #gwen #speaking #smiling
/
#c #adriana #not_speaking #default
/
Avec elle il faut toujours multiplier par quatre! 
D'ailleurs, tu pourras lui donner cette lettre au passage? Ca me ferait plaisir que ça soit toi qui lui donne.

#c #gwen #not_speaking #smiling
/
#c #adriana #speaking #default
/
Pas de soucis! Et je vais faire gaffe à l'atterrissage, ça serait dommage de casser les vitres.

#c #gwen #speaking #smiling
/
#c #adriana #not_speaking #default
/
Je ne doute pas que tu vas t'en sortir Adriana, personne ne pilote aussi bien que toi.

#c #gwen #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
C'est pas comme si tu connaissais beaucoup de pilotes. Mais je vais essayer d'être à la hauteur de ma réputation. 

~Gwen = Gwen.seen_adri
>>EndOfSequence
->END

=start
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

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Salut Adriana, tu viens chercher les vitres pour l'Île Ouest? On a ça de prêt dans le coin je crois.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Je n'étais pas au courant! Mais je peux les amener à l'Ile Ouest bien sûr.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Ah mince, je croyais que Phil ou Brianne t'avaient prévenu. 

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
C'est pour les nouveaux bâtiments là bas?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Et bien je ne sais pas trop... j'imagine oui? Phil est parti quelques temps et il m'a donné quelques instructions, mais je n'ai pas plus d'info.

Ah au fait ma petite Adriana! Tu peux donner cette lettre à Brianne, puisque tu vas à l'Ile Ouest?
#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Bien sûr! Je vais livrer tout ça alors, à bientôt Gwen!

~Gwen = Gwen.seen_adri
>>EndOfSequence
->END
