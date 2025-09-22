extends Node2D

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit


class Voice:
	var index: int
	var name: String
	var lang: String


func _ready() -> void:
	var voice_json: String = JavaScriptBridge.eval("voice_json")
	var voice_data_array: Array = JSON.parse_string(voice_json)
	var voice_list: Array[Voice] = []

	for voice_data: Dictionary in voice_data_array:
		var voice := Voice.new()
		voice.index = voice_data.get("index", 0)
		voice.name = voice_data.get("name", "")
		voice.lang = voice_data.get("lang", "")
		voice_list.append(voice)

	#for voice in voice_list:
	#print("index=%d, name=%s, lang=%s" % [voice.index, voice.name, voice.lang])


func _on_button_button_down() -> void:
	var window := JavaScriptBridge.get_interface("window")
	window.call("speakText", _text_edit.text)
