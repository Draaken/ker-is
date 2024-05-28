LIST Yoann = (default), received_wine
LIST Gwen = (default), seen_adri
LIST ErwanStress = (default), stressed, seen_gwen
LIST ErwanComing = (default), with_adri, with_yoann
VAR erwan_opinion_yoann = 0
VAR erwan_stress = 0

/start


===function DEBUG===
    ~return ">>>DEBUG YOANN_bateaux1 local metrics: Yoann:{Yoann}  / Gwen:{Gwen} / ErwanStress:{ErwanStress} / ErwanComing:{ErwanComing}" 
    
==IMAK==
{DEBUG()}
{Gwen?Gwen.seen_adri && not(Yoann?received_wine) && ErwanComing?ErwanComing.default: ->wine_not_seen_erwan}
{ErwanComing?ErwanComing.default && ErwanStress?ErwanStress.default:{->start|->stuck_not_seen_erwan}}
{ErwanComing?ErwanComing.default && ErwanStress?ErwanStress.stressed:{->stuck_erwan_wont_come1|->stuck_erwan_wont_come2}}
{ErwanComing?ErwanComing.with_adri:->back_with_erwan}


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

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Salut Adriana… On est en pleine galère…

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Qu'est-ce qu'il se passe?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
On a grave abimé le bateau… les copaines était à explorer le vieux village, au nord-est, et iels ont défoncé la coque contre un toit.

On a essayé de réparer mais c'est tendu… tu pourrais prévenir Erwan?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Euh oui, bien sûr, je vais le voir. 

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Merci. Il prend l'eau de partout. On l'a mis à terre, pour éviter les problèmes, mais on est un peu coincés ici tant qu'il est dans cet état.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Je vois. Je reviens!
->END

=wine_not_seen_erwan
#knot
#4

#background: IMAK

#characters:3

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right

#id:erwan
#name: ERWAN
#side:left
/

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
J'ai pas encore vu Erwan, mais j'ai un truc pour vous!
Des bouteilles de cidre et de jus. Ca vient de Gwen, à Tréville.

#c #yoann #speaking #smiling
/
#c #erwan #not_speaking #default
/
Oh trop bien, merci! Ca c'est cool. On va se faire une bonne soirée.

#c #yoann #not_speaking #smiling
/
#c #erwan #speaking #default
/
Je vais voir Erwan, je repasse plus tard!

~Yoann = received_wine
->END

=back_with_erwan
#knot
#4

#background: IMAK

#characters:4

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right

#id:erwan
#name:ERWAN
#side:left

#id:canette
#name:CANETTE
#side:left
/

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Erwan! Ça fait plaisir de te voir ici mec!

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
Salut Yoann. Bon il parait que vous avez un problème?

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Oui oui… tu veux pas boire un verre avant? Te poser un peu?

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
Je préfèrerais regarder les dégâts d'abord. Si ça te dérange pas.

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Non non, tranquille. C'est juste pour toi quoi…

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Enfin bref. Le bateau est juste à côté. En gros la coque est bien foutue, et le gouvernail en sale état aussi.

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
Qu'est ce que vous lui avez fait à ce bateau?

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Eh, j'y étais pas moi! Mais iels ont percuté le toit d'une baraque sous l'eau.

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Ca a fait un bruit affreux il parait. J'aurais bien entendu ça.

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
Je vais jeter un oeil.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
…
Ca va toi Adriana? Merci d'avoir ramené Erwan.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Faudrait l'aider de temps en temps. Il est souvent débordé tout seul, et vous êtes nombreux ici. 

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Il devrait venir ici, c'est con de rester tout seul…

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Bon Yoann, c'est un certain mode de vie ici. Tu sais bien que ça ne lui irait pas.
Enfin bref, à l'occasion donnez lui un coup de main. Il aide tout le monde lui.

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
J'ai regardé, et il y a pas mal de boulot. Je vais passer un moment ici.

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
T'as besoin qu'on vienne t'aider Erwan? On peut filer un coup de main.

#c #yoann #not_speaking #default
/
#c #erwan #speaking #default
/
Non ça va. Je vais m'en sortir seul, c'est pas compliqué.

#c #yoann #speaking #default
/
#c #erwan #not_speaking #default
/
Comme tu veux… Mais on est dispo si besoin.
Et puis tu pourras manger avec nous! Les gens de la bouffe font toujours des trucs trop bon.
Tu restes manger Adri?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Non, je vais repartir je pense, si Erwan n'a pas besoin que je le ramène.

#c #adriana #not_speaking #default
/
#c #erwan #speaking #default
/
Non pas de problème, quelqu'un me ramènera en bateau.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ok… A plus alors!


>>ChangeMetric, erwan_opinion_yoann, 10, true
>>ChangeMetric, erwan_stress, 20, true
>>ChangeMetric, yoann_opinion, 20, true

~ErwanComing = with_yoann
>>EndOfSequence
->END

=stuck_not_seen_erwan
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
J'ai pas encore été voir Erwan, désolée!

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah t'inquiète pas, on s'occupe bien ici. J'avais presque oublié pour le bateau!
Mais si tu préviens Erwan c'est super cool!

->END

=stuck_erwan_wont_come1
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
Mauvaise nouvelle, Erwan ne vas pas venir, en tous cas pas tout de suite.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah merde, pourquoi?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Il est débordé… enfin bref, il n'étais pas disponible.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Bon… si il peut passer à l'occasion ça serait chouette quand même.
On est coincés quoi...

{Gwen?Gwen.seen_adri && not(Yoann?received_wine): -> stuck_erwan_wont_come_wine1}
->END

=stuck_erwan_wont_come_wine1
#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Si ça peut te remonter le moral, j'ai des bouteilles pour vous.
C'est Gwen qui me les a fillées, du cidre et du jus de pomme.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah cool... merci!
~Yoann = received_wine
->END

=stuck_erwan_wont_come2
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
Je ne ramène toujours pas Erwan… 

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Bon… Ok. On va essayer de s'en occuper nous-même.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Désolé de ne pas pouvoir aider plus…
Si jamais il y a besoin que je vous ramène quoi que ce soit, dis-moi!

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
On a pas mal de stocks, on devrait se débrouiller, mais merci!

A la prochaine alors.

>>EndOfSequence
->END

=stuck_erwan_wont_come_wine2
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
Hello, Gwen m'a filé quelques bouteilles pour vous! De quoi faire passer le temps.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah trop cool, merci. Trop sympa de leur part!

~Yoann = received_wine

->END

	


==ERWAN
>>>DEBUG
{ErwanStress?ErwanStress.default && ErwanComing?ErwanComing.default: ->seen_yoann}
{Gwen?Gwen.seen_adri: ->gwen_visited}
{not(ErwanComing?ErwanComing.default):{->erwan_with_yoann|}}

=seen_yoann
#knot
#4

#background: ERWAN

#characters:3

#id:adriana
#name:ADRIANA
#side:left

#id:erwan
#name:ERWAN
#side:right

#id:canette
#name:CANETTE
#side:left
/
#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Erwan! Les gars de l'IMAK ont besoin de ton aide. Iels ont un problème avec la coque de leur bateau…

>>GetMetric, erwan_stress
>>GetMetric, erwan_opinion_yoann

{erwan_stress>40: ->seen_yoann_stressed}

{erwan_stress>20:
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
J'avais prévu autre chose mais bon… 
J'imagines que c'est urgent. Tu m'emmènes?

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Oui bien sûr, monte!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Allez viens Canette! On fait un petit tour!

#c #erwan #not_speaking #default
/
#c #canette #speaking #happy
/
Ouaf!

~ErwanComing = with_adri
->END
}

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Encore? Bon, tu m'emmènes? Ça ira plus vite.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Oui bien sûr, monte!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Allez viens Canette! On fait un petit tour!

#c #erwan #not_speaking #default
/
#c #canette #speaking #happy
/
Ouaf!

~ErwanComing = with_adri
->END

=seen_yoann_stressed
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Olala… j'en peux plus… Tout le monde à besoin de moi tout le temps!


{erwan_opinion_yoann<50:
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
C'est fini, j'ai assez donné. J'ai besoin d'une pause.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Mais comment iels vont faire? Pour leur bateau?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Et ben ils se débrouillent! Ou ils restent sur leur île pendant une semaine à jouer de la guitare!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
En tous cas je peux pas gérer ça maintenant!

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Je vois. Prend soin de toi Erwan. T'as besoin de repos.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Sans dec?
~ErwanStress = stressed
}

{erwan_opinion_yoann>49:
#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Tu veux que j'aille demander à quelqu'un d'autre?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Non mais y a personne d'autre, c'est le problème.
Mais ça va le faire. C'est pas loin. C'est ok. 

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Monte, je t'emmène en avion, ça ira plus vite.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
T'as raison. Allez viens Canette.

#c #erwan #not_speaking #default
/
#c #canette #speaking #happy
/
Ouaf!

>>EndOfSequence
}
->END

=gwen_visited
#knot
#4

#background: ERWAN

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:erwan
#name:ERWAN
#side:right
/
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Salut Adriana, tu viens de rater Gwen! Elle est passée me voir et on a mangé ensemble. 
Ca m'a fait plaisir de la voir par ici. On se croise pas si souvent.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Trop chouette!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Je vais aller à l'IMAK demain, pour leur histoire de bateau.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Tu ne veux pas que je t'emmène?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Je vais y aller moi-même, ça fait longtemps que j'ai pas navigué. Ca me fera du bien.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ok! Merci d'aller les aider Erwan. C'est cool.

~ErwanStress = seen_gwen
>>ChangeMetric, erwan_stress, 10, true
>>ChangeMetric, yoann_opinion, 5, true
>>ChangeMetric, erwan_opinion_yoann, 5, true
>>ChangeMetric, erwan_opinion, 15, true

>>EndOfSequence
->END

=erwan_with_yoann
#knot
#4

#background: ERWAN

#characters:1

#id:adriana
#name:ADRIANA
#side:left

/
#c #adriana #speaking #default
/
Erwan et Canette doivent encore être à l'IMAK...
>>EndOfSequence
->DONE

==TREVILLE==
>>>DEBUG
{ErwanStress?stressed && ErwanComing?ErwanComing.default && Gwen?Gwen.default: ->erwan_is_stressed}
{ErwanStress?stressed && ErwanComing?ErwanComing.default && Gwen?Gwen.seen_adri: ->erwan_is_stressed_seen_adri}
{ErwanComing?with_adri:->erwan_is_there}
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
Salut! Dis-moi, vous avez personne qui sait réparer les bateaux ici? Iels ont besoin d'un coup de main à l'IMAK. 

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Je ne crois pas non… Les dernières personnes qui savaient faire sont parties il y a quelque temps.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Maintenant on va surtout voir Erwan quand on a un souci.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
C'est vraiment le seul qui fait ça? C'est fou.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Et oui... Enfin, on sait faire la maintenance basique, mais pas beaucoup plus.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Prend quelques bouteilles pour Yoann et ses amis! Ca les fera patienter.
Il y a du cidre et du jus de pomme.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Merci! A la prochaine.

~Gwen = Gwen.seen_adri
->END

=erwan_is_there
#knot
#4

#background: TREVILLE

#characters:4

#id:adriana
#name:ADRIANA
#side:left

#id:gwen
#name:GWEN
#side:right

#id:erwan
#name:ERWAN
#side:left

#id:canette
#name:CANETTE
#side:left

/
#c #gwen #speaking #default
/
#c #erwan #not_speaking #default
/
Tiens, Ewan! Comment tu vas?

#c #gwen #not_speaking #default
/
#c #erwan #speaking #default
/ 
Ca va, ça va. 
Adrianna m'amène à l'IMAK... iels ont besoin d'un coup de main.

#c #canette #speaking #default
/
#c #gwen #not_speaking #default
/
Ouaf!

#c #gwen #speaking #default
/
#c #canette #not_speaking #default
/
Coucou ma belle!
Je vous laisse filer alors! Tu sais que tu peux passer quand tu veux Erwan?

#c #gwen #not_speaking #default
/
#c #erwan #speaking #default
/ 
Merci Gwen, ça me fait plaisir de t'avoir vu.

>>ChangeMetric, erwan_stress, -5, true
>>EndOfSequence
->END

=erwan_is_stressed
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
Salut! Dis-moi, vous avez personne qui sait réparer les bateaux ici? Iels ont besoin d'un coup de main à l'IMAK. 

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Je ne crois pas non… Les dernières personnes qui savaient faire sont parties il y a quelque temps.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Maintenant on va surtout voir Erwan quand on a un souci.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Le problème c'est qu'il est débordé en ce moment, il n'en peut plus Erwan. 

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh le pauvre… je vois. Je vais lui rendre visite, ça fait longtemps!

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Et prend quelques bouteilles pour Yoann et ses amis, ça les fera patienter.
Il y a du cidre et du jus de pomme!

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Merci! A la prochaine.

>>ChangeMetric, gwen_opinion, 5, true
>>ChangeMetric, erwan_stress, -20, true
~Gwen = Gwen.seen_adri
>>EndOfSequence
->END

=erwan_is_stressed_seen_adri
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
#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Bonjour Adriana! Alors, les problèmes de la bande de Yoann sont réglés?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Non iels sont toujours coincés... Erwan n'a pas l'énergie d'aller là bas.
Il est toujours à aider les gens, ça le stress beaucoup.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh le pauvre… je vois. Je vais lui rendre visite, ça fait longtemps!


#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Merci! C'est chouette de faire ça. A la prochaine.

>>ChangeMetric, gwen_opinion, 5, true
>>ChangeMetric, erwan_stress, -20, true
~Gwen = Gwen.seen_adri
>>EndOfSequence
->END
