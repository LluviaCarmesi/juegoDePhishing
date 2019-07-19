extends CanvasLayer

var randNumber
var highScore = 0
signal start_game

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func show_ready(text):
	$ReadyLabel.text = text
	$ReadyLabel.show()
	$MessageTimer.start()
	
func game_over(score):

	randNumber = randi()%16 + 0
	if(randNumber == 0):
		$Fact.text = "You should always report emails you\n don't think you should get."
	if(randNumber == 1):
		$Fact.text = "Spear Phishing is a highly personalized\n attack towards an individual"
	if(randNumber == 2):
		$Fact.text = "Ransomware can lock you from your files...\n unless you pay the ransom."
	if(randNumber == 3):
		$Fact.text = "Remember to only click on links if\n you're sure they are safe."
	if(randNumber == 4):
		$Fact.text = "Don't plug in a USB drive you found\n lying around. Please!"
	if(randNumber == 5):
		$Fact.text = "If you get phished and open Northwell\n to an attack, YOU WILL BE FIRED!!!"
	if(randNumber == 6):
		$Fact.text = "400,000 new phishing sites are created\n each month."
	if(randNumber == 7):
		$Fact.text = "Google, Paypal, and Apple are the most\n commonly spoofed organizations."
	if(randNumber == 8):
		$Fact.text = "Beware of mispelled Domain Names in the\n web address bar."
	if(randNumber == 9):
		$Fact.text = "Never make your password something that\n relates to you or your life."
	if(randNumber == 10):
		$Fact.text = "Emails that show spelling mistakes and evoke\n urgency are most likely phishing emails."
	if(randNumber == 11):
		$Fact.text = "Phishing sites have a lifetime of 15 hours.\n By the time it's found, the attacker already\n made a new one."
	if(randNumber == 12):
		$Fact.text = "If an email seems too good to be true, then\n it probably is a phishing email."
	if(randNumber == 13):
		$Fact.text = "Phishing doesn't always appear in email. These\n attacks can appear in SMS, social media, or\n phone calls."
	if(randNumber == 14):
		$Fact.text = "At least 3.4 billion emails are sent a day."
	if(randNumber == 15):
		$Fact.text = "In 2018, 83% of organizations fell victim to\n phishing attacks."
	
	$Fact.show()
	$FactTimer.start()
	if (highScore < score):
		highScore = score
	$HighScore.text = "High Score: " + String(highScore)
	$HighScore.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MessageTimer_timeout():
	$ReadyLabel.hide()

func _on_StartButton_pressed():
	$StartButton.hide()
	$DirectionsLabel.hide()
	$MessageLabel.hide()
	$HighScore.hide()
	emit_signal("start_game")

func _on_FactTimer_timeout():
	$Fact.hide()
	show_message("Game Over.")
	yield($MessageTimer, "timeout")
	$MessageLabel.text = "Dodge the Phishing Attacks."
	$DirectionsLabel.text = "Use the Up, Down, Left, and Right Arrow Keys to move"
	$DirectionsLabel.show()
	$StartButton.show()
	$MessageTimer.start()