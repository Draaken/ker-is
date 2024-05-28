LIST Brianne = (default), received_fish
LIST Erwan = (default), received_fish
LIST Yoann = (default), received_fish
LIST Gwen = (default), gave_fish
VAR fish = 0
VAR erwan_stress = -1
VAR brianne_gwen_flirt = -1

/start

===function DEBUG===
    ~return ">>>DEBUG ERWAN_past1 local metrics: Brianne:{Brianne} / Erwan:{Erwan} / Yoann:{Yoann} / Gwen:{Gwen} / fish:{fish}"


==TREVILLE==
{DEBUG()}

{Brianne?Brianne.received_fish: ->seen_brianne}
{not (Gwen?gave_fish): ->start}


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
Salut Adriana! Ca fait toujours plaisir de te voir à Tréville. 
C'est parfait que tu sois là, je reviens de la pêche, et elle a été très bonne. 
Tu penses que ça peut intéresser des gens du coin? Je suis sûre que ça fera des heureux un peu de poisson.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Oui, je devrais trouver du monde sans trop de problèmes. 

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Super. Je te mets ça dans la soute alors.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Parfait.  A la prochaine Gwen!

~fish = 1
~Gwen = gave_fish
>>ChangeMetric, gwen_opinion, 5, true
->END



=seen_brianne
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
#c #adriana #speaking #default
/
Hello, tes poissons ont fini à l'Ile Ouest. Brianne te remercie.

{brianne_gwen_flirt <90:
#c #gwen #speaking #blushing
/
#c #adriana #not_speaking #default
/
Oh… Ce n'est rien. Mais ça me fait plaisir qu'elle… enfin que tu ai trouvé quelqu'un à qui le donner…

#c #gwen #not_speaking #blushing
/
#c #adriana #speaking #smiling
/
Pas de soucis Gwen, ça me fait plaisir de t'aider à entretenir tes bonnes amitiés…

#c #gwen #speaking #blushing
/
#c #adriana #not_speaking #smiling
/
Je… oui… Les gens là-bas sont de très bons amis. 

#c #gwen #not_speaking #blushing
/
#c #adriana #speaking #smiling
/
Je vois, je vois. A bientôt l'amoureuse!

#c #gwen #speaking #blushing
/
#c #adriana #not_speaking #smiling
/
Mais je… je ne… enfin, à bientôt.

>>ChangeMetric, brianne_gwen_flirt, 10, true
}
{brianne_gwen_flirt >89:

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
Parfait, ça me fait plaisir que tu ai vu Brianne. Elle va bien? 

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Très bien, elle a dit que ses enfants adoraient le poisson.

#c #gwen #speaking #default
/
#c #adriana #not_speaking #default
/
C'est super ça, je penserais à eux la prochaine fois que j'en ramènerais alors.

#c #gwen #not_speaking #default
/
#c #adriana #speaking #default
/
Ca leur fera plaisir, et à Brianne aussi. A la prochaine Gwen!

}

>>ChangeMetric, gwen_opinion, 5, true
>>EndOfSequence
->END


==IMAK==
{DEBUG()}
{not(Yoann?Yoann.received_fish) && fish != 0: ->A}
>>EndOfSequence

=A
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
Hey! J'ai vu Gwen, à Tréville, qui m'a filé du poisson. Ça t'intéresse?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Hm… on est pas mal à être végétariens ici.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Ah je comprends, je vais trouver quelqu'un d'autre t'inqu..

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Honnêtement ça ne se refuse pas trop, je veux bien t'en prendre quelques un.

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Mais tu viens de me dire que vous êtes végétariens?

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Pas tout le monde, et puis ils sont pêchés ces poissons. Je suis contre l'exploitation animale, mais on refuse difficilement de la nourriture…

#c #yoann #not_speaking #default
/
#c #adriana #speaking #default
/
Je vois. Tu peux en prendre quelques-uns, je donnerais le reste à quelqu’un d'autre.

#c #yoann #speaking #default
/
#c #adriana #not_speaking #default
/
Super! Tu gères meuf.

#c #yoann #speaking #disgust
/
#c #adriana #not_speaking #default
/
Beurk, je déteste toucher la viande… Et l'odeur…

#c #yoann #not_speaking #disgust
/
#c #adriana #speaking #smiling
/
Allez,  à la prochaine Yoann.

~Yoann = Yoann.received_fish
~fish -= 0.5
>>ChangeMetric, yoann_opinion, 5, true
>>EndOfSequence
->END




==ERWAN==
{DEBUG()}
{not(Erwan?Erwan.received_fish) && fish != 0: ->A}
>>EndOfSequence

=A
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
Salut Erwan. Tu vas bien?
>>GetMetric, erwan_stress
{erwan_stress > 50:
#c #erwan #speaking #annoyed
/
#c #adriana #not_speaking #default
/
Ça va… ça va… j'ai du mal à me détendre en ce moment, c'est épuisant.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #concerned
/
J'éspère que ça va aller Erwan... essaye de prendre du repos quand même.
}
{erwan_stress <51 && erwan_stress > 10:
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ça va plutôt bien en ce moment. Je suis bien occupé, mais je le vis bien.
}

{erwan_stress <11:
#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Super bien! Je me suis rarement senti aussi tranquille.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ah, ça fait plaisir à entendre! T'as l'air plus frais effectivement.
}

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Ca t'intéresse du poisson? Pêché par Gwen, c'est du local!

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Ah c'est chouette. Oui je veux bien, je mange pas souvent de poisson.
Je peux en prendre deux?

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Oui bien sur. C'est vrai que tout seul tu ne vas pas tout manger.

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
J'avais essayé de pêcher il y a un moment, mais c'est vraiment pas mon truc, j'arrivais à rien.

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
Moi j'ai jamais aimé l'idée… de pêcher. Je suis pas végétarienne mais j'arrive pas à tuer des animaux...

#c #erwan #speaking #default
/
#c #adriana #not_speaking #default
/
Je comprend.
Je vais les faire griller, ça va être super. Merci de m'avoir amené ça Adri!

#c #erwan #not_speaking #default
/
#c #adriana #speaking #default
/
De rien, profite! Je vais donner ceux qui restent à quelqu'un d'autre.

~Erwan = Erwan.received_fish
~fish -= 0.5
>>ChangeMetric, erwan_opinion, 10, true
>>ChangeMetric, erwan_stress, -10, true
>>EndOfSequence
->END

==IO==
{DEBUG()}
{fish != 0: ->A}

>>EndOfSequence

=A
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
Bonjour belle gosse, qu'est ce qui nous vaut l'honneur de ta présence cette fois?

#c #brianne #not_speaking #default
/
#c #adriana #speaking #default
/
Quel accueil. Gwen à pêché trop de poisson. Je venais voir si ça t'intéressait.

>>GetMetric, brianne_gwen_flirt

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #default
/
Rien que pour moi, je suis flattée. Du poisson pas frais, elle n'a pas changé cette grande romantique.


#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #smiling
/
Alors de un, il est très frais, et de deux, ce n'était pas particulièrement pour toi. C'est moi qui ai choisi de te l'amener.

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #smiling
/
Oh, c'est toi qui flirt à coup de poissons alors?

#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #blush
/
Je… c'est pas ce que je voulais dire..

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #blush
/
Je veux bien le prendre! Ca fera plaisir aux petites, elles adorent ça.

#c #brianne #speaking #smiling
/
#c #adriana #not_speaking #default
/
Tu remercieras Gwen de ma part!

#c #brianne #not_speaking #smiling
/
#c #adriana #speaking #default
/
Je le ferais. A la prochaine Brianne.

>>ChangeMetric, brianne_opinion, 10, true
>>ChangeMetric, brianne_gwen_flirt, 5, true
~Brianne = Brianne.received_fish

~fish -= 1
{fish<0: 
    ~fish = 0
}
>>EndOfSequence
->END

