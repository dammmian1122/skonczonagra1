extends Node

var score = 0
var wszystkie_monety = 9;

@onready var label: Label = %Label

func add_point():
	var coin_sound = AudioStreamPlayer.new()
	coin_sound.stream = load("res://assets/spirites/sounds/coin.mp3")  # Zmień ścieżkę na swoją
	add_child(coin_sound)
	coin_sound.play()
	score += 1
	print(score)
	label.text = "Monety: " + str(score)
	zakoncz_poziom()

func zakoncz_poziom():
	if score == wszystkie_monety:
		get_tree().change_scene_to_file("res://scenes/koniec_poziomu.tscn")
		
