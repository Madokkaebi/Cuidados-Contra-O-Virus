extends Node

signal reset

var path = "user://Settings.dat"

var data = {
	"player_name" : "User",
	"sound" : true
}

var default_data = {
	"player_name" : "User",
	"sound" : true
}

func _ready():
	verifySettings()
	#MainMenu.toggleVolume()


func verifySettings():
	var file = File.new()
	
	if not file.file_exists(path):
		reset_data()
		return
	else:
		load_data()
		return
	pass

func reset_data():
	var file = File.new()
	data = default_data.duplicate(true)
	file.open_encrypted_with_pass(path, file.WRITE, "senhaencriptada123")
	file.store_var(data)
	file.close()
	#NameInput.showAll()
	emit_signal("reset")

func save_data():
	var file = File.new()
	file.open_encrypted_with_pass(path, file.WRITE, "senhaencriptada123")
	file.store_var(data)
	file.close()
	
func load_data():
	var file = File.new()
	file.open_encrypted_with_pass(path,file.READ, "senhaencriptada123")
	data = file.get_var()
	file.close()
