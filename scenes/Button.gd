extends TouchScreenButton

func _ready():
	# Conectar la señal de presión
	connect("pressed", self, "_on_Button_pressed")
	connect("released", self, "_on_Button_released")

func _on_Button_pressed():
	# Cambiar la opacidad al presionar
	modulate.a = 0.5  # Cambia la opacidad al 50%

func _on_Button_released():
	# Restaurar la opacidad al soltar
	modulate.a = 1.0  # Restaura la opacidad al 100%

