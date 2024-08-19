extends Control

@onready var line_edit: LineEdit = $MarginContainer2/PanelContainer/VBoxContainer/LineEdit
@onready var enter: Button = $MarginContainer2/PanelContainer/VBoxContainer/Enter


func _process(delta: float) -> void:
	if line_edit.text.length() >= 3:
		enter.disabled = false
		Data.NICKNAME = line_edit.text
	else:
		enter.disabled = true


func _on_enter_pressed() -> void:
	if line_edit.text.length() >= 3:
		Manager.chScene("menu")
