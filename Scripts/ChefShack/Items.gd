extends Spatial

var chefshack
var object_is_there = true
signal pickup

func _ready():
	chefshack = get_parent().get_parent()
	self.connect("pickup", chefshack, "_pickup", [get_name()])

func _on_interact():
	if object_is_there && chefshack.get_currently_holding() == "":
		$Object.visible = false
		emit_signal("pickup")
		object_is_there = false
	elif not object_is_there && chefshack.get_currently_holding() == get_name():
		reset()
		chefshack.currently_holding = ""

func reset():
	$Object.visible = true
	object_is_there = true

