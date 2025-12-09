extends Node2D

var ball_speed = 5;

# Called when the node enters the scene tree for the first time.
func _ready():
	position.x = 500
	position.y = 350


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#position = Vector2(0,position.x*ball_speed*delta)
	pass
