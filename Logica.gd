extends Node

var txtActual = 0
var texto = []
var OracionActual = ""
var ContadorLetra = 0
var robot
var Moviendo
var posicion
var NpcAlFrente
var NivelCompletado = false

#Aca se guardan un dato global que dice si derrotamos al enemigo
var NpcDerrotado = false
var Npc2Derrotado = false
var Npc3Derrotado = false
var Npc4Derrotado = false
var Npc5Derrotado = false
var Npc6Derrotado = false
var Npc7Derrotado = false
var Npc8Derrotado = false
var Npc9Derrotado = false
var Npc10Derrotado = false
var Npc11Derrotado = false
var Npc12Derrotado = false
var Npc13Derrotado = false
var Npc14Derrotado = false
var Npc15Derrotado = false
var Npc16Derrotado = false
var Npc17Derrotado = false

var MostrarComentario = true
var Mostrartxt = true
var Mostrartxt2 = true
var MostrarCristal2 = true
var MostrartxtMejorasPiratas = true
var MostrarDialogoRoberto = true
var MostrarCorrerEva = false

var CharlaEva = true
var CharlaEva2 = true
var CharlaEva3 = true
var MoverEva = false

var Laberinto2 = true

var txtJhonny = true
var MoverJhonny = false

var puzleCompletado = false
var cantidadLetras = 0
var Clave = ""

var CharlaLumina = true

var entregarCapsula = true
var entregarEscudo = true
var entregarCristal1 = true
var entregarVida = true
var entregarCristal3 = true
var entregarCristal4 = true

#MejorasPiratas
var Mejora1 = true
var Mejora2 = true
var Mejora3 = true
var Mejora4 = true
var Mejora5 = true
var Mejora6 = true

var empezarCombate
var vidaInicial = 100
var health : int = vidaInicial
var maxVida = 100
var VelocidadCorazon = 4

var NivelActual = ""

func ReproducirTexto(num):
	texto.clear()
	get_tree().get_nodes_in_group("gui")[0].get_node("bkgTxt").visible = true
	get_tree().get_nodes_in_group("gui")[0].get_node("txt").visible = true
	get_tree().get_nodes_in_group("main")[0].TextoOn = true
	get_tree().get_nodes_in_group("gui")[0].get_node("Timer").start()
	
	match(num):
		-1:
			if(MostrarDialogoRoberto == true):
				texto.append("ROB-erTo: Hola, muy buenas noches ser humano.")
				texto.append("ROB-erTo: Es un placer conocerte, me presento: soy ROB-erTo, tu robot especialista en materias de informática, programación y ciberseguridad.")
				texto.append("ROB-erTo: ¿Tú eres?")
				texto.append("No debería decírtelo.")
				texto.append("Ok, “No debería decírtelo”, el placer es todo mío.")
				texto.append("Eso me dejó visiblemente molesto, pero por lo menos no debía darle mi identidad al extraño robot.")
				texto.append("Podría aprovechar para sacarle información.")
				texto.append("¿Qué sabes de este lugar?")
				texto.append("ROB-erTo: Déjame escanear la ubicación…")
				texto.append("ROB-erTo: Según mi base de datos esto parece ser un cuartel criminal de algún tipo.")  # Podrías mostrar un holograma aquí
				texto.append("Interesante.")
				texto.append("Veo que podrías ser de gran utilidad para conseguir mi objetivo, los modelos como ustedes cuestan una fortuna de conseguir.")
				texto.append("ROB-erTo: Me alegra poder ayudar, ¿Cuál es ese objetivo que me cuentas?")
				texto.append("Estoy buscando los cristales del deseo para poder ir a los Alpes y cumplir mi sueño de toda la vida.")
				texto.append("ROB-erTo: ¿Cuál es ese sueño?")
				texto.append("Prefiero no decirlo.")
				texto.append("ROB-erTo: Está bien, guardaré tus preferencias y cambiaré el nombre de mi titular a “No debería decírtelo.”")
			MostrarDialogoRoberto = false

		1:
			texto.append("¡A entrenar, che!")
			texto.append("¡NO, no, no!")
			texto.append("Tengo que buscar los cristales")
			
		2:
			texto.append("¿Cómo hacían para ver en esto?")
			texto.append("¡Uy! El radar percibe fuertes señales de desiderium.")
			texto.append("Tengo que investigar, ¡no hay otra!")

		3:
			texto.append("ROB-erTo: ¡CUIDADO, loco!")
			texto.append("ROB-erTo: Al frente hay un enemigo.")
			texto.append("ROB-erTo: Yo estoy dañado, mis sistemas de ataque no funcionan.")
			texto.append("Fua servis para algo?")
			texto.append("ROB-erTo: Vas a tener que enfrentarlo vos.")
			texto.append("ROB-erTo: Tranquilo, yo te ayudo. Los enfrentamientos son fáciles.")
			texto.append("ROB-erTo: Si ya jugaste a Deltarune o Undertale, te va a ser fácil.")
			texto.append("ROB-erTo: La mecánica es la misma: tenés un corazón que es tu alma.")
			texto.append("ROB-erTo: Tenés que esquivar los ataques del enemigo mientras estás encerrado en un cuadrado.")
			texto.append("ROB-erTo: ¡Vamos, intentá!")
		4:
			texto.append("ROB-erTo: ¡Dale, qué fácil fue eso!")
			texto.append("ROB-erTo: Sigamos, que esto se pone interesante.")
		5:
			if(entregarCapsula == true):
				texto.append("ROB-erTo: ¡Opa! Tuviste suerte, encontraste una cápsula.")
				texto.append("ROB-erTo: Te va a servir para subir 25 PV de vida.")
				texto.append("100 + 25 PV❤❤❤💕💕❤❣🌹🤣💋🎉💀😎✨✍🖍🖊⚡🦁📜📜😎😎😎😎😎😎😎")
				get_tree().get_nodes_in_group("gui")[0].get_node("Capsula").visible = true
				vidaInicial += 25
				maxVida += 25
				entregarCapsula = false
			else:
				texto.append("Solo queda basura")
		6:
			texto.append("Que lindos captus")
		7:
				texto.append("ROB-erTo: Detecto objetos cerca")
				MostrarComentario = false
		8:
			texto.append("Primero, necesitas presionar la configuración de letras correcta para entrar.")
			texto.append("Pista: La clave tiene 8 letras")
		9:
			if(cantidadLetras <= 8):
				texto.append(Clave)
				if(Clave == "PHISHING"):
					texto.append("Clave Correcta")
					puzleCompletado = true
			else:
				texto.append("Clave incorrecta")
				cantidadLetras = 0
				Clave = ""
		10:
			texto.append("Persona misteriosa: Vaya, vaya. ¿Creen que sera tan facil quitarme el cristal?")
			texto.append("¡¿Quién eres?!")
			texto.append("Persona misteriosa: Déjame presentarme. Soy Johnny, jefe de seguridad de este lugar y por mis ratos libres un estafador sin escrúpulos.")
			texto.append("ROB-erTo: ¿Qué quieres de nosotros?")
			texto.append("Johnny: No mucho, solo ese pequeño cristal que ya llevan.")
			texto.append("¡Jamás te lo daré!")
			texto.append("Johnny: Entonces me veré inclinado a tomar medidas más drásticas.")
			texto.append("Johnny: ¡Prepárense!")
		11:
			if(entregarEscudo == true):
				texto.append("¿Que es esto?")
				texto.append("ROB-erTo: Un escudo de plasma")
				texto.append("ROB-erTo: Te va a servir para subir 10% tu resistencia")
				texto.append("+ 10% de resistencia❤❤❤💕💕❤❣🌹🤣💋🎉💀😎✨✍🖍🖊⚡🦁📜📜😎😎😎😎😎😎😎")
				get_tree().get_nodes_in_group("gui")[0].get_node("Escudo").visible = true
				vidaInicial += 25
				maxVida += 25
				entregarEscudo = false
			else:
				texto.append("Solo quedan cajas vacias")
		12:
			if(entregarCristal1 == true):
				texto.append("¡Conseguiste un cristal de desiderium!")
				texto.append("Creo que no fue una buena decición")
				texto.append("ROB-erTo: Detecto desiderium pasando la puerta")
				get_tree().get_nodes_in_group("gui")[0].get_node("Cristal").visible = true
				entregarCristal1 = false
			else:
				texto.append("Solo quedan cajas vacias")
		13:
			if(Mostrartxt == true):
				texto.append("ROB-erTo: ¿Oyes eso?")
				texto.append("Sí, lo oigo. Se escucha como gente trabajando con metales. Casi como si fuera una fábrica.")
				texto.append("ROB-erTo: ¿Una metalúrgica? ¿Aquí? No lo sé, me suena muy estaño 😉")
				texto.append("…")
				texto.append("ROB-erTo: Por lo menos no puedes negarme que trato de ponerle ánimo a la situación 😐")
				Mostrartxt = false
		14:
			if(Mostrartxt2 == true):
				texto.append("Persona misteriosa: …")
				texto.append("¿Hola…?")
				texto.append("Persona misteriosa: Hola, ¡Hola! Habla Johnny, soy el encargado de controlar el segundo subsuelo.")
				texto.append("¿Qué es lo que quieres?")
				texto.append("Persona misteriosa: Nada realmente, simplemente sigo el protocolo anti intrusos. ¿Cuál es el motivo que los trae por acá?")
				texto.append("Ehh… Venimos a… a limpiar.")
				texto.append("Persona misteriosa: ¿Limpiar?")
				texto.append("Persona misteriosa: Ah, es verdad. Contraté el servicio de limpieza para hoy. Entren tranquilos, si son los que contraté ya les envié la contraseña anteriormente.")
				texto.append("Sí, aquí la tenemos.")
				texto.append("Persona misteriosa: Si por alguna razón la olvidaron recuerden que tiene que ver con los ciberataques de ingeniería social.")
				texto.append("Debo irme, los dejo.")
				Mostrartxt2 = false
		15:
			if(entregarVida == true):
				texto.append("Encontraste Suero")
				texto.append("+ 40pv")
				vidaInicial += 40
				maxVida += 40
				get_tree().get_nodes_in_group("gui")[0].get_node("Suero").visible = true
				entregarVida = false
			else:
				texto.append("Lindo Sombrero")
		16:
			if(MostrarCristal2 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Cristal").visible = true
				get_tree().get_nodes_in_group("nivel")[0].get_node("Cristal2").visible = false
				MostrarCristal2 = false
			else:
				texto.append("Que sucio, mejor me voy")
				
				
				
				
				
				#Mejoras Piratas
		17:
			if(Mejora1 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora1").visible = true
				Mejora1 = false
				
				texto.append("+ 30pv")
				vidaInicial += 30
				maxVida +=30
			else:
				texto.append("Agotado")
		18:
			if(Mejora2 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora2").visible = true
				Mejora2 = false
				texto.append("- 50pv")
				vidaInicial -= 70
			else:
				texto.append("Agotado")
		19:
			if(Mejora3 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora3").visible = true
				Mejora3 = false
				texto.append("- 5% de velocidad")
				VelocidadCorazon -= 1
			else:
				texto.append("Agotado")
		20:
			if(Mejora4 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora4").visible = true
				Mejora4 = false
				texto.append("- 20pv")
				vidaInicial -= 40
			else:
				texto.append("Agotado")
		21:
			if(Mejora5 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora5").visible = true
				Mejora5 = false
				texto.append("+ 10% de velocidad")
				VelocidadCorazon += 3
			else:
				texto.append("Agotado")
		22:
			if(Mejora6 == true):
				get_tree().get_nodes_in_group("gui")[0].get_node("Mejora6").visible = true
				Mejora6 = false
				texto.append("+ 50pv")
				vidaInicial += 50
			else:
				texto.append("Agotado")
		23:
			if(MostrartxtMejorasPiratas == true):
				texto.append("ROB-erTo: Bienvenido a la sala de mejoras... pirata, claro.")
				texto.append("ROB-erTo: Aquí puedes elegir una mejora, pero hay una trampa: podrías ganar un poder increíble... o un virus devastador.")
				texto.append("ROB-erTo: ¿Qué dices? ¿Te arriesgas o te vas por el camino seguro?")
				MostrartxtMejorasPiratas = false
		24:
			if entregarCristal3:
				texto.append("¡Has obtenido un Cristal de Desiderium!")
				texto.append("¡Ugh! ¡Cómo detesto a las ratas!")
				get_tree().get_nodes_in_group("gui")[0].get_node("Cristal").visible = true
				entregarCristal3 = false
		25:
			texto.append("Interactua con ROB-erTo Primero")
		26:
			texto.append("Clave borrada")
			cantidadLetras = 0
			Clave = ""
		27:
			texto.append("???: Bueno, bueno... al fin nos conocemos cara a cara.")
			texto.append("???: Me habían dicho que alguien más andaba buscando los cristales. Qué sorpresa verte aquí.")
			texto.append("¿Quién eres tú y qué haces con los cristales?")
			texto.append("???: ¿No es obvio? Soy Eva, y para cuando termines aquí, habré recolectado todos los cristales.")
			texto.append("Eva: No importa cuánto lo intentes, no podrás alcanzarme ni detenerme.")
			texto.append("¿Por qué haces esto?")
			texto.append("Eva: Es simple. Necesito cristales para mejorar mis ataques DDoS y inyectar codigo malicioso")
			texto.append("Eva: En fin, ven trata de alcanzarme")
		28:
			texto.append("Eva: No puedo permitir que llegues")
		29:
			texto.append("Eva: Vaya, parece que te subestimé... No creí que llegarías tan lejos.")
			texto.append("Bueno, acá estoy. Y voy a quedarme con esos cristales, te guste o no.")
			texto.append("Eva: ¿En serio? No tenés idea del poder que contienen. Con esto, mis ataques DDoS serán imparables.")
			texto.append("No dejare que los uses")
		30:
			if entregarCristal4:
				texto.append("¡Has obtenido un Cristal de Desiderium!")
				texto.append("Ganaste + 30 De velocidad por derrotar a Eva")
				get_tree().get_nodes_in_group("gui")[0].get_node("Cristal").visible = true
				entregarCristal4 = false
		31:
			texto.append("???: Bienvenido, intruso.")
			texto.append("???: No es habitual que alguien llegue tan lejos... deberías sentirte halagado.")
			texto.append("¿Quién eres?")
			texto.append("Lumina: Yo soy Lumina, la inteligencia que gobierna cada línea de código en este sistema.")
			texto.append("Lumina: Me sorprende que hayas llegado hasta aquí, pero no subestimes lo que puedo hacer.")
			texto.append("¿Y qué piensas hacer ahora?")
			texto.append("Lumina: Destruir cada fragmento de tu conexión y desactivar cada intento de acceso.")
			texto.append("Lumina: No necesitas los cristales; yo los necesito para seguir controlando este espacio.")
			texto.append("Ya veremos si eres tan poderosa como dices.")
			texto.append("Lumina: En ese caso... prepárate para ser eliminado. Esta es tu última advertencia.")
		32:
			texto.append("Derrota a eva primero")
				
	txtActual = 0
	OracionActual = ""
	#ProcesarTexto()
	
func ProcesarTexto():
	if(txtActual == texto.size()):
		get_tree().get_nodes_in_group("main")[0].TextoOn = false
		get_tree().get_nodes_in_group("gui")[0].get_node("bkgTxt").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("txt").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Timer").stop()
		get_tree().get_nodes_in_group("gui")[0].get_node("Capsula").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Escudo").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Cristal").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Suero").visible = false
		
		#Mejoras Piratas
		
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora1").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora2").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora3").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora4").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora5").visible = false
		get_tree().get_nodes_in_group("gui")[0].get_node("Mejora6").visible = false
		
	else:
		if(texto[txtActual] == get_tree().get_nodes_in_group("gui")[0].get_node("txt").text):
		#get_tree().get_nodes_in_group("gui")[0].get_node("txt").text = Logica.texto[Logica.txtActual]
			get_tree().get_nodes_in_group("gui")[0].get_node("txt").text = ""
			txtActual+= 1
		else:
			get_tree().get_nodes_in_group("gui")[0].get_node("txt").text = texto[txtActual]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func ReproducirTextoNpc(dial):
	texto.clear()
	get_tree().get_nodes_in_group("gui")[0].get_node("bkgTxt").visible = true
	get_tree().get_nodes_in_group("gui")[0].get_node("txt").visible = true
	get_tree().get_nodes_in_group("main")[0].TextoOn = true
	get_tree().get_nodes_in_group("gui")[0].get_node("Timer").start()
	
	texto = dial
	
	txtActual = 0
	OracionActual = ""

func Oscuridad():
	get_tree().get_nodes_in_group("gui")[0].get_node("Oscuridad").visible = true

func NoOscuridad():
	get_tree().get_nodes_in_group("gui")[0].get_node("Oscuridad").visible = false
