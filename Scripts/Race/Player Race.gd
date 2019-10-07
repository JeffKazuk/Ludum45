extends AnimatedSprite3D

var dialogue = preload("res://dialogue/Dialogue.tscn")
var ins = dialogue.instance()

var started = false
var left = true
signal race_start
var run_frame = 0
var runner
var result = ""
var finished = false

func _ready():
    runner = get_parent().get_node("Runner Race")
    self.connect("race_start", runner, "_race_started")
    GlobalVars.race_attempted = true

func _process(delta):

    if runner.finished:
        if not result:
            result = "loss"

    if self.translation.x <= -26:
        finished = true
        animation = "waiting"
        if not result:
            result = "won"
        if runner.finished:
            if result == "won":
                GlobalVars.race_done = true
                ins.file = "jogger2"
                add_child(ins)
            elif result == "loss":
                ins.file = "joggerlose"
                add_child(ins)
        

func start_race():
        emit_signal("race_start")
        started = true
        animation = "running"

func _input(event):
    if not finished:
        if event.is_action_pressed("ui_left"):
            if not started:
                start_race()
            if left == true:
                translation.x -= .15
                left = false
        if event.is_action_pressed("ui_right"):
            if left == false:
                translation.x -= .15
                left = true