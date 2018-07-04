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
	set_process(true)


func verifica_tentativa(tentativas):
	# monitora o numero de tentativas de fim de jogo realizadas.
	if(tentativas == 0):
		print("Fim de Jogo")
		# adicionar aqui o caminho para a tela de fim de jogo
		get_tree().change_scene("res://GameOver.tscn")



func colisao(body):
	print("Entrou na zona de interacao")
	interacao=1


func saiu(body):
	print("Saiu da zona")
	interacao=0


func _process(delta):
	verifica_tentativa(tentativas)
	if(interacao and Input.is_action_pressed("ui_accept")):
		print("Clique")
		mensagem()
	# print(is_colliding())
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
func mensagem():
	get_node("RichTextLabel").percent_visible=1
	get_node("ButtonOkIteracao").flat=0
	get_node("ButtonOkIteracao").text="OK"
	get_node("Resposta Charada").show()
	#print("Deu certo")

func _on_ButtonOkIteracao_pressed():
	get_node("RichTextLabel").hide()
	get_node("ButtonOkIteracao").hide()
	get_node("ButtonOkIteracao").text=""
	get_node("AnimatedSprite").hide();
	get_node("Resposta Charada").hide()
	pass # replace with function body
	
func desabilitar_botao(raiz):
	#funcao que desabilita a opção errada escolhida.
	var btn = get_node("/root/Deserto/NPC2/Resposta Charada/"+raiz)
	var desabilitar = get_node("/root/Deserto/NPC2/Resposta Charada")
	btn.get_node("RichTextLabel").modulate="ef0f0f"
	desabilitar.get_node(raiz).disabled=true	
