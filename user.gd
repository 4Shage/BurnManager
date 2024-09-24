extends Panel
@onready var line_cost = $VBoxContainer/HBoxContainer/BoxContainer/LineEdit
@onready var line_borrowed = $VBoxContainer/HBoxContainer/BoxContainer4/LineEdit
@onready var line_sn = $HBoxContainer/LineEdit
@onready var line_n = $HBoxContainer/LineEdit2

@onready var line_day = $VBoxContainer/VBoxContainer/ItemList/BoxContainer3/BoxContainer/LineEdit
@onready var line_month = $VBoxContainer/VBoxContainer/ItemList/BoxContainer3/BoxContainer/LineEdit2
@onready var line_year = $VBoxContainer/VBoxContainer/ItemList/BoxContainer3/BoxContainer/LineEdit3
@export var user: UserRes



func _ready():
	user = UserRes.new()
	if Data.users != {}:
		user.deserialize(Data.selUser)
		line_sn.text = user.shortName
	if user.name: line_n.text = user.name
	if user.cost: line_cost.text = str(user.cost)
	if user.borrowed: line_borrowed.text = str(user.borrowed)

func _process(_delta):
	if line_n.text != "": user.name = line_n.text
	if line_sn.text != "": user.shortName = line_sn.text
	if line_cost.text != "": user.cost = line_cost.text
	if line_borrowed.text != "": user.borrowed = line_borrowed.text
