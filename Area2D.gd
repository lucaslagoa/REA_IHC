extends Area2D

# class member variables go here, for example:
var interacao = 0
var _timer = null
# tempo para ocultar as pistas
var tempo_ocultar_pistas = null
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#
	connect("body_entered",self,"colisao")
	connect("body_exited",self,"saiu")
	set_process(true)
	

func colisao(body):
	interacao=1
	
	
func saiu(body):
	interacao=0
	
func _process(delta):
	if(interacao and Input.is_action_pressed("ui_accept")):
		get_node("box_pistas").visible=true
		mensagem()
	# print(is_colliding())
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func mensagem():
	var posicao = get_node("/root/Cemiterio/TileMap/diario")
	posicao.get_node("pista1").visible=true
	get_node("RichTextLabel").visible=true
	ligacao()

func ligacao():
	#ligacao com o contador.
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout",self,"tempo")
	_timer.set_wait_time(0.12)
	_timer.set_one_shot(false)
	_timer.start()
	
func tempo():
	#Torna as letras pouco a pouco visiveis.)
	var no = get_node("RichTextLabel")
	no.set_visible_characters(no.get_visible_characters()+1)
	#esconder_pista()
	
#func esconder_pista():
	
#	tempo_ocultar_pistas = Timer.new()
#	add_child(tempo_ocultar_pistas)
#	tempo_ocultar_pistas.connect("timeout",self,"ocultar")
#	tempo_ocultar_pistas.set_wait_time(8.00)
#	tempo_ocultar_pistas.set_one_shot(false)
#	tempo_ocultar_pistas.start()
	
#func ocultar():
#	get_node("box_pistas").visible=false
#	get_node("RichTextLabel").visible=false