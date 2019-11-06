/*
  __  __           _            _                 _  __                         _____  
 |  \/  |         | |          | |               | |/ /                        |  __ \ 
 | \  / | __ _  __| | ___      | |__  _   _      | ' / __ _ ___ _ __   ___ _ __| |__) |
 | |\/| |/ _` |/ _` |/ _ \     | '_ \| | | |     |  < / _` / __| '_ \ / _ \ '__|  _  / 
 | |  | | (_| | (_| |  __/     | |_) | |_| |     | . \ (_| \__ \ |_) |  __/ |  | | \ \ 
 |_|  |_|\__,_|\__,_|\___|     |_.__/ \__, |     |_|\_\__,_|___/ .__/ \___|_|  |_|  \_\
                                       __/ |                   | |                     
                                      |___/                    |_|                     

  Author: Kasper Rasmussen
  Steam: https://steamcommunity.com/id/kasperrasmussen
*/

$(document).ready(function () {
  setTheme();
  $(".container").hide();
  window.addEventListener('message', function (event) {
    var item = event.data;
    if (item.show == true) {
      open();
      openHome();
    }
    if (item.show == false) {
      close();
    }
  });
  document.onkeyup = function (data) {
    if (data.which == 27) {
      $.post('http://kasperr_info_menu/close', JSON.stringify({}));
    }
  };
  $(".btnClose").click(function () {
    $.post('http://kasperr_info_menu/close', JSON.stringify({}));
  });
});

function open() {
  //$(".container").css("display", "block");
  $(".container").fadeIn();
  $('.keybinds').scrollTop(0);
  $('.rules').scrollTop(0);
}
function close() {
  //$(".container").css("display", "none");
  $(".container").fadeOut();
  $("#home").css("display", "none");
  $("#keybinds").css("display", "none");
  $("#rules").css("display", "none");
  $("#info").css("display", "none");
}
function openHome() {
  $("#home").css("display", "block");
  $("#keybinds").css("display", "none");
  $("#rules").css("display", "none");
  $("#info").css("display", "none");
  $(".nav-item").attr("class", "nav-item");
  $("#btnHome").attr("class", "nav-item active");
}
function openKeybinds() {
  $("#home").css("display", "none");
  $("#keybinds").css("display", "block");
  $("#rules").css("display", "none");
  $("#info").css("display", "none");
  $(".nav-item").attr("class", "nav-item");
  $("#btnKeybinds").attr("class", "nav-item active");
  $('.keybinds').scrollTop(0);
}
function openRules() {
  $("#home").css("display", "none");
  $("#keybinds").css("display", "none");
  $("#rules").css("display", "block");
  $("#info").css("display", "none");
  $(".nav-item").attr("class", "nav-item");
  $("#btnRules").attr("class", "nav-item active");
  $('.rules').scrollTop(0);
  $(".rules").empty();
  configs.rules.forEach(element => {
    $(".rules").append(`
      <p>§ ${element.number} ${element.text}</p>
    `);
  });
}
function openInfo() {
  $("#home").css("display", "none");
  $("#keybinds").css("display", "none");
  $("#rules").css("display", "none");
  $("#info").css("display", "block");
  $(".nav-item").attr("class", "nav-item");
  $("#btnInfo").attr("class", "nav-item active");
}

function setTheme() {
  if(configs.theme.primary_color && configs.theme.secondary_color) {
    let primary_color = `--primary-color: ${configs.theme.primary_color}; `;
    let secondary_color = `--secondary-color: ${configs.theme.secondary_color}; `;
    $(":root").attr("style", primary_color + secondary_color);
  }
}