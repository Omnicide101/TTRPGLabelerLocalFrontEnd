extends LineEdit

var gameText : RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	gameText = get_parent().get_parent().get_parent().get_node("GameText")
	gameText.text = "Welcome to the TTRPG Labeler Campaign!"
	

func _on_text_submitted(new_text):
	if (new_text.is_empty()):
		return

	# smack the text into the game text area
	gameText.append_text("\n\n" + new_text)
	
	# funny lil lore accurate easter egg
	if (new_text == "Praise be to the Western Church!"):
		gameText.append_text("\n\n" + "Praise be!")
		
	elif (new_text == "Praise be to the Eastern Church!"):
		gameText.append_text("\n\n" + "That's heresy! >:(")
		
	else:
		# get and display the correct response from the backend
		gameText.append_text("\n\n" + "This is where you would see the response, if Mira knew how to hook the TypeScript up to Godot :(")

	# clear the text of the text area.
	self.set_text('')

	# send the text to the TypeScript backend, somehow
	# and then reply with the correct response from the database
	# also make sure to save progress tied to the ID
