extends Node2D

var _text_to_speech: TextToSpeech
var _speech_to_text: SpeechToText

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit
@onready var _language_option_button: OptionButton = $CanvasLayer/LanguageOptionButton
@onready var _voice_option_button: OptionButton = $CanvasLayer/VoiceOptionButton


func _ready() -> void:
	_text_to_speech = TextToSpeech.new()
	_text_to_speech.voices_ready.connect(_on_voices_ready)

	_speech_to_text = SpeechToText.new()
	_speech_to_text.result_received.connect(_on_text_result_received)
	_speech_to_text.recognition_ended.connect(_on_recognition_ended)


func _on_voices_ready(lang_codes: Dictionary[String, bool]) -> void:
	_language_option_button.clear()
	for language in Language.get_languages(lang_codes):
		_language_option_button.add_item(language.get_name())

	_on_language_option_button_item_selected(-1)


func _on_text_result_received(text: String) -> void:
	_text_edit.text = text


func _on_recognition_ended() -> void:
	_on_text_to_speech_button_pressed()


func _get_current_language_code() -> String:
	var lang_name := _language_option_button.text
	return Language.get_code_by_name(lang_name)


func _on_speech_to_text_button_pressed() -> void:
	var lang_code := _get_current_language_code()
	_speech_to_text.start(lang_code)


func _on_text_to_speech_button_pressed() -> void:
	var voice_uri: String = _voice_option_button.get_selected_metadata()
	_text_to_speech.speak(_text_edit.text, voice_uri)


func _on_language_option_button_item_selected(_index: int) -> void:
	var lang_code := _get_current_language_code()
	var voices := _text_to_speech.get_voices(lang_code)

	_voice_option_button.clear()

	# Log.d("voices count by lang code: %s: %d" % [lang_code, voices.size()])

	for i in voices.size():
		var voice := voices[i]
		_voice_option_button.add_item(voice.get_short_name())
		_voice_option_button.set_item_metadata(i, voice.voice_uri)
