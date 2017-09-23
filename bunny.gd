extends Sprite
var velocity_x = 0
var velocity_y = 0
var gravity = 9.8
var max_x = 640
var min_x = 0
var max_y = 480
var min_y = 0

func _ready():
    velocity_x= randf() * 10
    velocity_y = rand_range(5, 10)
    set_fixed_process(true)
    
func _fixed_process(delta):
    var pos = get_position()
    var pos_x = pos.x
    var pos_y = pos.y
    pos_x += velocity_x
    pos_y += velocity_y
    velocity_y += gravity
    if (pos_x > max_x):
        velocity_x*= -1
        pos_x = max_x
    elif (pos_x < min_x):
        velocity_x*= -1
        pos_x = min_x
    if (pos_y > max_y):
        velocity_y *= -0.8
        pos_y = max_y
        if (randf() > 0.5):
            velocity_y -= randf() * 12;
    elif (pos_y < min_y):
        velocity_y = 0
        pos_y = min_y
    set_position(Vector2(pos_x, pos_y))