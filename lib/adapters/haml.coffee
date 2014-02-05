Adapter = require '../adapter_base'
path = require 'path'
fs = require 'fs'
W = require 'when'
UglifyJS = require 'uglify-js'

# TODO: add doctype and filter opts
# https://github.com/visionmedia/haml.js#extending-haml

class HAML extends Adapter

  constructor: (@compiler) ->
    @name = 'haml'
    @extensions = ['haml']
    @output = 'html'

  _render: (str, options) ->
    W.resolve @compiler.compile(str)(options)

  _compile: (str, options) ->
    W.resolve @compiler.compile(str, options)

  # clientHelpers: ->
  #   runtime_path = path.join(@compiler.__accord_path, 'haml.js')
  #   runtime = fs.readFileSync(runtime_path, 'utf8')
  #   return UglifyJS.minify(runtime, { fromString: true }).code

module.exports = HAML
