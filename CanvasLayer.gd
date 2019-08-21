extends CanvasLayer

var pause = true
var labelText = 0

func pause_allow():
	pause = false

func pause_disallow():
	pause = true

func _input(event):
	if(!get_tree().paused):
		if (event.is_action_pressed("pause") && pause == false):
			get_tree().paused = true
			$Label.text = "Paused"
			$Label.show()
			$ColorRect.show()
			$Angler.show()
			$Angler2.show()
			labelText = randi()%4 + 0
			if(labelText == 0):
				$Label2.text = "Are you ready to take our\n quiz?"
			if(labelText == 1):
				$Label2.text = "Can you correctly identify\n phishing attacks?"
			if(labelText == 2):
				$Label2.text = "Never give up personal information\n to phishers!"
			if(labelText == 3):
				$Label2.text = "Don't click links unless you're\n sure they are safe!"
			if(labelText == 4):
				$Label2.text = "Don't click on links unless you\n are sure they are safe!"
			$Label2.show()
	else:
		if event.is_action_pressed("pause"):
			$Label2.hide()
			$ColorRect.hide()
			$Angler.hide()
			$Angler2.hide()
			$Label.text = "2"
			$Timer.start()
			yield($Timer, "timeout")
			
			$Label.text = "1"
			$Timer2.start()
			yield($Timer2, "timeout")
			
			get_tree().paused = false
			$Label.hide()