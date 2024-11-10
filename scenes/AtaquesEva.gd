extends Node2D

onready var boton = $Controles/accion
onready var cuchillos = []
onready var cuchillos_extra = [$cuchillo19, $cuchillo20, $cuchillo21, $cuchillo22]

export (int) var damage = 1
export (float) var velocidad_horizontal = 900
export (float) var velocidad_caida = 500
export (float) var VelocidadAtaquesQueSiguen = 1000  # Velocidad de aproximación

var direccion = Vector2()
var lanzado_index = 0  # Índice del cuchillo que se lanzará
var rotar = true       # Control de rotación
var timer              # Temporizador para el lanzamiento
var lanzarCuchillos2 = false

func _ready():
	# Cargar los cuchillos en la lista hasta cuchillo67 de forma automática
	for i in range(1, 68):
		var cuchillo = get_node("cuchillo%d" % i)
		if cuchillo:
			cuchillos.append(cuchillo)

	set_gravity_scale(0)
	timer = Timer.new()
	timer.wait_time = 0.3
	timer.one_shot = false
	add_child(timer)
	timer.connect("timeout", self, "_on_Timer_timeout")

	boton.connect("pressed", self, "_on_Boton_pressed")  # Conectar el botón

func _process(delta):
	if rotar and lanzado_index < cuchillos.size():
		rotar_cuchillos(delta)
	Completado()

func rotar_cuchillos(delta):
	for i in range(lanzado_index, cuchillos.size()):
		var cuchillo = cuchillos[i]
		if cuchillo is RigidBody2D:
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				direccion = (posicion_jugador - cuchillo.position).normalized()
				var angulo = direccion.angle()
				cuchillo.rotation = angulo

func _on_Boton_pressed():
	boton.hide()
	timer.start()  # Iniciar el temporizador para el lanzamiento automático

func _on_Timer_timeout():
	if lanzado_index < cuchillos.size():
		lanzar_cuchillo()
	else:
		timer.stop()
		rotar = false
		lanzarCuchillos2 = true  # Habilitar el lanzamiento de los cuchillos extra

	if lanzarCuchillos2:
		lanzar_cuchillos_extra()

func lanzar_cuchillo():
	var cuchillo = cuchillos[lanzado_index]
	if cuchillo is RigidBody2D and typeof(Logica.posicion) == TYPE_VECTOR2:
		var posicion_jugador = Logica.posicion
		direccion = (posicion_jugador - cuchillo.position).normalized()
		cuchillo.linear_velocity = direccion * velocidad_horizontal
	lanzado_index += 1

func lanzar_cuchillos_extra():
	cuchillos_extra[0].linear_velocity = Vector2(0, velocidad_caida)
	cuchillos_extra[1].linear_velocity = Vector2(0, -velocidad_caida)
	lanzarCuchillos2 = false

func set_gravity_scale(value):
	for cuchillo in cuchillos + cuchillos_extra:
		cuchillo.gravity_scale = value

func Completado():
	var limite_derecho = 6700
	if cuchillos_extra[0].position.x >= limite_derecho and Logica.health > 0:
		Logica.NivelCompletado = true
		print("Nivel completado")
