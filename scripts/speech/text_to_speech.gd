class_name TextToSpeech
extends Node

signal voices_ready(lang_codes: Dictionary[String, bool])

const FILE_NAME = "text-to-speech.js"

var _js: JavaScriptObject
var _js_on_voices_ready := JavaScriptBridge.create_callback(_on_voices_ready)
var _voices: Array[Voice] = []
var _lang_codes: Dictionary[String, bool] = {}
var _voices_by_lang: Dictionary[String, Array] = {}


func _init() -> void:
	JSLoader.load(FILE_NAME)
	_js = JavaScriptBridge.get_interface("text_to_speech")
	_js.call("setup", _js_on_voices_ready)


func _on_voices_ready(args: Array) -> void:
	var voices_json: String = args[0]
	var voices_data: Array = JSON.parse_string(voices_json)

	_voices.clear()
	_voices_by_lang.clear()

	for voice_data: Dictionary in voices_data:
		var voice := Voice.new(voice_data)
		# print("%s %s" % [voice.lang, voice.name])
		_voices.append(voice)

		if not _voices_by_lang.has(voice.lang):
			_voices_by_lang[voice.lang] = []
		_voices_by_lang[voice.lang].append(voice)

		_lang_codes[voice.lang] = true

	for lang_code: String in _voices_by_lang.keys():
		# print("%s %s" % [lang_code, _voices_by_lang[lang_code].size()])
		_voices_by_lang[lang_code].sort_custom(
			func(a: Voice, b: Voice) -> bool:
				if a.local_service != b.local_service:
					return int(a.local_service) < int(b.local_service)
				return a.idx < b.idx
		)

	Log.d("voices count: %s" % _voices.size())

	voices_ready.emit(_lang_codes.duplicate())


func speak(text: String, voice_uri: String) -> void:
	_js.call("speak", text, voice_uri)


func get_voices(lang_code: String) -> Array[Voice]:
	var voices: Array = _voices_by_lang.get(lang_code, [])
	var result: Array[Voice] = []

	for voice: Voice in voices:
		result.append(voice)

	return result
