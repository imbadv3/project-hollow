extends CharacterBody2D

var gravity = 2500

var timer = 60

var health = 3


func _physics_process(delta: float) -> void:
	print(health)
	timer += -1
	if timer == -60:
		timer = 60
	
	velocity.x = 300
	if velocity.x == 300 and timer < 0 :
		velocity.x = -300
	
	
	
	velocity.y += gravity * delta
	#print(position)
	
	#print(timer)
	
	
	
	
	
	
	 
	
	
	
	
	
	
	move_and_slide()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if Input.is_action_pressed("spacebar"):
		health += -1


func _on_area_2d_body_exited(body: Node2D) -> void:
	pass # Replace with function body.
