extends AnimatedSprite2D
@onready var area_2d: Area2D = $Area2D


var hp: float = 1

# 死亡0.2秒再销毁
var dieTimer: float = 0.2
signal die


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (hp <= 0):
		dieTimer -= delta
		if dieTimer <= 0:
			queue_free()	
	
	# 向下移动
	position.y += 100 * delta
	
	if (position.y > 1000):
		queue_free()


@warning_ignore("unused_parameter")
func _on_area_2d_area_entered(area: Area2D) -> void:
	hp = 0
	play("die")
	die.emit()
