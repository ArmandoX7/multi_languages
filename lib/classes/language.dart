class Language {
  final int id;
  final String flag;
  final String name;
  final String languageCode;

  Language(this.id, this.flag, this.name, this.languageCode);

  static List<Language> languageList(){
    return <Language>[
      Language(1, '🇺🇸', 'English', 'en'), // Ingles
      Language(2, '🇲🇽', 'Español', 'es'), // Español
      /* Language(3, '🇨🇳', '中文', 'zh'), // Chino
      Language(4, '🇯🇵', '日本人', 'ja'), // Japones
      Language(5, '🇫🇷', 'français', 'fr'), // Frances
      Language(6, '🇷🇺', 'русский', 'ru'), // Ruso
      Language(7, '🇳🇱', 'Nederlands', 'nl'), // Holandes
      Language(8, '🇩🇪', 'Deutsche', 'de'), // Aleman
      Language(9, '🇮🇹', 'italiano', 'it'), // Italiano
      Language(10, '🇵🇹', 'Português', 'pt'), // Portugues
      Language(11, '🇦🇪', 'عرب', 'ar'), // Arabe
      Language(12, '🇮🇳', 'हिन्दी', 'hi'), // Hindi */
    ];
  }
}