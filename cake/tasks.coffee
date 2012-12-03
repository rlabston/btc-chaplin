tasks =
  build:      require './tasks/build'
  add:        require './tasks/add'
  generate:   require './tasks/generate'
  help:       require './tasks/help'
  test:       require './tasks/test'

tasks[key] = new value for key, value of tasks

module.exports =
  
  add:
    appcache:
      command:      'add:appcache'
      description:  'Add HTML5 application cache to the project'
      task:         tasks.add.appcache
    bootstrap:
      command:      'add:bootstrap'
      description:  'Add Twitter Bootstrap\n'
      task:         tasks.add.bootstrap

  gen:
    model:
      command:      'gen:model'
      description:  'Generate a Chaplin Model'
      task:         tasks.generate.model
    collection:
      command:      'gen:collection'
      description:  'Generate a Chaplin Collection + Model'
      task:         tasks.generate.collection
    view:
      view:
        command:      'gen:view'
        description:  'Generate a Chaplin View'
        task:         tasks.generate.view
      collection:
        command:      'gen:view:collection'
        description:  'Generate a Chaplin CollectionView + Item View'
        task:         tasks.generate.collectionView
    controller:
      command:      'gen:controller'
      description:  'Generate a Chaplin Controller\n'
      task:         tasks.generate.controller

  build:
    once:
      dev:
        command:      'build:dev'
        description:  'Build project'
        task:         tasks.build.onceDev
      prod:
        command:      'build:prod'
        description:  'Build project minified'
        task:         tasks.build.onceProd
    watch:
      dev:
        command:      'watch:dev'
        description:  'Continuously rebuild project on changes'
        task:         tasks.build.watchDev
      prod:
        command:      'watch:prod'
        description:  'Continuously rebuild project minified on changes'
        task:         tasks.build.watchProd
    server:
      dev:
        command:      'server:dev'
        description:  'Continuously rebuild project on changes, and host locally'
        task:         tasks.build.serverDev
      prod:
        command:      'server:prod'
        description:  'Continuously rebuild project minified on changes, and host locally\n'
        task:         tasks.build.serverProd
  
  test:
    terminal:
      command:      'test'
      description:  'Run test tasks in terminal using jsdom\n'
      task:         tasks.test.terminal

  help:
    npm:
      command:      'help:npm'
      description:  'Help for those running commands from npm'
      task:         tasks.help.npm