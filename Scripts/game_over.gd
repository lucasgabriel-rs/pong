extends ColorRect

# Placar
@onready var pontuacao_j1: Label = $MarginContainer/CenterContainer/HBoxContainer/PontuacaoJ1
@onready var pontuacao_j2: Label = $MarginContainer/CenterContainer/HBoxContainer/PontuacaoJ2


func _ready() -> void:
	# Atualizacao do Placar
	pontuacao_j1.text = str(global.pontuacao_j1)
	pontuacao_j2.text = str(global.pontuacao_j2)


func _on_jogar_novamente_pressed() -> void:
	# Jogar novamente.
	get_tree().change_scene_to_file("res://Scenes/main.tscn")


func _on_sair_pressed() -> void:
	# Sair para o menu principal.
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
