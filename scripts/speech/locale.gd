class_name Locale

const SEPARATOR_CODE: String = "-----"
const LOCALE_DATA: Array[Array] = [
	# Top 20 languages (by population)
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
	# Others
	[SEPARATOR_CODE, SEPARATOR_CODE],
	["af-ZA", "Afrikaans"],
	["am-ET", "አማርኛ"],
	["as-IN", "অসমীয়া"],
	["az-AZ", "Azərbaycan"],
	["bg-BG", "Български"],
	["bs-BA", "Bosanski"],
	["ca-ES", "Català"],
	["cs-CZ", "Čeština"],
	["cy-GB", "Cymraeg"],
	["da-DK", "Dansk"],
	["el-GR", "Ελληνικά"],
	["et-EE", "Eesti"],
	["eu-ES", "Euskera"],
	["fa-IR", "فارسی"],
	["fi-FI", "Suomi"],
	["fil-PH", "Filipino"],
	["ga-IE", "Gaeilge"],
	["gl-ES", "Galego"],
	["gu-IN", "ગુજરાતી"],
	["he-IL", "עברית"],
	["hr-HR", "Hrvatski"],
	["hu-HU", "Magyar"],
	["id-ID", "Bahasa Indonesia"],
	["is-IS", "Íslenska"],
	["iu-Cans-CA", "ᐃᓄᒃᑎᑐᑦ (ᑲᓇᑕ)"],
	["iu-Latn-CA", "Inuktitut (Canada)"],
	["jv-ID", "Basa Jawa"],
	["ka-GE", "ქართული"],
	["kk-KZ", "Қазақ"],
	["km-KH", "ខ្មែរ"],
	["kn-IN", "ಕನ್ನಡ"],
	["lb-LU", "Lëtzebuergesch"],
	["lo-LA", "ລາວ"],
	["lt-LT", "Lietuvių"],
	["lv-LV", "Latviešu"],
	["mk-MK", "Македонски"],
	["ml-IN", "മലയാളം"],
	["mn-MN", "Монгол"],
	["mr-IN", "मराठी"],
	["ms-MY", "Bahasa Melayu"],
	["mt-MT", "Malti"],
	["my-MM", "မြန်မာ"],
	["nb-NO", "Norsk (Bokmål)"],
	["ne-NP", "नेपाली"],
	["nl-BE", "Nederlands (België)"],
	["nl-NL", "Nederlands"],
	["no-NO", "Norsk (Nynorsk)"],
	["or-IN", "ଓଡ଼ିଆ"],
	["pa-IN", "ਪੰਜਾਬੀ"],
	["ps-AF", "پښتو"],
	["rm-CH", "Rumantsch"],
	["si-LK", "සිංහල"],
	["sk-SK", "Slovenčina"],
	["sl-SI", "Slovenščina"],
	["so-SO", "Soomaali"],
	["sq-AL", "Shqip"],
	["sr-RS", "Српски"],
	["su-ID", "Basa Sunda"],
	["sw-KE", "Kiswahili"],
	["sw-TZ", "Kiswahili (Tanzania)"],
	["te-IN", "తెలుగు"],
	["th-TH", "ไทย"],
	["uk-UA", "Українська"],
	["uz-UZ", "O'zbek"],
	["zu-ZA", "IsiZulu"],
]

static var _cached_locale: Array[Locale] = []
static var _locale_by_name: Dictionary[String, Locale] = {}

var _code := ""
var _name := ""


func _init(code: String, name: String) -> void:
	_code = code
	_name = name


func get_code() -> String:
	return _code


func get_name() -> String:
	return _name


func get_formatted_name() -> String:
	if is_separator():
		return _name

	return "[%s] %s" % [_code, _name]


func is_separator() -> bool:
	return _code == SEPARATOR_CODE


static func get_locales(locale_codes: Dictionary[String, bool]) -> Array[Locale]:
	_cached_locale = []
	_locale_by_name = {}

	for locale_data in LOCALE_DATA:
		var locale_code: String = locale_data[0]
		var locale_name: String = locale_data[1]
		var locale := Locale.new(locale_code, locale_name)

		if not locale.is_separator():
			if not locale_codes.has(locale_code):
				continue

		_cached_locale.append(locale)
		_locale_by_name[locale_name] = locale

	return _cached_locale.duplicate()


static func find_by_name(name: String) -> Locale:
	return _locale_by_name.get(name)


static func get_code_by_name(name: String) -> String:
	var start := name.find("[")
	var end := name.find("]", start)
	if start != -1 and end != -1:
		return name.substr(start + 1, end - start - 1)

	var locale := find_by_name(name)
	return locale._code
