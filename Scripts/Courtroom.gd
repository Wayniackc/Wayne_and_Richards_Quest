# Courtroom.gd
extends RichTextLabel

onready var panelNode2 = get_parent()

var dialog = ["Prisoner!", "You stand accused of crimes against the realm.", "Come forward and face your king!"]
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
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)