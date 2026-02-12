extends Node2D

# Bola
@onready var bola: Area2D = $"../Bola"

# Pontuacoes
var pontuacao_jogador1: int = 0
var pontuacao_jogador2: int = 0

# UI
@onready var texto_de_pontuacao_jogador_1: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador1"
@onready var texto_de_pontuacao_jogador_2: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador2"


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	pass


func _on_gol_1_area_entered(area: Area2D) -> void:
	pontuacao_jogador2 += 1
	texto_de_pontuacao_jogador_2.text = str(pontuacao_jogador2)
	bola.rodar_timer()


func _on_gol_2_area_entered(area: Area2D) -> void:
	pontuacao_jogador1 += 1
	texto_de_pontuacao_jogador_1.text = str(pontuacao_jogador1)
	bola.rodar_timer()
