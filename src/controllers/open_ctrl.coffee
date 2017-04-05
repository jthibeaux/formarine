angular
.module('fiskkit')
.controller 'OpenCtrl', [
  '$scope'
  'openStack'
  ($scope, openStack)->
    $scope.openStack = openStack
]
