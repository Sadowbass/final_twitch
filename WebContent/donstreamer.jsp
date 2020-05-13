<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>donation</title>
    <style>
        html {
            width: 100%;
            height: 100%;
        }
 
        body {
            width: 100%;
            height: 100%;
        }

        #viewPort {
            /* color:#ffffff; */
            display: none;
            width: 100%;
            height: 100%;
        }
        #viewPort div{
            width: 100%;
            height: 100%;
            text-align: center;
        }
        #viewPort div div{
        color: red;
            width: 33%;
            height: 33%;
            font-size: 6em;
            text-align: center;
        }
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
            integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
            crossorigin="anonymous"></script>
    <script src="https://code.responsivevoice.org/responsivevoice.js?key=WpsYh9WB"></script>
</head>
<body>
<div id="viewPort">
    <div id="vp">
        <div id="id"></div>
        <div id="amount"></div>
        <div id="content"></div>
    </div>
</div>

<script>
    $(document).ready(function () {
        var audio = new Audio("http://assets.mytwip.net/sounds/Coins.mp3");

        (function poll() {
            $.ajax({
                url: "viewDonation.sc",
                type: 'post',
                async: false,
                error: function (data) {
                    console.log("에러");
                },
                success: function (data) {
                    $('#id').html(data.name);
                    $('#amount').html(data.amount);
                    $('#content').html(data.content);
                    audio.play();
                    $('#viewPort').fadeIn(2000, function () {
                        responsiveVoice.speak(data.content, "Korean Female");
                        setTimeout(function () {
                            $('#viewPort').fadeOut(3000, function () {
                                $('#id').html("");
                                $('#amount').html("");
                                $('#content').html("");
                                poll();
                            })
                        }, 5000)
                    })
                },
                dataType: "json"
            });
        })();
    })


</script>
</body>
</html>


