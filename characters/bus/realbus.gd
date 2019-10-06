extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var rot

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rot = $Timer.time_left/$Timer.wait_time * 90
	$Wheel.rotation_degrees.z = rot
	$Wheel2.rotation_degrees.z = rot
	$Wheel3.rotation_degrees.z = rot
	$Wheel4.rotation_degrees.z = rot
