extends RichTextLabel

onready var panelNode = get_parent()
onready var timer = get_node("Timer")

var dialog = ["Herald: \"Nasty piece of business, Your Grace. We are better off having rid the realm of that scum.\"", "King: \"I fear it won't be the last we've heard of him if he's anything like his father.\"", "Wizard: \"He is exactly like his father to be sure.\"", "King: \"That should keep us all awake at night.\"", "Wizard: \"If you're having trouble sleeping, Your Grace, I can make you a sleeping potion that will assuredly help?\"", "King: \"Oh for God's sake. I'm going back to my chambers before I send the lot of you to the wasteland.\""]
var page = 0

var can_talk = true

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	panelNode.hide()
	
func _input(event):
	if Input.is_action_pressed("ui_accept"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size() - 1:
				page += 1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			else:
				panelNode.hide()
#				_banished()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _banished():
	if can_talk == true:
		can_talk = false
		get_node("../../../MC/AnimationPlayer/AnimatedMC").play("Banished")

func _on_Timer2_timeout():
	timer.start()
	panelNode.show()