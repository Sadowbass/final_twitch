/*상품 정렬 시작*/
var list = $('.product-list > .items').get();

var nameAsc = function(a, b) {
    var na = a.childNodes[1].childNodes[3].childNodes[0];
    var nb = b.childNodes[1].childNodes[3].childNodes[0];
    console.log(na.innerHTML.toLowerCase().localeCompare(nb.innerHTML.toLowerCase()));
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
    let pa = na.split(",");
    let pb = nb.split(",");
    let ra = "";
    let rb = "";

    for(i = 0 ; i < pa.length ; i++){
        ra+=pa[i];
    }
    for(i = 0 ; i < pb.length ; i++){
        rb+=pb[i];
    }

    ra = Number(ra);
    rb = Number(rb);

    return ra-rb;
}

var priceDesc = function(a, b) {
    var na = a.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    var nb = b.childNodes[1].childNodes[5].innerText.replace("$","").replace(".","")
    let pa = na.split(",");
    let pb = nb.split(",");
    let ra = "";
    let rb = "";

    for(i = 0 ; i < pa.length ; i++){
        ra+=pa[i];
    }
    for(i = 0 ; i < pb.length ; i++){
        rb+=pb[i];
    }

    ra = Number(ra);
    rb = Number(rb);

    return rb-ra;
}

sorting = function (value){
    list.sort(window[value]);
    for (var i = 0; i < list.length; i++) {
        list[i].parentNode.appendChild(list[i]);
    }
}
/*정렬 메소드 끝*/