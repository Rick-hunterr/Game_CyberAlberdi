extends Node2D

<<<<<<< HEAD

func _ready():
=======
export (PackedScene) var player
export (PackedScene) var MapaInicio
export (PackedScene) var Callejon

var nivelActual = 1

func _ready():
	
>>>>>>> 8bdcfbc (Juego con las caracteristicas principales terminadas)
	# Instanciar el mapa
	var lvl1 = MapaInicio.instance()
	add_child(lvl1)
	
	# Instanciar el jugador
	var newPlayer = player.instance()
	add_child(newPlayer)
	
<<<<<<< HEAD
	# Verificar el grupo "spawn"
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
=======
	# Obtener nodos del grupo "spawn"
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
	print("Nodos en el grupo 'spawn': ", spawn_nodes)  # Mensaje de depuración
	
>>>>>>> 8bdcfbc (Juego con las caracteristicas principales terminadas)
	if spawn_nodes.size() > 0:
		newPlayer.global_position = spawn_nodes[0].global_position
	else:
		print("Error: No hay nodos en el grupo 'spawn'.")
<<<<<<< HEAD
=======

func CambiarEscena():
	match nivelActual:
		1:
			pass
			get_tree().get_nodes_in_group("nivel")[0].queue_free()
		2:
			pass
>>>>>>> 8bdcfbc (Juego con las caracteristicas principales terminadas)
