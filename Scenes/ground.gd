extends Node2D

class_name Ground

signal bird_crashed

@export var speed = -150.0

@onready var sprite_1: Sprite2D = $Ground1/Sprite2D
@onready var sprite_2: Sprite2D = $Ground2/Sprite2D


func _ready() -> void:
	sprite_2.global_position.x = sprite_1.global_position.x + sprite_1.texture.get_width()

func _process(delta: float) -> void:
	sprite_1.global_position.x += speed * delta
	sprite_2.global_position.x += speed * delta
	
	# if sprite_1 has completely left the screen, teleport it to the right of sprite_2
	if sprite_1.global_position.x < -sprite_1.texture.get_width():
		sprite_1.global_position.x = sprite_2.global_position.x + sprite_2.texture.get_width()
	
	# if sprite_2 has completely left the screen, teleport it to the right of sprite_1
	if sprite_2.global_position.x < -sprite_2.texture.get_width():
		sprite_2.global_position.x = sprite_1.global_position.x + sprite_1.texture.get_width()


func _on_body_entered(body: Node2D) -> void:
	bird_crashed.emit()
	stop()
	(body as Bird).stop()


func stop() -> void:
	speed = 0
