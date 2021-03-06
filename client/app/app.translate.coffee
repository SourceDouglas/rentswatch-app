angular.module 'rentswatchApp'
  .config ($translateProvider, tmhDynamicLocaleProvider, settings)->
    'ngInject'
    # Load current locale
    tmhDynamicLocaleProvider.localeLocationPattern settings.LOCALE_LOCATION
    
    $translateProvider
      .useStaticFilesLoader
        prefix: 'assets/locales/',
        suffix: '.json'
      .registerAvailableLanguageKeys ['en', 'fr', 'de', 'es', 'it', 'cs'],
        'en_US': 'en',
        'en_UK': 'en',
        'en-US': 'en',
        'en-UK': 'en',
        'fr_FR': 'fr',
        'fr-FR': 'fr',
        'de_DE': 'de',
        'de-DE': 'de',
        'es-ES': 'es',
        'es_ES': 'es',
        'it_IT': 'it',
        'it-IT': 'it',
        'cs-CZ': 'cs',
        'cs_CZ': 'cs'
      .determinePreferredLanguage ->
        lang = navigator.language or navigator.userLanguage
        avalaibleKeys = [
          'en_US', 'en_UK', 'en-UK', 'en-US', 'en',
          'fr_FR', 'fr-FR', 'fr',
          'de_DE', 'de-DE', 'de',
          'es_ES', 'es-ES', 'es',
          'it_IT', 'it-IT', 'it',
          'cs_CZ', 'cs-CZ', 'cs'
        ]
        if avalaibleKeys.indexOf(lang) is -1 then 'en' else lang
      .fallbackLanguage ['en']
      .useCookieStorage()
      .useSanitizeValueStrategy null
  .run ($rootScope, tmhDynamicLocale)->
    'ngInject'
    $rootScope.$on '$translateChangeSuccess', (ev, data)->
      tmhDynamicLocale.set data.language
