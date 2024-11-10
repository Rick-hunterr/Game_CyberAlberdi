extends KinematicBody2D

var vel_actual = Vector2()
<<<<<<< HEAD
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

=======
var vel_desp = 15
var main

func _ready():
	main = get_tree().get_nodes_in_group("main")[0]
	$DetectarTilsets/RayCast2D.add_exception(self)
func _physics_process(_delta):
	vel_actual = Vector2()
	if(!main.TextoOn):
		if Input.is_action_just_pressed("tecla_X"):
			interactuar_tile()
			ProcesarRaycast()
		elif Input.is_action_pressed("tecla_W"):
			$AnimacionRoberto.play("up")
			$DetectarTilsets.rotation_degrees = 0
			vel_actual.y = -vel_desp
		elif Input.is_action_pressed("tecla_S"):
			$AnimacionRoberto.play("abajo")
			$DetectarTilsets.rotation_degrees = 180
			vel_actual.y = vel_desp
		elif Input.is_action_pressed("tecla_A"):
			$AnimacionRoberto.play("izquierda")
			$DetectarTilsets.rotation_degrees = 270
			vel_actual.x = -vel_desp
		elif Input.is_action_pressed("tecla_D"):
			$AnimacionRoberto.play("derecha")
			$DetectarTilsets.rotation_degrees = 90
			vel_actual.x = vel_desp
			$Sprite.flip_h = false
		elif Input.is_action_pressed("Saltar"):
			main.CambiarEscena(-1)
			pass
		else:
		# Detener la animación si no hay teclas presionadas
			if $AnimacionRoberto.is_playing():
				$AnimacionRoberto.stop()
		
	
	elif(main.TextoOn):
		if Input.is_action_just_pressed("tecla_X"):
			Logica.ProcesarTexto()
			
>>>>>>> 8bdcfbc (Juego con las caracteristicas principales terminadas)
	# Mover el objeto
	move_and_collide(vel_actual)

	# Obtener el número de tile
<<<<<<< HEAD
	if ($AnimationPlayer.is_playing()):
		var NumeroDeTile  = get_tree().get_nodes_in_group("tiles")[0].get_cellv(get_tree().get_nodes_in_group("tiles")[0].world_to_map($DetectarTilsets/Position2D.global_position))
		move_and_collide(vel_actual)
		print(NumeroDeTile)
=======
	if $AnimacionRoberto.is_playing():
		var tiles = get_tree().get_nodes_in_group("tiles")
		if tiles.size() > 0:
			var tile_map = tiles[0]
			var tile_position = tile_map.world_to_map($DetectarTilsets/Position2D.global_position)
			var NumeroDeTile = tile_map.get_cellv(tile_position)
			
			match NumeroDeTile:
				42:
					main.CambiarEscena(1)
					
					pass
				46:
					main.CambiarEscena(2)
					pass
				225:
					main.CambiarEscena(3)
					
					pass
				222:
					main.CambiarEscena(4)
					
					pass
				221:
					main.CambiarEscena(6)
					
					pass
				137:
					main.CambiarEscena(5)
					
					pass
				
		
			if NumeroDeTile != -1:
				vel_actual = Vector2(0,0)
				if NumeroDeTile != 10:
					vel_actual = Vector2(0, 0)
					#print(NumeroDeTile)
					
func interactuar_tile():
	var tiles = get_tree().get_nodes_in_group("tiles")
	var tile_map = tiles[0]
	var tile_position = tile_map.world_to_map($DetectarTilsets/Position2D.global_position)
	var NumeroDeTile = tile_map.get_cellv(tile_position)
	
	print(NumeroDeTile)
	
	match NumeroDeTile:
				29:
					print("Botella de agua")
					pass
				31:
					print("Rueda")
				13:
					Logica.ReproducirTexto(1)
				303:
					Logica.ReproducirTexto(2)
				334:
					main.CambiarEscena(7)
					pass
				333:
					main.CambiarEscena(6)
					pass
func ProcesarRaycast():
	var objColisionado = $DetectarTilsets/RayCast2D.get_collider()
	if (objColisionado != null && objColisionado.is_in_group("npc")):
		
		match(int ($DetectarTilsets.rotation_degrees)):
			0:
				print("hola")
				objColisionado.interaccion(0)
				print("hola")
			90:
				objColisionado.interaccion(1)
				print("hola")
			180:
				objColisionado.interaccion(2)
				print("hola")
			270:
				objColisionado.interaccion(3)
				print("hola")
>>>>>>> 8bdcfbc (Juego con las caracteristicas principales terminadas)
