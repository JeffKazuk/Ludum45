extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var burger = preload("res://models/Burger.tscn")
var plate = preload("res://models/PhysicsPlate.tscn")
export var currently_holding = ""

# Called when the node enters the scene tree for the first time.
func _ready():
	burger = burger.instance()
	add_child(burger)
	burger.translation = $"Interactables/Burgers".translation
	plate = plate.instance()
	add_child(plate)
	plate.translation = $"Interactables/Plates".translation
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
