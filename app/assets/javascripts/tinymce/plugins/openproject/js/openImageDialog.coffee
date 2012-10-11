tinyMCEPopup.requireLangPack()

OpenImageDialog =
  init: ->
    this.initHandlers()

    # Get the selected contents as text and place it in the input
    console.log tinyMCEPopup.editor.selection.getContent()

  initHandlers: ->
    jQuery('#attachment_list').on 'click', '.attachment', (event) ->
      newSelection = jQuery this
      # do not select the new_attachment div
      return if newSelection.is '#new_attachment'
      jQuery('#attachment_list .attachment').removeClass 'selected'
      newSelection.addClass 'selected'

  getSelectedAttachment: ->
    jQuery('#attachment_list .attachment.selected')

  insert: ->
    ed = tinyMCEPopup.editor
    dom = ed.dom
    n = ed.selection.getNode()
    fl = tinyMCEPopup.getParam 'external_image_list', 'tinyMCEImageList'

  close: ->
    tinyMCEPopup.close()

tinyMCEPopup.onInit.add OpenImageDialog.init, OpenImageDialog
