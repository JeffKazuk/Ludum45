extends Spatial

var walking = false
var dialogue

func _on_button_press():
	$InterpolatedCamera.speed = 0.5
	$InterpolatedCamera.target = get_node("Interactables/HerGrave").get_path()
	walking = true
	$Player/Sprite.play()

func _process(delta):
	if walking:
		$Player.translation.x -= 0.1
		$Player/Sprite.animation = "walk side"
		dialogue = get_node("Interactables").get_node("HerGrave").get_child(0)
		if dialogue:
			dialogue.visible = false
			$CSGBox.use_collision = false