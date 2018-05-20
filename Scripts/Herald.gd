extends Node

onready var richtext = get_node("Panel/RichTextLabel")
onready var panelNode = get_node("Panel")
onready var timer = get_node("Panel/RichTextLabel/Timer")
onready var timer2 = get_node("Timer")

func _on_Area2D_body_entered(body):
	if body.get_name() == "Herald":
		timer2.start()

func _on_Timer_timeout():
	print("Herald entered!")
#	print(richtext)
	timer.start()
	panelNode.show()

func _on_AnimationPlayer_animation_finished(Herald):
	print("Animation finished")





