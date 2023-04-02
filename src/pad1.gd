extends StaticBody2D

var speed = 400
var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	velocity = Vector2.ZERO
	if Input.is_action_pressed("ui_down"):
		velocity.y += 40
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 40
		
func _physics_process(delta):
	velocity = velocity.normalized() * speed
	move_and_collide(velocity * delta)
