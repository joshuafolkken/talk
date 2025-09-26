class STT {
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
    this._recognition.lang = 'ja-JP'
    this._recognition.interimResults = true

    this._recognition.onresult = (event) => {
      const result = event.results[0][0].transcript
      this._on_result(result)
    }

    this._recognition.onend = () => {
      this._on_end()
    }
  }

  start() {
    this._recognition.start()
  }

  stop() {
    this._recognition.stop()
  }
}

window.stt = new STT()
