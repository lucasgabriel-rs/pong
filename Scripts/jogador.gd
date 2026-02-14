extends CharacterBody2D

# Parametros
@export var jogador1: bool
var ia: bool
const IA_DEADZONE_MAX: float = 640
const IA_DEADZONE_MIN: float = 0

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
		# Move a raquete de acordo com a posicao y da bola.
		if bola.position.x >= IA_DEADZONE_MIN and bola.position.x <= IA_DEADZONE_MAX:
			position.y = move_toward(position.y, bola.position.y, VELOCIDADE * delta)
	
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
