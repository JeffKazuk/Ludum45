extends Spatial

var road = preload("res://TestRoad.tscn")
var newestcopy
var oldcopy
var delcopy
var speed = 0.2
# Called when the node enters the scene tree for the first time.
func _ready():
	newestcopy = road.instance()
	oldcopy = road.instance()
	add_child(oldcopy)
	oldcopy.translation.y = 100
	add_child(newestcopy)

func _process(delta):
	newestcopy.translation.z += speed
	oldcopy.translation.z += speed
	if newestcopy.translation.z > -5:
		#delcopy = oldcopy
		oldcopy.queue_free()
		oldcopy = newestcopy
		newestcopy = road.instance()
		add_child(newestcopy)
		newestcopy.translation.z = -20
		