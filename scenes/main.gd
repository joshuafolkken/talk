extends Node2D

var _text_to_speech: TextToSpeech
var _speech_to_text: SpeechToText

@onready var _text_edit: TextEdit = $CanvasLayer/TextEdit


func _ready() -> void:
	_text_to_speech = TextToSpeech.new()
	_text_to_speech.voices_ready.connect(_on_voices_ready)

	_speech_to_text = SpeechToText.new()
	_speech_to_text.result_received.connect(_on_text_result_received)
	_speech_to_text.recognition_ended.connect(_on_recognition_ended)


func _on_voices_ready(voices: Array[Voice]) -> void:
	Log.i("voices: %d" % voices.size())

	# for voice in _voices:
	# 	Log.d("index=%d, name=%s, lang=%s" % [voice.index, voice.name, voice.lang])


func _on_text_result_received(text: String) -> void:
	_text_edit.text = text


func _on_recognition_ended() -> void:
	_on_text_to_speech_button_pressed()


func _on_text_to_speech_button_pressed() -> void:
	_text_to_speech.speak(_text_edit.text)


func _on_speech_to_text_button_pressed() -> void:
	_speech_to_text.start()
