extends Node2D

var prestige = 0
var inventaire = []
var argent = 0
var rng = RandomNumberGenerator.new()

func _ready():
	var ranNumber = rng.randi_range(1, 100)
	if(ranNumber <= 5):
		get_parent().gagne("Vous êtes le fils ou la fille du roi")
	elif(ranNumber <= 10):
		get_parent().perdu("Vous êtes une fille, vous ne pouvez donc pas devenir noble")
	$princesse/sprPNJ.frame = 0
	$roi/sprPNJ.frame = 1

func _process(delta):
	$HUD/prestige.value = prestige
	$HUD/lbl_argent.text = str(argent)
	if Input.is_key_pressed(KEY_A):
		get_parent().gagne()
	if Input.is_key_pressed(KEY_E):
		get_parent().perdu()

func ajouteItem(item):
	inventaire.append(item)
	print("+1 %s" % item)
	prestige += 10
	match item:
		"épée":
			$HUD/item/sprepee.frame -= 1
		"pantalon":
			$HUD/item/sprpantalon.frame -= 1
			$player.sprite = load("res://images/persoPantalon.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		"bottes":
			$HUD/item/sprbottes.frame -= 1
			$player.sprite = load("res://images/persoBottes.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		"chemise":
			$HUD/item/sprchemise.frame -= 1
			$player.sprite = load("res://images/persoChemise.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		"cape":
			$HUD/item/sprcape.frame -= 1
			$player.sprite = load("res://images/persoCape.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
		"chapeau":
			$HUD/item/sprchapeau.frame -= 1
			$player.sprite = load("res://images/persoChapeau.png")
			$HUD/item/perso/sprperso.set_texture($player.sprite)
			$player/sprPerso.set_texture($player.sprite)
	
func ajouteArgent():
	var gain = rng.randi_range(1, 10)
	print("+%d argent" % gain)
	argent += gain