joueur = "tang"
nom = { "tang": "tangue", "dog": "chiens" }
adversaire = { "tang": "dog", "dog": "tang"}
curseur = { "tang": "img/titang.png", "dog": "img/tichien.png"}
boussole = ["g","c","d"]
origine = "c1"
destination = "c2"
changeJ = ->
        joueur = adversaire[joueur]
        $(".quijoue").text nom[joueur]
        $(".est, .nord, .ne, .nw").css "cursor", "url('#{curseur[joueur]}'), pointer"
        $("#dessinJ").toggleClass(adversaire[joueur]).toggleClass(joueur)

$ ->
    $(".regle, #graphe").draggable()
    vide = ->
        (not $("##{destination}").hasClass "tang") and (not $("##{destination}").hasClass "dog")
    videbis = ->
        (not $("##{origine}").hasClass "tang") and (not $("##{origine}").hasClass "dog")
    unCoup = (how,who) ->
        if how=="est"
                if ($("##{origine}").hasClass joueur) and vide()
                    $("##{origine}").removeClass joueur
                    $("##{destination}").addClass joueur
                    changeJ()
                else if videbis() and ($("##{destination}").hasClass joueur)
                    $("##{destination}").removeClass joueur
                    $("##{origine}").addClass joueur
                    changeJ()
        else
                if ($("##{origine}").hasClass joueur) and vide()
                    $("##{origine}").removeClass joueur
                    $("##{destination}").addClass joueur
                    changeJ()
                else if ($("##{destination}").hasClass joueur) and videbis() and joueur=="tang"
                    $("##{destination}").removeClass "tang"
                    $("##{origine}").addClass "tang"
                    changeJ()
    $(".nord").on 'click', ->
        origine = ""+(boussole[$(this).index()/2])+((7-$(this).parent().index())/2) 
        destination = ""+(boussole[$(this).index()/2])+((7-$(this).parent().index())/2+1) 
        unCoup("nord",joueur)
    $(".est").on 'click', ->
        origine = ""+(boussole[($(this).index()-1)/2])+((8-$(this).parent().index())/2) 
        destination = ""+(boussole[($(this).index()+1)/2])+((8-$(this).parent().index())/2)
        unCoup("est",joueur)
    $(".ne").on 'click', ->
        origine = ""+(boussole[($(this).index()-1)/2])+((7-$(this).parent().index())/2) 
        destination = ""+(boussole[($(this).index()+1)/2])+((9-$(this).parent().index())/2) 
        unCoup("ne",joueur)
    $(".nw").on 'click', ->
        origine = ""+(boussole[($(this).index()+1)/2])+((7-$(this).parent().index())/2) 
        destination = ""+(boussole[($(this).index()-1)/2])+((9-$(this).parent().index())/2) 
        unCoup("nw",joueur)
 
