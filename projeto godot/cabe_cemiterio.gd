extends Area2D

# class member variables go here, for example:
var interacao = 0
# var b = "textvar"
var _timer=null
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
		mensagem()
	# print(is_colliding())
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func mensagem():
	var posicao = get_node("/root/Cemiterio/TileMap/diario")
	posicao.get_node("pista7").visible=true
	get_node("box_pistas").visible=true
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