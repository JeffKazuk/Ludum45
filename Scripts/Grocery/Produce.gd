extends Spatial

func _on_interact():
	get_parent().get_parent().currently_holding = get_name()