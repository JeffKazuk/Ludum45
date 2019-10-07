extends Spatial

var borgor = ["Plate", "Bun", "Burger_Cooked", "Tomato", "Ketchup"]
var burger_step = 0
var holding = ""
var real_burger_hours

func _ready():
	call_deferred("make_burger_brown")
	real_burger_hours = borgor.duplicate()
	
func make_burger_brown():
	get_node("Burger").get_node("Cylinder").get_surface_material(0).albedo_color = Color(63/255,34/255,0/255)
	
func _on_interact():
	holding = get_tree().get_current_scene().get_currently_holding()
	if real_burger_hours[burger_step] == holding:
		get_tree().get_current_scene().currently_holding = ""
		burger_step += 1
		
	if burger_step == 1:
		$Plate.visible = true
	if burger_step == 2:
		$Bun.visible = true
	if burger_step == 3:
		$Burger.visible = true
	if burger_step == 4:
		$Tomat.visible = true
		
	if burger_step == 5:
		real_burger_hours = borgor.duplicate()
		burger_step = 0
		$Plate.visible = false
		$Bun.visible = false
		$Tomat.visible = false
		$Burger.visible = false
		get_tree().get_current_scene().get_node("Control").burger_made()
		get_tree().get_current_scene().burgers_made()
		get_tree().get_current_scene().reset()