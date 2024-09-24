extends Node

@onready var state = $MarginContainer/PanelContainer/VBoxContainer/VBoxContainer3/State

@onready var loginB: Button = $MarginContainer/PanelContainer/VBoxContainer/VBoxContainer/Login
@onready var signB: Button = $MarginContainer/PanelContainer/VBoxContainer/VBoxContainer2/Sign


var FB : FirebaseAuth = Firebase.Auth

func _ready():	
	FB = Firebase.Auth
	Data.cs = "auth"
	if FB.check_auth_file():
		Data.auth = FB.auth
		state.text = "Login success!"
		Manager.chScene("menu")

func _process(_delta):
	if Input.is_action_just_pressed("AL"): 
		FB.login_anonymous()
	if state != null:
		if state.text == "State":
			state.hide()
		else:
			state.show()


func login_sub(new_text: String) -> void:
	loginB.emit_signal("pressed")


func sign_sub(new_text: String) -> void:
	signB.emit_signal("pressed")
