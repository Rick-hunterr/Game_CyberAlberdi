extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 2

func _ready():
	pass 
	
func _physics_process(_delta):
	# Resetear la velocidad
	vel_actual = Vector2()  # Reiniciar la velocidad al inicio del frame

	if Input.is_action_pressed("tecla_W"):
		vel_actual.y = -vel_desp
		$AnimationPlayer.play("move-Up")
	elif Input.is_action_pressed("tecla_S"):
		vel_actual.y = vel_desp
		$AnimationPlayer.play("Move-Down")
	elif Input.is_action_pressed("tecla_A"):
		vel_actual.x = -vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = true
	elif Input.is_action_pressed("tecla_D"):
		vel_actual.x = vel_desp
		$AnimationPlayer.play("move-Derecha")
		$Sprite.flip_h = false
	else:
		if $AnimationPlayer.is_playing():
			var current_animation = $AnimationPlayer.current_animation
			var length = $AnimationPlayer.get_animation(current_animation).length
			$AnimationPlayer.stop()
			$AnimationPlayer.seek(length, true)

	# Mover el objeto
	move_and_collide(vel_actual)
