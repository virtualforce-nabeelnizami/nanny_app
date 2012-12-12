class Language < ActiveRecord::Base
belongs_to :user
  LIST_OF_LANGUAGE = [["Afrikaans", 1], ["Albanian", 2], ["Arabic", 3], ["Armenian", 4], ["Azerbaijani", 5], ["Basque", 6], 
    ["Belarusian", 7], ["Bengali", 8], ["Bulgarian", 9], ["Catalan", 10], ["Chinese", 11], ["Croatian", 12], ["Czech", 13], 
    ["Danish", 14], ["Dutch", 15], ["English", 16], ["Esperanto", 17], ["Estonian", 18], ["Filipino", 19], ["Finnish", 20], 
    ["French", 21], ["Galician", 22], ["Georgian", 23], ["German", 24], ["Greek", 25], ["Gujarati", 26], ["Haitian Creole", 27], 
    ["Hebrew", 28], ["Hindi", 29], ["Hungarian", 30], ["Icelandic", 31], ["Indonesian", 32], ["Irish", 33], ["Italian", 34],
    ["Japanese", 35], ["Kannada", 36], ["Korean", 37], ["Lao", 38], ["Latin", 39], ["Latvian", 40], ["Lithuanian", 41], 
    ["Macedonian", 42], ["Malay", 43], ["Maltese", 44], ["Norwegian", 45], ["Persian", 46], ["Polish", 47], ["Portuguese", 48], 
    ["Romanian", 49], ["Russian", 50], ["Serbian", 51], ["Slovak", 52], ["Slovenian", 53], ["Spanish", 54], ["Swahili", 55], 
    ["Swedish", 56], ["Tamil", 57], ["Telugu", 58], ["Thai", 59], ["Turkish", 60], ["Ukrainian", 61], ["Urdu", 62], 
    ["Vietnamese", 63], ["Welsh", 64], ["Yiddish", 65]]

    attr_accessor :language_name
end
