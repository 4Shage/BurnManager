extends ConfigFile
class_name SaveFile

@export var users : Dictionary

func sV():
	for e in users:
		self.set_value("usr",str(e),e)
