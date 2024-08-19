extends Panel
@export var user : Dictionary = {
		"shortName":"",
		"name":"Paweł Harasymowicz",
		"cost":60,
		"borrowed":0,
		"startDate":"01.06",
		"endDate":"01.09",
		"dayOn":{
			1:0,
			3:0
		}
	}

@onready var line_cost = $VBoxContainer/HBoxContainer/BoxContainer/LineEdit
@onready var line_borrowed = $VBoxContainer/HBoxContainer/BoxContainer4/LineEdit
@onready var line_sn = $HBoxContainer/LineEdit
@onready var line_n = $HBoxContainer/LineEdit2

@onready var line_day = $VBoxContainer/VBoxContainer/ItemList/BoxContainer/LineEdit
@onready var line_month = $VBoxContainer/VBoxContainer/ItemList/BoxContainer/LineEdit2
@onready var line_year = $VBoxContainer/VBoxContainer/ItemList/BoxContainer/LineEdit3




func _ready():
	if Data.users != {}:
		user = Data.users[Data.selUser]
		line_sn.text = user["shortName"]
	if user["name"]: line_n.text = user["name"]
	if user["cost"]: line_cost.text = str(user["cost"])
	if user["borrowed"]: line_borrowed.text = str(user["borrowed"])
	var weekdays
	for e in user["dayOn"]:
		var i : String
		match e:
			0:
				i = "1"
			1:
				i = "2"
			2:
				i = "3"
			3:
				i = "4"
			4:
				i = "5"
			5:
				i = "6"
			6:
				i = "7"
		if weekdays != null:
				weekdays = weekdays + ","+i
		else:
			weekdays = i
			

func _process(_delta):
	if line_n.text != "": user["name"] = line_n.text
	if line_sn.text != "": user["shortName"] = line_sn.text
	if line_cost.text != "": user["cost"] = float(line_cost.text)
	if line_borrowed.text != "": user["borrowed"] = float(line_borrowed.text)
