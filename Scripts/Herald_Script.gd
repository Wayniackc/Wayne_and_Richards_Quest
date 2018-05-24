# Courtroom.gd
extends RichTextLabel

onready var panelNode2 = get_parent()
onready var mc_node = get_node("../../../MC/AnimationPlayer")

var can_talk = true

var dialog = ["Herald: \"Prisoner!\"", "Herald: \"You stand accused of crimes against the realm.\"", "Herald: \"Come forward and face your king!\""]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	panelNode2.hide()
		
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
				return
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _next_speech():
	if can_talk == true:
		print(can_talk)
		can_talk = false
		print(can_talk)
		mc_node.assigned_animation = "MC"
		mc_node.play("MC")
#	else:
#		pass