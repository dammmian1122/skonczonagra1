extends Node2D

@onready var timer: Timer = $Area2D/Timer
@onready var ray_cast_left: RayCast2D = $Area2D/RayCastLeft
@onready var ray_cast_right: RayCast2D = $Area2D/RayCastRight
@onready var animated_sprite_2d: AnimatedSprite2D = $Area2D/AnimatedSprite2D

const SPEED = 60
var direction = 1

func _process(delta: float) -> void:
	if ray_cast_right.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = false
	if ray_cast_left.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = true
	
	position.x += direction * SPEED * delta

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player":  # Sprawdź nazwę gracza lub jego typ
		print("nie zyjesz")
		var death_sound = AudioStreamPlayer.new()
		death_sound.stream = load("res://assets/spirites/sounds/death.mp3")
		add_child(death_sound)
		death_sound.play()
		timer.start()

func _on_timer_timeout() -> void:
	get_tree().reload_current_scene()
