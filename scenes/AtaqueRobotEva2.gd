extends Node2D

onready var boton = $Controles/accion
onready var cuchillos = [
	$cuchillo1, $cuchillo2, $cuchillo3, $cuchillo4, $cuchillo5, 
	$cuchillo6, $cuchillo7, $cuchillo8, $cuchillo9, $cuchillo10, 
	$cuchillo11, $cuchillo12, $cuchillo13, $cuchillo14, $cuchillo15, 
	$cuchillo16, $cuchillo17, $cuchillo18
]

export (int) var damage = 70
export (float) var velocidad_horizontal = 500
export (float) var velocidad_caida = 350
export (float) var VelocidadAtaquesQueSiguen = 100  # Velocidad de aproximación

var direccion = Vector2()
var lanzado_index = 0  # Índice del cuchillo que se lanzará
var rotar = true       # Control de rotación
var timer              # Temporizador para el lanzamiento

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
		rotar = false         # Detener la rotación

func lanzar_cuchillo():
	var cuchillo = cuchillos[lanzado_index]
	if cuchillo is RigidBody2D and typeof(Logica.posicion) == TYPE_VECTOR2:
		var posicion_jugador = Logica.posicion
		direccion = (posicion_jugador - cuchillo.position).normalized()
		cuchillo.linear_velocity = direccion * velocidad_horizontal
	lanzado_index += 1

func set_gravity_scale(value):
	for cuchillo in cuchillos:
		cuchillo.gravity_scale = value

func Completado():
	var limite_derecho = 3900
	if lanzado_index >= cuchillos.size() and Logica.health > 0:
		Logica.NivelCompletado = true
		print("Nivel completado")
