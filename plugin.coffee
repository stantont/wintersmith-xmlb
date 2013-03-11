xmlb = require 'xmlb'
fs = require 'fs'
path = require 'path'

module.exports = (wintersmith, callback) ->

  class XmlbTemplate extends wintersmith.TemplatePlugin

    constructor: (@tpl) ->

    render: (locals, callback) ->
      try
        callback null, new Buffer @tpl(locals)
      catch error
        callback error
        
  XmlbTemplate.fromFile = (filename, base, callback) ->
    fs.readFile path.join(base, filename), (error, contents) ->
      if error then callback error
      else
        try
          tpl = xmlb.compile contents.toString()
          callback null, new XmlbTemplate tpl
        catch error
          callback error

  wintersmith.registerTemplatePlugin '**/*.xmlb', XmlbTemplate
  callback()
          