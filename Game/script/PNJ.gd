extends CharacterBody2D

var player
var player_in_chat_zone = false
var to_start = false

func _process(_delta):
	if Input.is_action_just_pressed("ui_accept") and player_in_chat_zone:
		to_start=true
	if to_start:
		$Dialogue.start()
		to_start=false

func _on_dialogue_body_entered(body):
	if body.has_method("player"):
		player = body
		player_in_chat_zone = true
		$sprQuest.frame = 1


func _on_dialogue_body_exited(body):
	if body.has_method("player"):
		player_in_chat_zone = false
		$sprQuest.frame = 0
		
