extends Resource
class_name UserRes
## Zasób do łatwiejszego działania z danymi podopiecznych.
@export var id: String
@export var shortName: String = "PH"
@export var name: String = "Paweł Harasymowicz"
@export var cost = 0.0:
	get:
		return cost
	set(val):
		cost = float(val)
@export var borrowed = 0.0:
	get:
		return borrowed
	set(val):
		borrowed = float(val)
@export_category("Dates")
@export var startDate: String = "10.07.2024"
@export var endDate: String = "30.08.2024"
@export var dayOn: Dictionary = {}


func deserialize(_id: String):
	var data = Data.users[_id]
	id = _id
	shortName = data["shortName"]
	name = data["name"]
	cost = data["cost"]
	borrowed = data["borrowed"]
	startDate = data["startDate"]
	endDate = data["endDate"]
	dayOn = data["dayOn"]

func serialize() -> Dictionary:
	var data: Dictionary = {
		"shortName":shortName,
		"name":name,
		"cost":cost,
		"borrowed":borrowed,
		"startDate":startDate,
		"endDate":endDate,
		"dayOn":dayOn
	}
	Data.users[id] = data
	return data


const dayDummy: Dictionary = {
	2024:{
		9:{
			14:{
				16.30:0
			}
		}
	}
}

func addDay(day:int,month:int,year:int,time:float,state:int = 0):
	if !dayOn.has(year):
		dayOn[year] = {}
	if !dayOn[year].has(month):
		dayOn[year][month] = {}
	if !dayOn[year][month].has(day):
		dayOn[year][month][day] = {}
	if !dayOn[year][month][day].has(time):
		dayOn[year][month][day][time] = state


func getAllDays(month:int = Data.date["month"],year:int = Data.date["year"]) -> Dictionary:
	var data: Dictionary
	for e in dayOn[year][month]:
		data[e] = dayOn[year][month][e]
	return data
