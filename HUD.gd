extends CanvasLayer

var randNumber
var highScore = 0
signal start_game
var check = false
var pause = 0

func _process(delta):
	if(!check):
		if Input.is_action_pressed("ui_accept"):
			$StartButton.hide()
			$DirectionsLabel.hide()
			$MessageLabel.hide()
			$HighScore.hide()
			$Choice3.hide()
			$Choice2.hide()
			emit_signal("start_game")
			check = true
	
func game_over(score):

	randNumber = randi()%31 + 0
	if(randNumber == 0):
		$Fact.text = "You should always report emails\n you don't think you\n should get."
	if(randNumber == 1):
		$Fact.text = "Spear Phishing is a highly\n personalized attack towards\n an individual."
	if(randNumber == 2):
		$Fact.text = "Ransomware can lock you from your\n files unless you pay the ransom."
	if(randNumber == 3):
		$Fact.text = "Remember to only click on links\n if you're sure they are safe."
	if(randNumber == 4):
		$Fact.text = "Don't plug in a USB drive you\n found lying around. Please!"
	if(randNumber == 5):
		$Fact.text = "Whale Phishing attacks are aimed\n at high-value targets."
	if(randNumber == 6):
		$Fact.text = "400,000 new phishing sites are\n created each month."
	if(randNumber == 7):
		$Fact.text = "Google, Paypal, and Apple are the\n most commonly spoofed\n organizations."
	if(randNumber == 8):
		$Fact.text = "Beware of mispelled Domain Names\n in the web address bar."
	if(randNumber == 9):
		$Fact.text = "Never make your password something\n that relates to you or\n your life."
	if(randNumber == 10):
		$Fact.text = "Emails that show spelling mistakes\n and evoke urgency are most\n likely phishing emails."
	if(randNumber == 11):
		$Fact.text = "Phishing sites have a lifetime of\n 15 hours. By the time it's found,\n the attacker already made a new one."
	if(randNumber == 12):
		$Fact.text = "If an email seems too good to be\n true, then it probably is a\n phishing email."
	if(randNumber == 13):
		$Fact.text = "Phishing doesn't always appear in\n email. These attacks can appear in\n SMS, social media, or phone calls."
	if(randNumber == 14):
		$Fact.text = "At least 3.4 billion emails are\n sent a day."
	if(randNumber == 15):
		$Fact.text = "In 2018, 83% of organizations fell\n victim to phishing attacks."
	if(randNumber == 16):
		$Fact.text = "70% of breaches associated with a\n nation-state or state-affiliated\n actors involved phishing."
	if(randNumber == 17):
		$Fact.text = "71.4% of targeted attacks involved\n the use of spear-phishing\n emails."
	if(randNumber == 18):
		$Fact.text = "66% of malware is installed via\n malicious email attachments."
	if(randNumber == 19):
		$Fact.text = "43% of all breaches included social\n tactics."
	if(randNumber == 20):
		$Fact.text = "93% of social attacks were\n phishing related."
	if(randNumber == 21):
		$Fact.text = "64% of organizations have experienced\n a phishing attack in the\n past year."
	if(randNumber == 22):
		$Fact.text = "28% of phishing attacks target a\n specific person."
	if(randNumber == 23):
		$Fact.text = "Finance faced 59% of phishing attacks\n in the Americas."
	if(randNumber == 24):
		$Fact.text = "50% of recipients open e-mails and\n click on phishing links within\n the first hour of being sent."
	if(randNumber == 25):
		$Fact.text = "Almost half of all phishing attacks\n registered in 2016 were aimed\n at stealing victim’s money."
	if(randNumber == 26):
		$Fact.text = "Phishing emails include fake\n notifications from banks, e-payment\n systems, email providers, social networks,\n online games, etc."
	if(randNumber == 27):
		$Fact.text = "The APWG announced that the number\n of observed phishing attacks in\n Q1 2016 was higher than any total\n since 2004."
	if(randNumber == 28):
		$Fact.text = "Phishing sites can also have HTTPS\n in place."
	if(randNumber == 29):
		$Fact.text = "Phishing sites can hide from search\n engines"
	if(randNumber == 30):
		$Fact.text = "Employee benefits emails are good\n phish bait for employees"

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
	$Choice3.hide()
	$Choice2.hide()
	$HighScore.hide()
	emit_signal("start_game")
	check = true

func _on_FactTimer_timeout():
	$Fact.hide()
	$MessageLabel.text = "Dodge the Phishing Attacks."
	$MessageLabel.show()
	$DirectionsLabel.text = "Use the Up, Down, Left, and Right Arrow Keys to move\nPress Spacebar to pause and M to mute music"
	$DirectionsLabel.show()
	$Choice3.text = "Click Start or Press Enter to Begin"
	$Choice3.show()
	$Choice2.text = "Your Score Increases Every Eight Seconds"
	$Choice2.show()
	$StartButton.show()
	$MessageTimer.start()
	check = false
	