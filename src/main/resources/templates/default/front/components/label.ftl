<#macro label>
<div class="row">
  <div class="col-md-4">
    <div class="form-group">
      <label for="label">标签</label>
      <input type="hidden" name="labels"/>
      <input type="text" id="label" class="form-control" placeholder="给话题加上标签吧 (可选)"/>
    </div>
  </div>
  <div class="col-md-8">
    <div class="form-group">
      <label for="labels">&nbsp;</label>
      <div id="labels"></div>
    </div>
  </div>
</div>
<link href="//cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.css" rel="stylesheet">
<script src="//cdn.bootcss.com/jqueryui/1.12.1/jquery-ui.min.js"></script>
<script>
  $("#label").autocomplete({
    source: "/label/search",
    minLength: 2,
    select: function (event, ui) {
      var label = ui.item.value;
      setLabel(label);
    }
  });
  $("#label").keyup(function (e) {
    if (e.keyCode === 13 && $(this).val().length > 0) {
      setLabel($(this).val());
    }
  });
  function setLabel(label) {
    if($("#labels .label").size() >= 5) {
      $("#error_message").text("每个话题最多只能添加5个话题");
      return;
    }
    $("#labels").append("<span class='label label-primary'>" + label + " <span onclick='deleteLabel(this)'>x</span></span> ");
    $("#label").val("");

    setLabelName();
  }

  function setLabelName() {
    var labelNames = '';
    $("#labels .label").each(function (i, v) {
      labelNames += $(v).clone().children().remove().end().text().trim() + ",";
    });
    $("input[name='labels']").val(labelNames);
  }
  function deleteLabel(e) {
    $(e).parent().remove();
    setLabelName();
  }
</script>
</#macro>