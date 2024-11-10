extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp
var main

func _ready():
	main = get_tree().get_nodes_in_group("main")[0]
	$DetectarTilsets/RayCast2D.add_exception(self)
func _physics_process(_delta):
	var vel_actual = Vector2()
	
	vel_desp = Logica.VelocidadCorazon
	# Movimientos Diagonales
	if Input.is_action_pressed("tecla_W") and Input.is_action_pressed("tecla_D"):
		$DetectarTilsets.rotation_degrees = 45
		vel_actual = Vector2(vel_desp, -vel_desp)
	elif Input.is_action_pressed("tecla_W") and Input.is_action_pressed("tecla_A"):
		$DetectarTilsets.rotation_degrees = 315
		vel_actual = Vector2(-vel_desp, -vel_desp)
	elif Input.is_action_pressed("tecla_S") and Input.is_action_pressed("tecla_D"):
		$DetectarTilsets.rotation_degrees = 135
		vel_actual = Vector2(vel_desp, vel_desp)
	elif Input.is_action_pressed("tecla_S") and Input.is_action_pressed("tecla_A"):
		$DetectarTilsets.rotation_degrees = 225
		vel_actual = Vector2(-vel_desp, vel_desp)
	# Movimientos en Línea Recta
	elif Input.is_action_pressed("tecla_W"):
		$DetectarTilsets.rotation_degrees = 0
		vel_actual.y = -vel_desp
	elif Input.is_action_pressed("tecla_S"):
		$DetectarTilsets.rotation_degrees = 180
		vel_actual.y = vel_desp
	elif Input.is_action_pressed("tecla_A"):
		$DetectarTilsets.rotation_degrees = 270
		vel_actual.x = -vel_desp
	elif Input.is_action_pressed("tecla_D"):
		$DetectarTilsets.rotation_degrees = 90
		vel_actual.x = vel_desp
		
	else:
		# Detener la animación si no hay teclas presionadas
		if $AnimationPlayer.is_playing():
			$AnimationPlayer.stop()
				
	move_and_collide(vel_actual)

func damage_jugador(damage):
	Logica.health -= damage
	print("Daño recibido: ", damage)
	print("Salud restante: ", Logica.health)

func velocidad_jugador(velocidad):
	Logica.VelocidadCorazon -= velocidad
	
func _on_Huurtbox_area_entered(area):
	# Asegúrate de que el nodo enemigo esté correctamente referenciado
	var enemigo = area.get_parent()
	
	if enemigo.is_in_group("enemigo"):
		print("Enemigo detectado")
		if area.get_parent().is_in_group("enemigo"):
			damage_jugador(area.get_parent().damage)
			print("El enemigo tiene la propiedad 'damage'")
		else:
			print("El enemigo no tiene la propiedad 'damage'")
	else:
		print("No funciona", enemigo)
		
	if enemigo.is_in_group("enemigo"):
		print("Enemigo detectado")
		if area.get_parent().is_in_group("enemigo"):
			velocidad_jugador(area.get_parent().velocidad)
			print("El enemigo tiene la propiedad 'damage'")
		else:
			print("El enemigo no tiene la propiedad 'damage'")
	else:
		print("No funciona", enemigo)
