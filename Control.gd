extends Camera2D

var navbar:= preload("res://navbar.tscn")

var swiping : Dictionary = {
	"navbar":false,
	"swp":false,
	"startPos":Vector2(0,0),
	"curPos":Vector2(0,0)
}

func _init():
	self.anchor_mode = Camera2D.ANCHOR_MODE_FIXED_TOP_LEFT

func _process(_delta):
	if Data.cs == "auth":
		return
	if Input.is_action_just_pressed("press"):
		if !swiping["swp"]:
			swiping["swp"] = true
			swiping["startPos"] = get_global_mouse_position()
	if Input.is_action_pressed("press"):
		if swiping["swp"]:
			swiping["curPos"] = get_global_mouse_position()
			if swiping["startPos"].distance_to(swiping["curPos"]) >= 100:
				if swiping["startPos"].x - swiping["curPos"].x <= -10:
					print("swipe")
					if !swiping["navbar"]:
						get_parent().add_child(navbar.instantiate())
						swiping["navbar"] = true
					swiping["swp"] = false
				if swiping["startPos"].x - swiping["curPos"].x >= -10:
					print("swipe")
					if swiping["navbar"]:
						swiping["navbar"] = false
					swiping["swp"] = false
	else:
		swiping["swp"] = false
