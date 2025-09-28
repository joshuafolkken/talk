class_name TextToSpeech
extends Node

signal voices_ready

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
	var voices_data: Array = JSON.parse_string(voices_json)

	_voices = []
	for voice_data: Dictionary in voices_data:
		var voice := Voice.new(voice_data)
		_voices.append(voice)

	voices_ready.emit()


func speak(text: String, voice_uri: String) -> void:
	_js.call("speak", text, voice_uri)


func get_voices(lang_code: String) -> Array[Voice]:
	var voices := _voices.filter(func(voice: Voice) -> bool: return voice.lang == lang_code)

	voices.sort_custom(
		func(a: Voice, b: Voice) -> bool:
			if a.local_service != b.local_service:
				return int(a.local_service) < int(b.local_service)
			return a.idx < b.idx
	)

	return voices
