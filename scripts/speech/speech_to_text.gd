class_name SpeechToText
extends Node

signal result_received(text: String)
signal recognition_ended

const FILE_NAME = "speech-to-text.js"

var _js: JavaScriptObject
var _js_on_result := JavaScriptBridge.create_callback(_on_result)
var _js_on_end := JavaScriptBridge.create_callback(_on_end)


func _init() -> void:
	JSLoader.load(FILE_NAME)
	_js = JavaScriptBridge.get_interface("speech_to_text")
	_js.call("setup", _js_on_result, _js_on_end)


func _on_result(args: Array) -> void:
	var text: String = args[0]
	result_received.emit(text)


func _on_end(_args: Array) -> void:
	recognition_ended.emit()


func start(code: String) -> void:
	_js.call("start", code)
