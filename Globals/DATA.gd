extends Node

var auth
const SC : Dictionary = {
	"menu":"res://menu.tscn",
	"auth":"res://auth/auth.tscn",
	#"cal":"res://calendar.tscn",
	"profile":"res://auth/profile.tscn",
	"rules":"res://scenes/rules.tscn",
	"ushub":"res://users_hub.tscn",
	"us":"res://user.tscn"
}
var cs : String :
	set(new_val):
		if SC.has(new_val):
			cs = new_val
		else:
			printerr("Scene doesn't exist : "+new_val)

var day : Dictionary = {}
func _ready():
	day[date["year"]] = {}
	day[date["year"]][date["month"]] = {}
	day[date["year"]][date["month"]][date["day"]] = {}
	day[date["year"]][date["month"]][date["day"]][16.30] = 0
const monthsDays : Array = [31,28,31,30,31,30,31,31,30,31,30,31]
var date : Dictionary
var selUser : int
var users : Dictionary = {}
var db : Dictionary = {}
var monthDays : int

var sData : Dictionary = {
	"shortName":"PH",
	"name":"Paweł Harasymowicz",
	"cost":60,
	"borrowed":"",
	"startDate":"10.07.2024",
	"endDate":"30.08.2024",
	"dayOn":{},
}

var MC : Dictionary = {
	"name":""
}
