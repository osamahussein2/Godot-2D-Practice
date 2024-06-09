extends CanvasLayer

# Tells the Main node that the start button has been pressed
signal startGame

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func ShowMessage(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func ShowGameOverScreen():
	ShowMessage("Game Over!")
	
	# Waits until the message timer has counted down
	await $MessageTimer.timeout
	
	$Message.text = "Dodge the Creeps!"
	$Message.show()
	
	# Make a one shot timer and wait for it to finish
	await get_tree().create_timer(1.0).timeout
	$StartButton.show()

func UpdateScore(score):
	$ScoreLabel.text = str(score)
	
	


func _on_start_button_pressed():
	#pass # Replace with function body.
	
	$StartButton.hide()
	startGame.emit()


func _on_message_timer_timeout():
	#pass # Replace with function body.
	
	$Message.hide()
