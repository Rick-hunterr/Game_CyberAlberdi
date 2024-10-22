extends Node2D


func _ready():
	# Instanciar el mapa
	var lvl1 = MapaInicio.instance()
	add_child(lvl1)
	
	# Instanciar el jugador
	var newPlayer = player.instance()
	add_child(newPlayer)
	
	# Verificar el grupo "spawn"
	var spawn_nodes = get_tree().get_nodes_in_group("spawn")
	if spawn_nodes.size() > 0:
		newPlayer.global_position = spawn_nodes[0].global_position
	else:
		print("Error: No hay nodos en el grupo 'spawn'.")
