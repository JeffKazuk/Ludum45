extends Spatial

func _ready():
    call_deferred("make_burger_brown")
func make_burger_brown():
    get_node("Burger").get_node("Cylinder").get_surface_material(0).albedo_color = Color(63/255,34/255,0/255)