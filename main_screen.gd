extends Node2D

@onready var ball = $Ball
var ball_speed = 300
var x_move
var y_move
var i = 0
var velocity = Vector2(0,0)

var direction_y

# Called when the node enters the scene tree for the first time.
func _ready():
	$Ball.position.x = 500
	$Ball.position.y = 350
#
#func changeDirection():
	#direction_y = $Ball.position.y + 
	
func getVelocity(direction):
	if (direction == "right"):
		return Vector2(1,0) * ball_speed
	elif (direction == "left"):
		return Vector2(-1,0) * ball_speed
	elif (direction == "up"):
		return Vector2(0,-1) * ball_speed
	elif (direction == "down"):
		return Vector2(0,1) * ball_speed
	elif (direction == "rup"):
		var cur_dir = Vector2(-0.6,-1)
		cur_dir = cur_dir.normalized()
		return cur_dir * ball_speed
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#Ball just goes right
	#velocity = getVelocity("right")
	#$Ball.position += velocity * delta
	
	#Ball just goes left
	#velocity = getVelocity("left")
	#$Ball.position += velocity * delta
	
	#Ball just goes up
	#velocity = getVelocity("up")
	#$Ball.position += velocity * delta
	
	#Ball just goes down
	#velocity = getVelocity("down")
	#$Ball.position += velocity * delta
	
	#Ball goes right up
	velocity = getVelocity("rup")
	$Ball.position += velocity * delta
	
	#pass
