class_name JSLoader

const DIR = "res://assets/js/"


static func load(file_name: String) -> void:
	var path := DIR + file_name
	var file := FileAccess.open(path, FileAccess.READ)
	var code := file.get_as_text()
	file.close()
	JavaScriptBridge.eval(code)
