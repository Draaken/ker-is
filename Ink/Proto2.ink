VAR panne_eoliennes_io = false
VAR chantier_io = 10
VAR connaissance_fin_chantier_io = false

//--------------------------------------------------------------------------------
// state marchines pour la eoliennes des éoliennes de l'IO
VAR adriana_eoliennes = "default"
// "default", "sait_panne", "pieces_recuperees", "pieces_livrees", "sait_reparations"

VAR erwan_eoliennes = "default"
// "default", "vu_adri", "pieces_hemmuca", "prevenu_adri"

VAR brianne_eoliennes = "default"
// "default", "vu_adri", "frustree"
//---------------------------------------------------------------------------------




->START

==START==
~panne_eoliennes_io = true
->HUB

==HUB==
    Où aller?
    
+Ile Ouest
    ->ILEOUEST
+Ile de la Langue
    ++Atelier d'Erwan
        ->ERWAN
    ++Tréville-en-Mer
        ->TREVILLE
    ++Autres îles
        ->HUB
    
+Ile Musicalement Autogérée de Kermevin
    ->IMAK
    



==ILEOUEST== //-----------------------------------------------------------------------------------

{panne_eoliennes_io: ->IO_EOLIENNES}

->IOCHANTIER

==IOCHANTIER==
    {
    - chantier_io <100:
        ->chantier_en_cours
    -  not remerciements_chantier:
        ->remerciements_chantier
    - else:
        ->default_chantier_fini
    }
    +   [Repartir.]
        ->HUB


=chantier_en_cours
 Brianne: "Salut Adriana, tout va bien?"
    Adriana: "Oui! Les travaux avancent bien?"
    Brianne: 
    <>
    {
    - chantier_io < 30: 
         "C'est le début encore, il reste beaucoup à faire!"
    - chantier_io <60:
        "La grange est finie, il ne reste plus que les maisons! Rien que ça."
    - chantier_io < 80: 
        {&"Ca avance bien, j'espère qu'on pourra finir avant les grandes tempêtes..."|"Oui, ça avance pas mal, mais il reste du boulot!}
    - else:
        "On a presque fini! J'en vois enfin le bout."
    }
    Adriana: "Bon courage!"
    +   [Repartir.]
        ->HUB

=remerciements_chantier
    Brianne: "Ca fait plaisir de te voir ici Adriana! 
    
    {connaissance_fin_chantier_io:
        Adriana: "Il parait que le chantier est fini! Bravo, c'était un gros boulot."
        Brianne: "Oui, on en a bavé. Mais c'est fait!"
    - else:
        Adriana: "Salut, alors, quoi de neuf?"
        Brianne: "On a enfin fini de construire les bâtiments! Ca fait plaisir de voir le résultat de notre travail!"
        Adriana: "Trop bien!"
        ~connaissance_fin_chantier_io = true
    }
    Brianne: "Mais d'ailleurs, merci beaucoup Adriana, on aurait pas pu faire tout ça sans toi."
    Adriana: "T'en fais trop, je suis sûre que vous vous en seriez sorti."
    Brianne: "Peut-être, mais avec beaucoup plus de galères. Je déconne pas Adri, on te dois beaucoup."
    Adriana: "Hm. Et bien de rien, j'imagine."
    -
    +   [Repartir.]
        ->HUB
  
  
=default_chantier_fini
    Adriana: "Salut Brianne! Je venais prendre des nouvelles."
    Brianne: "Hey la pilote! La vie est tranquille ici, rien de neuf. On peut enfin se reposer."
    +   [Repartir.]
        ->HUB

==IO_EOLIENNES==
{erwan_eoliennes == "pieces_hemmuca" or erwan_eoliennes == "prevenu_adri":
    ->hemmuca_livraison
}

{adriana_eoliennes == "default" or adriana_eoliennes == "sait_panne":
    {
    - brianne_eoliennes == "vu_adri": ->pas_les_pieces_deja_vu
    - else: ->pas_les_pieces_jamais_vu
    }
    
}
{adriana_eoliennes == "pieces_recuperees":
    {
    - brianne_eoliennes == "vu_adri": ->a_les_pieces_deja_vu
    - else: ->a_les_pieces_jamais_vu
    }
}


=pas_les_pieces_jamais_vu

    Brianne: "Salut Adriana, tu tombes à pic!"
    
    {adriana_eoliennes == "sait_panne":
        Adriana: "Hey, toujours là pour aider! Il parait que vous avez des petits soucis électriques."
        Brianne: "Oui... Nos éoliennes sont foutus. Tu peux aller chercher les pièces chez Erwan?"
    -else:
        ~adriana_eoliennes = "sait_panne"
        Adriana: "Hello, un souci?"
        Brianne: "Oui, avec le vent de la semaine dernière, nos éoliennes ont lachées. On aurait dû être plus prudentes. En tous cas on a pas du tout de quoi les réparer."
        Adriana: "Erwan devrait pouvoir vous aider."
        Brianne: "Oui, je l'ai contacté, il a des pièces pour nous. Tu pourrais nous les ramener? En bateau ça nous prendrait une éternité, et on a besoin que le courrant revienne vite."
    }   
    
    +["Bien sûr."]
        {erwan_eoliennes == "vu_adri": Adriana: "Bien sûr, je retourne chez Erwan."}
        {erwan_eoliennes == "default": Adriana: "Bien sûr, je pars pour la Langue tout de suite."}
    +["Je vais voir ce que je peux faire."]
        Adriana: "Je vais voir ce que je peux faire.
    -
    Brianne: "Merci! Le chantier est à l'arrêt complêt tant qu'on aura pas récupéré nos éoliennes."
    ~brianne_eoliennes = "vu_adri"
    
    
    +   [Repartir.]
        Adriana: "A bientôt Brianne!"
        ->HUB
    
    

=pas_les_pieces_deja_vu
    {pas_les_pieces_deja_vu > 1:
    ~brianne_eoliennes = "frustree"
    }
    
    Brianne: "Adriana! Tu nous ramènes le matos?"
    Adriana: "Pas vraiment... je ne suis pas encore passé voir Erwan."
    Brianne: {"Je vois. J'veux pas te brusquer, mais c'est un peu une urgence."|"Ca devient vraiment chiant Adriana, le chantier est bloqué depuis longtemps..." }
    +   [Repartir.]
        ->HUB
    

=a_les_pieces_jamais_vu
    ~adriana_eoliennes = "pieces_livrees"

    Brianne: "Adriana, tu tombes à pic! On a un gros souci depuis la tempête de la semaine dernière..."
    Adriana: "T'inquiète pas Brianne, ta sauveuse est là. J'ai tout ce qui faut dans la soute."
    Brianne: "Parfait! Vraiment parfait! Je savais bien que je pouvais faire confiance à Erwan!"
    Adriana: "Et à ta livreuse belle gosse."
    Brianne: "C'est ça, c'est ça, aide moi à les décharger plutôt."
   
    +[Décharger les pièces.]
        ->fin_livraison

=a_les_pieces_deja_vu
    ~adriana_eoliennes = "pieces_livrees"
    
    Brianne: "Parfait te revoilà! T'as les pièces?"
    Adriana: "Oui bien sûr, j'ai tout dans la soute."
    Briane: "Parfait, parfait."
    Adriana: "Ca pèse une tonne cependant, aide moi à décharger."
    Brianne: "Bien sûr. Tu ne te rend pas compte à quel point tu nous économises du temps!
    +[Décharger les pièces.]
        ->fin_livraison
    
    
    
=fin_livraison
    ~panne_eoliennes_io = false
    ~chantier_io += 10
    Brianne: "Merci Adriana, tu nous sauves. Les travaux vont pouvoir reprendre."
    Adriana: "De rien, c'est le moins que je puisse faire avec mon avion."
    Brianne: "Tu le fais, c'est tout ce qui compte. Tiens, prend ça. Je t'ai mis de l'huile d'olive, et puis du pain de ce matin."
    Adriana: "Merci beaucoup Briane."
    +   [Repartir.]
        ->HUB
        
        
        

=hemmuca_livraison
    ~panne_eoliennes_io = false
    
    {brianne_eoliennes == "vu_adri":
        {
        - erwan_eoliennes == "prevenu_adri":
            Adriana: "Salut!"
            Brianne: "Hey."
            Adriana: "Désolé, j'ai pas pu faire la livraison pour les éoliennes."
            Brianne: "Pas de soucis, le principal c'est qu'elles remarchent maintenant. Les travaux ont repris!"
            +   [Repartir.]
                ->HUB
            
        - else:
            Adriana: "Salut, je suis désolée, j'ai pas encore récupéré les pièces chez Erwan!
            Brianne: "Pas de soucis, Hemmuca viens de nous les livrer. Erwan a dû les lui donner. Enfin c'est ce que j'imagine."
            +   [Repartir.]
                ->HUB
        }
        
        
    -else:
    ->IOCHANTIER
    }
    
==ERWAN== //----------------------------------------------------------------------------------
{panne_eoliennes_io: ->ERWAN_EOLIENNES}
->default

=default
    Adriana: "Salut Erwan, quoi de neuf?"
    Erwan: "Salut Adri, je suis pas mal occupé là, repasse plus tard!"
    +   [Repartir.]
        ->HUB
    
==ERWAN_EOLIENNES==
    
    {erwan_eoliennes == "pieces_hemmuca":
        ->livraison_hemmuca
    }
    
    {erwan_eoliennes == "vu_adri" and adriana_eoliennes == "sait_panne" : 
        ->pas_les_pieces_deja_vu_erwan
    }
    
    {adriana_eoliennes == "default" or adriana_eoliennes == "sait_panne":
        - brianne_eoliennes == "vu_adri" or brianne_eoliennes == "frustree":
            ->pas_les_pieces_deja_vu_brianne
        - else:
            ->pas_les_pieces_jamais_vu_brianne
        
    }
    
    
    {adriana_eoliennes == "pieces_recuperees":
        -> a_les_pieces
    
    }
    
=pas_les_pieces_deja_vu_brianne
    ~erwan_eoliennes = "vu_adri"
    Adriana: "Yo, je reviens de l'île Ouest. Il paraît qu'iels ont besoin de matos pour leurs éoliennes."
    Erwan: "Yes, j'ai reçu leur message. J'ai préparé ça quelque part normalement..."
    ->recuperation_pieces

=livraison_hemmuca
    ~erwan_eoliennes = "prevenu_adri"
    Adriana: "Salut!"
    Erwan: "Ah, salut. Si jamais ne t'inquiète pas pour les pièces d'éoliennes, je les ai filées à Hemmuca. Iel allait vers l'île Ouest."
    +   [Repartir.]
        ->HUB

=pas_les_pieces_jamais_vu_brianne
    ~erwan_eoliennes = "vu_adri"
    ~adriana_eoliennes = "sait_panne"
    Adriana: "Yo Erwan, ça va?"
    Erwan: "Très bien très bien. J'ai un peu de mal à tout gérer en ce moment, mais ça va le faire."
    Erwan: "Au fait, j'ai reçu un message de l'île Ouest, leur faut des pièces pour leurs éoliennes. Iels en ont deux qui ont lâché cette semaine. Ça leur manque beaucoup à ce que j’ai compris."
    Adriana: "Ah merde. T'as ce qu'il faut?"
    Erwan: "Oui oui, y a plus qu'à livrer. Si ça te va bien sûr. Sinon je trouverais quelqu'un pour leur envoyer par bateau."
    ->recuperation_pieces
    
=pas_les_pieces_deja_vu_erwan
    Erwan: "Salut, tu viens chercher les pièces d'éoliennes?"
    +["Oui."]
        ~adriana_eoliennes = "pieces_recuperees"
        Adriana: "Oui."
        Erwan: "Très bien, je vais chercher ça."
        Erwan: "Ouf. Voilà, j'ai tout mis ici."
        Adriana: "Ca pèse combien tout ça? Ca a l'air lourd."
        Erwan: "Hm. Et bien. Non, trois fois rien, 300 kilos au total. Enfin pas beaucoup plus."
        Adriana: "Rien que ça."
        Adriana: "Désolé de ne pas être venu chercher ça plus tôt..."
        Erwan: "Aucun soucis. Enfin faudra voir avec l'île Ouest. Mais aucun soucis pour moi."
        Adriana: "J'y vais tout de suite. A plus Erwan, je repasserai bientôt!"
        Erwan: "Ciao, tu reviens quand tu veux!"
        ++   [Repartir.]
            ->HUB
        
    +["Pas vraiment..."]
        Adriana: "Pas vraiment..."
        ~erwan_eoliennes = "pieces_hemmuca"
        Erwan: "Qu'est ce que tu viens faire ici alors? Bon j'ai pas vraiment le temps de toutes façons. A plus Adri."
        ++   [Repartir.]
            ->HUB
        
=a_les_pieces
    Erwan: "T'as pas encore livré les pièces à l'île Ouest?"
    +   [Repartir.]
        ->HUB
=recuperation_pieces
    
    Erwan: "Ca te va de leur livrer ça?"
    
    +["Oui bien sûr."]
        ~adriana_eoliennes = "pieces_recuperees"
        Adriana: "Oui bien sûr."
        Erwan: "Ouf. Voilà, j'ai tout mis ici."
        Adriana: "Ca a l'air lourd."
        Erwan: "Hm. Et bien. Non, trois fois rien, 300 kilos au total. Enfin pas beaucoup plus."
        Adriana: "Rien que ça. Ca va être marrant à décharger."
        
    +["Je ne sais pas trop..."]
        Erwan: "Ah bon?"
        ++["Je n'ai pas trop le temps..."]
            Adriana: "Je n'ai pas vraiment le temps en ce moment..."
        ++[Je n'ai pas trop la place..."]
            Adriana: "Je transporte déjà beaucoup de trucs... je ne sais pas si j'ai vraiment la place."
        --
        Erwan: "Hm. Très bien. Tu veux repasser plus tard, ou tu préfères que je trouve un bateau pour les envoyer?"
        ++["Je vais repasser."]
            Adriana: "Je vais repasser."
            Erwan: "Hm très bien. Essaie de revenir vite, iels en ont vraiment besoin je crois."
        ++["Ca m'arangerais si tu pouvais les envoyer par bateau."]
            ~erwan_eoliennes = "pieces_hemmuca"
            ~erwan_eoliennes = "prevenu_adri"
            Adriana: "Ca m'arangerais si tu pouvais les envoyer par bateau."
            Erwan: "Très bien."
    -
    Erwan: "J’ai fait deux trois ajustements sur ton avion aussi, et je t’ai refait le plein. Tu devrais plus y faire attention Adriana. C’est précieux ces machines."
    Adriana: Merci beaucoup Erwan. Heureusement que t’es là. Ils sont chanceux de t’avoir dans le coin."
        
    +   [Repartir.]
        Erwan: "Allez à plus Adri, fait gaffe à toi."
        Adriana: "A la prochaine, ciao!"
        ->HUB
    
//-----------------------------------------------------------------------------------

==IMAK==
->HUB
==TREVILLE==
->HUB