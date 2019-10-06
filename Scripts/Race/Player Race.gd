extends AnimatedSprite3D

var left = true
signal race_start

func _ready():
    self.connect("race_start", get_parent().get_node("Runner Race"), "_race_started")

func _input(event):
    if event.is_action_pressed("strafe_left"):
        emit_signal("race_start")
        if left == true:
            translation.x -= 0.1
            left = false
    if event.is_action_pressed("strafe_right"):
        if left == false:
            translation.x -= 0.1
            left = true