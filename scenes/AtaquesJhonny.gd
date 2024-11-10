extends Node2D

onready var boton = $Controles/accion
onready var cuchillo1 = $cuchillo1
onready var cuchillo2 = $cuchillo2
onready var cuchillo3 = $cuchillo3
onready var cuchillo4 = $cuchillo4
onready var cuchillo5 = $cuchillo5
onready var cuchillo6 = $cuchillo6
onready var cuchillo7 = $cuchillo7
onready var cuchillo8 = $cuchillo8
onready var cuchillo9 = $cuchillo9
onready var cuchillo10 = $cuchillo10
onready var cuchillo11 = $cuchillo11
onready var cuchillo12 = $cuchillo12
onready var cuchillo13 = $cuchillo13
onready var cuchillo14 = $cuchillo14
onready var cuchillo15 = $cuchillo15
onready var cuchillo16 = $cuchillo16
onready var cuchillo17 = $cuchillo17
onready var cuchillo18 = $cuchillo18
onready var cuchillo19 = $cuchillo19
onready var cuchillo20 = $cuchillo20
onready var cuchillo21 = $cuchillo21
onready var cuchillo22 = $cuchillo22
onready var cuchillo23 = $cuchillo23
onready var cuchillo24 = $cuchillo24

export (int) var damage = 70
export (float) var velocidad_horizontal = 500
export (float) var velocidad_caida = 350
export (float) var VelocidadAtaquesQueSiguen = 100  # Velocidad de aproximación

var direccion = Vector2()
var lanzado = false
var lanzado2 = false
var delta
var rotar = true
var lanzarCuchillos2 = false
	
func _ready():
	set_gravity_scale(0)
	
func _process(delta):
	if Input.is_action_just_pressed("tecla_X"):
		boton.hide()
		mover_cajas(delta)
		lanzar_cuchillos()
	else:
		if not lanzado:
			rotar_cuchillos(delta)
		if not lanzado2:
			rotar_cuchillos2(delta)
	delta = delta
	
	Completado()
	lanzar_cuchillos2()
	print(cuchillo1.position)
	garfios(delta)
	hacer_caer_cuchillos(delta)
	
func mover_cajas(delta):
	# Establece la velocidad horizontal
	cuchillo1.linear_velocity.x = velocidad_horizontal
	cuchillo2.linear_velocity.x = -velocidad_horizontal

func rotar_cuchillos(delta):
	# Rotar cuchillos 3 a 8 hacia el jugador
	for cuchillo in [cuchillo3, cuchillo4, cuchillo5, cuchillo6, cuchillo7, cuchillo8]:
		if cuchillo is RigidBody2D:  # Verifica que sea un RigidBody2D
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				# Calcular la dirección hacia el jugador
				direccion = (posicion_jugador - cuchillo.position).normalized()
				# Calcular el ángulo de rotación
				var angulo = direccion.angle()
				cuchillo.rotation = angulo  # Apunta el cuchillo hacia el jugador
				
func rotar_cuchillos2(delta):
	# Rotar cuchillos 3 a 8 hacia el jugador
	for cuchillo2 in [cuchillo11, cuchillo12, cuchillo13, cuchillo14, cuchillo15, cuchillo16, cuchillo17, cuchillo18, cuchillo19, cuchillo20, cuchillo21, cuchillo22]:

		if cuchillo2 is RigidBody2D:  # Verifica que sea un RigidBody2D
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				# Calcular la dirección hacia el jugador
				direccion = (posicion_jugador - cuchillo2.position).normalized()
				# Calcular el ángulo de rotación
				var angulo = direccion.angle()
				cuchillo2.rotation = angulo  # Apunta el cuchillo hacia el jugador
				
func lanzar_cuchillos():
	# Lanza cuchillos 3 a 8
	for cuchillo in [cuchillo3, cuchillo4, cuchillo5, cuchillo6, cuchillo7, cuchillo8]:
		if cuchillo is RigidBody2D:  # Verifica que sea un RigidBody2D
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				# Calcular la dirección hacia el jugador
				direccion = (posicion_jugador - cuchillo.position).normalized()
				cuchillo.linear_velocity = direccion * velocidad_horizontal  # Lanza el cuchillo
		lanzado = true  # Cambia el estado a lanzado

func lanzar_cuchillos2():
	if(lanzarCuchillos2 == true):
		for cuchillo2 in [cuchillo11, cuchillo12, cuchillo13, cuchillo14, cuchillo15, cuchillo16, cuchillo17, cuchillo18, cuchillo19, cuchillo20, cuchillo21, cuchillo22]:

			if cuchillo2 is RigidBody2D:  # Verifica que sea un RigidBody2D
				if typeof(Logica.posicion) == TYPE_VECTOR2:
					var posicion_jugador = Logica.posicion
					# Calcular la dirección hacia el jugador
					direccion = (posicion_jugador - cuchillo2.position).normalized()
					cuchillo2.linear_velocity = direccion * velocidad_horizontal  # Lanza el cuchillo
			lanzado2 = true  # Cambia el estado a lanzado
			lanzarCuchillos2 = false
		
func garfios(delta):
	if cuchillo1.position.x >= 800 and rotar:
		cuchillo9.rotation_degrees += -200 * delta
		cuchillo10.rotation_degrees += 200 * delta
		if cuchillo1.position.x >= 2000:
			rotar = false
			lanzarCuchillos2 = true
	if cuchillo1.position.x >= 2800:
		rotar = true
		if cuchillo1.position.x >= 3000:
			rotar = false
	if cuchillo1.position.x >= 3500:
			rotar = true
			lanzarCuchillos2 = false

func hacer_caer_cuchillos(delta):
	if(cuchillo1.position.x >= 2500):
		set_gravity_scale(1)

		cuchillo23.linear_velocity.y = velocidad_caida
	if(cuchillo1.position.x >= 1000):

		cuchillo24.linear_velocity.y -= 200 * delta
		print("secumple")

func set_gravity_scale(value):
	for i in range(1, 24):
			var cuchillo = get_node("cuchillo" + str(i))
			cuchillo.gravity_scale = value

func Completado():
	var limite_derecho = 3800
	if cuchillo1.position.x >= limite_derecho and Logica.health > 0:
		Logica.NivelCompletado = true
		print("Nivel completado")

