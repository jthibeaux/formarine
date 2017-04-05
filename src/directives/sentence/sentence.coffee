angular.module('fiskkit')
.directive 'sentence', [
  '$state'
  'popPath'
  ($state, popPath)->
    restrict: 'A'
    templateUrl: 'directives/sentence/sentence.html'
    scope:
      sentence: '='
      openStack: '='
    link: (scope, elem, attrs)->
      scope.add = {}

      scope.pop = ->
        $state.go(
          'base.open'
          openStack: ''
        )

      scope.opened = _.includes(
        scope.openStack
        scope.sentence.id
      )

      scope.addComment = (content)->
        return unless content?

        id = (new Date()).getTime().toString()
        path = "#{scope.sentence.idPath},#{id}"
        scope.sentence.comments ||= []
        scope.sentence.comments.push(
          id: id
          content: content
          idPath: path
        )
]
