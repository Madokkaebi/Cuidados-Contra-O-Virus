extends Node

var rng = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var Cartas : PoolIntArray = [0, 0, 0, 0, 0, 0, 0, 0]
var CartasObj : Array
var aux : int
var aux3 : int
var verif : bool = true
var j : int

var acertos : int = 0

var CartaParaCima = null

var Jogador = Global.data

var total_score = 0

func inicializaCartas():
	for i in range(0,7):
		verif = false
		if(Cartas[i] == 0):
			j = 0
			rng.randomize()
			aux = rng.randi_range (1,8)
			while(verif == false):
				if(Cartas[j] == aux):
					rng.randomize()
					aux = rng.randi_range (1,8)
					j = 0
				if (Cartas[j] != aux):
					if(j == 7):
						verif = true
						Cartas[i] = aux
					j = j + 1
																	
			verif = false
			while(verif == false):
				rng2.randomize()
				aux3 = rng2.randi_range(i + 1, 7)
				if(Cartas[aux3] == 0):
					Cartas[aux3] = aux
					verif = true
					
	$BGImage/Carta1.colocarImagem(Cartas[0])
	$BGImage/Carta1.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta1.connect("virada",self,"_ao_virar")
	$BGImage/Carta2.colocarImagem(Cartas[1])
	$BGImage/Carta2.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta2.connect("virada",self,"_ao_virar")
	$BGImage/Carta3.colocarImagem(Cartas[2])
	$BGImage/Carta3.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta3.connect("virada",self,"_ao_virar")
	$BGImage/Carta4.colocarImagem(Cartas[3])
	$BGImage/Carta4.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta4.connect("virada",self,"_ao_virar")
	$BGImage/Carta5.colocarImagem(Cartas[4])
	$BGImage/Carta5.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta5.connect("virada",self,"_ao_virar")
	$BGImage/Carta6.colocarImagem(Cartas[5])
	$BGImage/Carta6.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta6.connect("virada",self,"_ao_virar")
	$BGImage/Carta7.colocarImagem(Cartas[6])
	$BGImage/Carta7.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta7.connect("virada",self,"_ao_virar")
	$BGImage/Carta8.colocarImagem(Cartas[7])
	$BGImage/Carta8.connect("clicada",self,"_ao_clicada")
	$BGImage/Carta8.connect("virada",self,"_ao_virar")
	
	verif = false
	
	pass

func _ao_clicada(Carta):
	if Carta.estaViradaParaCima == false:
		Carta.click()
		Carta.virarCarta()
		
func _ao_virar(Carta):
	if Carta.estaViradaParaCima == true:
		if CartaParaCima == null:
			CartaParaCima = Carta
		else:
			if CartaParaCima.cara == Carta.cara:
				CartaParaCima.fixa = true
				Carta.fixa = true
				print(str(CartaParaCima.cara) + " = " + str(Carta.cara))
				Carta.acerto()
				CartaParaCima = null
				acertos = acertos + 1
				if acertos == 4:
					Vitoria()
			else:
				CartaParaCima.reset()
				Carta.reset()
				Carta.erro()
				CartaParaCima = null
				total_score = total_score - 25
	pass

func _ready():
	inicializaCartas()
	total_score = 0
	pass


func _on_Voltar1_pressed():
	$BGImage/Click.play()
	$BGImage/TimerText.pause()
	$BGImage/Overlay.show()
	$BGImage/Overlay/VoltarConfirm.show()
	$BGImage/Overlay/VoltarConfirm/Sim.show()
	$BGImage/Overlay/VoltarConfirm/Nao.show()
	pass


func _on_Sim_pressed():
	$BGImage/Click.play()
	$BGImage/TimerText.stop()
	endGame()
	pass


func _on_Nao_pressed():
	$BGImage/Click.play()
	$BGImage/Overlay.hide()
	$BGImage/Overlay/VoltarConfirm.hide()
	$BGImage/Overlay/VoltarConfirm/Sim.hide()
	$BGImage/Overlay/VoltarConfirm/Nao.hide()
	$BGImage/TimerText.resume()
	pass
	
func Vitoria():
	$BGImage/BGM.stop()
	$BGImage/TimerText.stop()
	$BGImage/TimerText.hide()
	setScore()
	$BGImage/Overlay/Vitoria/TimerText.stop()
	$BGImage/Overlay/Vitoria/TimerText.show()
	$BGImage/Overlay/Vitoria/Pontos.show()
	$BGImage/Overlay/Vitoria/VitoriaBGM.play()
	$BGImage/Overlay.show()
	$BGImage/Overlay/Vitoria.show()
	$BGImage/Overlay/Voltar2.show()

func setScore():
	var tts
	tts = $BGImage/Overlay/Vitoria/TimerText.returnScore()
	tts = 1000 - tts
	total_score = tts + total_score
	if(total_score < 1):
		total_score = 1
	$BGImage/Overlay/Vitoria/Pontos.text = str(total_score) + " PONTOS"


func endGame():
	$BGImage.hide()
	$BGImage/BGM.stop()
	$BGImage/Overlay/Vitoria/VitoriaBGM.stop()
	MainMenu.showAll()

func _on_Voltar2_pressed():
	$BGImage/Click.play()
	SilentWolf.Scores.persist_score(Jogador.player_name + " (Facil)", total_score)
	SilentWolf.Scores.get_high_scores()
	
	endGame()
