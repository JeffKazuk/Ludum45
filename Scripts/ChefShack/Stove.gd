extends Spatial

var chefshack
signal pickup
var cooked_color = Color(63/255,34/255,0/255)
var raw_color = Color(255/255,83/255,83/255)

func _ready():
    chefshack = get_parent().get_parent()
    self.connect("pickup", chefshack, "_pickup", ["Burger_Cooked"])

func _on_interact():
	if chefshack.currently_holding == "Burger_Raw":
		chefshack.currently_holding = ""
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color = cooked_color
		$Borger.visible = true
		$Timer.start()
	elif $Timer.time_left == 0:
		emit_signal("pickup")
		$Borger.visible = false

func _process(delta):
	print($Timer.time_left)
	if $Timer.time_left!=0:
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.r8 = ($Timer.time_left/$Timer.wait_time)*192+63
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.g8 = ($Timer.time_left/$Timer.wait_time)*49+34
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.b8 = ($Timer.time_left/$Timer.wait_time)*83
		#print(($Timer.time_left/$Timer.wait_time)*192+63)
