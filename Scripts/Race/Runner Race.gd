extends AnimatedSprite3D
var distance = 30
export var running = false

func _process(delta):
	if running:
		self.translation.x = -((1-$Timer.time_left/$Timer.wait_time)*distance)

func _race_started():
	if running == false:
		running = true
		$Timer.start()