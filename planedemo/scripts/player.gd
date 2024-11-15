extends CharacterBody2D


const SPEED = 300.0

@export var bullet: PackedScene

var timer: float = 0.0


func _physics_process(delta: float) -> void:
	handle_move(delta)
	
	handle_attack(delta)
	
	
func handle_move(delta: float) -> void:
	var input_vector = Vector2()
	if Input.is_action_pressed("right") and position.x <=550:
		input_vector.x += 1
	if Input.is_action_pressed("left") and position.x >= 50:
		input_vector.x -= 1
	if Input.is_action_pressed("down") and position.y <= 950:
		input_vector.y += 1
	if Input.is_action_pressed("up") and position.y >= 50:
		input_vector.y -= 1

	if input_vector.length() > 0:
		input_vector = input_vector.normalized()  # 归一化向量

	velocity = input_vector * SPEED
	move_and_slide()


func handle_attack(delta: float) -> void:
	# 处理子弹连续
	timer += delta
	
	if Input.is_action_pressed("attack") and timer > 0.1:
		var leftB = bullet.instantiate()
		leftB.position.x = position.x - 30
		leftB.position.y = position.y - 50
		get_tree().root.add_child(leftB)
		var rightB = bullet.instantiate()
		rightB.position.x = position.x + 30
		rightB.position.y = position.y - 50
		get_tree().root.add_child(rightB)
		
		timer = 0.0
		
		
