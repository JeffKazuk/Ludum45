extends Control

# Declare member variables here. Examples:
# var a = 2
onready var black = get_node("black")
onready var timer = get_node("Timer")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	black.scale.y = ((1-timer.time_left)*3/timer.wait_time*3)
