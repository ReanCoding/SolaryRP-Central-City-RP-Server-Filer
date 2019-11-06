$(function()
{
    window.addEventListener('message', function(event)
    {
        var item = event.data;
        var buf = $('#wrap');

        buf.find('table').append("<tr class=\"heading\"><th>Id</th><th>Steam Navn</th><th>Karakter Navn</th><th>Arbejde</th></tr>");
        if (item.meta && item.meta == 'close')
        {
            document.getElementById("slots").innerHTML = "";
            document.getElementById("ptbl").innerHTML = "";
            $('#wrap').hide();
            return;
        }
        buf.find('table').append(item.text);
        $(".slots").append("<h1 class='slots' id='slots'>" + item.text1 + "</h1>")
        $('#wrap').show();
    }, false);
});