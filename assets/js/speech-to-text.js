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

    if (!SpeechRecognition) {
      console.error('SpeechRecognition is not supported in this browser')
      return
    }

    this._recognition = new SpeechRecognition()
    this._recognition.interimResults = true
    this._recognition.continuous = false

    this._recognition.onstart = () => {
      console.log('Speech recognition started')
    }

    this._recognition.onresult = (event) => {
      const result = event.results[0][0].transcript
      this._on_result(result)
    }

    this._recognition.onend = () => {
      console.log('Speech recognition ended')
      this._on_end()
    }

    this._recognition.onerror = (event) => {
      console.error('Speech recognition error:', event.error, event)
      this._on_end()
    }
  }

  start(lang) {
    if (!this._recognition) {
      console.error('SpeechRecognition is not initialized')
      return
    }

    console.log('Starting speech recognition with language:', lang)

    this._recognition.lang = lang
    this._recognition.start()
  }

  stop() {
    if (!this._recognition) return

    console.log('Stopping speech recognition')
    this._recognition.stop()
  }
}

window.speech_to_text = new SpeechToText()
