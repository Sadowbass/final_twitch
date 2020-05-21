/*상품 정렬 시작*/
var list = $('.product-list > .items').get();

var nameAsc = function(a, b) {
    var na = a.childNodes[1].childNodes[3].childNodes[0];
    var nb = b.childNodes[1].childNodes[3].childNodes[0];
    return na.innerHTML.toLowerCase().localeCompare(nb.innerHTML.toLowerCase());
}

var nameDesc = function(a, b) {
    var na = a.childNodes[1].childNodes[3].childNodes[0];
    var nb = b.childNodes[1].childNodes[3].childNodes[0];
    return nb.innerHTML.toLowerCase().localeCompare(na.innerHTML.toLowerCase());
}

var priceAsc = function(a, b) {
    var na = a.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    var nb = b.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    return nb.toLowerCase().localeCompare(na.toLowerCase());
}

var priceDesc = function(a, b) {
    var na = a.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    var nb = b.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    return nb.toLowerCase().localeCompare(na.toLowerCase());
}

sorting = function (value){
    list.sort(window[value]);
    for (var i = 0; i < list.length; i++) {
        list[i].parentNode.appendChild(list[i]);
    }
}
/*정렬 메소드 끝*/