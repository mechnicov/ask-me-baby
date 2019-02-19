// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(window).load(function(){
  Pagy.init()
});

$(function(){
  $('#ask-button').click(function(){
    $('#ask-form').slideToggle(300);
    return false;
  });
});

$(function(){
  var bgcolor = document.getElementById('bgcolor');
  var fontcolor = document.getElementById('fontcolor');
  var bordercolor = document.getElementById('bordercolor');
  var previewUpper = document.getElementById('preview-upper');
  var previewLower = document.getElementById('preview-lower');
  var previewBorder = document.getElementById('preview-border');
  var previewName = document.getElementById('preview-name');
  var previewUsername = document.getElementById('preview-username');
  var previewAvatar = document.getElementById('preview-avatar');

  function bgcolorAssign() {
    previewUpper.style.background = bgcolor.value;
    previewLower.style.background = bgcolor.value;
  }
  function fontcolorAssign() {
    previewUpper.style.color = fontcolor.value;
    previewLower.style.color = fontcolor.value;
  }
  function bordercolorAssign() {
    previewBorder.style.borderColor = bordercolor.value;
  }

  bgcolorAssign();
  fontcolorAssign();
  bordercolorAssign();

  $('#bgcolor').change(function(){
    bgcolorAssign();
  });
  $('#fontcolor').change(function(){
    fontcolorAssign();
  });
  $('#bordercolor').change(function(){
    bordercolorAssign();
  });
  $('#avatar_url').change(function(){
    previewAvatar.src = this.value;
  });
  $('#name').change(function(){
    previewName.textContent = this.value;
  });
  $('#username').change(function(){
    previewUsername.textContent = "@" + this.value.toLowerCase();
  });

  var radio = document.getElementsByClassName('radio');
  var colorFields = document.getElementById('color-fields');
  function func (elm) {
    if (elm.id == "custom-colors" && elm.checked)
      colorFields.style.display = "block";
    else
      colorFields.style.display = "none";
      bgcolor.value = "#ecb8a5";
      fontcolor.value = "#904c77";
      bordercolor.value = "#957d95";
      bgcolorAssign();
      fontcolorAssign();
      bordercolorAssign();
  }

  for (var i=0;i<radio.length;i++){
    radio[i].onchange = function () {func(this)};
  }
});
