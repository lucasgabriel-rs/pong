extends Node2D

# Bola
@onready var bola: Area2D = $"../Bola"

# Efeito Sonoro
@onready var som_impacto_gol: AudioStreamPlayer = $SomImpactoGol

# Pontuacoes
var pontuacao_jogador1: int = 0
var pontuacao_jogador2: int = 0

# UI
@onready var texto_de_pontuacao_jogador_1: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador1"
@onready var texto_de_pontuacao_jogador_2: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador2"


func _input(event: InputEvent) -> void:
	# Sair do Jogo
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
	# Reiniciar partida
	if event.is_action_pressed("reiniciar"):
		get_tree().reload_current_scene()


func _on_gol_1_area_entered(_area: Area2D) -> void:
	# Chamado quando o Jogador 2 marca um gol.
	som_impacto_gol.play()
	
	pontuacao_jogador2 += 1
	texto_de_pontuacao_jogador_2.text = str(pontuacao_jogador2)
	
	bola.rodar_timer()


func _on_gol_2_area_entered(_area: Area2D) -> void:
	# Chamado quando o Jogador 1 marca um gol.
	som_impacto_gol.play()
	
	pontuacao_jogador1 += 1
	texto_de_pontuacao_jogador_1.text = str(pontuacao_jogador1)
	
	bola.rodar_timer()
