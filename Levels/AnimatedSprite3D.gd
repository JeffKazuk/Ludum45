extends AnimatedSprite3D

# Declare member variables here. Examples:
# var a = 2
var once = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		if(translation.z>=0):
			translation.z -= 0.06
			play()
		else:
			play("default")


		