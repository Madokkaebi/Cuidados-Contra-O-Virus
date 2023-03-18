extends Node

func _ready():
	$SFX.play()



func _on_Transition_Scene_transitioned():
	$BG.hide()
	$Sprite.hide()
	MainMenu.showAll()
	pass # Replace with function body.


func _on_SFX_finished():
	$Transition_Scene.transition()
	pass # Replace with function body.
