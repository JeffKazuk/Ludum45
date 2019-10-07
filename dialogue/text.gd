extends RichTextLabel

onready var top = get_parent().get_parent().get_parent().get_node("Tp")
onready var bottom = get_parent().get_parent().get_parent().get_node("Btm")
onready var cineTimer = get_parent().get_parent().get_node("cineTimer")
onready var button = get_parent().get_parent().get_node("Button")
onready var nameBox = get_parent().get_parent().get_parent().get_node("nameBox/MarginContainer/name")
var json_result = {}
var dialogues = 0;
var filepath = ""

signal done
signal hide1
signal unhide1

func _ready():
	self.connect("done",get_tree().get_current_scene().get_node("changeScene"),"spawnFade")
	filepath = get_parent().get_parent().get_parent().get_file()
	button.set_text("Next")
	parse_Json()
	print(json_result)
	set_bbcode(json_result["say"][dialogues]["says"])
	set_visible_characters(0)
	nameBox.set_bbcode(json_result["say"][dialogues]["name"])
	if(not get_tree().get_current_scene().get_node("UI")==null):
		get_tree().get_current_scene().get_node("UI").hide()



func _process(delta):
	top.scale.x = (cineTimer.time_left/cineTimer.wait_time -1)
	bottom.scale.x = (1-cineTimer.time_left/cineTimer.wait_time)

func parse_Json():
	var file = File.new()
	file.open(filepath, file.READ)
	var json = file.get_as_text()
	json_result = JSON.parse(json).result
	file.close()

func _on_TextTimer_timeout():
	set_visible_characters(get_visible_characters()+1)


func _on_Button_pressed():
	dialogues +=1
	
	if (dialogues<=json_result["say"].size()-1):
		set_bbcode(json_result["say"][dialogues]["says"])
		nameBox.set_bbcode(json_result["say"][dialogues]["name"])
		set_visible_characters(0)
	if(dialogues==json_result["say"].size()-1):
		button.set_text("Continue")
	
	if (dialogues>json_result["say"].size()-1):
		dialogueDone()
		if(not get_tree().get_current_scene().get_node("Town/UI")==null):
			get_tree().get_current_scene().get_node("Town/UI").unhide()


func dialogueDone():
	emit_signal("done")
	queue_free()


