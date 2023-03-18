extends CanvasLayer


func showAll():
	MainMenu.hideAllMenu()
	$Overlay.show()
	$NoClick.show()
	$CreditosIMG.show()
	$VoltarCreditos.show()

func hideAll():
	$Overlay.hide()
	$NoClick.hide()
	$CreditosIMG.hide()
	$VoltarCreditos.hide()
	

func _on_VoltarCreditos_pressed():
	MainMenu.playClick()
	hideAll()
	MainMenu.showAllMenu()
