extends Node2D

onready var boton = $Controles/accion
onready var cuchillos = [
	$cuchillo1, $cuchillo2, $cuchillo3, $cuchillo4, $cuchillo5, 
	$cuchillo6, $cuchillo7, $cuchillo8, $cuchillo9, $cuchillo10, 
	$cuchillo11, $cuchillo12, $cuchillo13, $cuchillo14, $cuchillo15, 
	$cuchillo16, $cuchillo17, $cuchillo18, $cuchillo23, $cuchillo24,
	$cuchillo25, $cuchillo26, $cuchillo27, $cuchillo28, $cuchillo29, 
	$cuchillo30, $cuchillo31, $cuchillo32
]

onready var cuchillo19 = $cuchillo19
onready var cuchillo20 = $cuchillo20
onready var cuchillo21 = $cuchillo21
onready var cuchillo22 = $cuchillo22
onready var cuchillo33 = $cuchillo33
onready var cuchillo34 = $cuchillo34
onready var cuchillo35 = $cuchillo35

export (int) var damage = 80
export (float) var velocidad_horizontal = 700
export (float) var velocidad_caida = 700
export (float) var VelocidadAtaquesQueSiguen = 500  # Velocidad de aproximación

var direccion = Vector2()
var lanzado_index = 0  # Índice del cuchillo que se lanzará
var rotar = true       # Control de rotación
var timer              # Temporizador para el lanzamiento
var lanzarCuchillos2 = false
var lanzarCuchillosExtra = false
var lanzado2 = false

var mover = true
var restart = true

func _ready():
	set_gravity_scale(0)
	# Crear el temporizador pero no iniciarlo
	timer = Timer.new()     
	timer.wait_time = 0.5    # Configurar el tiempo de espera entre lanzamientos
	timer.one_shot = false   # Repetir el temporizador
	add_child(timer)         # Añadir el temporizador al nodo
	timer.connect("timeout", self, "_on_Timer_timeout")  # Conectar la señal de timeout

	boton.connect("pressed", self, "_on_Boton_pressed")  # Conectar el botón

func _process(delta):
	if rotar and lanzado_index < cuchillos.size():
		rotar_cuchillos(delta)
	Completado()
	lanzar_cuchillos2()
	girar_cuchillos()
	print(cuchillo19.position)
	
func girar_cuchillos():
	# Verifica si la posición en X de cuchillo19 es mayor o igual a 2000 y si 'mover' es verdadero
	if  cuchillo19.position.x >= 2000 and mover == true:
		# Rota los cuchillos 33, 34 y 35 continuamente
		cuchillo33.rotation_degrees += 4
		cuchillo34.rotation_degrees += 3
		cuchillo35.rotation_degrees += 3
		
		# Configura los cuchillos 33, 34 y 35 para que sigan al jugador
		if restart == true:
			lanzado_index = 0
			restart = false
		VelocidadAtaquesQueSiguen = 2000

		# Recalcula la dirección hacia el jugador para los cuchillos 33, 34 y 35
		
		var posicion_jugador = Logica.posicion
		direccion = (posicion_jugador - cuchillo33.position).normalized()
		cuchillo33.linear_velocity = direccion * 2000

		

func lanzar_cuchillos2():
	# Lanzar cuchillos 19 y 20 en direcciones opuestas
	if lanzarCuchillos2 == true and not lanzado2:
		cuchillo19.linear_velocity.x = velocidad_horizontal
		cuchillo20.linear_velocity.x = -velocidad_horizontal
		lanzado2 = true  # Cambia el estado a lanzado

		# Programar el lanzamiento de cuchillos 21 y 22
		yield(get_tree().create_timer(2.0), "timeout")  # Esperar un segundo
		lanzar_cuchillos_extra()

func lanzar_cuchillos_extra():
	# Lanzar cuchillo21 hacia abajo y cuchillo22 hacia arriba
	if not lanzarCuchillosExtra:
		cuchillo21.linear_velocity = Vector2(0, velocidad_caida)    # Cuchillo 21 cae hacia abajo
		cuchillo22.linear_velocity = Vector2(0, -velocidad_caida)   # Cuchillo 22 sube hacia arriba
		lanzarCuchillosExtra = true  # Marca que los cuchillos extras han sido lanzados

func rotar_cuchillos(delta):
	# Rotar cuchillos hacia el jugador solo si no han sido lanzados
	for i in range(lanzado_index, cuchillos.size()):
		var cuchillo = cuchillos[i]
		if cuchillo is RigidBody2D:
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				direccion = (posicion_jugador - cuchillo.position).normalized()
				var angulo = direccion.angle()
				cuchillo.rotation = angulo  # Apunta el cuchillo hacia el jugador

func _on_Boton_pressed():
	boton.hide()          # Ocultar el botón cuando se presiona
	timer.start()         # Iniciar el temporizador para el lanzamiento automático

func _on_Timer_timeout():
	if lanzado_index < cuchillos.size():
		lanzar_cuchillo()
	else:
		timer.stop()          # Detener el temporizador cuando todos los cuchillos han sido lanzados
		rotar = false 
		lanzarCuchillos2 = true

func lanzar_cuchillo():
	if lanzado_index < cuchillos.size():
		var cuchillo = cuchillos[lanzado_index]
		if cuchillo is RigidBody2D and typeof(Logica.posicion) == TYPE_VECTOR2:
			var posicion_jugador = Logica.posicion
			velocidad_horizontal = 900
			direccion = (posicion_jugador - cuchillo.position).normalized()
			cuchillo.linear_velocity = direccion * velocidad_horizontal
		lanzado_index += 1
	else:
		print("Índice fuera de rango para cuchillos")


func set_gravity_scale(value):
	for cuchillo in cuchillos:
		cuchillo.gravity_scale = value
	cuchillo19.gravity_scale = value
	cuchillo20.gravity_scale = value
	cuchillo21.gravity_scale = value
	cuchillo22.gravity_scale = value

func Completado():
	var limite_derecho = 6000
	if cuchillo19.position.x >= limite_derecho and Logica.health > 0:
		Logica.NivelCompletado = true
		print("Nivel completado")
