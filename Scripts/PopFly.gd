extends Spatial

var circle_radius = 5
var score = 0
var tries = 20

var a
var r
var R
var Batter

func _ready():
	randomize()
	Batter = get_tree().get_current_scene().find_node("Batter")
	hit_ball()


func hit_ball():
	tries -= 1
	if Batter:
		Batter.play()
	$"Timer".start()
	a = randf()*2*PI
	r = circle_radius * sqrt(randf())
	$"Ball".translation.x = r * cos(a)
	$"Ball".translation.z = r * sin(a)
	get_node("Ball").get_node("AnimatedSprite3D").frame = 0
	get_node("Ball").get_node("AnimatedSprite3D").visible = false

func _process(delta):
	if get_node("Timer").time_left <= 1.3:
		get_node("Ball").get_node("AnimatedSprite3D").play()
		get_node("Ball").get_node("AnimatedSprite3D").visible = true


func _on_Timer_timeout():
	if $"Ball".overlaps_body(get_parent().get_node("Player")):
		score += 1
	get_node("Ball").get_node("AnimatedSprite3D").stop()
	print(score)
	if Batter:
		Batter.frame = 0
	if tries > 0:
		hit_ball()
	elif tries == 0:
		
