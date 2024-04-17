extends Sprite

var direction = false

func init(d):
	direction = d
	
func _ready():
	scale = Vector2(.18, .18)
	
func _process(delta):
	if direction:
		position.x -= 4
	else:
		position.x += 4


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
