extends Node2D

export (int) var damage = 20

export (int) var velocidad

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Logica.NivelActual == "AtaquesEva"):
		damage = 15
		velocidad = 0.4
#	pass
