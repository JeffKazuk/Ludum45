extends AnimatedSprite3D
var finish = -26
var finished = false
export var running = false

func _process(delta):
	if running:
		self.translation.x = ($Timer.time_left/$Timer.wait_time)*49.29-26
	if self.translation.x <= -26:
		animation = "waiting"
		finished = true
		running = false

func _race_started():
	animation = "running"
	running = true
	$Timer.start()