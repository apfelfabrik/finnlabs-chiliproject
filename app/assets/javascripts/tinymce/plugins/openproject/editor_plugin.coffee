###
editor_plugin_src.js

Copyright 2012, Finn GmbH
Released under GPL License.
###
(->
  # Load plugin specific language pack
  tinymce.PluginManager.requireLangPack "openproject"
  tinymce.create "tinymce.plugins.OpenProjectPlugin",
    init: (ed, url) ->
      # Register commands
      ed.addCommand "showOPImageDialog", ->
        # Internal image object like a flash placeholder
        return  unless ed.dom.getAttrib(ed.selection.getNode(), "class", "").indexOf("mceItem") is -1
        ed.windowManager.open
          file: url + "/openImageDialog.htm"
          width: 480 + parseInt(ed.getLang("openproject.delta_width", 0))
          height: 385 + parseInt(ed.getLang("openproject.delta_height", 0))
          inline: 1
        ,
          plugin_url: url

      # Register showOPImageDialog button
      ed.addButton "image",
        title: "advimage.image_desc"
        cmd: "showOPImageDialog"

      # Add a node change handler, selects the button in the UI when a image is selected
      ed.onNodeChange.add (ed, cm, n) ->
        cm.setActive "openproject", n.nodeName is "IMG"

    getInfo: ->
      longname: "OpenProject plugin"
      author: "Philipp Tessenow"
      authorurl: "http://finn.de/team#p.tessenow"
      infourl: "http://finn.de"
      version: "0.8"

  # Register plugin
  tinymce.PluginManager.add "openproject", tinymce.plugins.OpenProjectPlugin
)()