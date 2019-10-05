extends KinematicBody

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var gravity = Vector3.DOWN * 12
var velocity = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
    velocity += gravity * delta
    velocity = move_and_slide(velocity, Vector3.UP)