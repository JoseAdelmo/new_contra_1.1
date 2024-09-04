extends Sprite

var direction = false
var start_position = 0
var lifespan = 400

func init(d, ls=400):
	direction = d
	lifespan = ls
	
func _ready():
	scale = Vector2(.18, .18)
	
func _process(delta):
	if direction:
		position.x -= 4
	else:
		position.x += 4


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Area2D_area_entered(area):
	queue_free()
