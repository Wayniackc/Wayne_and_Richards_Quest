extends RichTextLabel

onready var panelNode = get_parent()
onready var timer = get_node("Timer")

var dialog = ["Wizard: \"I'm very sorry, Your Grace.\"", "Wizard: \"I had intended to be here on time, but I was in my laboratory working on my strongest potion and...\"", "King: \"Enough! Just get on with it so we can be rid of this traitor once and for all.\"", "Wizard: \"Yes, Your Grace. Very well.\"", "Wizard: *closes his eyes and his staff begins to glow*", "Wizard: \"EXSULES VITAE!!\""]
var page = 0

var can_talk = true

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	panelNode.hide()
	
func _on_AnimatedSprite_animation_finished():
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
				_banished()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _banished():
	if can_talk == true:
		can_talk = false
		get_node("../../../MC/AnimationPlayer/AnimatedMC").play("Banished")

func _on_AnimatedMC_animation_finished():
	get_node("../../../MC/AnimationPlayer/AnimatedMC").hide()
