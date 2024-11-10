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
export (float) var velocidad_caida = 250

func _ready():
	# Inicializa la gravedad en 0
	set_gravity_scale(0)

func _process(delta):
	if Input.is_action_just_pressed("tecla_X"):
		boton.hide()
		hacer_caer_cajas(delta)
		
	Completado()

func hacer_caer_cajas(delta):
	
	set_gravity_scale(1)

	# Establece la velocidad de caída
	caja1.linear_velocity.y = velocidad_caida
	caja2.linear_velocity.y = velocidad_caida
	caja3.linear_velocity.y = velocidad_caida
	caja4.linear_velocity.y = velocidad_caida
	caja5.linear_velocity.y = velocidad_caida
	caja6.linear_velocity.y = velocidad_caida
	caja7.linear_velocity.y = velocidad_caida
	caja8.linear_velocity.y = velocidad_caida
	caja9.linear_velocity.y = velocidad_caida

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
	var limite_inferior = 500

	if caja9.position.y >= limite_inferior && Logica.health > 0:
		print("BB")
		Logica.NivelCompletado = true

