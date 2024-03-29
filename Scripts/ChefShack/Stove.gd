extends Spatial

var chefshack
signal pickup
var cooked_color = Color(float(63)/255,float(34)/255,float(0)/255)
var raw_color = Color(float(255)/255,float(83)/255,float(83)/255)
var burger = false

func _ready():
    chefshack = get_parent().get_parent()
    self.connect("pickup", chefshack, "_pickup", ["Burger_Cooked"])

func _on_interact():
	if chefshack.currently_holding == "Raw_Burger":
		chefshack.currently_holding = ""
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color = cooked_color
		$Borger.visible = true
		$Timer.start()
		get_parent().get_node("Raw_Burger").reset()
		burger = true
	elif chefshack.currently_holding == "Burger_Cooked":
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color = cooked_color
		chefshack.currently_holding = ""
		$Borger.visible = true
		burger = true
	elif $Timer.time_left == 0 && burger:
		emit_signal("pickup")
		$Borger.visible = false
		burger = false

func _process(delta):
	#print($Timer.time_left)
	if $Timer.time_left!=0:
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.r8 = ($Timer.time_left/$Timer.wait_time)*192+63
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.g8 = ($Timer.time_left/$Timer.wait_time)*49+34
		get_node("Borger").get_node("Cylinder").get_surface_material(0).albedo_color.b8 = ($Timer.time_left/$Timer.wait_time)*83
		#print(($Timer.time_left/$Timer.wait_time)*192+63)
