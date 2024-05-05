LIST Yoann = (default), gave_tape, knows_erwan_is_repairing, received_tape_player, bored
LIST Erwan = (default), received_tape, gave_tape_player
LIST Adri = (default), knows_house, visited_house, talked_house_with_yoann

===function DEBUG===
    ~return ">>>DEBUG Cassettes 1 local metrics: {Yoann} / {Erwan} / {Adri}"
==IMAK==

{DEBUG()}

{Yoann?Yoann.default && Erwan?Erwan.default && Adri?Adri.default: ->start}
{Yoann?Yoann.default && Erwan?Erwan.default && Adri?visited_house: ->visited_house_start}

{Yoann?gave_tape && Erwan?Erwan.default && not (Adri?visited_house): ->not_visited_house_not_seen_erwan} //repasser voir Yoann avant de voir Erwan, sans avoir vu la maison

{Yoann?gave_tape && Adri?visited_house && Erwan?Erwan.default: ->visited_house_not_seen_erwan}  
{Yoann?gave_tape && Adri?visited_house && Erwan?received_tape && not(Yoann?knows_erwan_is_repairing): ->visited_house_seen_erwan}   


{Erwan.received_tape && not(Yoann?knows_erwan_is_repairing): ->seen_erwan} //parler à Yoann pendant qu'Erwan répare le lecteur

{not(Yoann?received_tape_player) && Erwan.gave_tape_player:->erwan_gave_tape_player}
//amener le lecteur cassette à Yoann ->fin de la séquence pour Yoann

{Adri?visited_house:->visited_house_default}

>>>DEBUG Can not find a storylet matching the current local metrics states.




=start
#knot
#3

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
Hey Adriana! Ca fait plaisir de te voir dans le coin. Faut que je te montre un truc. 
On a fouillé une vieille baraque abandonnée avec les copaines, on a trouvé des trucs incroyables dans la cave.
Le type était un gros fan de musique, il y avait du matos partout! 
Des bon trucs hein, on a récupéré plein d'instruments. Bon la cave était dans un salle état, ça avait bien pris l'eau.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #suspicious
/
Mais vous pillez des maisons comme ça? Ils sont passés où les habitants?

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #suspicious
/
T'inquiète, ça fait un moment qu'ils se sont barrés les proprios. C'était sûrement leur maison de vacances d'ailleurs, tu verrais la baraque. 
Les types ont du voir l'eau monter, et on décidé de plus jamais foutre les pieds ici.
Mais tout a déjà été vidé depuis bien longtemps. Enfin à part la cave, elle avait échappé aux derniers visiteurs visiblement.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Hm, j'imagine que ça ne profite à personne si ça prend l'eau dans une maison abandonnée. Qu'est ce que tu voulais me montrer?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Avec le matos de musique il y avait de l'électronique, des cassettes, des trucs comme ça... j'ai essayé de jeter un oeil mais je comprends rien.
Tu voudrais pas amener ça à Erwan pour voir si ça l'intéresse?
#c #yoann #not_speaking #default
/
#c #adriana #speaking #concerned
/
Oui bien sûr, je lui donnerai quand je passerai le voir. 
Tu peux me montrer où elle est cette maison? J'irais bien faire un tour, ça m'intrigue.
#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Euh ouais, pas de problème. Je te le mets sur ta carte... attend voir...
Voilà, c'était dans le coin. Fais attention à toi, c'est un peu en bordel là bas, il y a des vitres pétées, des trucs effondrés.

>>UpdateMap, VillaLocation, Add
~Adri = knows_house
~Yoann = gave_tape

->END

=visited_house_start
#knot
#3

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
Salut Adri, qu'est ce qui t'amène?


#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai visité une villa abandonné vers l'ouest, sur les collines. T'as déjà mis les pieds là bas?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah oui dans la forêt là, on y a été y a pas longtemps avec les copaines! T'as trouvé des choses?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai ramassé une vieille cassette, une histoire de surf ou quelque chose du genre. Mais sinon tout était surtout en train de pourir.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ah ouais, nous on a trouvé la cave, qu'était pas en si mauvais état. Il y avais plein de matos de musique. Les proprios devaient vivre la belle vie là bas.
Mais ça fait des années qu'elle a été pillée cette maison. C'était une résidence secondaire de toute façon, les types sont juste jamais revenus quand l'eau a commencé à monter.
    
#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Je me demande ce qu'ils sont devenus quand même... Les anciens proprios je veux dire.

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Bah. Ils ont sûrement racheté une autre baraque sur une coline plus haute. T'inquiète pas pour eux meuf.

#c #yoann #not_speaking #smiling
/
#c #adriana #speaking #default
/
Hm. Bon, et alors, t'as trouvé des choses intéressantes là bas?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Ouais, il devait avoir un musicos dans la famille, parce qu'il y avais du matos partout. Des instruments, des posters, et beaucoup de cassettes. Mais bon, une bonne parti avais pris l'eau. 
Et puis y avais tout ce bordel électronique aussi, pour enregistrer des cassettes je pense. Maintenant que j'y pense, peut être que ça intéresserait Erwan. 
Ca ce trouve il pourrait même refaire fonctionner des trucs. Moi j'ai essayé de jeter un oeil mais je comprend rien. Tu pourrais lui amener?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #concerned
/
Oui oui bien sûr, je lui donnerais la prochaine fois que je le verrai. A plus Yoann!

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Trop bien, ciao Adri!
~Adri = talked_house_with_yoann
~Yoann = gave_tape
->END


=not_visited_house_not_seen_erwan
>>>DEBUG ignore this smh
{not_visited_house_not_seen_erwan>2: 
    ->not_visited_house_not_seen_erwan2
-else: 
    ->not_visited_house_not_seen_erwan1
}

=not_visited_house_not_seen_erwan1
#knot
#2

#background: IMAK

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right
/

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Hello Adri, t'as des nouvelles des cassettes?

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Non je ne suis pas passé voir Erwan encore, désolé, je reviens te voir quand je lui aurais montré!

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Yes pas de problème, il y a rien d'urgent de toutes façons. Ciao Adri!
->END

=not_visited_house_not_seen_erwan2
#knot
#1

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
Salut Yoann, j'ai pas eu le temps de passer voir Erwan, mais je repasse te voir quand ça sera fait!

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Pas de problèmes! Prend ton temps. A plus Adri.
->END


=visited_house_not_seen_erwan
#knot
#3

#background: IMAK

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right

/
->adri_visited_house->

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
J'ai pas encore amené le matériel pour cassettes à Erwan, je te tiens au courant quand je lui aurais montré.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Pas de soucis! Prend ton temps Adri.
~Adri = talked_house_with_yoann
->END

=visited_house_seen_erwan
#knot
#3

#background: IMAK

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right
/


->adri_visited_house->
#c #yoann #not_speaking #default
/
#c #adriana #speaking #smiling
/
Sinon, j'ai montré le matos de cassettes à Erwan! Il était hyper content. Il va essayer de voir s'il peut réparer des choses. Je repasserais te voir si j'ai des nouvelles.

#c #yoann #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
Ah trop cool, je m'écouterais bien des cassettes. Il doit avoir plein de trésors planqués. Tiens moi au courrant!
~Adri = talked_house_with_yoann
~Yoann = knows_erwan_is_repairing

->END

=visited_house_default
#knot
#3

#background: IMAK

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:yoann
#name:YOANN
#side:right
/


->adri_visited_house->
#c #yoann #speaking #default
/
#c #adriana #not_speaking #smiling
/
Te fais pas trop de soucis Adri! Allez, à la prochaine.
~Adri = talked_house_with_yoann
->END

=adri_visited_house
#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Hello belle gosse! Comment ça va?

#c #yoann #not_speaking #smiling
/
#c #adriana #speaking #default
/
Salut Yoann. Je suis allez faire un tour dans la villa. C'est dans un sale état. Ca fait longtemps que c'est comme ça?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Honnêtement je ne sais pas si quelqu'un a déjà vu les proprios. Mais avant le déluge elle était entretenue oui. Depuis elle tombe en ruine lentement. 
Et puis les gens se sont servis, entre les meubles et le matos de jardinage, il y avais tout un tas de trucs utiles.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Je vois. Tant mieux si ça sert à des gens. Je vais pas défendre les maisons vides non plus. Ca me fait juste bizarre de penser à tous ces gens qui ont disparu.
->->

=seen_erwan
#knot
#3

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
Hello Yoann, j'ai montré ce que t'avais trouvé dans la villa à Erwan, il était hyper intéressé. Il pense pouvoir réparer des trucs.

#c #yoann #speaking #excited
/
#c #adriana #not_speaking #default
/
Trop bien. Ca se trouve on pourra écouter des cassettes. Ca serait vraiment stylé. La quantité de musique qu'il y a à redécouvrir... Ca serait vraiment cool.
~Yoann = knows_erwan_is_repairing
->END
=erwan_gave_tape_player
#knot
#3

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
#c #adriana #speaking #smiling
/
Hey! J'ai quelque chose pour toi. Erwan a réussi à réparer une des machines que vous aviez récupéré! Tu peux écouter des cassettes avec ça! Bon... pour l'instant on a pas grand chose à écouter, mais vous devriez réussir à en récupérer d'autres. 

#c #yoann #speaking #excited
/
#c #adriana #not_speaking #smiling
/
Trop bien! Merci de ouf Adri, tu pourras remercier Erwan pour moi? Quel génie ce type, c'est incroyable. Trop trop cool.

#c #yoann #not_speaking #smiling
/
#c #adriana #speaking #default
/
Il est trop fort. Il a dit qu'il allait voir si il pouvait réparer d'autres lecteurs de cassettes.

#c #yoann #speaking #smiling
/
#c #adriana #not_speaking #default
/
Ok trop cool, encore merci pour avoir fait les livraisons! A la prochaine Adri.

>>ChangeMetric, magneto_tech, AUDIO, false
>>ChangeMetric, yoann_opinion, 10, true
>>EndOfSequence
->END

==ERWAN==

{DEBUG()}

{Yoann?Yoann.default && Erwan?Erwan.default: ->seen_house_not_seen_yoann}
{Yoann?Yoann.gave_tape && Erwan?Erwan.default: ->yoann_gave_tape} //première fois qu'on voit Erwan
{Yoann?Yoann.gave_tape && Erwan?Erwan.received_tape: ->give_tape_player} //on reviens: Erwan donne le lecteur cassettes
//{not (Yoann?Yoann.received_tape_player) && Erwan?Erwan.gave_tape_player: ->tape_player_received_not_given} //on reviens voir Erwan sans avoir donné le lecteur à Yoann
{Yoann?Yoann.received_tape_player && Erwan?Erwan.gave_tape_player:->tape_player_given}//on reviens voir Erwan après avoir donné le lecteur: fin de séquence pour Erwan


=seen_house_not_seen_yoann
#knot
#2

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
Salut Erwan, t'as déjà été dans la grande villa sur les collines, à l'ouest?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Non, je vais pas trop dans ce coin là, c'est un peu loin. Mais je sais que les gens de l'IMAK font souvent le tour des maisons abandonnés. Iels connaissent peut être celle là.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ok, merci Erwan. J'en parlerais à Yoann à l'occasion.
->END

=yoann_gave_tape
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
Yo Erwan. J'ai vu Yoann, il voulait te passer ça. C'est du matos de musique, ou quelque chose du genre. Ca te parle?


#c #erwan #speaking #excited
/
#c #adriana #not_speaking #default
/
Oh wow, c'est génial. Ca fait longtemps que j'avais pas vu ce genre d'équipement. Ca m'intéresse carrément. Ca à l'air en sale état, mais je devrais pouvoir en tirer quelque chose!
{Adri>visited_house:
#c #erwan #not_speaking #excited
/
#c #adriana #speaking #default
/
J'ai été voir la maison où iels ont trouvé ça, ça m'étonne pas que le matos soit abimé. L'endroit est en ruine et il y a de l'eau partout. J'espère que tu trouveras des choses intéressantes quand même.

-else:
#c #erwan #not_speaking #excited
/
#c #adriana #speaking #default
/
Oui, je ne suis pas sur d'où iels ont choppé ça, mais ça a bien pris l'eau. J'espère que t'arriveras à récupérer deux trois trucs quand même.
}

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Je vais jeter un oeil et je te dirais si j'arrive à bricoler quelque chose avec ce qui fonctionne encore.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ok, je repasserais plus tard. Ciao Erwan, prend soin de toi!

~Erwan = received_tape
->END

=give_tape_player
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

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ah Adri, parfait. J'ai pris le temps de fouiller dans les trucs de Yoann, et il y a du beau matos. J'ai pu remettre sur pied un lecteur cassettes. On peut seulement écouter des cassettes audio, mais ça devrais plaire à Yoann.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ca fait un bail que j'ai pas écouté de cassettes... T'as trouvé des trucs bien? T'écoutais quoi avant toi?

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Hmm, plein de trucs différents, mais surtout des choses chills. Là j'ai trouvé 47 cassettes d'un concert de The Raging Things. C'est pas vraiment mon truc mais qui sait, on trouveras peut être un fan.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #smiling
/
Ah oui je vois, intense. Je vais amener ça à Yoann, on verra si ça l'intéresse.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ciao! Repasse quand tu veux. Je vais voir si je peux réparer d'autres trucs.
>>ChangeMetric, cassettes,THE_RAGING_THINGS_1,true
>>ChangeMetric, erwan_opinion, 5, true
~Erwan = gave_tape_player
->END

=tape_player_received_not_given
#knot
#1

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
Salut Adriana!
->END

=tape_player_given
#knot
#2

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
Hey Erwan, j'ai donné le lecteur cassettes à Yoann, ça lui a bien fait plaisir. Il te remercie.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Trop cool. Je manque de matos pour réparer les autres lecteurs, mais peut être que plus tard ça pourra se faire. 
>>EndOfSequence
->END

==ABANDONNED_VILLA==
{Adri?Adri.default: ->dont_know_house}
{Adri?Adri.knows_house: ->do_knows_house}
->default_knot

=dont_know_house
#knot
#3

#background: abandonned_house

#characters:1

#id:adriana
#name:ADRIANA
#side:left

/

#c #adriana #speaking #default
/
Hey! Il y a quelqu'un?
C'est immense comme maison... Et ça a été abandonné il y a un moment.
Une cassette? J'ai pas vu ce genre de truc depuis longtemps.
"Compilation Surf & Bass". Ca me dit rien, on dirait qu'elle est faite maison.

>>ChangeMetric, cassettes,SURF_AND_BASS,true
~Adri = visited_house
->END
=do_knows_house
#knot
#3

#background: abandonned_house

#characters:1
#id:adriana
#name:ADRIANA
#side:left
/

#c #adriana #speaking #default
/
Ca doit être la villa dont parlais Yoann. C'est immense.
Hey! Il y a quelqu'un? 
Effectivement, personne n'a vécu là depuis un moment, c'est complètement en ruines.
Une cassette? J'ai pas vu ce genre de truc depuis longtemps.
"Compilation Surf & Bass". Aucune idée de ce que ça veut dire. Ca intéressera peut être Yoann.


>>ChangeMetric, cassettes,SURF_AND_BASS,true
~Adri = visited_house
->END

=default_knot


#knot
#1

#background: abandonned_house

#characters:1
#id:adriana
#name:ADRIANA
#side:left
/

#c #adriana #speaking #default
/
Rien n'a vraiment changé depuis ma dernière visite... Quelle ambiance étrange.
->END