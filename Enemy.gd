extends Node2D
onready var bullet = preload("res://scenes/Bullet.tscn")
var b

func _physics_process(delta):
	if $RayCast2D.is_colliding():
		if $Timer.is_stopped():
			$Timer.start()
	else:
		if not $Timer.is_stopped():
			$Timer.stop()
	
func _on_Area2D_area_entered(area):
		queue_free()
	
func shoot(dir):
		b = bullet.instance()
		b.init(dir, 800)
		get_parent().add_child(b)
		b.global_position = $Position2D.global_position
		
func _on_Timer_timeout():
	shoot(true)
