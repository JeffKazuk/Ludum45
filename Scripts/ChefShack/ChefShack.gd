extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var currently_holding = ""

func get_time_left():
	return $Timer.time_left()

func get_currently_holding():
	return currently_holding
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _pickup(item):
	currently_holding = item
	#print(currently_holding)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
