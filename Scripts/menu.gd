extends Control

# Menu
@onready var menu_1: VBoxContainer = $MarginContainer/CenterContainer/Menu1
@onready var menu_2: VBoxContainer = $MarginContainer/CenterContainer/Menu2
@onready var dificuldade: VBoxContainer = $MarginContainer/CenterContainer/Menu3


func _on_jogar_pressed() -> void:
	# Alterna entre menus.
	menu_1.visible = false
	menu_2.visible = true


func _on_sair_pressed() -> void:
	# Sai do jogo.
	get_tree().quit()


func _on_um_jogador_pressed() -> void:
	# Alterna entre o menu de escolha entre Um Jogador/Dois Jogadores
	# e Dificuldade no Modo Um Jogador.
	menu_2.visible = false
	dificuldade.visible = true
	global.ia = true


func _on_dois_jogadores_pressed() -> void:
	# Inicia o jogo em Modo Dois Jogadores
	global.ia = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_voltar_pressed() -> void:
	# Sai do Menu de Escolha Um Jogador/Dois Jogadores para Menu Principal
	menu_1.visible = true
	menu_2.visible = false


func _on_facil_pressed() -> void:
	# Define o a Dificuldade do Modo Um Jogador para Facil.
	global.atraso = 0.1
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_normal_pressed() -> void:
	# Define o a Dificuldade do Modo Um Jogador para Normal.
	global.atraso = 0.12
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_dificil_pressed() -> void:
	# Define o a Dificuldade do Modo Um Jogador para Dificil.
	global.atraso = 0.15
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_dificuldade_voltar_pressed() -> void:
	# Sai de escolha de dificuldade.
	menu_2.visible = true
	dificuldade.visible = false
