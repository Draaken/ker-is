LIST Erwan = (default), seen_adri, canette_came_back
LIST Gwen = (default), seen_adri
/start

===function DEBUG===
    ~return ">>>DEBUG ERWAN_animal local metrics: Erwan:{Erwan}  / Gwen:{Gwen}"

==ERWAN==
{Erwan?Erwan.default:->start}
{Erwan?Erwan.seen_adri:->erwan_is_away}

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
#side:right
/

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Salut Erwan! Comment ça va?

#c #erwan #speaking #concerned
/
#c #adriana #not_speaking #default
/
Cannette à disparu… C'est terrible! Je sais pas quoi faire…

#c #erwan #not_speaking #concerned
/
#c #adriana #speaking #concerned
/
Oh non! Elle va sûrement revenir bientôt! Elle ne part jamais toute seule?

#c #erwan #speaking #concerned
/
#c #adriana #not_speaking #concerned
/
Elle reste tout le temps avec moi… c'est un bébé encore. Enfin elle fait des petites ballades, mais elle reviens vite d'habitude.

#c #erwan #not_speaking #concerned
/
#c #adriana #speaking #default
/
Bon, elle a juste dû partir un petit peu plus loin cette fois, je suis sûre qu'elle va revenir vite!

#c #erwan #speaking #concerned
/
#c #adriana #not_speaking #default
/
J'espère… La pauvre, toute seule dans la nature… J'ai essayé de l'appeler partout, mais rien.

#c #erwan #not_speaking #concerned
/
#c #adriana #speaking #default
/
Elle ne peut pas aller très loin de toutes façons. C'est pas comme si elle allait croiser un crocodile dans la région non plus.

#c #erwan #speaking #concerned
/
#c #adriana #not_speaking #default
/
Tu as raison… je vais me préparer pour faire le tour de l'île, pour voir si je peux la retrouver…

#c #erwan #not_speaking #concerned
/
#c #adriana #speaking #default
/
Je suis sûre qu'elle va bien Erwan! Je vais regarder depuis là haut si je ne la vois pas.

~Erwan = Erwan.seen_adri
>>ChangeMetric, erwan_stress, 20, true
->END


=erwan_is_away
#knot
#4

#background: ERWAN

#characters:1

#id:adriana
#name:ADRIANA
#side:left
/

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Erwan n'est pas dans le coin… il a dû partir chercher Canette. 
J'espère qu'il va la retrouver…
->canette_is_back_hiden

=canette_is_back_hiden
#knot
#4

#background: ERWAN

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:canette
#name:?
#side:right
/

#c #canette #speaking #empty
/
#c #adriana #not_speaking #default
/
Aouhhh…

#c #canette #not_speaking #empty
/
#c #adriana #speaking #default
/
Canette??
->canette_is_back


=canette_is_back
#knot
#4

#background: ERWAN

#characters:2

#id:adriana
#name:ADRIANA
#side:left

#id:canette
#name:CANETTE
#side:right
/

#c #canette #speaking #default
/
#c #adriana #not_speaking #default
/
Ouaf ouaf!

#c #canette #not_speaking #default
/
#c #adriana #speaking #default
/
Canette! T'étais où bella? Erwan te cherchais partout!

#c #canette #speaking #happy
/
#c #adriana #not_speaking #default
/
Ouaf!

#c #canette #not_speaking #default
/
#c #adriana #speaking #default
/
Et Erwan qui fait le tour de l'île pendant que tu l'attends ici!

#c #canette #speaking #default
/
#c #adriana #not_speaking #default
/
Ouaf ouaf…

#c #canette #not_speaking #default
/
#c #adriana #speaking #default
/
Il devrais revenir bientôt, on peut l'attendre ici!


->erwan_is_back

=erwan_is_back
#knot
#4

#background: ERWAN

#characters:3

#id:adriana
#name:ADRIANA
#side:left

#id:canette
#name:CANETTE
#side:left

#id:erwan
#name:ERWAN
#side:right
/

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ah Adrianna... Tu parles toute seule?

#c #erwan #not_speaking #default
/
#c #canette #speaking #happy
/
Ouaf ouaf ouaf!

#c #erwan #speaking #smiling
/
#c #canette #not_speaking #happy
/
CANETTE! Viens ici ma grande!

Ca me plaisir de te revoir! Tu m'as manqué!

#c #erwan #not_speaking #smiling
/
#c #canette #speaking #happy
/
Ouaf ouaf!

#c #erwan #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
Je l'ai trouvée ici, elle t'atendais!

#c #erwan #speaking #smiling
/
#c #canette #not_speaking #happy
/
Tu es rentrée à la maison tout seule! T'es une fille super maligne!

#c #erwan #not_speaking #smiling
/
#c #canette #speaking #happy
/
Ouaf!

#c #erwan #not_speaking #smiling
/
#c #adriana #speaking #smiling
/

Bon, je vais vous laisser à vos retrouvailles!

#c #erwan #not_speaking #smiling
/
#c #canette #speaking #happy
/
Ouaf ouaf!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Merci beaucoup Adrianna! Ca m'a fait du bien que tu sois là pour aider.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Pas de soucis, je suis contente qu'elle soit revenue!

>>ChangeMetric, erwan_opinion, 15, true
~Erwan = canette_came_back
>>EndOfSequence
->END



==TREVILLE==
{DEBUG()}
{Erwan?Erwan.seen_adri:{->canette_is_missing|}}
{Erwan?canette_came_back && Gwen?Gwen.seen_adri:->canette_is_back}

=canette_is_missing
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
Salut ma petite Adriana, qu'est ce qui t'amène dans le coin?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Tu n'aurais pas vu Canette? Le chien d'Erwan?

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Oh, non. Tu penses qu'il aurait pu traverser jusqu'ici?

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Hm… je ne pense pas vraiment, mais je me suis dis que ça ne coûtait rien de venir vous voir. 

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Le pauvre Erwan doit être dans tous ses états… déjà qu'il passe son temps à se faire du soucis. Pauvre petit gars.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Il est en train de la chercher. J'essaie de l'aider comme je peux mais je n'ai rien vu depuis le ciel.
#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Bon courage à vous deux, j'irais le voir si jamais j'apperçois Canette dans le coin!

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Merci Gwen!
~Gwen = Gwen.seen_adri
->END


=canette_is_back
#knot
#2

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
#c #adriana #speaking #smiling
/
Canette est revenue! Elle n'avait pas dû aller très loin. Elle est rentrée à la maison dès qu'Erwan est parti. 

#c #gwen #speaking #smiling
/
#c #adriana #not_speaking #smiling
/
Ah, quelle bonne nouvelle! Ça me fait plaisir, je me faisais du soucis pour ces deux là.

#c #gwen #not_speaking #smiling
/
#c #adriana #speaking #default
/
C'était chouette de les voir tous les deux réunis, Canette est adorable.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Elle est toute mignonne oui. Merci de m'avoir tenu au courant.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Ciao Gwen!

>>EndOfSequence
->END

