extends CharacterBody2D

signal PinReached
signal Landing
signal TakingOff

var target_position = Vector2()
var position_margin = 20
@export var full_speed = 200 #velocity constant
@export var fly_by_speed = 40
var direction = Vector2()
var state = "landed"

var landing_area = null



# Called when the node enters the scene tree for the first time.
func _ready():
	target_position = self.position
	direction = Vector2(0,0)
	self.rotation = direction.angle()
	state = "landed"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if state == "moving":
		if self.position.x < target_position.x + position_margin && self.position.x > target_position.x - position_margin && self.position.y < target_position.y + position_margin && self.position.y > target_position.y - position_margin:
			emit_signal("PinReached")
			
		else:
			move_to(target_position, delta, full_speed)
	if state == "fly_by":
		#idle_angle += 2 * delta
		#var circle_target = Vector2()
		#circle_target = (target_position + Vector2(sin(idle_angle), cos(idle_angle)) * 180)
		#circle(circle_target, delta)
		fly_by(delta)

	if state == "landed":
		pass
		


func stop(type):
	if type == "Flying":
		state = "fly_by"
	if type == "Landing":
		land()
		
func land():
	state = "landed"
	$Sprite.animation = "Landed"
	emit_signal("Landing")
	
	if landing_area:
		landing_area.interraction_start()

#func circle(target,delta):
	#direction = (target - self.position).normalized()
	##	direction = (target_position - self.position).normalized()
	#self.rotation = direction.angle()
	#velocity = full_speed* direction * delta
	#self.position += velocity

func fly_by(delta):
	target_position += (fly_by_speed+1) * direction * delta
	direction = (target_position - self.position).normalized()
	move_to(target_position, delta, fly_by_speed)
	

func move_to(target, delta, speed):
#	var move_time = target-self.position
#	var tween = get_tree().create_tween()
#	tween.tween_property(self, "position", target, move_time)
#	tween.play()
	var tween = get_tree().create_tween() 
	tween.tween_property(self, "direction", (target - self.position).normalized(), 2 )
	tween.play()
#	direction = (target_position - self.position).normalized()
	self.rotation = direction.angle()
	velocity = speed* direction
	move_and_slide()
	
	
	
	
func new_target(pin):
	if state == "landed":
		emit_signal("TakingOff")
	
	target_position = pin.position
	state = "moving"
	$Sprite.animation = "Flying"
	$Sprite.play()
	
	
	




func _on_landing_box_area_entered(area):
	landing_area = area


func _on_landing_box_area_exited(area):
	landing_area = null
