//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self

jQuery(function() {
  $("a[rel~=popover], .has-popover").popover();
  $("a[rel~=tooltip], .has-tooltip").tooltip();
});
