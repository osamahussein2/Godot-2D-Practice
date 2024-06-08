extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	# Get the list of the animation names inside the Mob node
	var mobTypes = $AnimatedSprite2D.sprite_frames.get_animation_names()
	
	# Randomize the numbers to play the 3 animations at random times
	$AnimatedSprite2D.play(mobTypes[randi() % mobTypes.size()])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	#pass # Replace with function body.
	
	# Delete the mobs when they leave the screen (perhaps to reduce unncessary memory from the Godot engine)
	queue_free()
