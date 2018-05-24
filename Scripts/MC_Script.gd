# MC_Script.gd
extends RichTextLabel

onready var panelNode2 = get_parent()
onready var timer = get_node("../../../King/Timer")

var dialog = ["MC: \"I have nothing to say to any of you.\"", "MC: \"This so-called trial is just as farcical as the rest of your reign and I will take no further part in either.\"", "MC: *spits on the ground*"]
var page = 0

var can_talk = true

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	panelNode2.hide()
	print(timer)
		
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				panelNode2.hide()
				_next_speech()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _next_speech():
	if can_talk == true:
		can_talk = false
		timer.start()