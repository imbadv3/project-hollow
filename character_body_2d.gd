extends CharacterBody2D

var run_speed = 400
var jump_speed = -1500
var gravity = 2500
var health = 20
const max_health = 10
var heal_amount = 1
var stickdg = 1

func _ready() -> void:
	Dialogic.start("armadillo")

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed('ui_right')
	var left = Input.is_action_pressed('ui_left')
	var jump = Input.is_action_just_pressed('ui_up')
	var heal = Input.is_action_just_pressed('ui_down')
	var atk = Input.is_action_just_pressed("spacebar")
	
	
	
	
	if is_on_floor() and jump:
		velocity.y = jump_speed
	
	if right:
		transform.x.x = 1
		velocity.x += run_speed
	
	if left:
		transform.x.x = -1
		velocity.x -= run_speed
	
	if health < 0:
		position = Vector2(0,0)
		
	if heal:
		health += heal_amount
	
	if health > max_health:
		health = max_health
	
	if atk:
		$mainarea/CollisionShape2D.set_deferred("disabled",false)
	
	
	
	
	
	
	
func _physics_process(delta):
	
	# print(health)
	velocity.y += gravity * delta
	
	get_input()
	
	move_and_slide()
	








func _on_area_2d_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
