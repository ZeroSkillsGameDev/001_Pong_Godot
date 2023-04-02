extends Node2D

var Ball = preload("res://ball.tscn")
var TheBall

var ScoreP1 = 0
var ScoreP2 = 0
var player 
# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()
	
func new_game():
	$GUI.hide()
	ScoreP1 = 0
	ScoreP2 = 0
	$Player1.position.x = 100
	$Player1.position.y = 540
	$Player2.position.x = 1820
	$Player2.position.y = 540
	TheBall = Ball.instantiate()
	add_child(TheBall)
	TheBall.position.x = 960
	TheBall.position.y = 540
	TheBall.connect("goal",self.on_goal)

func on_goal(player):
	if player == 1:
		ScoreP1 += 1
	elif player ==2:
		ScoreP2 += 1
	if ScoreP1 == 3 or ScoreP2 == 3:
		game_over(player)

func game_over(player):
	TheBall.queue_free()
	$GUI.text = "Game Over\nPlayer " + str(player) + " wins!\nPlay again? Y/N"
	$GUI.show()
	
func _input(event):
	if Input.is_action_pressed("ui_yes"):
		new_game()
	if Input.is_action_pressed("ui_no"):
		get_tree().quit()
		
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ScoreP1.text = str(ScoreP1)
	$ScoreP2.text = str(ScoreP2)

