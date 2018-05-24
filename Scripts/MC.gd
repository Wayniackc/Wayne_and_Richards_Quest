extends Node

onready var richtext = get_node("Panel/RichTextLabel")
onready var panelNode = get_node("Panel")
onready var timer = get_node("Panel/RichTextLabel/Timer")
onready var timer2 = get_node("Timer")

func _on_Area2D_body_entered(body):
	if body.get_name() == "MC":
		print("MC entered!")
		timer2.start()
		
func _on_Timer_timeout():
	timer.start()
	panelNode.show()

func _on_AnimationPlayer_animation_finished(MC):
	print("MC animation finished.")
