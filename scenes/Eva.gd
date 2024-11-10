extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 7
var velocidadnpc = 50

var main
var accion_realizada
var playerPlay
var direccion
var npc

func _ready():
	pass
	
func interaccionNivel1(direccion):
	match(direccion):
		0:
			$AnimacionJhonny.play("abajo")
		1:
			$AnimacionJhonny.play("izquierda")
		2:
			$AnimacionJhonny.play("up")
		3:
			$AnimacionJhonny.play("derecha")
			
func _physics_process(_delta):
	vel_actual = Vector2()
	
	# Obtener todos los nodos en el grupo "npc"
	var npc = get_tree().get_nodes_in_group("npcnivel1")

	if npc.size() > 0:
		npc = npc[0]  # Selecciona el primer NPC del grupo

		if npc is Node2D:
			# Asegúrate de que Logica.posicion sea un Vector2
			if typeof(Logica.posicion) == TYPE_VECTOR2:
				var posicion_jugador = Logica.posicion
				
				# Calcular la dirección hacia el jugador
				direccion = (posicion_jugador - npc.position).normalized()
				
				# Determinar la dirección y la animación del NPC
				
				if(Logica.MoverEva == true):
					if abs(posicion_jugador.x - npc.position.x) > abs(posicion_jugador.y - npc.position.y):
						# Movimiento horizontal
						if posicion_jugador.x < npc.position.x:
							
							$AnimacionJhonny.play("izquierda")
						else:
							$AnimacionJhonny.play("derecha")
					else:
						# Movimiento vertical
						if posicion_jugador.y < npc.position.y:
							$AnimacionJhonny.play("up")
						else:
							$AnimacionJhonny.play("abajo")
			else:
				pass
		else:
			pass
	else:
		pass

	if(Logica.MoverEva == true):
		npc.position += direccion * velocidadnpc * _delta
	move_and_collide(vel_actual)
