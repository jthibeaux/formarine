angular.module 'fiskkit'
.config [
  '$stateProvider'
  '$urlRouterProvider'
  '$locationProvider'
  ($stateProvider, $urlRouterProvider, $locationProvider)->
    $urlRouterProvider
    .otherwise('/')

    $stateProvider
    .state 'base',
      url: '/'
      controller: 'BaseCtrl'
      templateUrl: 'templates/base.html'
      resolve:
        sentences: [
          ->
            [
              id: '1'
              content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
              comments: [
                id: '2'
                content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer aliquam, felis ut tincidunt consequat, nunc.'
                comments: [
                  id: '3'
                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque mauris purus, accumsan sit amet velit.'
                  comments: [
                    id: '321'
                    content: 'Vitae in est rhoncus leo ac tortor, mollis morbi malesuada.'
                    comments: [
                      id: '3211'
                      content: 'Vestibulum et eros mattis wisi, mattis ut eget ligula arcu, pede ipsum.'
                    ]
                  ]
                ,
                  id: '31'
                  content: 'Dictum lectus morbi ultricies lacus, lobortis massa condimentum semper vivamus eros mattis, egestas eu ullamcorper vitae magna mi, porttitor orci sodales, fringilla sed.'
                ,
                  id: '32'
                  content: 'Quisque sociis id molestie sociosqu.'
                ,
                  id: '33'
                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ,
                  id: '34'
                  content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ,
                  id: '35'
                  content: 'Quisque sociis id molestie sociosqu.'
                ,
                  id: '36'
                  content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ,
                  id: '37'
                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ]
              ]
            ,
              id: '4'
              content: 'Vitae in est rhoncus leo ac tortor, mollis morbi malesuada.'
              comments: [
                id: '5'
                content: 'Quisque sociis id molestie sociosqu.'
                comments: [
                  id: '6'
                  content: 'This is another comment'
                  comments: [
                    id: '61'
                    content: 'Dictum lectus morbi ultricies lacus, lobortis massa condimentum semper vivamus eros mattis, egestas eu ullamcorper vitae magna mi, porttitor orci sodales, fringilla sed.'
                    comments: [
                      id: '611'
                      content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                    ]
                  ]
                ]
              ,
                id: '51'
                content: 'Dictum lectus morbi ultricies lacus, lobortis massa condimentum semper vivamus eros mattis, egestas eu ullamcorper vitae magna mi, porttitor orci sodales, fringilla sed.'
                comments: [
                  id: '61'
                  content: 'Quisque sociis id molestie sociosqu.'
                ]
              ,
                id: '52'
                content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                comments: [
                  id: '62'
                  content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ]
              ,
                id: '53'
                content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                comments: [
                  id: '63'
                  content: 'Consectetur adipiscing elit. Fusce blandit venenatis est sit amet venenatis.'
                ]
              ,
                id: '54'
                content: 'Dictum lectus morbi ultricies lacus, lobortis massa condimentum semper vivamus eros mattis, egestas eu ullamcorper vitae magna mi, porttitor orci sodales, fringilla sed.'
                comments: [
                  id: '64'
                  content: 'Quisque sociis id molestie sociosqu.'
                ]
              ]
            ]
        ]
    .state 'base.open',
      url: 'open?openStack'
      resolve:
        openStack: [
          '$stateParams'
          ($stateParams)->
            _.split($stateParams.openStack, ',')
        ]
      views:
        content:
          controller: 'OpenCtrl'
          templateUrl: 'templates/open.html'
]
