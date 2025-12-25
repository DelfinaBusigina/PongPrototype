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
	
	velocity = getVelocity("right_up")
	print("_ready() velocity: ", velocity)
#
#func changeDirection():
	#direction_y = $Ball.position.y + 
	
func getVelocity(direction):
	print("getVelocity() called")
	var cur_dir = Vector2(0,0)
	var newVelocity = cur_dir * ball_speed
	
	if (direction == "right"):
		newVelocity = Vector2(1,0) * ball_speed
		
	elif (direction == "left"):
		newVelocity = Vector2(-1,0) * ball_speed 
		
	elif (direction == "up"):
		newVelocity = Vector2(0,-1) * ball_speed
		
	elif (direction == "down"):
		newVelocity = Vector2(0,1) * ball_speed 
		
	elif (direction == "right_up"):
		cur_dir = Vector2(1,-1)
		cur_dir = cur_dir.normalized()
		newVelocity = cur_dir * ball_speed
		
	elif (direction == "right_down"):
		cur_dir = Vector2(1,1)
		cur_dir = cur_dir.normalized()
		newVelocity = cur_dir * ball_speed
	
	elif (direction == "left_down"):
		cur_dir = Vector2(-1,1)
		cur_dir = cur_dir.normalized()
		newVelocity = cur_dir * ball_speed
		
	elif (direction == "left_up"):
		cur_dir = Vector2(-1,-1)
		cur_dir = cur_dir.normalized()
		newVelocity = cur_dir * ball_speed
		
	return newVelocity

func changeVelocity(collisionArea):
	print("changeVelocity() called")
	if (collisionArea == "TopBounce"):
		velocity = getVelocity("right_down")
	if (collisionArea == "PlayerWin"):
		velocity = getVelocity("left_down")
	if (collisionArea == "BottomBounce"):
		velocity = getVelocity("left_up")
	if (collisionArea == "PlayerDeath"):
		velocity = getVelocity("right_up")
	return velocity
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Ball.position += velocity * delta
	
	i += 1
	if i == 40:
		print("_process() velocity: ",velocity)
		i = 0
	
	#pass


func _on_top_bounce_body_entered(body: Node2D) -> void:
	print("_on_top_bounce_body_entered() called")
	print("Ball entered top area")
	velocity = changeVelocity("TopBounce")


func _on_player_win_body_entered(body: Node2D) -> void:
	#For testing purposes will be substituting the enemy platform
	print("_on_player_win_body_entered() called")
	print("Ball entered right area")
	velocity = changeVelocity("PlayerWin")
	
func _on_bottom_bounce_body_entered(body: Node2D) -> void:
	print("_on_bottom_bounce_body_entered() called")
	print("Ball entered bottom area")
	velocity = changeVelocity("BottomBounce")
	
func _on_player_death_body_entered(body: Node2D) -> void:
	#For testing purposes will be substituting the player platform
	print("_on_player_death_body_entered() called")
	print("Ball entered left area")
	velocity = changeVelocity("PlayerDeath")
	pass # Replace with function body.
