extends StaticBody2D

signal goal(player)

var speed = 800
var velocity = Vector2.ZERO
var player

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity.x = 40
	velocity.y = 40


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = velocity.normalized() * speed
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
	if position.x > 1920 or position.x < 0:
		if position.x > 1920:
			player = 1 
		elif position.x < 0:
			player = 2
		position.x = 960
		emit_signal("goal", player)
	
