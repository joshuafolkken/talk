class_name Language

const LANGUAGE_DATA: Array[Array] = [
	# トップ20言語（使用人口順）
	["en-US", "English (United States)"],
	["en-GB", "English (United Kingdom)"],
	["en-AU", "English (Australia)"],
	["en-CA", "English (Canada)"],
	["en-IE", "English (Ireland)"],
	["en-IN", "English (India)"],
	["en-ZA", "English (South Africa)"],
	["en-HK", "English (Hong Kong)"],
	["en-KE", "English (Kenya)"],
	["en-NG", "English (Nigeria)"],
	["en-NZ", "English (New Zealand)"],
	["en-PH", "English (Philippines)"],
	["en-SG", "English (Singapore)"],
	["en-TZ", "English (Tanzania)"],
	["es-ES", "Español (España)"],
	["es-US", "Español (Estados Unidos)"],
	["es-MX", "Español (México)"],
	["es-AR", "Español (Argentina)"],
	["es-BO", "Español (Bolivia)"],
	["es-CL", "Español (Chile)"],
	["es-CO", "Español (Colombia)"],
	["es-CR", "Español (Costa Rica)"],
	["es-CU", "Español (Cuba)"],
	["es-DO", "Español (República Dominicana)"],
	["es-EC", "Español (Ecuador)"],
	["es-SV", "Español (El Salvador)"],
	["es-GQ", "Español (Guinea Ecuatorial)"],
	["es-GT", "Español (Guatemala)"],
	["es-HN", "Español (Honduras)"],
	["es-NI", "Español (Nicaragua)"],
	["es-PA", "Español (Panamá)"],
	["es-PY", "Español (Paraguay)"],
	["es-PE", "Español (Perú)"],
	["es-PR", "Español (Puerto Rico)"],
	["es-UY", "Español (Uruguay)"],
	["es-VE", "Español (Venezuela)"],
	["fr-FR", "Français (France)"],
	["fr-CA", "Français (Canada)"],
	["fr-BE", "Français (Belgique)"],
	["fr-CH", "Français (Suisse)"],
	["de-DE", "Deutsch (Deutschland)"],
	["de-AT", "Deutsch (Österreich)"],
	["de-CH", "Deutsch (Schweiz)"],
	["ja-JP", "日本語"],
	["it-IT", "Italiano"],
	["ko-KR", "한국어"],
	["zh-CN", "中文 (中国)"],
	["zh-CN-liaoning", "中文 (中国遼寧省)"],
	["zh-CN-shaanxi", "中文 (中国陝西省)"],
	["zh-TW", "中文 (台灣)"],
	["zh-HK", "中文 (香港)"],
	["pt-BR", "Português (Brasil)"],
	["pt-PT", "Português (Portugal)"],
	["hi-IN", "हिन्दी"],
	["ru-RU", "Русский"],
	["ar-SA", "العربية (السعودية)"],
	["ar-AE", "العربية (الإمارات العربية المتحدة)"],
	["ar-BH", "العربية (البحرين)"],
	["ar-DZ", "العربية (الجزائر)"],
	["ar-EG", "العربية (مصر)"],
	["ar-IQ", "العربية (العراق)"],
	["ar-JO", "العربية (الأردن)"],
	["ar-KW", "العربية (الكويت)"],
	["ar-LB", "العربية (لبنان)"],
	["ar-LY", "العربية (ليبيا)"],
	["ar-MA", "العربية (المغرب)"],
	["ar-OM", "العربية (عُمان)"],
	["ar-QA", "العربية (قطر)"],
	["ar-SY", "العربية (سوريا)"],
	["ar-TN", "العربية (تونس)"],
	["ar-YE", "العربية (اليمن)"],
	["sv-SE", "Svenska"],
	["tr-TR", "Türkçe"],
	["vi-VN", "Tiếng Việt"],
	["ro-RO", "Română"],
	["ta-IN", "தமிழ்"],
	["ta-MY", "தமிழ் (மலேசியா)"],
	["ta-SG", "தமிழ் (சிங்கப்பூர்)"],
	["ta-LK", "தமிழ் (இலங்கை)"],
	["ur-PK", "اردو"],
	["ur-IN", "اردو (بھارت)"],
	["bn-BD", "বাংলা"],
	["pl-PL", "Polski"],
	# Google サポート
	["nl-NL", "Nederlands"],
	["nl-BE", "Nederlands (België)"],
	["id-ID", "Bahasa Indonesia"],
	# Microsoft サポート
	["az-AZ", "Azərbaycan"],
	["fil-PH", "Filipino"],
	["gl-ES", "Galego"],
	["ka-GE", "ქართული"],
	["el-GR", "Ελληνικά"],
	["gu-IN", "ગુજરાતી"],
	["he-IL", "עברית"],
	["hu-HU", "Magyar"],
	["is-IS", "Íslenska"],
	["iu-Cans-CA", "ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕ)"],
	["iu-Latn-CA", "Inuktitut (Canada)"],
	["ga-IE", "Gaeilge"],
	["jv-ID", "Basa Jawa"],
	["kn-IN", "ಕನ್ನಡ"],
	["kk-KZ", "Қазақ"],
	["km-KH", "ខ្មែរ"],
	["lo-LA", "ລາວ"],
	["lv-LV", "Latviešu"],
	["lt-LT", "Lietuvių"],
	["mk-MK", "Македонски"],
	["ms-MY", "Bahasa Melayu"],
	["ml-IN", "മലയാളം"],
	["mt-MT", "Malti"],
	["mr-IN", "मराठी"],
	["mn-MN", "Монгол"],
	["my-MM", "မြန်မာ"],
	["ne-NP", "नेपाली"],
	["nb-NO", "Norsk (Bokmål)"],
	["ps-AF", "پښتو"],
	["fa-IR", "فارسی"],
	["so-SO", "Soomaali"],
	["su-ID", "Basa Sunda"],
	["sw-TZ", "Kiswahili (Tanzania)"],
	["sw-KE", "Kiswahili"],
	["te-IN", "తెలుగు"],
	["th-TH", "ไทย"],
	["uk-UA", "Українська"],
	["uz-UZ", "O'zbek"],
	["cy-GB", "Cymraeg"],
	["zu-ZA", "IsiZulu"],
	# その他の人気言語
	["af-ZA", "Afrikaans"],
	["am-ET", "አማርኛ"],
	["as-IN", "অসমীয়া"],
	["bg-BG", "Български"],
	["bs-BA", "Bosanski"],
	["ca-ES", "Català"],
	["cs-CZ", "Čeština"],
	["da-DK", "Dansk"],
	["et-EE", "Eesti"],
	["eu-ES", "Euskera"],
	["fi-FI", "Suomi"],
	["hr-HR", "Hrvatski"],
	["lb-LU", "Lëtzebuergesch"],
	["no-NO", "Norsk (Nynorsk)"],
	["or-IN", "ଓଡ଼ିଆ"],
	["pa-IN", "ਪੰਜਾਬੀ"],
	["rm-CH", "Rumantsch"],
	["si-LK", "සිංහල"],
	["sk-SK", "Slovenčina"],
	["sl-SI", "Slovenščina"],
	["sq-AL", "Shqip"],
	["sr-RS", "Српски"],
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


static func get_languages(lang_codes: Dictionary[String, bool]) -> Array[Language]:
	_cached_languages = []
	_language_by_name = {}

	for language_data in LANGUAGE_DATA:
		var lang_code: String = language_data[0]
		if not lang_codes.has(lang_code):
			continue

		var lang_name: String = language_data[1]
		var language := Language.new(lang_code, lang_name)

		_cached_languages.append(language)
		_language_by_name[lang_name] = language

	return _cached_languages.duplicate()


static func find_by_name(name: String) -> Language:
	return _language_by_name.get(name)


static func get_code_by_name(name: String) -> String:
	var language := find_by_name(name)
	return language._code
