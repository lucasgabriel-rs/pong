extends CharacterBody2D

# Parametro
@export var jogador1: bool
var ia: bool

# Movimento
const VELOCIDADE: int = 500

# Limites
const Y_MIN: float = 64
const Y_MAX: float = 654

# Objeto
@onready var bola: Area2D = $"../Bola"


func _physics_process(delta: float) -> void:
	_movimentar_jogador(delta)
	_limitar_movimento_do_jogador()
	move_and_slide()


func _movimentar_jogador(delta: float) -> void:
	if ia:
		var target_y = bola.position.y
		
		# A variavel atraso controla o "atraso". Quanto menor, mais lenta a reacao.
		position.y = lerp(position.y, target_y, global.atraso)
	
	else:
		# Movimento do Jogador 1
		if jogador1:
			if Input.is_action_pressed("mv-cima-1"):
				position.y -= VELOCIDADE * delta
			elif Input.is_action_pressed("mv-baixo-1"):
				position.y += VELOCIDADE * delta
		
		# Movimento do Jogador 2
		else:
			if Input.is_action_pressed("mv-cima-2"):
				position.y -= VELOCIDADE * delta
			elif Input.is_action_pressed("mv-baixo-2"):
				position.y += VELOCIDADE * delta


func _limitar_movimento_do_jogador() -> void:
	# Impede que o jogador saia da tela
	position.y = clamp(position.y, Y_MIN, Y_MAX)
