extends CanvasLayer

onready var choice = -1


func _on_Transition_Scene_transitioned():
	if(choice == 1):
		hideAll()
		MainMenu.hideAll()
		get_tree().change_scene("res://Assets/Scenes/EasyMode.tscn")
	elif(choice == 2):
		hideAll()
		MainMenu.hideAll()
		get_tree().change_scene("res://Assets/Scenes/NormalMode.tscn")
	elif(choice == 3):
		hideAll()
		MainMenu.hideAll()
		get_tree().change_scene("res://Assets/Scenes/HardMode.tscn")

func _on_Facil_pressed():
	choice = 1
	MainMenu.playClick()
	$Transition_Scene.transition()

func _on_Medio_pressed():
	choice = 2
	MainMenu.playClick()
	$Transition_Scene.transition()

func _on_Dificil_pressed():
	choice = 3
	MainMenu.playClick()
	$Transition_Scene.transition()

func _on_Voltar_pressed():
	MainMenu.playClick()
	hideAll()
	MainMenu.showAllMenu()

func hideAll():
	$NoClick.hide()
	$Overlay.hide()
	$Facil.hide()
	$Medio.hide()
	$Dificil.hide()
	$Voltar.hide()

func showAll():
	$Overlay.show()
	$NoClick.show()
	$Facil.show()
	$Medio.show()
	$Dificil.show()
	$Voltar.show()
