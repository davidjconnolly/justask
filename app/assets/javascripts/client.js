function updateSurvey(data)
  {

  }

$(document).ready(function() {

  $("#sign").change(function(e){
    curSign = $("#survey").serialize();

    $.ajax({
        type: "GET",
        dataType : "JSON",
        url: "client/get_survey",
        data: curSign,
        success: updateSurvey
    });

    window.location.href = "#showSurvey";
    e.preventDefault();
  });

});