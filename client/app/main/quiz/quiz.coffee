'use strict'

angular.module 'rentswatchApp'
.config ($stateProvider) ->
  $stateProvider
  .state 'main.quiz',
    url: 'q/'
    templateUrl: 'app/main/quiz/quiz.html'
    controller: 'QuizCtrl as quiz'