extends CharacterBody2D

# Parameters
@export var player_one: bool
var ai: bool

# Movements
const SPEED: int = 500

# Limits
const MIN_Y: float = 64
const MAX_Y: float = 654
const MAX_X_AI: float = 640
const MIN_X_AI: float = 0

# Objet
@onready var ball: Area2D = $"../Bola"


func _physics_process(delta: float) -> void:
	if ai:
		# Move the racket according to the y position of the ball.
		if ball.position.x >= MIN_X_AI and ball.position.x <= MAX_X_AI:
			position.y = move_toward(position.y, ball.position.y, SPEED * delta)
	
	else:
		# Player 1's Movement
		if player_one:
			var direction := Input.get_axis("mv-cima-1", "mv-baixo-1")
			if direction:
				velocity.y = direction * SPEED
			else:
				velocity.y = move_toward(velocity.y, 0, SPEED)
		
		# Player 2's Movement
		else:
			var direction := Input.get_axis("mv-cima-2", "mv-baixo-2")
			if direction:
				velocity.y = direction * SPEED
			else:
				velocity.y = move_toward(velocity.y, 0, SPEED)
	
	# Prevents the player from leaving the screen.
	position.y = clamp(position.y, MIN_Y, MAX_Y)
	
	move_and_slide()
