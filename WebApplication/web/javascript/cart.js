function clearCart() {
    $.ajax({
        url: 'cart',
        type: 'POST',
        dataType: "json",
        data: {
            "action": "clearCart"
        },
        success: function () {
            $("#card").load(" #card > *");
            console.log("Cart cleared!");
        },
        error: function () {
            console.log("error");
        }
    });
}

function removeProductFromCart(id) {
    $.ajax({
        url: 'cart',
        type: 'POST',
        dataType: "json",
        data: {
            "id": id,
            "action": "removeProductfromCart"
        },
        success: function () {
            $("#" + id).closest(".cartProducts").remove();
            location.reload();
        },
        error: function () {
            console.log("error");
        }
    });
}

function reduceQuantity(id, element) {
    element.parentNode.querySelector('input[type=number]').stepDown();
    $.ajax({
        url: 'cart',
        type: 'POST',
        dataType: "json",
        data: {
            "id": id,
            "action": "reduceQuantity"
        },
        success: function (response) {
            if (response === 0) {
                $(element).closest(".cartProducts").remove();
            }
            location.reload();
        },
        error: function () {
            console.log("error");
        }
    });
}

function increaseQuantity(id, element) {
    element.parentNode.querySelector('input[type=number]').stepUp();
    $.ajax({
        url: 'cart',
        type: 'POST',
        data: {
            "id": id,
            "action": "increaseQuantity"
        },
        success: function () {
            console.log("Product quantity increased!");
            location.reload();
        },
        error: function () {
            console.log("error");
        }
    });
}

function getDate() {
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0');
        var yyyy = today.getFullYear();

        today = mm + '/' + dd + '/' + yyyy;

        var twoWeeksFromToday = new Date();
        twoWeeksFromToday.setDate(twoWeeksFromToday.getDate() + 14);
        var dd2 = String(twoWeeksFromToday.getDate()).padStart(2, '0');
        var mm2 = String(twoWeeksFromToday.getMonth() + 1).padStart(2, '0');
        var yyyy2 = twoWeeksFromToday.getFullYear();

        twoWeeksFromToday = mm2 + '/' + dd2 + '/' + yyyy2;
        document.getElementById("delivery-date").innerHTML = today + " - " + twoWeeksFromToday;
    }

getDate();