extends Area2D

# How fast the player will move across the pixel screen per second
# @export makes a variable public to Godot, so that it is seen inside the inspector
@export var playerSpeed = 400

# Create a variable that sets the game window size
var screenSize

# Create 4 variables to initialize the Vector2 directions
var moveRight
var moveLeft
var moveUp
var moveDown

# Called when the node enters the scene tree for the first time.
# The _ready function is most likely for initializing our variables and perhaps functions?
func _ready():
	#pass # Replace with function body. I don't know what pass does so I'll just comment it out for now
	screenSize = get_viewport_rect().size
	
	moveRight = Vector2(1, 0)
	moveLeft = Vector2(-1, 0)
	moveUp = Vector2(0, 1)
	moveDown = Vector2(0, -1)

# Called every frame. 'delta' is the elapsed time since the previous frame.
# The _process fuction updates this script every time the game is run
func _process(delta):
	#pass
	var playerVelocity = Vector2(0, 0)
	
	if Input.is_action_pressed("MoveRight"):
		playerVelocity += moveRight
	if Input.is_action_pressed("MoveLeft"):
		playerVelocity += moveLeft
	if Input.is_action_pressed("MoveUp"):
		playerVelocity -= moveUp
	if Input.is_action_pressed("MoveDown"):
		playerVelocity -= moveDown
	
	# If the player is moving using arrow keys
	if playerVelocity.length() > 0:
		
		# This prevents faster diagonal movement comapred to just moving it horizontally or vertically
		playerVelocity = playerVelocity.normalized() * playerSpeed
		
		# The $ sign is a short syntax for get_node function
		# Meaning that I could write get_node("AnimatedSprite2D").play()
		
		# $ returns the node at a relative path from the current node, only returns null if the node isn't found
		$AnimatedSprite2D.play() # Play the movement animation
	
	# Else if the player is not moving
	elif playerVelocity.length() <= 0:
		$AnimatedSprite2D.stop() # Stop playing the animation of the Player node
		
	# Helps to make the movement update consistently per frame
	position += playerVelocity * delta # delta is the frame length inside the _process function
	
	# The clamp function restricts any movement from going beyond a certain value/amount
	position = position.clamp(Vector2(0, 0), screenSize)
