extends Node2D

var speed = 2
var speed1 = 2
var count = 0
var n = 3

func _process(delta):
	$pl.position.y = get_global_mouse_position().y
	$enemy.position.x -= speed
	$"+".position.x -= speed1
	
	if $enemy.position.x <= -146:
		$enemy.position.x = 1183
		$enemy.position.y = rand_range(136,562)
		speed = 1
		count += 1
		$Label.text = str(count)
	if $"+".position.x <= -111:
		$"+".position.x = 1380
		print("+")
		
	var rast = ($enemy.position - $pl.position).length()
	var rast1 = ($"+".position - $pl.position).length()
	
	if(rast) <= 157:
		n -= 1
		hp (n)
	if(rast1) <= 157:
		if n <3:
			n +=1
			print(n)
			hp2 (n)
			$"+".position.x = 1380
func hp2(n):
	if n == 3:
		$"3".visible = true
	if n == 2:
		$"2".visible = true 	
	if n == 1:
		$"1".visible = true 	
	
func hp(n):
	if n == 2:
		$"3".visible = false 
		$enemy.position.x = 1183
		$enemy.position.y = rand_range(136,562)
	if n == 1:
		$"2".visible = false 
		$enemy.position.x = 1183
		$enemy.position.y = rand_range(136,56)
	if n == 0:
		$"1".visible = false 
		$enemy.position.x = 1183
		$enemy.position.y = rand_range(136,56)
		set_process(false)
