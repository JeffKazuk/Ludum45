extends Spatial

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()

var circle_radius = 5
var score = 0
var tries = 20

var a
var r
var R
var Batter

func _ready():
	randomize()
	get_parent().get_node("changeScene").nextLevel = "Town"
	get_parent().get_node("changeScene").location = "Ballgame"
	call_deferred("get_batter")
	hit_ball()

func get_batter():
	Batter = get_tree().get_current_scene().find_node("Batter")

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
		if score >= 10:
			GlobalVars.pop_fly_done = true
			ins.file = "Boy Win PLACEHOLDER"
			add_child(ins)
		elif score < 10:
			ins.file = "Boy Lose PLACEHOLDER"
			add_child(ins)
