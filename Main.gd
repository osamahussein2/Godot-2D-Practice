extends Node

# Allows us to choose the Mob scene we want to instance
@export var mobScene : PackedScene

var score

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func game_over():
	#pass # Replace with function body.
	
	$ScoreTimer.stop()
	$MobTimer.stop()

func new_game():
	score = 0
	$Player.playerStart($StartPosition.position)
	$StartTimer.start()


func _on_score_timer_timeout():
	#pass # Replace with function body.
	score += 1


func _on_start_timer_timeout():
	#pass # Replace with function body.
	
	$MobTimer.start()
	$ScoreTimer.start()

func _on_mob_timer_timeout():
	#pass # Replace with function body.
	
	# Create a new instance of the Mob scene
	var mob = mobScene.instantiate()
	
	# Choose a random location for the Path2D to follow
	var mobSpawnLocation = $MobPath/MobSpawnLocation
	mobSpawnLocation.progress_ratio = randf()
	
	# Make the mob's direction perpendicular to the path direction
	var direction = mobSpawnLocation.rotation + PI / 2
	
	#Set the mob's position to random locations
	mob.position = mobSpawnLocation.position
	
	# Randomize the directions too
	# Godot uses randians to measure angles by default instead of degrees
	direction += randf_range(-PI / 4, PI / 4)
	mob.rotation = direction
	
	# Choose a velocity for the mob
	var mobVelocity = Vector2(randf_range(150.0, 250.0), 0.0)
	mob.linear_velocity = mobVelocity.rotated(direction)
	
	# Spawn the mob by adding it inside the Main scene (or Game Scene, as I named it)
	add_child(mob)
	
