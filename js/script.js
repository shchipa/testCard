jQuery(document).ready(function ($) {

//валидация ввода символов в форму
    document.getElementById('id_contract').onkeypress = function(e) {
        if (e.ctrlKey || e.altKey || e.metaKey) return;

        var chr = getChar(e);
        if (chr == null) return;
        if (chr < '0' || chr > '9') {
            alert("В поле необходимо вводить только цифры.\nСимвол " + chr + " зарпрещён.");
            return false;
        }
    };

    function getChar(event) {   //получение символа из keypress
        if (event.which == null) {  // IE
            if (event.keyCode < 32) return null;    // спец. символ
            return String.fromCharCode(event.keyCode);   // остальные
        }

        if (event.which != 0 && event.charCode != 0) {  // все кроме IE
            if (event.which < 32) return null;  // спец. символ
            return String.fromCharCode(event.which); // остальные
        }

        return null;    // спец. символ
    }
// конец валидации ввода символов в форму



    $(".submit").click(function () {
        var id_contract = $("#id_contract").val();
        // alert(id_contract);

        $.ajax({
            url: "/back.php",
            method: "POST",
            data: {"id_contract": id_contract},
            dataType: "json",
            success: function (data) {
                // alert(data);
                console.log(data);
                if(!data) {
                    $("#input").text("Такого договора нет");
                }
                else {
                    //$("#input").text(data);
                    $("#input").html(
                        "<tr><td colspan=2><b>информация про клиента</b></td></tr>" +
                        "<tr><td>название клиента</td>  <td>" + data.customer.name_customer + "</td></tr>" +
                        "<tr><td>компания</td>          <td>" + data.customer.company + "</td></tr>" +

                        "<tr><td colspan=2><b>информация про договор</b></td></tr>" +
                        "<tr><td>номер договора</td>    <td>" + data.contract.number + "</td></tr>" +
                        "<tr><td>дата подписания</td>   <td>" + data.contract.date_sign + "</td></tr>" +

                        "<tr><td colspan=2><b>информация про сервисы</b></td></tr>" +
                        "<tr><td colspan=2 id='service'></td></tr>");

                    var val = "";
                    $.each(data.service, function(key, value) {
                        val += value + "<br>";
                    });
                    if(val == "") {
                        val = "<i>сервисы отсутствуют</i>";
                    }
                    $("#service").html(val);
                }
            }
        })
    })
});