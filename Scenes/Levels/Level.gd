extends Node2D

onready var powerMeter = $PowerMeter
onready var powerMeterBar = $PowerMeter/CanvasLayer/TextureProgress

onready var ball = $Ball
onready var ball_position = $Position2D
onready var score = $ScoreUI/Score

onready var selectPlayer = preload("res://Scenes/Sounds/SelectStreamPlayer.tscn")
onready var musicPlayer = preload("res://Scenes/Sounds/AmbienceStreamPlayer.tscn")

var on = false
export var move = false
var stroke_count = 0

func _ready():
	ball.connect("still", self, "ball_spawn")
	var musicSound = musicPlayer.instance()
	get_tree().current_scene.add_child(musicSound)
	
func get_input():
	var selectSound = selectPlayer.instance()
	if Input.is_action_pressed("Reset"):
		get_tree().reload_current_scene()
		
	if Input.is_action_just_pressed("Click"):
		get_tree().current_scene.add_child(selectSound)
		if !on:
			powerMeter.start_meter()
			on = true
			stroke_count += 1
		elif on:
			powerMeter.stop_meter()
			ball.shoot(powerMeterBar.value)
			on = false
			move = true
			score_update()
				
func _physics_process(delta):
	if !move:
		get_input()

func ball_spawn():
	ball_position.global_position = ball.global_position
	move = false
	
func score_update():
	score.text = str(stroke_count)
	
func ball_reset():
	ball.global_position = ball_position.global_position
	ball.angular_velocity = 0
	ball.linear_velocity = Vector2.ZERO
	move = false
	ball.show_sprite()
	
func _on_Boundaries_oob():
	ball_reset()


