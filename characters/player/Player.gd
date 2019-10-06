extends KinematicBody

var gravity = Vector3.DOWN * 12  # strength of gravity
export var speed = 4  # movement speed
export var SpawnLoc = ""
var interactables
var interactable
var distances = []
var velocity = Vector3()
var currently_interactable
var can_interact = false
signal interact

func _ready():
    
    self.translation = get_tree().get_current_scene().get_node(SpawnLoc).translation

func get_input():
    velocity.x = 0
    velocity.z = 0
    if Input.is_action_pressed("move_forward"):
        velocity.z -= speed
        $Sprite.frame = 2
    if Input.is_action_pressed("move_back"):
        velocity.z += speed
        $Sprite.frame = 0
    if Input.is_action_pressed("strafe_right"):
        velocity.x += speed
        $Sprite.frame = 3
    if Input.is_action_pressed("strafe_left"):
        velocity.x -= speed
        $Sprite.frame = 1
       
func _input(event):
    if event.is_action_pressed("interact"):
        if get_parent().find_node("Interactables"):
            for interactable in interactables:
                self.disconnect("interact", interactable, "_on_interact")
            self.connect("interact", currently_interactable, "_on_interact")
            if can_interact:
                emit_signal("interact")



func _process(delta):
    distances.clear()
    if get_parent().find_node("Interactables"):
        interactables = get_parent().find_node("Interactables").get_children()
        for interactable in interactable:
            distances.append(self.translation.distance_squared_to(interactable.translation))
        currently_interactable = interactables[distances.find(distances.min())]
        if distances.min() <= 2:
            can_interact = true
    

func _physics_process(delta):
    velocity += gravity * delta
    get_input()
    velocity = move_and_slide(velocity, Vector3.UP)