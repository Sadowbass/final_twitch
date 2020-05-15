let onair = function (loc) {
    location.href = loc;
}

$(document).on('keyup', '#sidebar-friend-search', function () {
    let value = $('#sidebar-friend-search').val().trim();
    if (value == "") {
        console.log("공란")
        $('#sidebar-navmain').attr('style', "display:flex;");
        $('#sidebar-friendlist').attr('style', 'display:none;');
    } else {
        $.ajax({
            type: 'post',
            data: {"value" : value},
            url: 'searchFriends.sc',
            error: function (error) {
                console.log(error);
            },
            success: function (data) {
                console.log(data);
                $('#sidebar-navmain').attr('style', "display:none;");
                $('#sidebar-friendlist').attr('style', 'display:flex;');

                for (i of data) {
                    var newLi = document.createElement('li');
                    newLi.className = 'nav-item';

                    var newDiv = document.createElement('div');
                    newDiv.className = "nav-link nav-link-sc";
                    newDiv.id = i.mem_id;

                    var newImg = document.createElement('img');
                    newImg.className = "sidebar-list-img rounded-circle";
                    newImg.setAttribute("src", "./img/s1.png");

                    var newDiv2 = document.createElement('div');
                    newDiv2.className = "sidebar-list-content";

                    var newDiv3 = document.createElement('div');
                    newDiv3.className = "sidebar-list-text";

                    var newSpan = document.createElement('span');
                    newSpan.appendChild(i.mem_id);

                    var newDiv4 = document.createElement('div');
                    newDiv4.className = "sidebar-list-viewer";

                    var newI = document.createElement('i');
                    newI.className = "fas fa-user-plus";

                    newDiv4.appendChild(newI);
                    newDiv3.appendChild(newSpan);
                    newDiv2.appendChild(newDiv3);
                    newDiv2.appendChild(newDiv4);
                    newDiv.appendChild(newImg);
                    newDiv.appendChild(newDiv2);
                    newLi.appendChild(newDiv);
                };

            }
        }) // end of ajax
    } // end of if/else

})