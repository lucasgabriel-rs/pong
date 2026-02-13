extends CharacterBody2D

# Parametro
@export var jogador1 : bool

# Movimento
const VELOCIDADE : int = 500

# Limites
const Y_MIN: float = 64
const Y_MAX: float = 654

func _physics_process(delta: float) -> void:
	movimentar_jogador(delta)
	limitar_movimento_do_jogador()
	move_and_slide()


func movimentar_jogador(delta: float) -> void:
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


func limitar_movimento_do_jogador() -> void:
	# Impede que o jogador saia da tela
	position.y = clamp(position.y, Y_MIN, Y_MAX)
