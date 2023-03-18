extends RichTextLabel

var ms = 0
var s = 0
var m = 0

func _process(_delta):
	
	if ms > 9:
		s+= 1
		ms = 0
		
	if s > 59:
		m += 1
		s = 0
	
	#set_text(str(m)+ " : " + str(s) + " : " + str(ms))
	
	if(s < 10 && m > 10):
		bbcode_text = "[center]" + str(m)+ " : 0" + str(s) + " : " + str(ms) + "[/center]"
		
	if(s < 10 && m < 10):
		bbcode_text = "[center]" + "0" + str(m)+ " : 0" + str(s) + " : " + str(ms) + "[/center]"
		
	if(s > 10 && m < 10):
		bbcode_text = "[center]" + "0" + str(m)+ " : " + str(s) + " : " + str(ms) + "[/center]"
		
	if(s > 10 && m > 10):
		bbcode_text = "[center]" + str(m)+ " : " + str(s) + " : " + str(ms) + "[/center]"
	
	
	pass


func _on_Timer_timeout():
	ms += 1
	pass

func stop():
	$Timer.stop()
	
func returnScore ():
	var aux
	aux = ms + (10 * s) + (600 * m)
	return aux

func pause():
	$Timer.set_paused(true)
	
func resume():
	$Timer.set_paused(false)
