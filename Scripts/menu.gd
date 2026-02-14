extends Control

# Menu
@onready var menu_1: VBoxContainer = $MarginContainer/CenterContainer/Menu1
@onready var menu_2: VBoxContainer = $MarginContainer/CenterContainer/Menu2


func _on_jogar_pressed() -> void:
	# Alterna entre menus.
	menu_1.visible = false
	menu_2.visible = true


func _on_sair_pressed() -> void:
	# Sai do jogo.
	get_tree().quit()


func _on_um_jogador_pressed() -> void:
	# Iniciar jogo em Modo Um Jogador.
	global.ia = true
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_dois_jogadores_pressed() -> void:
	# Inicia o jogo em Modo Dois Jogadores.
	global.ia = false
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_voltar_pressed() -> void:
	# Sai do Menu de Escolha Um Jogador/Dois Jogadores para Menu Principal.
	menu_1.visible = true
	menu_2.visible = false
