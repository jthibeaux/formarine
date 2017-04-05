angular.module('fiskkit')
.directive 'commentInput', [
  ->
    restrict: 'E'
    templateUrl: 'directives/comment_input/comment_input.html'
    scope:
      object: '='
    link: (scope, elem, attrs)->
      scope.input = {}

      scope.submit = ->
        return unless scope.input.content?

        id = (new Date()).getTime().toString()
        path = "#{scope.object.idPath},#{id}"
        scope.object.comments ||= []
        scope.object.comments.push(
          id: id
          content: scope.input.content
          idPath: path
        )
        scope.input.content = ''
]
