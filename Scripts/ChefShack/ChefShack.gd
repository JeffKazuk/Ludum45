extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var burgers = 0

export var currently_holding = ""

func get_time_left():
	return $Timer.time_left

func get_currently_holding():
	return currently_holding
# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _pickup(item):
	currently_holding = item
	#print(currently_holding)

func burgers_made():
	burgers += 1
	if burgers == 5:
		#Win stuff
		get_node("Control/CanvasLayer/MarginContainer2/list").set_bbcode("You Win!")
		$changeScene.spawnFade()
		GlobalVars.borgers_done = true

func reset():
	get_node("Interactables/Plate").reset()
	get_node("Interactables/Bun").reset()
	get_node("Interactables/Raw_Burger").reset()
	get_node("Interactables/Ketchup").reset()
	get_node("Interactables/Tomato").reset()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	get_node("Control/CanvasLayer/MarginContainer2/list").set_bbcode("Not Fast Enough")
	$changeScene.spawnFade()
