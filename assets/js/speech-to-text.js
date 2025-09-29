class SpeechToText {
  constructor() {
    this._recognition = null
    this._on_result = null
    this._on_end = null
  }

  setup(on_result, on_end) {
    this._on_result = on_result
    this._on_end = on_end

    const SpeechRecognition =
      window.SpeechRecognition || window.webkitSpeechRecognition
    this._recognition = new SpeechRecognition()
    this._recognition.interimResults = true

    this._recognition.onresult = (event) => {
      const result = event.results[0][0].transcript
      this._on_result(result)
    }

    this._recognition.onend = () => {
      this._on_end()
    }
  }

  start(lang) {
    this._recognition.lang = lang
    this._recognition.start()
  }

  stop() {
    this._recognition.stop()
  }
}

window.speech_to_text = new SpeechToText()
