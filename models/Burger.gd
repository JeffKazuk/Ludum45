extends Spatial

var material

# Called when the node enters the scene tree for the first time.
func _ready():
    material = $Cylinder.get_surface_material(0)
    material = material.duplicate()
    $Cylinder.set_surface_material(0, material)

