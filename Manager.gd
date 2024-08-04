extends Node

var date : Dictionary

const SC : Dictionary = {
	"menu":"res://menu.tscn",
	"cal":"res://calendar.tscn",
	"ushub":"res://users_hub.tscn",
	"us":"res://user.tscn"
}
func chScene(sc:String):
	get_tree().change_scene_to_file(SC.get(sc))

const monthsDays : Array = [31,28,31,30,31,30,31,31,30,31,30,31]

var selUser : String
var users : Dictionary = {}
var monthDays : int

func addUser(namE:String,shortName:String,cost:float,startDate:String,endDate:String,dayOn:Dictionary,wild:Dictionary={},dayOff:Dictionary={}):
	users[shortName] = {
		"name":namE,
		"cost":cost,
		"borrowed":"",
		"startDate":startDate,
		"endDate":endDate,
		"dayOn":dayOn,
		"dayOff":dayOff,
		"wild":wild
	}
func remUser(shortName:String):
	users.erase(shortName)

func calcMonthlyCost(shortName:String):
	pass

func _ready():
	date = Time.get_date_dict_from_system()
	print_debug(date)
	monthDays = monthsDays[date["month"]-1]
	if date["month"] == 2:
		var przes2 : int = date["year"] / 4
		var przes : float = date["year"] / 4.0
		przes -= przes2
		if przes == 0.00:
			monthDays += 1
	print_debug(monthDays)
