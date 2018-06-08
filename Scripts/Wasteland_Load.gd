extends TextureRect

onready var bg_tween = get_node("Tween")
#onready var bg = get_node(self)

func _ready():
	print(bg_tween)
	print(self)
	bg_tween.interpolate_property(self, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), 3.0, Tween.TRANS_LINEAR, Tween.EASE_IN)
	bg_tween.start()
