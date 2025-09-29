class_name TextToSpeech
extends Node

signal voices_ready(locale_codes: Dictionary[String, bool])

const FILE_NAME = "text-to-speech.js"

var _js: JavaScriptObject
var _js_on_voices_ready := JavaScriptBridge.create_callback(_on_voices_ready)
var _voices: Array[Voice] = []
var _locale_codes: Dictionary[String, bool] = {}
var _voices_by_locale: Dictionary[String, Array] = {}


func _init() -> void:
	JSLoader.load(FILE_NAME)
	_js = JavaScriptBridge.get_interface("text_to_speech")
	_js.call("setup", _js_on_voices_ready)


func _on_voices_ready(args: Array) -> void:
	var voices_json: String = args[0]
	var voices_data: Array = JSON.parse_string(voices_json)

	_voices.clear()
	_voices_by_locale.clear()

	for voice_data: Dictionary in voices_data:
		var voice := Voice.new(voice_data)
		# print("%s %s" % [voice.locale, voice.name])
		_voices.append(voice)

		if not _voices_by_locale.has(voice.locale):
			_voices_by_locale[voice.locale] = []
		_voices_by_locale[voice.locale].append(voice)

		_locale_codes[voice.locale] = true

	for locale_code: String in _voices_by_locale.keys():
		#print("%s %s" % [locale_code, _voices_by_locale[locale_code].size()])
		_voices_by_locale[locale_code].sort_custom(
			func(a: Voice, b: Voice) -> bool:
				if a.local_service != b.local_service:
					return int(a.local_service) < int(b.local_service)
				return a.idx < b.idx
		)

	Log.d("voices count: %s" % _voices.size())
	Log.d("locale count: %s" % _voices_by_locale.size())

	voices_ready.emit(_locale_codes.duplicate())


func speak(text: String, voice_uri: String) -> void:
	_js.call("speak", text, voice_uri)


func get_voices(locale_code: String) -> Array[Voice]:
	var voices: Array = _voices_by_locale.get(locale_code, [])
	var result: Array[Voice] = []

	for voice: Voice in voices:
		result.append(voice)

	return result
