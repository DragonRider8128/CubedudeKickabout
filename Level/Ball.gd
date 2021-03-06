extends RigidBody

var my_spawn

func _ready():
	my_spawn = get_tree().get_root().find_node("BallSpawn",true,false)

func reset():
	translation = my_spawn.translation
	axis_lock_linear_x = false
	axis_lock_linear_y = false
	axis_lock_linear_z = false
	linear_velocity = Vector3( 0, 0, 0 )
	angular_velocity = Vector3( 0, 0, 0 )
	

func freeze(id):
	axis_lock_linear_x = true
	axis_lock_linear_y = true
	axis_lock_linear_z = true


func _on_Ball_body_entered(body):
	if body is KinematicBody and not $AudioStreamPlayer.is_playing():
		$AudioStreamPlayer.play()
		
