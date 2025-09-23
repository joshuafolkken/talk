extends Node2D

# var _js_on_voices_ready := JavaScriptBridge.create_callback(_on_voices_ready)

var _voice_list: Array[Voice] = []

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit


class Voice:
	var index: int
	var name: String
	var lang: String


func _init() -> void:
	_load_tts_js()


func _load_tts_js() -> void:
	var tts_path := "res://assets/js/tts.js"
	var tts_js := ""
	var file := FileAccess.open(tts_path, FileAccess.READ)
	if file:
		tts_js = file.get_as_text()
		file.close()
	else:
		print("File not found: " + tts_path)

	JavaScriptBridge.eval(tts_js)


func _get_voices() -> bool:
	var tts := JavaScriptBridge.get_interface("tts")
	var voice_json: String = tts.call("get_voice_json")

	if voice_json == "":
		return false

	var voice_data_array: Array = JSON.parse_string(voice_json)
	var voice_list: Array[Voice] = []

	for voice_data: Dictionary in voice_data_array:
		var voice := Voice.new()
		voice.index = voice_data.get("index", 0)
		voice.name = voice_data.get("name", "")
		voice.lang = voice_data.get("lang", "")
		voice_list.append(voice)

	# for voice in voice_list:
	# 	print("index=%d, name=%s, lang=%s" % [voice.index, voice.name, voice.lang])

	return true


func _on_button_button_down() -> void:
	if _voice_list.size() == 0:
		if !_get_voices():
			print("声が取れないー")
			return

	var window := JavaScriptBridge.get_interface("tts")
	window.call("speak_text", _text_edit.text)
