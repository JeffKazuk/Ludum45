extends KinematicBody

var gravity = Vector3.DOWN * 12  # strength of gravity
export var speed = 4  # movement speed
var interactables
var interactable
var distances = []
var velocity = Vector3()
var currently_interactable
var can_interact = false
signal interact

func get_input():
    velocity.x = 0
    velocity.z = 0
    if Input.is_action_pressed("move_forward"):
        velocity.z -= speed
    if Input.is_action_pressed("move_back"):
        velocity.z += speed
    if Input.is_action_pressed("strafe_right"):
        velocity.x += speed
    if Input.is_action_pressed("strafe_left"):
        velocity.x -= speed
    if Input.is_action_pressed("interact"):
        self.connect("interact", currently_interactable, "_on_interact")
        if can_interact:
            emit_signal("interact")


func _process(delta):
    distances.clear()
    interactables = get_parent().get_node("Interactables").get_children()
    for interactable in interactable:
        distances.append(self.translation.distance_squared_to(interactable.translation))
    currently_interactable = interactables[distances.find(distances.min())]
    if distances.min() <= 2:
        can_interact = true
    

func _physics_process(delta):
    velocity += gravity * delta
    get_input()
    velocity = move_and_slide(velocity, Vector3.UP)