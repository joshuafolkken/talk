extends Node2D

var _on_tts_voices_ready_js := JavaScriptBridge.create_callback(_on_tts_voices_ready)
var _on_stt_result_js := JavaScriptBridge.create_callback(_on_stt_result)
var _on_stt_end_js := JavaScriptBridge.create_callback(_on_stt_end)

var _voices: Array[Voice] = []

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit


func _init() -> void:
	_eval_js("res://assets/js/text-to-speech.js")
	_eval_js("res://assets/js/speech-to-text.js")

	var text_to_speech := JavaScriptBridge.get_interface("text_to_speech")
	text_to_speech.call("setup", _on_tts_voices_ready_js)

	var speech_to_text := JavaScriptBridge.get_interface("speech_to_text")
	speech_to_text.call("setup", _on_stt_result_js, _on_stt_end_js)


func _on_tts_voices_ready(args: Array) -> void:
	var voices_json: String = args[0]
	# print(voices_json)

	var voices_data: Array = JSON.parse_string(voices_json)

	for voice_data: Dictionary in voices_data:
		var voice := Voice.new()
		voice.index = voice_data.get("index", 0)
		voice.name = voice_data.get("name", "")
		voice.lang = voice_data.get("lang", "")
		_voices.append(voice)

	for voice in _voices:
		print("index=%d, name=%s, lang=%s" % [voice.index, voice.name, voice.lang])


func _on_stt_result(args: Array) -> void:
	var result: String = args[0]
	_text_edit.text = result


func _on_stt_end(_args: Array) -> void:
	_on_text_to_speech_button_pressed()


func _eval_js(path: String) -> void:
	var file := FileAccess.open(path, FileAccess.READ)
	var code := file.get_as_text()
	file.close()
	JavaScriptBridge.eval(code)


func _on_text_to_speech_button_pressed() -> void:
	var text_to_speech := JavaScriptBridge.get_interface("text_to_speech")
	text_to_speech.call("speak_text", _text_edit.text)


func _on_speech_to_text_button_pressed() -> void:
	var speech_to_text := JavaScriptBridge.get_interface("speech_to_text")
	speech_to_text.call("start")
