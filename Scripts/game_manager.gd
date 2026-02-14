extends Node

# Entidades
@onready var bola: Area2D = $"../Bola"
@onready var jogador_1: CharacterBody2D = $"../Jogador1"
@onready var jogador_2: CharacterBody2D = $"../Jogador2"

# Efeito Sonoro
@onready var som_impacto_gol: AudioStreamPlayer = $SomImpactoGol

# Parametros
var pontuacao_jogador1: int = 0
var pontuacao_jogador2: int = 0
var _game_over: int = 10
var reset_posicao_y: float = 360.0

# UI
@onready var texto_de_pontuacao_jogador_1: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador1"
@onready var texto_de_pontuacao_jogador_2: Label = $"../UI/PainelDePontuação/TextoDePontuacaoJogador2"


func _ready() -> void:
	# Define se a IA esta ligada/desligada.
	jogador_2.ia = global.ia


func _process(_delta: float) -> void:
	_gameover()


func _input(event: InputEvent) -> void:
	# Sair do Jogo
	if event.is_action_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/menu.tscn")
	
	# Reiniciar partida
	if event.is_action_pressed("reiniciar"):
		get_tree().reload_current_scene()


func _gameover() -> void:
	# Dita quando o jogo acaba.
	if pontuacao_jogador1 == _game_over or pontuacao_jogador2 == _game_over:
		global.pontuacao_j1 = pontuacao_jogador1
		global.pontuacao_j2 = pontuacao_jogador2
		get_tree().change_scene_to_file("res://Scenes/game_over.tscn")


func _on_gol_1_area_entered(_area: Area2D) -> void:
	# Chamado quando o Jogador 2 marca um gol.
	som_impacto_gol.play()
	
	bola.velocidade = 500
	jogador_1.position.y = reset_posicao_y
	jogador_2.position.y = reset_posicao_y
	
	pontuacao_jogador2 += 1
	texto_de_pontuacao_jogador_2.text = str(pontuacao_jogador2)
	
	bola.rodar_timer()


func _on_gol_2_area_entered(_area: Area2D) -> void:
	# Chamado quando o Jogador 1 marca um gol.
	som_impacto_gol.play()
	
	bola.velocidade = 500
	jogador_1.position.y = reset_posicao_y
	jogador_2.position.y = reset_posicao_y
	
	pontuacao_jogador1 += 1
	texto_de_pontuacao_jogador_1.text = str(pontuacao_jogador1)
	
	bola.rodar_timer()
