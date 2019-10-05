extends Spatial

var chefshack 

func _ready():
    chefshack = get_parent().get_parent()

func _on_interact():
	chefshack.currently_holding = "Stove"
	print(chefshack.currently_holding)