tinyMCEPopup.requireLangPack()

OpenImageDialog =
  init: ->
    form = document.forms[0];
    this.initHandlers form

    # Get the selected contents as text and place it in the input
    tinyMCEPopup.editor.selection.getContent {format : 'text'}

  initHandlers: ->
    #debugger
    console.log 'foo'

  insert: ->
    ed = tinyMCEPopup.editor
    dom = ed.dom
    n = ed.selection.getNode()
    fl = tinyMCEPopup.getParam 'external_image_list', 'tinyMCEImageList'

  close: ->
    tinyMCEPopup.close()

tinyMCEPopup.onInit.add OpenImageDialog.init, OpenImageDialog
