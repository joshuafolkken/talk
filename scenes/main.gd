extends Node2D

var _on_stt_result_js := JavaScriptBridge.create_callback(_on_stt_result)
var _on_stt_end_js := JavaScriptBridge.create_callback(_on_stt_end)

var _voice_list: Array[Voice] = []

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit


class Voice:
	var index: int
	var name: String
	var lang: String


func _init() -> void:
	_eval_js("res://assets/js/stt.js")
	_eval_js("res://assets/js/tts.js")

	var stt := JavaScriptBridge.get_interface("stt")
	stt.call("set_on_result", _on_stt_result_js)
	stt.call("set_on_end", _on_stt_end_js)


func _on_stt_result(args: Array) -> void:
	var result: String = args[0]
	_text_edit.text = result


func _on_stt_end(_args: Array) -> void:
	_on_text_to_speech_button_pressed()


func _eval_js(path: String) -> void:
	var file := FileAccess.open(path, FileAccess.READ)
	var code := file.get_as_text()
	JavaScriptBridge.eval(code)


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


func _on_text_to_speech_button_pressed() -> void:
	if _voice_list.size() == 0:
		if !_get_voices():
			Log.w("Voice not found")
			return

	var window := JavaScriptBridge.get_interface("tts")
	window.call("speak_text", _text_edit.text)


func _on_speech_to_text_button_pressed() -> void:
	var stt := JavaScriptBridge.get_interface("stt")
	stt.call("start")
