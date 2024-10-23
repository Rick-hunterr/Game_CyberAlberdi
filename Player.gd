extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 3

func _ready():
	pass 

func _physics_process(_delta):
	vel_actual = Vector2()  # Reiniciar la velocidad actual

	if Input.is_action_pressed("tecla_W"):
		$DetectarTilsets.rotation_degrees = 0
		vel_actual.y = -vel_desp
		$AnimationPlayer.play("move-Up")
	elif Input.is_action_pressed("tecla_S"):
		$DetectarTilsets.rotation_degrees = 180
		vel_actual.y = vel_desp
		$AnimationPlayer.play("move-Down")
	elif Input.is_action_pressed("tecla_A"):
		$DetectarTilsets.rotation_degrees = 90
		vel_actual.x = -vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("tecla_D"):
		$DetectarTilsets.rotation_degrees = 270
		vel_actual.x = vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = false
	else:
		# Detener la animación si no hay teclas presionadas
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop()

	# Mover el objeto
	move_and_collide(vel_actual)

	# Obtener el número de tile
	if ($AnimationPlayer.is_playing()):
		var NumeroDeTile  = get_tree().get_nodes_in_group("tiles")[0].get_cellv(get_tree().get_nodes_in_group("tiles")[0].world_to_map($DetectarTilsets/Position2D.global_position))
		move_and_collide(vel_actual)
		print(NumeroDeTile)
