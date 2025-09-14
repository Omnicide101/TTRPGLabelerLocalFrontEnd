extends LineEdit

var rng = RandomNumberGenerator.new()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("Ctrl+D") and self.text == (''):
		generate_new_id()

func _on_text_submitted(new_text):
	if (new_text.is_empty()):
		return
	elif (new_text.is_valid_int() and new_text.length() == 9 ):
		self.text = "ID accepted!"
	# send the text to the TypeScript backend, somehow
	# then 'load' the correct 'save'
	
func generate_new_id():
	self.select_all_on_focus = true
	self.text = str(rng.randi_range(100000000, 999999999))
	self.grab_focus()
