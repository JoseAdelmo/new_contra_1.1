extends KinematicBody2D

var gravity := 50
var direction := Vector2.ZERO
onready var bullet = preload("res://scenes/Bullet.tscn")
var b
var is_jumping = false

func _physics_process(delta):
	move()
	shoot($AnimatedSprite.flip_h)
	direction = move_and_slide(direction, Vector2.UP)

####################################################################################################
	#CONTROLE DE REPRODUÇÂO DA ANIMAÇÃO DO PERSONAGEM
	if is_on_floor() and !is_jumping:
		if direction.x != 0:
			$AnimatedSprite.play("run")
		else:
			$AnimatedSprite.play("idle")
	else:
		$AnimatedSprite.play("jump")
####################################################################################################
	
####################################################################################################
	#AÇÕES, ROTAÇÃO E ETC
func shoot(dir):
	if Input.is_action_just_pressed("attack"):
		b = bullet.instance()
		b.init(dir)
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		
func move():
	if !is_on_floor():
		gravity += 14
	if Input.is_action_pressed("move_right"):
		direction.x = 100
		$Position2D.position.x = 14.5
		$AnimatedSprite.flip_h = false
	elif Input.is_action_pressed("move_left"):
		$Position2D.position.x = -14.5
		direction.x = -100
		$AnimatedSprite.flip_h = true
	else:
		direction.x = 0
	if Input.is_action_just_pressed("jump") and is_on_floor():
		gravity = -350
		is_jumping = true
	
	if is_on_floor():
		is_jumping = false

	direction.y = gravity
####################################################################################################
