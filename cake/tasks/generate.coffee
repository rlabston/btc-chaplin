Exec = require '../lib/exec'

commander = require 'commander'

module.exports = class Generate extends Exec
  command: './node_modules/.bin/brunch'
  args: ['generate']

  collection:     ({name}) => @_generate 'collection', name
  model:          ({name}) => @_generate 'model', name
  controller:     ({name}) => @_generate 'controller', name
  view:           ({name}) => @_generate 'view', name
  collectionView: ({name}) => @_generate 'collection-view', name

  _generate: (type, name) ->
    if name?
      name = @_toDash name
      if name.length isnt 0 and @_validate type, name
        @_exec type, name
      else
        console.log 'Invalid name'
    else
      @_prompt type, (name) =>
        name = @_toDash name
        if name.length isnt 0 and @_validate type, name
          @_exec type, name, process.exit
        else
          console.log 'Invalid name'
          @_generate type

  _validate: (type, name) ->
    return true unless type is 'view'
    name isnt 'base'

  _exec: (type, name, callback = ->) ->
    args = @args[..]
    args.push type
    args.push name
    @exec args, callback

  _prompt: (type, callback) ->
    commander.prompt "\nEnter name for #{type}: ", callback

  _toDash: (string) ->
    " #{string} "
      .replace(/-/g, '_')
      .replace(/[^(\w|\d|\s)]/g, '')
      .replace(/_/g, ' ')
      .replace(/[A-Z]{1,}[^A-Z]/g, (string) ->
        start = string[...string.length - 2]
        end = string[string.length - 2..]
        " #{start.toLowerCase()} #{end.toLowerCase()}"
      )
      .trim()
      .replace(/\s{1,}/g, '-')