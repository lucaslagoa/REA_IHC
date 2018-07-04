extends Area2D

# class member variables go here, for example:
var interacao = 0
var _timer = 0
# var b = "textvar"
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#
	connect("body_entered",self,"colisao")
	connect("body_exited",self,"saiu")
	set_process(true)


func colisao(body):
	print("Entrou na zona de interacao")
	interacao=1


func saiu(body):
	print("Saiu da zona")
	interacao=0

func _process(delta):
	if(interacao and Input.is_action_pressed("ui_accept")):
		print("Clique")
		mensagem()
	# print(is_colliding())
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func ligacao():
	#ligacao com o contador.
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout",self,"tempo")
	_timer.set_wait_time(0.12)
	_timer.set_one_shot(false)
	_timer.start()
	
	
func mensagem():

	#get_node("RichTextLabel").percent_visible=1
	get_node("ButtonOkIteracao").flat=0
	get_node("ButtonOkIteracao").text="OK"
	get_node("box_pistas").show()
	ligacao()
	#print("Deu certo")

func tempo():
	#Torna as letras pouco a pouco visiveis.)
	var no = get_node("boas_vindas")
	no.set_visible_characters(no.get_visible_characters()+1)
	
func _on_ButtonOkIteracao_pressed():
	get_node("boas_vindas").hide()
	get_node("ButtonOkIteracao").hide()
	get_node("ButtonOkIteracao").text=""
	get_node("AnimatedSprite").hide()
	get_node("box_pistas").hide()
	var posicao = get_node("/root/Forest/NPC2")
	posicao.show()
	var diario = get_node("/root/Forest/diario")
	diario.get_node("diario_box").visible=true
	pass # replace with function body
