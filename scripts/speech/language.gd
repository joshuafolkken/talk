class_name Language

const LANGUAGE_DATA: Array[Array] = [
	# 主要学習言語（学習人気順）
	["en-US", "English (United States)"],
	["en-GB", "English (United Kingdom)"],
	["en-AU", "English (Australia)"],
	# ["en-CA", "English (Canada)"],
	["en-IE", "English (Ireland)"],
	["en-IN", "English (India)"],
	["en-ZA", "English (South Africa)"],
	["es-ES", "Español (España)"],
	["es-MX", "Español (México)"],
	["es-US", "Español (Estados Unidos)"],
	["fr-FR", "Français (France)"],
	["fr-CA", "Français (Canada)"],
	["de-DE", "Deutsch (Deutschland)"],
	["ja-JP", "日本語"],
	["ko-KR", "한국어"],
	["it-IT", "Italiano"],
	["zh-CN", "中文 (中国)"],
	["zh-TW", "中文 (台灣)"],
	["zh-HK", "中文 (香港)"],
	["pt-BR", "Português (Brasil)"],
	["pt-PT", "Português (Portugal)"],
	["ru-RU", "Русский"],
	# ["ar-SA", "العربية (السعودية)"],  # 音声が利用できない（ar-001のみ利用可能）
	["hi-IN", "हिन्दी"],
	# その他の人気言語
	["th-TH", "ไทย"],
	["vi-VN", "Tiếng Việt"],
	["tr-TR", "Türkçe"],
	["nl-NL", "Nederlands"],
	["nl-BE", "Nederlands (België)"],
	["sv-SE", "Svenska"],
	["ms-MY", "Bahasa Melayu"],
	["nb-NO", "Norsk (Bokmål)"],
	# ["no-NO", "Norsk"],  # 音声が利用できない（nb-NOのみ利用可能）
	["da-DK", "Dansk"],
	["fi-FI", "Suomi"],
	["pl-PL", "Polski"],
	["cs-CZ", "Čeština"],
	["hu-HU", "Magyar"],
	["ro-RO", "Română"],
	["bg-BG", "Български"],
	["hr-HR", "Hrvatski"],
	["sk-SK", "Slovenčina"],
	["sl-SI", "Slovenščina"],
	# ["et-EE", "Eesti"],
	# ["lv-LV", "Latviešu"],
	# ["lt-LT", "Lietuvių"],
	["el-GR", "Ελληνικά"],
	["uk-UA", "Українська"],
	# ["bn-BD", "বাংলা"],
	["ta-IN", "தமிழ்"],
	# ["te-IN", "తెలుగు"],
	# ["ml-IN", "മലയാളം"],
	# ["kn-IN", "ಕನ್ನಡ"],
	# ["gu-IN", "ગુજરાતી"],
	# ["pa-IN", "ਪੰਜਾਬੀ"],
	# ["or-IN", "ଓଡ଼ିଆ"],
	# ["as-IN", "অসমীয়া"],
	# ["ne-NP", "नेपाली"],
	# ["si-LK", "සිංහල"],
	# ["my-MM", "မြန်မာ"],
	# ["km-KH", "ខ្មែរ"],
	# ["lo-LA", "ລາວ"],
	# ["ka-GE", "ქართული"],
	# ["am-ET", "አማርኛ"],
	["he-IL", "עברית"],
	# ["fa-IR", "فارسی"],
	# ["ur-PK", "اردو"],
	# ["sw-KE", "Kiswahili"],
	# ["zu-ZA", "IsiZulu"],
	# ["af-ZA", "Afrikaans"],
	# ["is-IS", "Íslenska"],
	# ["ga-IE", "Gaeilge"],
	# ["cy-GB", "Cymraeg"],
	# ["mt-MT", "Malti"],
	# ["eu-ES", "Euskera"],
	["ca-ES", "Català"],
	# ["gl-ES", "Galego"],
	# ["lb-LU", "Lëtzebuergesch"],
	# ["rm-CH", "Rumantsch"],
	# ["sq-AL", "Shqip"],
	# ["mk-MK", "Македонски"],
	# ["sr-RS", "Српски"],
	# ["bs-BA", "Bosanski"],
]

static var _cached_languages: Array[Language] = []
static var _language_by_name: Dictionary[String, Language] = {}

var _code := ""
var _name := ""


func _init(code: String, name: String) -> void:
	_code = code
	_name = name


func get_code() -> String:
	return _code


func get_name() -> String:
	return _name


static func _initialize() -> void:
	for language_data in LANGUAGE_DATA:
		var code: String = language_data[0]
		var name: String = language_data[1]
		var language := Language.new(code, name)

		_cached_languages.append(language)
		_language_by_name[name] = language


static func _ensure_initialized() -> void:
	if _cached_languages.is_empty():
		_initialize()


static func get_languages() -> Array[Language]:
	_ensure_initialized()
	return _cached_languages.duplicate()


static func find_by_name(name: String) -> Language:
	_ensure_initialized()
	return _language_by_name.get(name)


static func get_code_by_name(name: String) -> String:
	var language := find_by_name(name)
	return language._code
