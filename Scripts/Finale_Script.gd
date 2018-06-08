extends RichTextLabel

onready var panelNode = get_parent()
onready var timer = get_node("Timer")

onready var wizard_tween = get_node("../../../Wizard/AnimatedSprite/Tween")
onready var wizard = get_node("../../../Wizard/AnimatedSprite")

onready var king_tween = get_node("../../../King/Sprite/Tween")
onready var king = get_node("../../../King/Sprite")

onready var herald_tween = get_node("../../../Herald/AnimationPlayer/Sprite/Tween")
onready var herald = get_node("../../../Herald/AnimationPlayer/Sprite")

onready var bg_tween = get_node("../../../Background/Tween")
onready var bg = get_node("../../../Background")

export(String, FILE, "*.tscn") var wasteland_scene

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
				_fade_out()
		else:
			set_visible_characters(get_total_character_count())

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters() + 1)
	
func _on_Timer2_timeout():
	timer.start()
	panelNode.show()
	
func _fade_out():
	wizard_tween.interpolate_property(wizard, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	wizard_tween.start()
	king_tween.interpolate_property(king, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	king_tween.start()
	herald_tween.interpolate_property(herald, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	herald_tween.start()
	yield(get_tree().create_timer(3.0), "timeout")
	bg_tween.interpolate_property(bg, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), 2.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	bg_tween.start()
	yield(get_tree().create_timer(3.0), "timeout")
	get_tree().change_scene(wasteland_scene)
