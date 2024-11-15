extends Area2D


@onready var timer = $Timer

# 碰撞时开始倒计时, 0.6秒后重新开始
# 
func _on_body_entered(body: Node2D) -> void:
	print("You died!")
	Engine.time_scale = 0.5 #相当于慢放成0.5倍
	# 碰撞时, 移除玩家的碰撞检测节点
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

# 0.6秒后重新开始
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
