extends CanvasLayer

var vida
var maxVida

func _ready():
	pass

func _process(delta):
	vida = Logica.health
	maxVida = Logica.maxVida
	if(vida != null):
		$Node2D/TextureProgress.value = vida
		$Node2D/TextureProgress.max_value = maxVida
