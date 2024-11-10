extends Node2D

onready var boton = $Controles/accion

onready var punch = $punch
onready var punch2 = $punch2
onready var punch3 = $punch3
onready var punch4 = $punch4

export (int) var damage = 50
export (float) var velocidad_horizontal = 300  # Cambia el nombre a velocidad_horizontal
export (float) var velocidad_caida = 350

var speed = 0

func _ready():
	# Inicializa la gravedad en 0
	set_gravity_scale(0)

func _process(delta):
		
	if Input.is_action_just_pressed("tecla_X"):
		boton.hide()
		
		punch.linear_velocity.x = velocidad_horizontal
		punch3.linear_velocity.x = -velocidad_horizontal
		
		speed = 450
		
	punch2.position.y -= speed * delta
	
	Completado()

func set_gravity_scale(value):
	punch.gravity_scale = value

func Completado():
	var limite_derecho = 1500  # Ajusta según el límite de tu escena

	if punch4.position.y >= limite_derecho && Logica.health > 0:
		Logica.NivelCompletado = true
