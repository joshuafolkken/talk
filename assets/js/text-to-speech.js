class TextToSpeech {
  constructor() {
    this._voices = []
    this._voice_list = []
    this._voice_json = ''
    this._on_voices_ready = null
  }

  setup(on_voices_ready) {
    this._on_voices_ready = on_voices_ready
    speechSynthesis.onvoiceschanged = () => this.setup_voices()
  }

  setup_voices() {
    this._voices = speechSynthesis.getVoices()

    this._voices.forEach((voice, idx) => {
      // console.log(`Voice ${idx}: name="${voice.name}", lang="${voice.lang}"`);

      this._voice_list.push({
        id: idx,
        name: voice.name,
        lang: voice.lang,
      })
    })

    this._voice_json = JSON.stringify(this._voice_list)
    this._on_voices_ready(this._voice_json)

    // console.log('voices: ' + this._voices.length)
  }

  speak(text, voice_name) {
    if (speechSynthesis.speaking) {
      speechSynthesis.cancel()
    }

    const utterance = new SpeechSynthesisUtterance(text)
    const selected_voice = this._voices.find(
      (voice) => voice.name === voice_name
    )
    utterance.voice = selected_voice
    speechSynthesis.speak(utterance)

    console.log('voice name: ' + voice_name)
    // console.log("Speaking text: ", text);

    // if (this._voices.length > 0) {
    //   const japanese_voice = this._voices.find(
    //     // (voice) => voice.name.includes('Google 日本語')
    //     (voice) => voice.lang.includes('en')
    //   )

    //   if (japanese_voice) {
    //     utterance.voice = japanese_voice
    //     // console.log("Using Japanese voice: ", japanese_voice.name);
    //   } else {
    //     utterance.voice = this._voices[0]
    //     // console.log("Using default voice: ", voices[0].name);
    //   }
    // }
  }
}

window.text_to_speech = new TextToSpeech()
