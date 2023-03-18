extends CanvasLayer

func showAll():
	$NoClick.show()
	$Overlay.show()
	$NameInp.show()
	$NameInput.show()
	$Yes.show()
	$No.show()

func hideAll():
	$NoClick.hide()
	$Overlay.hide()
	$NameInp.hide()
	$NameInput.hide()
	$Yes.hide()
	$No.hide()

func _on_Yes_pressed():
	hideAll()
	MainMenu.playClick()
	Global.save_data()

func _on_No_pressed():
	hideAll()
	MainMenu.playClick()
	Global.data.player_name = "User"
	Global.save_data()

func _on_NameInput_text_changed(new_text):
	Global.data.player_name = new_text

func _on_NameInput_text_entered(new_text):
	Global.data.player_name = new_text
