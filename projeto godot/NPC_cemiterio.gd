extends Area2D

# class member variables go here, for example:
var interacao = 0
var _timer= null
# var b = "textvar"
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#
	
	connect("body_entered",self,"colisao")
	connect("body_exited",self,"saiu")
	set_process(true)
	

func colisao(body):
	#print("Entrou na zona de interacao")
	interacao=1
	
	
func saiu(body):
	#print("Saiu da zona")
	interacao=0
	
func _process(delta):
	if(interacao and Input.is_action_pressed("ui_accept")):
		mensagem()
		
#
func mensagem():
	get_node("box_pistas").visible=true
	get_node("Button").flat=0
	get_node("Button").text="Ok"
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
	var no = get_node("boas_vindas")
	no.set_visible_characters(no.get_visible_characters()+1)


func _on_Button_pressed():
	get_node("boas_vindas").hide()
	get_node("Button").hide()
	get_node("Button").text=""
	get_node("npc_sprite").hide()
	var posicao = get_node("/root/Cemiterio/TileMap/NPC2")
	posicao.show()
	get_node("box_pistas").visible=false
	# Ativa o diario
	var diario = get_node("/root/Cemiterio/TileMap/diario")
	diario.get_node("diario_box").visible=true
	