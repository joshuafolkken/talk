class_name Voice

var idx: int
var voice_uri: String
var name: String
var lang: String
var local_service: bool
var default: bool


func _init(data: Dictionary) -> void:
	idx = data.get("idx", 0)
	voice_uri = data.get("voice_uri", "")
	name = data.get("name", "")
	lang = data.get("lang", "")
	local_service = data.get("local_service", false)
	default = data.get("default", false)


func get_short_name() -> String:
	if name.find("Microsoft") != -1:
		return name.split(" - ")[0].replace(" (Natural)", "")

	if name.find(" (") != -1:
		return name.split(" (")[0]

	# if name.find("Google") != -1:
	# 	if name.find("Female") != -1:
	# 		return "Google Female"
	# 	if name.find("Male") != -1:
	# 		return "Google Male"

	# 	return "Google"

	return name
