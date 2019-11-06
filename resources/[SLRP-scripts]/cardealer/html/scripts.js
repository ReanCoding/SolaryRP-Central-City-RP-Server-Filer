$(document).ready(function(){
    // Partial Functions
    function openMain() {
        $("#home").css("display", "block");
    }
    function closeAll() {
        $(".body").css("display", "none");
    }
    function openSell() {
        $("#sell").css("display", "block");
    }
    function openBuy() {
        $("#buy").css("display", "block");
    }
    function openSearch() {
        $("#search").css("display", "block");
    }
    function openProfil() {
        $("#profil").css("display", "block");
    }
    function openBuyConfirm() {
        $("#buy-confirm").css("display", "block");
    }
    function openSellConfirm() {
        $("#sell-confirm").css("display", "block");
    }
    function openContainer() {
        $(".torvet-container").css("display", "block");
    }
    function closeContainer() {
        $(".torvet-container").css("display", "none");
    }
    // Listen for NUI Events
    window.addEventListener('message', function(event){
        var item = event.data;
        // Open & Close main bank window
        if(item.openComputer == true) {
            $("#home .block-1 .del-1").remove();
            $("#home .block-1 .del-2").remove();
            $("#home .block-2").remove();
            $("#home .block-1 #nocars").remove();
            openContainer();
            $.post('http://cardealer/getfrontpage', JSON.stringify({}));
            $("#loading").show();
        }
        if(item.openComputer == false) {
            closeAll();
            closeContainer();
        }
        // Open sub-windows / partials
        if(item.openSection == "sell") {
            closeAll();
            openSell();
        }
        if(item.openSection == "sell-confirm") {
            closeAll();
            openSellConfirm();
        }
        if(item.mode == "carlist") {
            if(item.list != "") {
                $("#sell-seller-id").val(item.player);
                $("#vehicle").find("option").remove();
                var split = item.list.split(",");
                $("#vehicle").append("<option selected disabled value='choose'>Vælg køretøj</option>");
                var empty = true;
                for(var i = 0; i != split.length; i++) {
                    var split2 = split[i].split(":");
                    if(split2[1] != "") {
                        $("#vehicle").append("<option value='"+split2[0]+"'>"+split2[1]+"</option>");
                        empty = false;
                    }
                }
                if(empty == true) {
                    $("#sell-form").css("display", "none");
                    $("#sell .sell-container").append("<span class='remove-sell-text'>Du har ingen køretøjer du kan sælge!</span>");
                }else{
                    $('#vehicle').selectmenu('destroy');
                    $( "#vehicle" )
                        .selectmenu()
                        .selectmenu("menuWidget")
                        .addClass("overflow");
                }
            }else{
                $("#sell-form").css("display", "none");
                $("#sell .sell-container").append("<span class='remove-sell-text'>Du har ingen køretøjer du kan sælge!</span>");
            }
            $("#loading").hide();
            openSell();
        }
        if(item.mode == "frontlist") {
            var json = JSON.parse(item.list);
            if(json.length == undefined) {
                $("#home .block-1").append("<span id='nocars'>Der er ingen køretøjer til salg lige nu!</span>");
            }else{
                for(var i = 0; i != json.length; i++) {
                    if(i == 0) {
                        $("#home .block-1").append('<figure class="del-1 btnBuy" data-id="'+json[i].cardealer_id+'" style="background-image: url('+json[i].cardealer_img+');"><figcaption>'+json[i].cardealer_vehiclename+' </br>'+format_number(json[i].cardealer_price)+',- DKK</figcaption></figure>');
                    }else if(i == 1) {
                        var classes = "";
                        if(json.length < 4) {
                            classes = "max-height";
                        }
                        $("#home .block-1").append("<div class='del-2 "+classes+"'></div>");
                        $("#home .block-1 .del-2").append("<figure class='btnBuy' data-id='"+json[i].cardealer_id+"' style='background-image: url("+json[i].cardealer_img+");'><figcaption>"+json[i].cardealer_vehiclename+" </br>"+format_number(json[i].cardealer_price)+",- DKK</figcaption></figure>");
                    }else if(i < 5 ) {
                        $("#home .block-1 .del-2").append("<figure class='btnBuy' data-id='"+json[i].cardealer_id+"' style='background-image: url("+json[i].cardealer_img+");'><figcaption>"+json[i].cardealer_vehiclename+" </br>"+format_number(json[i].cardealer_price)+",- DKK</figcaption></figure>");
                    }else if(i == 5) {
                        $("#home").append("<article class='block-2'></article>");
                        $("#home .block-2").append("<figure class='btnBuy' data-id='"+json[i].cardealer_id+"' style='background-image: url("+json[i].cardealer_img+");'><figcaption>"+json[i].cardealer_vehiclename+" </br>"+format_number(json[i].cardealer_price)+",- DKK</figcaption></figure>");
                    }else if(i > 5) {
                        $("#home .block-2").append("<figure class='btnBuy' data-id='"+json[i].cardealer_id+"' style='background-image: url("+json[i].cardealer_img+");'><figcaption>"+json[i].cardealer_vehiclename+" </br>"+format_number(json[i].cardealer_price)+",- DKK</figcaption></figure>");

                    }
                }
            }
            $("#loading").hide();
            openMain();
        }
        if(item.mode == "buy") {
            $("#buy .title").text(item.title);
            $("#buy #seller-name").attr("data-userid", item.seller);
            $("#buy #seller-name span").text(item.sellername);
            $("#buy .price").attr("data-price", item.price);
            $("#buy .price span").text(format_number(item.price));
            $("#buy .number span").text(item.sellerphone);
            $("#buy .information span").text(item.desc);
            $("#buy .del-2 figure").css('background-image', 'url('+item.img+')');
            if(item.user_id != item.seller) {
                $("#buy .del-1").append("<a href='#' data-id='"+item.id+"' id='buy-button'>KØB NU</a>");
            }else{
                $("#buy .del-1").append("<span class='egen-bil'>Note: Du kan ikke købe din egen bil.</span>");
            }
            $("#loading").hide();
            openBuy();
        }
        if(item.mode == "profil") {
            var json = JSON.parse(item.list);
            if(json.length == undefined) {
                $("#profil div").append("<span class='profil-text'>Intet at vise</span>");
            }else{
                $("#profil div").append("<ul class='info'><li>Køretøj:</li><li>Pris:</li><li>Status:</li><li></li></ul>")
                for(var i = 0; i != json.length; i++) {
                    var status = "Afventer";
                    if(json[i].cardealer_accepted == true) {
                        status = "Godkendt";
                    }
                    if(json[i].cardealer_accepted == true && json[i].cardealer_soldtoid > 0){
                        status = "Solgt";
                    }
                    $("#profil div").append("<ul class='item'><li>"+json[i].cardealer_vehiclename+"</li><li>"+format_number(json[i].cardealer_price)+"</li><li>"+status+"</li><li><span data-id='"+json[i].cardealer_id+"' class='delete-item'>Slet</span></li></ul>");
                }
            }
            $("#loading").hide();
            openProfil();
        }
        if(item.mode == "search") {
            var json = JSON.parse(item.list);
            var search = $("#search-input").val();
            if(json.length == undefined) {
                if(search == "") {
                    $("#search-result").text("Der blev ikke fundet nogle resultere!");
                }else{
                    $("#search-result").text("Der blev ikke fundet nogle resultere under: "+search+"!");
                }
            }else {
                for (var i = 0; i != json.length; i++) {
                    $("#search article").append("<figure class='btnBuy' data-id='"+json[i].cardealer_id+"' style='background-image: url("+json[i].cardealer_img+");'><figcaption>"+json[i].cardealer_vehiclename+"</br>"+format_number(json[i].cardealer_price)+",- DKK</figcaption></figure>")
                }
            }
            $("#search-loading").hide();
            $("#loading").hide();
            openSearch();
        }
        if(item.mode == "discord") {
            $.ajax({
                type: 'POST',
                url: item.discord,
                data: JSON.stringify({
                    username: 'Bilbasen',
                    content: 'Der er kommet en ny bil annonce!',
                    avatar_url: 'https://i.imgur.com/0fcQERG.png',
                    embeds: [{
                        title: 'Spiller:',
                        description: item.id,
                        color: 65280,
                        image: {
                            url: item.img
                        },
                        fields: [
                            {
                                name: 'Køretøj:',
                                value: item.vehiclename + " - ("+item.vehicle+")"
                            },
                            {
                                name: 'Pris:',
                                value: item.price
                            },
                            {
                                name: 'Information:',
                                value: item.vehicledesc
                            },
                            {
                                name: 'Billedet link:',
                                value: item.img
                            },
                            {
                                name: 'Link:',
                                value: item.link
                            }
                        ],
                    }]
                }),
                contentType: 'application/json',
                success: function (data) { },
            });
        }
    });
    // On 'Esc' call close method
    document.onkeyup = function (data) {
        if (data.which == 27 ) {
            $.post('http://cardealer/close', JSON.stringify({}));
        }
    };
    $(".btnClose").click(function(){
        $.post('http://cardealer/close', JSON.stringify({}));
    });
    $(".btnHome").click(function(){
        closeAll();
        $("#home .block-1 .del-1").remove();
        $("#home .block-1 .del-2").remove();
        $("#home .block-2").remove();
        $("#home .block-1 #nocars").remove();
        openContainer();
        $.post('http://cardealer/getfrontpage', JSON.stringify({}));
        $("#loading").show();
    });
    $(document).on("click", ".delete-item", function () {
        var id = $(this).attr("data-id");
        $(this).parent().parent().remove();
        $.post('http://cardealer/deleteProfil', JSON.stringify({id: id}));
    });
    $(".btnSearch").click(function(){
        closeAll();
        openContainer();
        $("#loading").show();
        $("#search-input").val("");
        $("#search article").find("figure").remove();
        $("#search #search-result").text("");
        var search = $("#search-input").val();
        $.post('http://cardealer/getsearch', JSON.stringify({search: search}));
    });
    $( "#search-input" ).keyup(function() {
        $("#search-loading").show();
        $("#search article").find("figure").remove();
        $("#search #search-result").text("");
        var search = $("#search-input").val();
        $.post('http://cardealer/getsearch', JSON.stringify({search: search}))
    });
    $(".btnProfil").click(function(){
        closeAll();
        openContainer();
        $("#loading").show();
        $("#profil").find(".profil-text").remove();
        $("#profil").find(".info").remove();
        $("#profil div").find("ul").remove();
        $.post('http://cardealer/getprofil', JSON.stringify({}));
    });
    $("#buy-confirmbtn").click(function(){
        var id = $(this).attr("data-id");
        $.post('http://cardealer/confirmedbuy', JSON.stringify({id: id}));
        closeAll();
        $.post('http://cardealer/close', JSON.stringify({}));
    });
    $("#buy-denybtn").click(function(){
        closeAll();
        openMain();
    });
    $(document).on("click", "#buy-button", function () {
        var id = $(this).attr("data-id");
        var spiller = $("#buy #seller-name span").text();
        var vehicle = $("#buy .title").text();
        var price = $("#buy .price span").text();
        $("#buy-confirm #seller-name-confirm span").text(spiller);
        $("#buy-confirm #vehiclename span").text(vehicle);
        $("#buy-confirm .price span").text(price);
        $("#buy-confirm #buy-confirmbtn").attr("data-id", id);
        closeAll();
        openBuyConfirm();
    });
    $(document).on("click", ".btnBuy", function () {
        closeAll();
        $("#loading").show();
        openContainer();
        $("#buy").find(".egen-bil").remove();
        $("#buy").find("#buy-button").remove();
        var id = $(this).attr("data-id");
        $.post('http://cardealer/buy', JSON.stringify({id: id}));
    });
    $(".btnSell").click(function(){
        closeAll();
        $("#sell-img-viewer").hide();
        $("#sell-form").css("display", "block");
        $(".remove-sell-text").remove();
        $("#loading").show();
        $.post('http://cardealer/getvehicles', JSON.stringify({}));
    });
    $( "#vehicle" )
        .selectmenu()
        .selectmenu("menuWidget")
        .addClass("overflow");
    $( "#sell-form #sell-img" ).keyup(function() {
        if(isUriImage($(this).val())) {
            $("#sell-img-viewer").show();
            $("#sell-img-viewer").css("background-image", "url("+$(this).val()+")")
        }else{
            $("#sell-img-viewer").hide();
        }
    });
    $('#sell-form #vehicle').on('selectmenuchange', function() {
        $("#sell #sell-img-viewer figcaption").text($(".ui-selectmenu-text").text())
        $(".vehicle-error").text("");
        $(".billedet-error").text("");
        $(".desc-error").text("");
    });
    $( "#sell-form" ).submit(function( e ) {
        e.preventDefault();
        var vehicle = $("#vehicle").val();
        var vehiclename = $("#vehicle option[value='"+vehicle+"']").text();
        var vehicledesc = mysql_real_escape_string($("#sell-desc").val());
        var price = $("#sell-price").val();
        var img = $("#sell-img").val();
        if(vehicle != null) {
            if(price > 1000 && price <= 10000000) {
                if(isUriImage(img)) {
                    if(vehicledesc.length > 0) {
                        $.post('http://cardealer/carsubmit', JSON.stringify({
                            vehiclename: vehiclename,
                            vehicle: vehicle,
                            vehicledesc: vehicledesc,
                            price: price,
                            img: img
                        }));
                        $('#vehicle').val("choose"); // your default option's value
                        $('#vehicle').selectmenu("refresh");
                        $("#sell-price").val("");
                        $("#sell-img").val("");
                        $("#sell-img-viewer").css("background-image", "unset");
                        $("#sell #sell-img-viewer figcaption").text("");
                        $("#sell-desc").val("");
                        closeAll();
                        openSellConfirm();
                    }else{
                        $(".desc-error").text("Du skal skrive min. 10 tegn!");
                    }
                }else{
                    $(".billedet-error").text("Billedet skal været et link og ende på jpg/jpeg/png!");
                }
            }
        }else{
            $(".vehicle-error").text("Du skal vælge et køretøj!");
        }
    });
});
var isUriImage = function(uri) {
    //make sure we remove any nasty GET params
    var regex = '(https?:\/\/.*\.(?:png|jpg|jpeg))';
    if(uri.match(regex)) {
        uri = uri.split('?')[0];
        //moving on now
        var parts = uri.split('.');
        var extension = parts[parts.length-1];
        var imageTypes = ['jpg','jpeg','png'];
        if(imageTypes.indexOf(extension) !== -1 && (uri.includes("http") || uri.includes("https"))) {
            return true;
        }else{
            return false;
        }
    }else{
        return false;
    }
}
function mysql_real_escape_string (str) {
    str.replace(/[\0\x08\x09\x1a\n\r"'\\\%]/g, function (char) {
        switch (char) {
            case "\0":
            case "\x08":
            case "\x09":
            case "\x1a":
            case "\\n":
            case "\n":
            case "\r":
            case "\"":
            case "'":
            case "\\":
            case "%":
                return ""; // prepends a backslash to backslash, percent,
                                  // and double/single quotes
        }
    });
    return str.replace("\\n", "");
}

function format_number(number) {
    var number = number.toLocaleString(
        "da-DK", // leave undefined to use the browser's locale,
        // or use a string like 'en-US' to override it.
        { minimumFractionDigits: 0 }
    );
    return number;
}