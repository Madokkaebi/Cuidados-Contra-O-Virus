extends Node2D

class_name Carta

signal virada(Carta)
signal clicada(Carta)

var estaViradaParaCima : bool = false
var cara : int = 1
var fixa : bool = false

onready var imagem = $Frontal
onready var traseira = $Traseira
onready var area = $AreaCarta

func _ready():
	$AnimCarta.play("EscondeCarta")
	area.connect("clicada", self, "_ao_clicada")
	

# Colocar imagem na Frontal da carta
func colocarImagem (num: int):
	cara = num
	self.imagem.texture = load("res://Assets/Cartas/Carta" + String(cara) + ".jpg")
	

func virarCarta():
	if estaViradaParaCima == true : return
	
	$AnimCarta.play("MostraCarta")
	estaViradaParaCima = true
	emit_signal("virada", self)
	
func reset():
	if estaViradaParaCima == false : return
	$AnimCarta.play("EscondeCarta")
	estaViradaParaCima = false
	
func acerto():
	$Acerto.play()
	
func erro():
	$Erro.play()
	
func click():
	$Click.play()
	
func _ao_clicada():
	emit_signal("clicada", self)
