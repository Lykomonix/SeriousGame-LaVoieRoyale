extends Node2D

var window

func _ready():
	window = preload("res://scene/windowStart.tscn").instantiate()
	add_child(window)

func nouvellePartie():
	window.queue_free()
	window = preload("res://scene/windowPlay.tscn").instantiate()
	add_child(window)

func credits():
	window.queue_free()
	window = preload("res://scene/windowCredits.tscn").instantiate()
	add_child(window)

func Accueil():
	window.queue_free()
	window = preload("res://scene/windowStart.tscn").instantiate()
	add_child(window)
