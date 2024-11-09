extends Control

func _ready():
	get_tree().paused = false
	self.visible = false

func grajDalej():
	get_tree().paused = false
	self.visible = false  

func pause():
	get_tree().paused = true
	self.visible = true 

func esc():
	if Input.is_action_just_pressed("esc") and !get_tree().paused:
		pause()		
	elif Input.is_action_just_pressed("esc") and get_tree().paused:
		grajDalej()

func _on_graj_dalej_pressed() -> void:
	grajDalej()

func _on_restart_pressed() -> void:
	get_tree().reload_current_scene()

func _on_wyjdz_pressed() -> void:
	get_tree().quit()

func _process(delta):
	esc()


func _on_powrot_do_menu_pressed() -> void:
	get_tree().paused = false 
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
