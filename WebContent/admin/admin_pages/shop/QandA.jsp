<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
     <link href="plugins/sweetalert/sweetalert.css" rel="stylesheet" />
</head>


<div class="container-fluid">
    <div class="block-header">
        <h2>게시판관리</h2>
    </div>
    <!-- Basic Table -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        Q&A
                    </h2>
                    <div class="row clearfix">
                      <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 col-lg-offset-6 col-md-offset-6">
                     <div class="input-group review_search">
                                <span class="input-group-addon" id=""><i class="material-icons"
                                        id="review_search_icon">search</i></span>
                                <input type="text" class="form-control review_search_input" placeholder="제목 or내용 검색"
                                    aria-describedby="basic-addon1">
                            </div>
                            </div>
                        </div>
                    <ul class="header-dropdown m-r--5">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button"
                                aria-haspopup="true" aria-expanded="false">
                                <i class="material-icons">more_vert</i>
                            </a>
                            <ul class="dropdown-menu pull-right">
                                <li><a href="javascript:void(0);">Action</a></li>
                                <li><a href="javascript:void(0);">Another action</a></li>
                                <li><a href="javascript:void(0);">Something else here</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="body table-responsive">
                 <c:forEach begin="1" end="5" var="i">
                    <div class="row clearfix">
                        <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2">
                            <div class="card" onclick="">
                              
                                    
                                    <div class="panel-group" id="accordion_${i}" role="tablist" aria-multiselectable="true">
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingOne_${i}">
                                                <h4 class="panel-title qa_title">
                                                    <a role="button" data-toggle="collapse" data-parent="#accordion_${i}" href="#collapseOne_${i}" aria-expanded="true" aria-controls="collapseOne_${i}">
                                                        Collapsible Group Item #1
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseOne_${i}" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne_${i}">
                                                <div class="panel-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                                                    non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                    eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid
                                                    single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                                                    helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                                    Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                                                    raw denim aesthetic synth nesciunt you probably haven't heard of them
                                                    accusamus labore sustainable VHS.
                                                    <div class="js-sweetalert">
                                                     <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                            		<button type="button" class="btn btn-defalt waves-effect m-r-20" id="notice_modify_btn">수정</button> 
                                            		</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingTwo_${i}">
                                                <h4 class="panel-title qa_title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_${i }" href="#collapseTwo_${i }" aria-expanded="false"
                                                       aria-controls="collapseTwo_${i }">
                                                        Collapsible Group Item #2
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseTwo_${i }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo_${i }">
                                                <div class="panel-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                                                    non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                    eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid
                                                    single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                                                    helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                                    Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                                                    raw denim aesthetic synth nesciunt you probably haven't heard of them
                                                    accusamus labore sustainable VHS.
                                                     <div class="js-sweetalert">
                                                     <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                            		<button type="button" class="btn btn-defalt waves-effect m-r-20" id="notice_modify_btn">수정</button> 
                                            		</div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="panel panel-primary">
                                            <div class="panel-heading" role="tab" id="headingThree_${i }">
                                                <h4 class="panel-title qa_title">
                                                    <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion_${i }" href="#collapseThree_${i }" aria-expanded="false"
                                                       aria-controls="collapseThree_${i }">
                                                        Collapsible Group Item #3
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapseThree_${i }" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree_${i }">
                                                <div class="panel-body">
                                                    Anim pariatur cliche reprehenderit, enim eiusmod high life accusamus terry richardson ad squid. 3 wolf moon officia aute,
                                                    non cupidatat skateboard dolor brunch. Food truck quinoa nesciunt laborum
                                                    eiusmod. Brunch 3 wolf moon tempor, sunt aliqua put a bird on it squid
                                                    single-origin coffee nulla assumenda shoreditch et. Nihil anim keffiyeh
                                                    helvetica, craft beer labore wes anderson cred nesciunt sapiente ea proident.
                                                    Ad vegan excepteur butcher vice lomo. Leggings occaecat craft beer farm-to-table,
                                                    raw denim aesthetic synth nesciunt you probably haven't heard of them
                                                    accusamus labore sustainable VHS.
                                                    <div class="js-sweetalert">
                                                     <button class="btn btn-defalt waves-effect" data-type="cancel2">삭제</button>
                                            		<button type="button" class="btn btn-defalt waves-effect m-r-20" id="notice_modify_btn">수정</button> 
                                            		</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                              
                            </div>
                        </div>
                    </div>
				 </c:forEach>
				 <div class="page_div">
				  <ul class="pagination">
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect">
                                            <i class="material-icons">chevron_left</i>
                                        </a>
                                    </li>
                                    <li><a href="javascript:void(0);" class="waves-effect">1</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect">2</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect">3</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect">4</a></li>
                                    <li><a href="javascript:void(0);" class="waves-effect">5</a></li>
                                    <li>
                                        <a href="javascript:void(0);" class="waves-effect">
                                            <i class="material-icons">chevron_right</i>
                                        </a>
                                    </li>
                                </ul>
                                </div>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Basic Table -->

</div>

<script src="js/shop.js" ></script>
<script src="plugins/sweetalert/sweetalert.min.js"></script>
<script src="js/pages/ui/dialogs.js"></script>

</html>