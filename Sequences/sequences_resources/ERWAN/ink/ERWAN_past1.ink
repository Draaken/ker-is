LIST Erwan = (default), annoyed, friendly
LIST Adri = (default), solo_introspection, talked_about_erwan_being_annoyed
/start
===function DEBUG===
    ~return ">>>DEBUG ERWAN_past1 local metrics: {Erwan} / {Adri}"

==ERWAN==
{DEBUG()}

{Erwan?Erwan.default: ->start}
{Erwan?annoyed: ->end_of_annoyed}
>>>DEBUG Can not find a storylet matching the current local metrics states.

=start
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
Salut Erwan! Ca fait plaisir de te voir. Dis je me demandais, pourquoi tu vis ici, tout seul?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/

C'est chez moi ici. Enfin maintenant. Avant c'était chez ma mère. J'ai vécu en ville un moment.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
J'y ai été pour commencer des études, mais j'ai décroché.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Tu étudiais quoi?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ingénierie des matériaux. J'aimais bien résoudre des problèmes. Mais l'uni c'était vraiment compliqué. 

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
J'ai essayé de m'accrocher mais c'était pas possible. Et puis je bossais en même temps.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Enfin bref, j'ai continué à bosser, un truc miteux dans un supermarché vers la zone commerciale.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Tes parents ne t'aidaient pas?

#c #erwan #speaking #concerned
/
#c #adriana #not_speaking #default
/
Non. Ca a toujours été compliqué avec eux... Je préfère pas trop en parler.

#c #erwan #not_speaking #concerned
/
#c #adriana #speaking #default
/
Oh je suis désolée Erwan. On peut parler d'autre chose!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Hm. Oui je préfèrerais. Désolé.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Aucun soucis!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
...

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Enfin voilà, quand l'eau a commencé à monter j'étais déjà revenu ici. 
C'est un sacré coup de bol. Je sais pas si j'aurais tenu dans la ville.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
C'est vrai que vous êtes bien ici, dans l'archipel. Y a vraiment pas de quoi envier les gens coincés sur le continent.
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Hm. Je ne sais pas si j’aurais survécu, là-bas. Je ne sais vraiment pas.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
T’es balèze Erwan, je suis sûre que ça aurais été aussi !

#c #erwan #speaking #angry
/
#c #adriana #not_speaking #default
/
C’est pas la question Adriana ! Les gens solides meurent aussi ! Et puis tu ne me connaissais pas. Tu ne comprends pas.
#c #erwan #not_speaking #angry
/
#c #adriana #speaking #concerned
/
Je suis désolée Erwan. Je n’aurais pas dû dire ça.
#c #erwan #speaking #annoyed
/
#c #adriana #not_speaking #concerned
/
Je préfèrerais que tu partes Adri. J’ai besoin d’un peu de temps seul. A la prochaine.
#c #erwan #not_speaking #annoyed
/
#c #adriana #speaking #concerned
/
Je comprends. A plus. Je suis désolée.

~Erwan = Erwan.annoyed 
>>ChangeMetric, erwan_stress, 5, true
->END


=end_of_annoyed
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

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Erwan... Je voulais m'excuser pour la dernière fois. C'est ok si je reste un peu pour discuter?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ca me fait plaisir de te voir. Moi aussi je voulais m'excuser. C'était pas contre toi, j'ai du mal à gérer toute cette histoire.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Je comprend. Moi aussi j'ai du mal avec tout ça, les gens que j'ai quitté.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Si jamais tu veux en parler Adri, je suis là. J'ai du mal à m'exprimer mais je sais écouter.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/ 
Tu sais j'ai apris à poser mes limites, à dire quand ça ne va pas. Ca peut parraitre un peu rude, mais c'est le mieux pour moi. Et pour tout le monde je pense.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Parfois j'ai besoin d'être seul. C'est une des raisons pour laquelle je vis dans ce trou perdu. Mais ça veut pas dire que je ne t'apprécie pas. Je t'ai... je t'apprécie beaucoup Adri.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Enfin bref. Mon problème actuel, c'est les pucerons. Ils ont bouffé tout un champ...

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Moi l'agriculture, j'y connais rien! Et j'ai jamais eu un bon contact avec les animaux...

#c #erwan #speaking #smiling
/
#c #adriana #not_speaking #default
/
Oui enfin, je ne sais pas qui a un bon contact avec les pucerons... Pas moi en tout cas.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Allez, à la prochaine Erwan! Je suis trop contente qu'on ai pu en parler!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ciao, repasse bientôt!

~Erwan = Erwan.friendly
>>EndOfSequence
->END


==BRIANNE==
{DEBUG()}

{Erwan?annoyed && not(Adri?talked_about_erwan_being_annoyed): ->talk_about_erwan}
{Erwan?friendly && not(Adri?talked_about_erwan_being_annoyed): ->talk_about_erwan_friendly}
>>>DEBUG Can not find a storylet matching the current local metrics states.

=talk_about_erwan

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
Brianne, je peux te parler d'un truc?

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Oui bien sûr, toujours!

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai parlé avec Erwan récemment et... on s'est un peu disputé. Enfin pas tout à fait. Mais je l'ai blessé je crois. Je suis un peu perdue.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Erwan peut être sensible parfois. Il a pas eu une vie facile. Peut être que la conversation est allé un peu vite.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Oui, je crois que c'est ça. J'ai été maladroite. Mais quand même, il a réagi bizarrement. On parlait de sa famille, et ça ne lui a pas plu visiblement.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/ 
On ne vit pas tous les choses pareil Adriana. Tu caches tes émotions, ce n'est pas le cas de tout le monde.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Je sais que tu n'as pas de mauvaises intentions, alors fait attentions aux autres. Si Erwan se montre vulnérable avec toi, c'est aussi qu'il te fait confiance.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
J'éspère qu'il ne m'en veut pas... J'ai déconné...

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Il n'est pas rancunier. Il dit ce qu'il pense, mais il connais aussi ses amis. Une fois qu'il aura eu le temps de se reposer seul, il sera ravi de te revoir j'en suis sûre.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/ 
Merci Brianne! Ca m'a fait du bien de t'en parler. A la prochaine.

~Adri = talked_about_erwan_being_annoyed
>>ChangeMetric, brianne_opinion, 5, true
>>EndOfSequence
->END

=talk_about_erwan_friendly
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

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Brianne, je peux te parler d'un truc? 

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/ 
Oui bien sûr, toujours!

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai parlé avec Erwan récemment, et on s'est un peu disputé... enfin pas vraiment. Mais j'ai pas très bien géré.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/ 
Hm. Tu l'as revu depuis?

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/ 
Oui, on s'est excusé. Mais j'ai peur qu'il m'en veuille. J'ai été maladroite pendant qu'on parlais de son passé...

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/ 
C'est un sujet sensible pour lui. S'il t'en a parlé c'est qu'il te fait confiance, mais c'est vraiment pas facile pour lui.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
A mon avis, il ne t'en veux pas. Il dit ce qu'il pense franchement, mais il pardonne facilement aussi. 
Je ne suis pas à sa place, et je ne sais pas ce que tu lui a dis, mais si il te dit que c'est excusé, c'est excusé.

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Merci Brianne, tu me rassures. J'étais un peu perdue.

#c #brianne #speaking #default
/
#c #adriana #not_speaking #default
/
Pas de soucis Adriana. Mais fais attention à Erwan, va pas lui dire n'importe quoi. 



~Adri = talked_about_erwan_being_annoyed
>>ChangeMetric, brianne_opinion, 5, true
>>EndOfSequence
->END

==YOANN==
{DEBUG()}

{Erwan?annoyed && not(Adri?talked_about_erwan_being_annoyed): ->talk_about_erwan}
>>>DEBUG Can not find a storylet matching the current local metrics states.

=talk_about_erwan
#knot
#3

#background: IO

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
Yoann, je peux te parler d'un truc?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/ 
Euh oui? Bien sûr.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai parlé avec Erwan et... je crois qu'il m'en veut un peu. J'ai été maladroite et il s'est vexé.

#c #yoann #speaking #concerned
/
#c #adriana #not_speaking #default
/
Ah... Qu'est ce que t'as dit? Erwan est un peu sensible parfois. Ca arrive.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
On parlais de comment il est arrivé ici... de ses parents je crois. De sa vie quoi.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
En fait il ne s'est pas vraiment vexé, je déforme... il avais l'air vulnérable plutôt.

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Il n'hésite pas à dire ce qu'il pense aux gens, et à demander de l'espace quand il en a besoin. Pourquoi tu crois qu'il vit tout seul?

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/ 
Laisse lui un peu de temps, je suis sur qu'il ne t'en veux pas! Il est un peu solitaire le ptit mec, mais il t'aime bien je suis sûr.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Je vois. Tu me rassures, j'irais m'excuser.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/ 
Ciao Adriana!

~Adri = talked_about_erwan_being_annoyed
>>ChangeMetric, yoann_opinion, 5, true
>>EndOfSequence
->END



==ADRI_SOLO==
{DEBUG()}
{Adri?Adri.default && Erwan?annoyed: ->introspection1}
>>>DEBUG Can not find a storylet matching the current local metrics states.

=introspection1
#knot
#3

#background: SEA

#characters:1

#id:adriana
#name:ADRIANA
#side:left

/

#c #adriana #speaking #concerned
/
J'éspère qu'Erwan va bien... ça me soule qu'on se soit quittés comme ça.
Je ne comprend pas trop... j'ai l'impression qu'il s'est vexé pour rien. Enfin non, on parlais de choses qui le touchaient...
Peut être que je pourrais en parler à d'autres personnes. Il y a des gens qui le connaissent bien ici. Ca me ferait du bien d'en discuter.
~Adri = Adri.solo_introspection
->END



