extends Node2D

onready var boton = $Controles/accion

onready var caja1 = $caja1  # Asegúrate de que sean RigidBody2D
onready var caja2 = $caja2
onready var caja3 = $caja3
onready var caja4 = $caja4
onready var caja5 = $caja5
onready var caja6 = $caja6
onready var caja7 = $caja7
onready var caja8 = $caja8
onready var caja9 = $caja9

export (int) var damage = 20
export (float) var velocidad_horizontal = 500  # Cambia el nombre a velocidad_horizontal

func _ready():
	# Inicializa la gravedad en 0
	set_gravity_scale(0)

func _process(delta):
	if Input.is_action_just_pressed("tecla_X"):
		boton.hide()
		mover_cajas(delta)  # Cambia el nombre a mover_cajas
		
	Completado()

func mover_cajas(delta):  # Cambia el nombre de hacer_caer_cajas a mover_cajas
	# Establece la velocidad horizontal
	caja1.linear_velocity.x = -velocidad_horizontal
	caja2.linear_velocity.x = -velocidad_horizontal
	caja3.linear_velocity.x = -velocidad_horizontal
	caja4.linear_velocity.x = -velocidad_horizontal
	caja5.linear_velocity.x = -velocidad_horizontal
	caja6.linear_velocity.x = -velocidad_horizontal
	caja7.linear_velocity.x = -velocidad_horizontal
	caja8.linear_velocity.x = -velocidad_horizontal
	caja9.linear_velocity.x = -velocidad_horizontal

func set_gravity_scale(value):
	caja1.gravity_scale = value
	caja2.gravity_scale = value
	caja3.gravity_scale = value
	caja4.gravity_scale = value
	caja5.gravity_scale = value
	caja6.gravity_scale = value
	caja7.gravity_scale = value
	caja8.gravity_scale = value
	caja9.gravity_scale = value

func Completado():
	var limite_derecho = -100  # Ajusta según el límite de tu escena
	print(caja9.position.x)
	if caja9.position.x <= limite_derecho && Logica.health > 0:
		Logica.NivelCompletado = true
