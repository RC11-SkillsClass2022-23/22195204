extends Node2D

# Set the number of columns for the grid
var num_columns = 20

# Set the spacing between images
var spacing = 70

# Set the scale factor (image size)
var scale_factor = 0.1  # Smaller value makes the image smaller

# Called when the node enters the scene tree for the first time.
func _ready():
	var dir = 'res://istanbul street/'
	var image_paths = list_file_in_directory(dir)
	
	for ip in range(len(image_paths)):
		var imPath = dir + image_paths[ip]
		var image = preload("res://image.tscn").instantiate()
		add_child(image)
		image.initialise(imPath)
		
		var x = (ip % num_columns) * spacing
		var y = int(ip / num_columns) * spacing
		
		image.transform.origin = Vector2(x, y)
		# Change image size
		image.scale = Vector2(scale_factor, scale_factor)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func list_file_in_directory(path):
	var files = []
	var dir = DirAccess.open(path)
	if dir:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if file_name.ends_with(".jpeg"):
				files.append(file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	return files
