extends Node2D

var _text_to_speech: TextToSpeech
var _speech_to_text: SpeechToText

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit
@onready var _locale_option_button: OptionButton = $CanvasLayer/LocaleOptionButton
@onready var _voice_option_button: OptionButton = $CanvasLayer/VoiceOptionButton


func _ready() -> void:
	_text_to_speech = TextToSpeech.new()
	_text_to_speech.voices_ready.connect(_on_voices_ready)
	_text_to_speech.setup()

	_speech_to_text = SpeechToText.new()
	_speech_to_text.result_received.connect(_on_text_result_received)
	_speech_to_text.recognition_ended.connect(_on_recognition_ended)
	_speech_to_text.setup()


func _on_voices_ready(locale_codes: Dictionary[String, bool]) -> void:
	_locale_option_button.clear()
	for locale in Locale.get_locales(locale_codes):
		if locale.is_separator():
			_locale_option_button.add_separator()
			continue

		_locale_option_button.add_item(locale.get_formatted_name())

	_on_locale_option_button_item_selected(-1)


func _on_text_result_received(text: String) -> void:
	_text_edit.text = text


func _on_recognition_ended() -> void:
	_on_text_to_speech_button_pressed()


func _get_current_locale_code() -> String:
	return Locale.get_code_by_name(_locale_option_button.text)


func _on_speech_to_text_button_pressed() -> void:
	var locale_code := _get_current_locale_code()
	_speech_to_text.start(locale_code)


func _on_text_to_speech_button_pressed() -> void:
	var voice_uri: String = _voice_option_button.get_selected_metadata()
	_text_to_speech.speak(_text_edit.text, voice_uri)


func _on_locale_option_button_item_selected(_index: int) -> void:
	var locale_code := _get_current_locale_code()
	var voices := _text_to_speech.get_voices(locale_code)

	_voice_option_button.clear()

	# Log.d("voices count by Locale code: %s: %d" % [locale_code, voices.size()])

	for i in voices.size():
		var voice := voices[i]
		_voice_option_button.add_item(voice.get_short_name())
		_voice_option_button.set_item_metadata(i, voice.voice_uri)
