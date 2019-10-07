extends Spatial
var changeScene
export var can_exit = false
# Declare member variables here. Examples:
func _ready():
	call_deferred("establish_change_scene")
	
func establish_change_scene():
	changeScene = get_tree().get_current_scene().get_node("changeScene")

func _on_interact():
	if can_exit:
		changeScene.nextLevel = "Restaurant"
		changeScene.location = "Kitchen"
		changeScene.spawnFade()