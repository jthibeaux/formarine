angular
.module('fiskkit')
.controller 'BaseCtrl', [
  '$scope'
  '$state'
  'addIdPaths'
  'sentences'
  ($scope, $state, addIdPaths, sentences)->
    $scope.sentences = addIdPaths(sentences)

    if $state.is('base')
      $state.go(
        'base.open'
        openStack: ''
      ,
        location: 'replace'
      )
]
