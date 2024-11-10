extends Node2D

onready var boton = $Controles/accion

onready var caja1 = $caja1  # Asegúrate de que sean RigidBody2D
onready var caja2 = $caja2
onready var caja3 = $caja3
onready var caja4 = $caja4
onready var lazer1 = $lazer1
onready var lazer2 = $lazer2
onready var lazer3 = $lazer3
onready var lazer4 = $lazer4
onready var lazer5 = $lazer5
onready var lazer6 = $lazer6
onready var lazer7 = $lazer7
onready var lazer8 = $lazer8

export (int) var damage = 60
export (float) var velocidad_horizontal = 500  # Cambia el nombre a velocidad_horizontal
export (float) var velocidad_caida = 350

var speed = 0

func _ready():
	# Inicializa la gravedad en 0
	set_gravity_scale(0)

func _process(delta):
		
	if Input.is_action_just_pressed("tecla_X"):
		boton.hide()
		
		caja1.linear_velocity.y = velocidad_caida
		caja2.linear_velocity.y = velocidad_caida
		caja3.linear_velocity.y = velocidad_caida
		caja4.linear_velocity.y = velocidad_caida
		lazer1.linear_velocity.x = velocidad_horizontal
		lazer2.linear_velocity.x = velocidad_horizontal
		lazer3.linear_velocity.y = velocidad_caida
		lazer4.linear_velocity.y = velocidad_caida
		lazer5.linear_velocity.y = velocidad_caida
		
		speed = 250
		
	
	lazer6.position.y -= speed * delta
	lazer7.position.y -= speed * delta
	lazer8.position.y -= speed * delta
	
	Completado()

func set_gravity_scale(value):
	caja1.gravity_scale = value
	caja2.gravity_scale = value
	caja3.gravity_scale = value
	caja4.gravity_scale = value
	lazer1.gravity_scale = value
	lazer2.gravity_scale = value
	lazer3.gravity_scale = value
	lazer4.gravity_scale = value
	lazer5.gravity_scale = value

func Completado():
	var limite_derecho = 1500  # Ajusta según el límite de tu escena

	if caja4.position.y >= limite_derecho && Logica.health > 0:
		Logica.NivelCompletado = true
