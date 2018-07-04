extends Button

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

func _pressed():
	print("Alternativa B");
	var opcao = get_node("/root/Cemiterio/TileMap/NPC2")
	opcao.tentativas-=1
	opcao.desabilitar_botao("B")
#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
