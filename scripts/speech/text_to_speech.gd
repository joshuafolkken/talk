class_name TextToSpeech
extends Node

signal voices_ready(voices: Array[Voice])

const FILE_NAME = "text-to-speech.js"

var _js: JavaScriptObject
var _js_on_voices_ready := JavaScriptBridge.create_callback(_on_voices_ready)
var _voices: Array[Voice] = []


func _init() -> void:
	JSLoader.load(FILE_NAME)
	_js = JavaScriptBridge.get_interface("text_to_speech")
	_js.call("setup", _js_on_voices_ready)


func _on_voices_ready(args: Array) -> void:
	var voices_json: String = args[0]
	# Log.d(voices_json)

	var voices_data: Array = JSON.parse_string(voices_json)

	for voice_data: Dictionary in voices_data:
		var voice := Voice.new()
		voice.index = voice_data.get("index", 0)
		voice.name = voice_data.get("name", "")
		voice.lang = voice_data.get("lang", "")
		_voices.append(voice)

	voices_ready.emit(_voices)


func speak(text: String) -> void:
	_js.call("speak", text)
