extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var mostrar = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Logica.MostrarCorrerEva == true && mostrar == true:
		var correr_eva = $KinematicBody2D/CorrerEva
		var eva = $KinematicBody2D/eva2
		eva.visible = false

		if correr_eva and correr_eva is AnimationPlayer:  # Verifica que el nodo exista y sea un AnimationPlayer
			correr_eva.play("Correr")
			print("Encontrado")
			mostrar = false


