extends Spatial
var changeScene
# Declare member variables here. Examples:
func _ready():
    changeScene = get_tree().get_current_scene().get_node("changeScene")

func _on_interact():
    changeScene.spawnFade("PostOffice")