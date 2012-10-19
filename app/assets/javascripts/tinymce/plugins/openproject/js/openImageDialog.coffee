tinyMCEPopup.requireLangPack()

OpenImageDialog =
  attachableFileTypes: ['jpg', 'jpeg', 'gif', 'png']
  init: ->
    this.initHandlers()
    this.populateAttachmentList()

    # Get the selected contents as text and place it in the input
    console.log tinyMCEPopup.editor.selection.getContent()

  initHandlers: ->
    jQuery('#attachment_list').on 'click', '.attachment', ->
      OpenImageDialog.setSelectedAttachment jQuery(this)
    jQuery('#cancel').on 'click', -> OpenImageDialog.close()

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
    src = switch filetype
      when 'jpg', 'jpeg', 'png', 'gif' then a.url
      when 'pdf' then'/assets/mimetypes/pdf.png'
      when 'txt' then '/assets/mimetypes/txt.png'
      when 'xls', 'xlsx', 'ods' then '/assets/mimetypes/spreadsheet.png'
      when 'doc', 'docx', 'odt' then '/assets/mimetypes/document.png'
      when 'doc', 'docx', 'odt' then '/assets/mimetypes/document.png'
      when 'ppt', 'pptx', 'odp' then '/assets/mimetypes/kpresenter_kpr.png'
      else '/assets/mimetypes/unknown.png'
    container.prepend(jQuery '<img />',
          src: src
          alt: a.description)
    container.data 'info', a
    jQuery('#attachment_list').append container

  loading: (flag, animationTime)->
    e = jQuery('#attachment_list_loading')
    e.fadeTo (animationTime || 200), (if flag then 1 else 0), ->
      if flag then e.show() else e.hide()

  attachmentIsEmbedable: (filename) ->
    filetype = a.filename.split('.').pop().toLowerCase()
    _.contains OpenImageDialog.attachableFileTypes, filetype

  getSelectedAttachment: ->
    jQuery('#attachment_list .attachment.selected')

  setSelectedAttachment: (newSelection)->
    # do not select the new_attachment div
    return if newSelection.is '#new_attachment'
    jQuery('#attachment_list .attachment').removeClass 'selected'
    newSelection.addClass 'selected'
    if OpenImageDialog.attachmentIsEmbedable(newSelection.data('info').filename)
      OpenImageDialog.activateEmbedSelection()

  activateEmbedOrLink: (embed, link) ->
    #foo

  insert: ->
    ed = tinyMCEPopup.editor
    dom = ed.dom
    n = ed.selection.getNode()
    fl = tinyMCEPopup.getParam 'external_image_list', 'tinyMCEImageList'

  close: ->
    tinyMCEPopup.close()

tinyMCEPopup.onInit.add OpenImageDialog.init, OpenImageDialog
