extends Node

func _ready():
	SilentWolf.configure(
		{
			"api_key": "R1PF2aFOru2CIEnfzmLQv1eibs6eYj0s6w4eYe78",
			"game_id": "CuidadosContraoVirus",
			"game_version": "1.2.1",
			"log_level": 1
		}
	)
	
	SilentWolf.configure_scores(
		{
			"open_scene_on_close": MainMenu
		}
	)
	
	Global.connect("reset", self, "_on_noUsername")
	hideAll()
	Creditos.hideAll()
	SoundManagement.hideAll()
	Dificuldade.hideAll()
	

func playClick():
	$BGImage/ClickSFX.play()

func _on_Iniciar_pressed():
	hideAllMenu()
	playClick()
	Dificuldade.showAll()
	pass

func _on_Recordes_pressed():
	playClick()
	hideAll()
	get_tree().change_scene("res://addons/silent_wolf/Scores/Leaderboard.tscn")
	pass

func _on_Sair_pressed():
	playClick()
	get_tree().quit()
	
func _on_Creditos_pressed():
	playClick()
	Creditos.showAll()
	pass

func hideAllMenu():
	$BGImage/Iniciar.hide()
	$BGImage/Recordes.hide()
	$BGImage/Sair.hide()
	$BGImage/Creditos.hide()
	SoundManagement.hideAll()

func showAllMenu():
	$BGImage/Iniciar.show()
	$BGImage/Recordes.show()
	$BGImage/Sair.show()
	$BGImage/Creditos.show()
	SoundManagement.toggleVolume()

func showAll():
	$BGImage.show()
	$BGImage/BGM.play()
	$BGImage/Creditos.show()
	$BGImage/Iniciar.show()
	$BGImage/Recordes.show()
	$BGImage/Sair.show()
	SoundManagement.toggleVolume()
	
func hideAll():
	$BGImage.hide()
	$BGImage/BGM.stop()
	$BGImage/Creditos.hide()
	$BGImage/Iniciar.hide()
	$BGImage/Recordes.hide()
	$BGImage/Sair.hide()
	SoundManagement.hideAll()

func _on_noUsername():
	NameInput.showAll()
