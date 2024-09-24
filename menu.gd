extends Control
@onready var box_container: BoxContainer = $ScrollContainer/BoxContainer

@export var posts: Dictionary = {
	"0.4.1": {
			"	-Added updates to main menu.":0
		}
}




func _ready() -> void:
	for e in posts:
		var p: Panel = Panel.new()
		var l: Label = Label.new()
		var b: BoxContainer = BoxContainer.new()
		l.text = e
		b.size_flags_horizontal = Control.SIZE_EXPAND_FILL
		b.size_flags_vertical = Control.SIZE_EXPAND_FILL
		b.vertical = true
		l.size_flags_vertical = Control.SIZE_EXPAND_FILL
		p.set_custom_minimum_size(Vector2(0,100))
		box_container.add_child(p)
		p.add_child(b)
		b.add_child(l)
		for i in posts[e]:
			var l2: Label = Label.new()
			l2.text = i
			l2.size_flags_vertical = Control.SIZE_EXPAND_FILL
			b.add_child(l2)
