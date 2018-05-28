extends Node



func _on_Timer_timeout():
	get_node("AnimatedSprite").play("Teleport")
