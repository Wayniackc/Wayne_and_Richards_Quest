# King_Script.gd
extends RichTextLabel

onready var panelNode2 = get_parent()

var dialog = ["King: *sighs*", "MC: \"Very well. I had hoped for a better outcome, but I see you are just as stubborn and petulent as your father.\"", "King: \"I don't relish what I am about to do, but you lave me no choice.\"", "King: \"Now where is that blasted wizard?\""]

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