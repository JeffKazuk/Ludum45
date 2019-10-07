extends Spatial

# Declare member variables here. Examples:
# var a = 2
var done = false
func _process(delta):
	if(GlobalVars.intro_done):
		$bus.visible = false
	if(GlobalVars.isdone()&& not done):
		done()
		done == false
	if($bus.translation.x>-15):
		$bus.translation.x = $bus.translation.x -0.06
	elif$bus.translation.x<-15:
		GlobalVars.intro_done = true
		

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func done():
	$bus.translation.x = 8.576
	$bus.visible = true