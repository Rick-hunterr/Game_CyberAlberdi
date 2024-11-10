extends KinematicBody2D

var vel_actual = Vector2()
var vel_desp = 5
var velocidadnpc = 50
var main
var accion_realizada
var playerPlay
var direccion
var npc
export (Array) var dialogo_1

func _ready():
	pass
	
	
func interaccion(direccion):
	Logica.ReproducirTextoNpc(dialogo_1.duplicate())
	
	match(direccion):
		0:
			$AnimacionRoberto.play("abajo")
		1:
			$AnimacionRoberto.play("izquierda")
		2:
			$AnimacionRoberto.play("up")
		3:
			$AnimacionRoberto.play("derecha")
			
func _physics_process(_delta):
	vel_actual = Vector2()
	
	if(Logica.robot == true && Logica.Moviendo == true):
		
			# Obtener todos los nodos en el grupo "npc"
		var ROBerTo = get_tree().get_nodes_in_group("npc")

		if ROBerTo.size() > 0:
			npc = ROBerTo[0]  # Selecciona el primer NPC del grupo

			if npc is Node2D:
				# Asegúrate de que Logica.posicion sea un Vector2
				if typeof(Logica.posicion) == TYPE_VECTOR2:
					var posicion_jugador = Logica.posicion
					# Calcular la dirección hacia el jugador
					direccion = (posicion_jugador - npc.position).normalized()
					
				else:
					print("Logica.posicion no es un Vector2.")
			else:
				print("El nodo no es un Node2D.")
		else:
			print("No hay NPCs en el grupo.")
		
		npc.position += direccion * velocidadnpc * _delta
		if Input.is_action_pressed("tecla_W"):
				$DetectarTilsets.rotation_degrees = 0
				vel_actual.y = -vel_desp
				$AnimacionRoberto.play("up")
		elif Input.is_action_pressed("tecla_S"):
				$DetectarTilsets.rotation_degrees = 180
				vel_actual.y = vel_desp
				$AnimacionRoberto.play("abajo")
		elif Input.is_action_pressed("tecla_A"):
				$DetectarTilsets.rotation_degrees = 270
				vel_actual.x = -vel_desp
				$AnimacionRoberto.play("izquierda")
		elif Input.is_action_pressed("tecla_D"):
				$DetectarTilsets.rotation_degrees = 90
				vel_actual.x = vel_desp
				$AnimacionRoberto.play("derecha")
				$Sprite.flip_h = false
	move_and_collide(vel_actual)
