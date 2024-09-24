extends Node

var olds : Dictionary

func chScene(sc:String):
	if Data.SC.has(sc):
		get_tree().change_scene_to_file(Data.SC.get(sc))
		Data.cs = sc
	else:
		printerr("Scene doesn't exist : "+sc)


func addUser(namE:String,shortName:String,cost:float = 0,startDate:String = "",endDate:String = "",dayOn:Dictionary=Data.day,wild:Dictionary={},dayOff:Dictionary={}):
	var rn := RandomNumberGenerator.new()
	var rng: String = str(rn.seed)
	Data.users[rng] = {
		"shortName":shortName,
		"name":namE,
		"cost":cost,
		"borrowed":"",
		"startDate":startDate,
		"endDate":endDate,
		"dayOn":dayOn,
	}
	Data.selUser = rng
	saveUsrs()
func saveUser(id:int, data: Dictionary):
	Data.users[id] = {
		"shortName":data["shortName"],
		"name":data["name"],
		"cost":data["cost"],
		"borrowed":data["borrowed"],
		"startDate":data["startDate"],
		"endDate":data["endDate"],
		"dayOn":data["dayOn"],
	}
	saveUsrs()

func remUser(id:int):
	Data.users.erase(id)

func saveUsrs():
	var cfg := SaveFile.new()
	cfg.set_value("usr","usrs", Data.users)
	cfg.save("user://users.cfg")

func loadUsrs():
	var cfg := SaveFile.new()
	cfg.load("user://users.cfg")
	Data.users = cfg.get_value("usr","usrs")

func calcMonthlyCost(_id:int):
	pass

func userAddToDB():
	Data.db = {}
	for e in Data.users:
		Data.db[Data.users[e]["shortName"]] = e
	print(Data.db)

func _ready():
	var FB : FirebaseAuth = Firebase.Auth
	if FB.check_auth_file():
		Data.auth = FB.auth
	if FileAccess.file_exists("user://users.cfg"):
		loadUsrs()
	userAddToDB()
	Data.date = Time.get_date_dict_from_system()
	print_debug(Data.date)
	Data.monthDays = Data.monthsDays[Data.date["month"]-1]
	if Data.date["month"] == 2:
		var przes2 : int = Data.date["year"] / 4
		var przes : float = Data.date["year"] / 4.0
		przes -= przes2
		if przes == 0.00:
			Data.monthDays += 1
	print_debug(Data.monthDays)



func _process(_delta: float) -> void:
	if Data.auth == null:
		if Data.cs != "auth":
			chScene("auth")
	else:
		if olds.has("users"):
			if olds["users"] != Data.users:
				var r = await Firebase.Storage.ref(Data.auth.localid+"/users.cfg").delete()
				r = await Firebase.Storage.ref(Data.auth.localid+"/users.cfg").put_file("user://users.cfg")
				olds["users"] = Data.users
		else:
			olds["users"] = {}
			var r = await Firebase.Storage.ref(Data.auth.localid+"/users.cfg").delete()
			#r = await Firebase.Storage.ref(Data.auth.localid+"/users.cfg").put_file("user://users.cfg")
			olds["users"] = Data.users

var cal: Dictionary
func calD():
	for e in Data.users:
		print_debug(e)
		for i in Data.users[e]["dayOn"][Data.date["year"]][Data.date["month"]]:
			print_debug(i)
			if cal.has(i):
				for a in i:
					print_debug(a) 
					if cal[i].has(a):
						cal[i][a] =cal[i][a]+a
					else:
						cal[i][a] = a
			else:
				for a in i:
					print_debug(a)
					cal[i]=cal[i]+a

func saveSelf():
	var col_id = "users"
	#if Data.auth.localid:
		#var collection : FirestoreCollection = Firebase.Firestore.collection(col_id)
		#var data : Dictionary = {
			#"name": Data.auth.localid,
			#"fields": Data.sData,
			#"createTime":Time.get_date_string_from_system()
		#}
		#var task : FirestoreTask = collection.update(data)
		#task = Firebase.Firestore.document(Data.auth.localid, Data.sData)
		
