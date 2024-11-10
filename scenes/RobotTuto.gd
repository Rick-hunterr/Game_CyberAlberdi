extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 6
var velocidadnpc = 30
var main
var accion_realizada
var playerPlay
var direccion
var npc

func _ready():
	pass
	
	
func interaccionNivel1(direccion):
	
	match(direccion):
		1:
			$AnimacionRoberto.play("izquierda")
		3:
			$AnimacionRoberto.play("derecha")
			
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
				
				# Determinar si el NPC está a la izquierda o a la derecha
				if posicion_jugador.x < npc.position.x:
					$AnimacionRobot1.play("derecha")
					$Sprite.flip_h = true
				elif posicion_jugador.x > npc.position.x:
					$AnimacionRobot1.play("derecha")
					$Sprite.flip_h = false
				else:
					pass
			else:
					pass
		else:
					pass
	else:
					pass
	if(Logica.empezarCombate == true):
		npc.position += direccion * velocidadnpc * _delta
	move_and_collide(vel_actual)
