jQuery(document).ready(function($) {
  var load_cb, memberstab, update_cb;
  init_members_cb = function () {
    $("#members_add_form select.select2-select").each(function (ix, elem){
      if (!$.isEmptyObject(elem.siblings('div.select2-select.select2-container'))) {
        setTimeout (function () {
          $(elem).select2();
        }, 0);
      }
    });
  }

  memberstab = $('#tab-members').first();
  if ((memberstab != null) && (memberstab.hasClass("selected"))) {
    init_members_cb();
  } else {
    memberstab.click(init_members_cb);
  }
});