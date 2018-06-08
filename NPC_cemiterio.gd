extends Area2D

# class member variables go here, for example:
var interacao = 0
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
#	pass
func mensagem():
	
	get_node("boas_vindas").percent_visible=1
	get_node("Button").flat=0
	get_node("Button").text="Ok"
	



func _on_Button_pressed():
	get_node("boas_vindas").hide()
	get_node("Button").hide()
	get_node("Button").text=""
	get_node("npc_sprite").hide()
	var posicao = get_node("/root/Cemiterio/TileMap/NPC2")
	posicao.show()