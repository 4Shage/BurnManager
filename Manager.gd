extends Node

var date : Dictionary

const SC : Dictionary = {
	"cal":"res://calendar.tscn",
	"ushub":"res://users_hub.tscn",
	"us":"res://user.tscn"
}
func chScene(sc:String):
	get_tree().change_scene_to_file(SC.get(sc))


var selUser : String
var users : Dictionary = {}
var monthDays : int

func addUser(name:String,shortName:String,cost:float,startDate:String,endDate:String,dayOn:Dictionary,wild:Dictionary={},dayOff:Dictionary={}):
	users[shortName] = {
		"name":name,
		"cost":cost,
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
