extends Node2D

class_name PipePair

signal bird_entered
signal point_scored

var speed = 0

func set_speed(new_speed) -> void:
	speed = new_speed

func _process(delta: float) -> void:
	position.x += speed * delta

func _on_body_entered(body) -> void:
	bird_entered.emit()

func _on_point_scored(body) -> void:
	point_scored.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
