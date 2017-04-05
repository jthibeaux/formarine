angular.module('fiskkit')
.factory 'popPath', [
  ->
    (path)->
      parts = _.split(path, ',')
      _.dropRight(parts, 1).join(',')
]
