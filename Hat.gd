extends Control  # For draggable UI elements like Hat, Pants, Shoes

var is_dragging = false
var initial_position = Vector2()

func _ready():
	initial_position = rect_position  # rect_position is correct for Control nodes

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			is_dragging = true
		else:
			is_dragging = false
			if not is_overlapping_area2d():
				rect_position = initial_position  # Use rect_position for Control nodes

func _process(delta):
	if is_dragging:
		rect_global_position = get_viewport().get_mouse_position()  # rect_global_position for Control nodes

func is_overlapping_area2d() -> bool:
	# You'll need to check if the item is dropped on a valid Area2D like "HeadArea2D"
	var area = get_node("../HeadArea2D")  # Replace with the actual path of your Area2D node
	var mouse_pos = get_global_mouse_position()
	
	# Check if the mouse is within the bounds of the Area2D collision shape
	return area.get_node("CollisionShape2D").shape.get_rect().has_point(mouse_pos)
