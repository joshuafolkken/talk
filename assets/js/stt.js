class STT {
  constructor() {
    this._recognition = null
    this._on_result = null
    this._on_end = null
  }

  setup() {
    const SpeechRecognition =
      window.SpeechRecognition || window.webkitSpeechRecognition
    this._recognition = new SpeechRecognition()
    this._recognition.lang = 'ja-JP'
    this._recognition.interimResults = true
    this._recognition.onresult = (event) => {
      const result = event.results[0][0].transcript
      if (this._on_result) {
        this._on_result(result)
      }
    }
    this._recognition.onend = () => {
      if (this._on_end) {
        this._on_end()
      }
    }
  }

  set_on_result(callback) {
    this._on_result = callback
  }

  set_on_end(callback) {
    this._on_end = callback
  }

  start() {
    if (!this._recognition) this.setup()
    this._recognition.start()
  }

  stop() {
    this._recognition.stop()
  }
}

window.stt = new STT()
window.stt.setup()
