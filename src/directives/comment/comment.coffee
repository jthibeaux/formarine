angular.module('fiskkit')
.directive 'comment', [
  '$state'
  'popPath'
  ($state, popPath)->
    restrict: 'A'
    templateUrl: 'directives/comment/comment.html'
    scope:
      comment: '='
      openStack: '='
      last: '='
    link: (scope, elem, attrs)->
      scope.add = {}

      scope.pop = ->
        $state.go(
          'base.open'
          openStack: popPath(scope.comment.idPath, scope.comment.id)
        )

      scope.addComment = (content)->
        return unless content?

        id = (new Date()).getTime().toString()
        path = "#{scope.comment.idPath},#{id}"
        scope.comment.comments ||= []
        scope.comment.comments.push(
          id: id
          content: content
          idPath: path
        )

      scope.opened = _.includes(
        scope.openStack
        scope.comment.id
      )
]
