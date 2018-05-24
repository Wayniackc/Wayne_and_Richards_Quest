# King_Script.gd
extends RichTextLabel

onready var panelNode = get_parent()
onready var timer = get_node("Timer")

var dialog = ["King: *sighs*", "King: \"Very well. I had hoped for a better outcome, but I see you are just as stubborn and petulent as your father.\"", "MC: \"How dare you mention my father!\"", "King: \"SILENCE!\"", "King: *sighs* \"I don't relish what I am about to do, but you leave me no choice but to banish you to the wastelands with all the other criminals and traitors.\"", "King: \"Now where is that blasted wizard?\""]
var page = 0


func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	panelNode.hide()
	
func _on_Timer0_timeout():
	timer.start()
	panelNode.show()
		
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				panelNode.hide()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
