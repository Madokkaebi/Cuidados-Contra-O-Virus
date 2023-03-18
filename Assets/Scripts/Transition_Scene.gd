extends CanvasLayer

signal transitioned


func transition():
	$AnimationPlayer.play("Fade_to_Black")

func _on_AnimationPlayer_animation_finished(anim_name):
	if(anim_name == "Fade_to_Black"):
		emit_signal("transitioned")
		$AnimationPlayer.play("Fade_to_Normal")
		
	if(anim_name == "Fade_to_Normal"):
		pass
