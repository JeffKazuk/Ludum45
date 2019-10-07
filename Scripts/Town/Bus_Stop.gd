extends Spatial

func _on_interact():
	if GlobalVars.isdone():
		var cs = get_parent().get_parent().get_node("changeScene")
		cs.nextLevel = "GraveYard"
		cs.location = "BusStation"
		cs.spawnFade()