extends Control


func _ready() -> void:
	var finish_sound = AudioStreamPlayer.new()
	finish_sound.stream = load("res://assets/spirites/sounds/finish.mp3")  # Zmień ścieżkę na swoją
	add_child(finish_sound)
	finish_sound.play()

func _on_powrot_do_menu_pressed() -> void:
	
	get_tree().change_scene_to_file("res://scenes/menu.tscn")

func _on_wyjdz_pressed() -> void:
	get_tree().quit()
