extends Node2D

@onready var ball = $Ball
var ball_speed = 300
var x_move
var y_move

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ball.position.x = 500
	$Ball.position.y = 350


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	x_move = $Ball.position.x + ball_speed * delta
	y_move = $Ball.position.y - ball_speed * delta
	$Ball.position = Vector2(x_move,y_move)
