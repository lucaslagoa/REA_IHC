extends Area2D

# class member variables go here, for example:
var interacao = 0
var tentativas= 2

# var b = "textvar"
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#
	connect("body_entered",self,"colisao")
	connect("body_exited",self,"saiu")
	get_node("npc2_sprite").playing=true
	set_process(true)
	
func verifica_tentativa(tentativas):
	# monitora o numero de tentativas de fim de jogo realizadas.
	if(tentativas == 0):
		print("Fim de Jogo")
		# adicionar aqui o caminho para a tela de fim de jogo
		get_tree().change_scene("res://GameOver.tscn")
func colisao(body):
	interacao=1
	
	
func saiu(body):
	interacao=0
	
func _process(delta):
	verifica_tentativa(tentativas)
	if(interacao and Input.is_action_pressed("ui_accept")):
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
	get_node("charada").show()

func desabilitar_botao(raiz):
	var btn = get_node("/root/Cemiterio/TileMap/NPC2/charada/"+raiz)
	var desabilitar = get_node("/root/Cemiterio/TileMap/NPC2/charada")
	btn.get_node("RichTextLabel").modulate="ef0f0f"
	desabilitar.get_node(raiz).disabled=true