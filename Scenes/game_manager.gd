extends Node

@onready var bird: Bird = $"../Bird"
@onready var ground: Ground = $"../Ground"
@onready var pipe_spawner: PipeSpawner = $"../PipeSpawner"
@onready var fade: Fade = $"../Fade"
@onready var ui: CanvasLayer = $"../UI"

var points = 0

func _ready() -> void:
	bird.game_started.connect(on_game_started)
	ground.bird_crashed.connect(end_game)
	pipe_spawner.bird_crashed.connect(end_game)
	pipe_spawner.point_scored.connect(on_point_scored)

func on_game_started() -> void:
	pipe_spawner.start_spawning_pipes()

func end_game() -> void:
	if fade != null:
		fade.play()
	bird.kill()
	ground.stop()
	pipe_spawner.stop()
	ui.on_game_over()

func on_point_scored() -> void:
	points += 1
	ui.update_points(points)
