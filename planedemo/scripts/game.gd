extends Node2D


@export var enemy: PackedScene
@onready var score_label: Label = $ScoreLabel

# 每隔一段时间刷新出一个敌机
var freshTime: float = 0
var score: int = 0

var random

func _ready() -> void:
	random = RandomNumberGenerator.new()
	random.randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	freshTime += delta
	
	if freshTime > 1:
		var e = enemy.instantiate() as AnimatedSprite2D
		e.connect("die", Callable(self, "add_score"))
		e.position.y = 0
		e.position.x = random.randf_range(50, 550)
		add_child(e)
		
		freshTime = 0



func add_score() -> void:
	score = score + 1
	score_label.text = "Score: " + str(score)
