extends Area2D


# Movimento
const VELOCIDADE: int = 500
const POSICAO_INICIAL: Vector2 = Vector2(640, 360)
var direcao_inicial: Vector2 = Vector2(0, 0)
var nova_direcao: Vector2 = Vector2(0, 0)

# Limites
const X_MIN: float = 0
const X_MAX: float = 1280
const Y_MIN: float = 0
const Y_MAX: float = 720

# Efeitos Sonoros
@onready var som_impacto_barreira: AudioStreamPlayer = $SomImpactoBarreira
@onready var som_impacto_jogador: AudioStreamPlayer = $SomImpactoJogador

# Timer
@onready var timer: Timer = $Timer


func _ready() -> void: rodar_timer()


func _physics_process(delta: float) -> void:
	movimentar_bola(delta)
	colidir_com_as_paredes()


func rodar_timer() -> void: timer.start()


func resetar_bola() -> void:
	# Centraliza a Bola e a manda para uma direção aleatoria
	position = POSICAO_INICIAL
	escolher_direcao_inicial()


func escolher_direcao_inicial() -> void:
	# Escolhe as direções horizontal e vertical.
	var x_aleatorio = [-1, 1].pick_random()
	var y_aleatorio = [-1, 1].pick_random()
	
	# Aplica as novas direções
	direcao_inicial = Vector2(x_aleatorio, y_aleatorio)
	nova_direcao = direcao_inicial


func movimentar_bola(delta: float) -> void:
	# Movimenta a Bola
	position += nova_direcao * VELOCIDADE * delta


func colidir_com_as_paredes() -> void:
	# Manda a Bola na direção contrária ao tentar sair da tela.
	# Funciona fora dos limites do campo e deve funcionar para que a bola
	# sempre rebata em direcao a colisao do gol,
	# tirando a necessidade de aumentar a escala da colisao.
	if position.y >= Y_MAX or position.y <= Y_MIN:
		nova_direcao.y *= -1
		
		# Impede que o efeito sonoro de Impacto na Barreira toque fora dos limites do campo.
		if position.x >= X_MIN and position.x <= X_MAX:
			som_impacto_barreira.play()


func _on_body_entered(body: Node2D) -> void:
	# Manda a Bola na direcao contraria ao colidir com os jogadores
	if body.is_in_group("jogadores"):
		nova_direcao.x *= -1
		som_impacto_jogador.play()


func _on_timer_timeout() -> void: resetar_bola()
