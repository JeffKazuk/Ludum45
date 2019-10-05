extends AnimatedSprite3D

var left = true

func _input(event):
    if event.is_action_pressed("strafe_left"):
        if left == true:
            translation.x += 0.1
            left = false
    if event.is_action_pressed("strafe_right"):
        if left == false:
            translation.x += 0.1
            left = true