extends Spatial
var changeScene
# Declare member variables here. Examples:
func _ready():
	call_deferred("establish_change_scene")
	
func establish_change_scene():
	changeScene = get_tree().get_current_scene().get_node("changeScene")

func _on_interact():
	changeScene.nextLevel = "GroceryStore"
	changeScene.location = "Town"
	changeScene.spawnFade()