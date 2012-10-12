tinyMCEPopup.requireLangPack()

OpenImageDialog =
  init: ->
    this.initHandlers()
    this.populateAttachmentList()

    # Get the selected contents as text and place it in the input
    console.log tinyMCEPopup.editor.selection.getContent()

  initHandlers: ->
    jQuery('#attachment_list').on 'click', '.attachment', (event) ->
      newSelection = jQuery this
      # do not select the new_attachment div
      return if newSelection.is '#new_attachment'
      jQuery('#attachment_list .attachment').removeClass 'selected'
      newSelection.addClass 'selected'

  populateAttachmentList: ->
    jQuery.ajax tinyMCEPopup.editor.documentBaseURI.path + '/list_attachments.json',
      success: (attachments) ->
        OpenImageDialog.addAttachment a for a in attachments
      complete: (ajaxObj, status)->
        # TODO: show error message if status = 'error'
        OpenImageDialog.loading false

  addAttachment: (a) ->
    container = jQuery '<span />',
      'class': 'attachment'
    container.append jQuery '<p />',
      text: if a.description.length > 0 then a.description else a.filename
    filetype = a.filename.split('.').pop().toLowerCase()
    preview = switch filetype
      when 'jpg', 'jpeg', 'png', 'gif' # image
        jQuery '<img />',
          src: a.url
          alt: a.description
      else
        jQuery '<img />',
          src: '/assets/mimetypes/unknown.png'
          alt: a.description
    container.prepend preview
    jQuery('#attachment_list').append container

  loading: (flag, animationTime)->
    e = jQuery('#attachment_list_loading')
    e.fadeTo (animationTime || 200), (if flag then 1 else 0), ->
      if flag then e.show() else e.hide()

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
