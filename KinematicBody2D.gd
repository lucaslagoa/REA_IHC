extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
export (int) var speed = 5

var velocity = Vector2()

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	_process(true)

func parado():
	#altera a animação se o personagem estiver parado.
	if velocity.x == 0:
		$AnimatedSprite.animation="parado"
		$AnimatedSprite.play()
func get_input():
    velocity = Vector2()
    
    if Input.is_action_pressed("ui_right"):
       velocity.x += 1
       $AnimatedSprite.animation="caminhando_dir"
    if Input.is_action_pressed("ui_left"):
        velocity.x -= 1
        $AnimatedSprite.animation="caminhando_esq"
    if Input.is_action_pressed('down'):
        velocity.y += 1
    if Input.is_action_pressed('up'):
        velocity.y -= 1
    velocity = velocity.normalized() * speed
	
func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
	#$AnimatedSprite.play()
	var estado;
	parado()
	get_input()
	estado = move_and_collide(velocity)
	if(estado):
		print("colisao");
	

	
