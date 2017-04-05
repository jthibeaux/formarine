angular.module('fiskkit')
.factory 'addIdPaths', [
  ->
    mapObject = (map, parentPath, object)->
      object.idPath = "#{parentPath}#{object.id}"
      if object.comments?
        _.each(
          object.comments
          (comment)->
            mapObject(map, object.idPath + ',', comment)
        )

    (objects)->
      map = {}
      _.each(
        objects
        (object)->
          mapObject(map, '', object)
      )
]
