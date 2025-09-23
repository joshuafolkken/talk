class TTS {
  constructor() {
    this._voices
    this._voice_list = []
    this._voice_json = ''
  }

  setup_voices() {
    this._voices = speechSynthesis.getVoices()

    this._voices.forEach((voice, idx) => {
      // console.log(`Voice ${idx}: name="${voice.name}", lang="${voice.lang}"`);

      this._voice_list.push({
        index: idx,
        name: voice.name,
        lang: voice.lang,
      })
    })

    this._voice_json = JSON.stringify(this._voice_list)
    // this.on_voices_ready();
    // console.log("voices: " + this._voices.length);
  }

  get_voice_json() {
    return this._voice_json
  }

  speak_text(text) {
    // console.log("Speaking text: ", text);

    if (speechSynthesis.speaking) {
      speechSynthesis.cancel()
    }

    const utterance = new SpeechSynthesisUtterance(text)

    if (this._voices.length > 0) {
      const japanese_voice = this._voices.find(
        (voice) => voice.name.includes('Google 日本語')
        // voice.lang.includes("ja")
      )

      if (japanese_voice) {
        utterance.voice = japanese_voice
        // console.log("Using Japanese voice: ", japanese_voice.name);
      } else {
        utterance.voice = this._voices[0]
        // console.log("Using default voice: ", voices[0].name);
      }
    }

    speechSynthesis.speak(utterance)
  }
}

window.tts = new TTS()
speechSynthesis.onvoiceschanged = () => window.tts.setup_voices()
