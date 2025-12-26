extends Node2D

@onready var ball = $Ball
var ball_speed = 300
var x_move
var y_move
var i = 0
var velocity = Vector2(0,0)

var direction_y

var global_hor_dir
var global_vert_dir

# Called when the node enters the scene tree for the first time.
func _ready():
	
	$Ball.position.x = 500
	$Ball.position.y = 350
	
	velocity = getVelocity("right", "any")
	print("_ready() velocity: ", velocity)
	
#func get
	
func getVelocity(hor_dir, vert_dir):

	var cur_dir = Vector2(0,0)
	var newVelocity = cur_dir * ball_speed
	print("getVelocity() called")
	var x_value
	var y_value
	
	var vert_dir_list = ["up", "down"]
	
	if vert_dir == "any":
		vert_dir = vert_dir_list.pick_random()
		print("'any' transformed to: ", vert_dir)
		
	
	if(hor_dir == "left"):
		x_value = -1
	elif(hor_dir == "right"):
		x_value = 1
		
	if(vert_dir == "up"):
		y_value = -1
	elif(vert_dir == "down"):
		y_value = 1
		
	print("Expected new vector: ", x_value, ", ", y_value)
		
	cur_dir = Vector2(x_value,y_value)
	cur_dir = cur_dir.normalized()
	newVelocity = cur_dir * ball_speed
		
	global_hor_dir = hor_dir
	global_vert_dir = vert_dir
		
	return newVelocity

func changeVelocity(collisionArea):
	print("changeVelocity() called")
	if (collisionArea == "TopBounce"):
		velocity = getVelocity(global_hor_dir,"down")
	if (collisionArea == "PlayerWin"):
		#hor_dir = "right"
		velocity = getVelocity("left","any")
	if (collisionArea == "BottomBounce"):
		velocity = getVelocity(global_hor_dir,"up")
	if (collisionArea == "PlayerDeath"):
		#hor_dir = "left"
		velocity = getVelocity("right","any")
	return velocity
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	$Ball.position += velocity * delta
	
	i += 1
	if i == 40:
		print("_process() velocity: ",velocity)
		i = 0

func _on_top_bounce_body_entered(_body: Node2D) -> void:
	print("_on_top_bounce_body_entered() called")
	print("Ball entered top area")
	velocity = changeVelocity("TopBounce")


func _on_player_win_body_entered(_body: Node2D) -> void:
	#For testing purposes will be substituting the enemy platform
	print("_on_player_win_body_entered() called")
	print("Ball entered right area")
	velocity = changeVelocity("PlayerWin")
	
func _on_bottom_bounce_body_entered(_body: Node2D) -> void:
	print("_on_bottom_bounce_body_entered() called")
	print("Ball entered bottom area")
	velocity = changeVelocity("BottomBounce")
	
func _on_player_death_body_entered(_body: Node2D) -> void:
	#For testing purposes will be substituting the player platform
	print("_on_player_death_body_entered() called")
	print("Ball entered left area")
	velocity = changeVelocity("PlayerDeath")
