extends CanvasLayer

func _ready():
	if(Global.data.sound == false):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	else:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)

func _on_SoundOn_pressed():
	MainMenu.playClick()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), -80)
	Global.data.sound = false
	Global.save_data()
	toggleVolume()

func _on_SoundOff_pressed():
	MainMenu.playClick()
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), 0)
	Global.data.sound = true
	Global.save_data()
	toggleVolume()

func toggleVolume():
	if(Global.data.sound == false):
		$SoundOff.show()
		$SoundOn.hide()
	else:
		$SoundOff.hide()
		$SoundOn.show()

func hideAll():
	$SoundOff.hide()
	$SoundOn.hide()
