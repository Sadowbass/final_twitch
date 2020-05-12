﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%> <%request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link href="css/member.css" rel="stylesheet" />
    <!-- JQuery Nestable Css -->
    <link href="plugins/nestable/jquery-nestable.css" rel="stylesheet" />
</head>


<div class="container-fluid">
    <div class="block-header">
        <h2>
            쇼핑몰 메뉴 관리
        </h2>
    </div>

    <!-- Draggable Handles -->
    <div class="row clearfix">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <div class="card">
                <div class="header">
                    <h2>
                        메뉴 삭제·수정·추가
                    </h2>
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
                <div class="body">
                    <div class="clearfix m-b-20">
                    <span class="shop_plus_text">추가</span>
                      <div class="shop_menu_plus">
                         <i class="material-icons">add_circle_outline</i>
                     </div>
                        <div class="dd nestable-with-handle">
                            <ol class="dd-list">
                                <li class="dd-item dd3-item" data-id="13">
                                    <div class="dd-handle dd3-handle"></div>
                                    <div class="dd3-content">
                                        <input type="text" class="shop_menu_input" placeholder="item 13" />
                                        <div class="shop_menu_delete">
                                            <i class="material-icons">close</i>
                                        </div>
                                    </div>
                                </li>
                                <li class="dd-item dd3-item" data-id="14">
                                    <div class="dd-handle dd3-handle"></div>
                                    <div class="dd3-content">
                                        <input type="text" class="shop_menu_input" placeholder="item 14" />
                                        <div class="shop_menu_delete">
                                            <i class="material-icons">close</i> 
                                        </div>
                                    </div>
                                </li>
                                <li class="dd-item dd3-item" data-id="15">
                                    <div class="dd-handle dd3-handle"></div>
                                    <div class="dd3-content">
                                        <input type="text" class="shop_menu_input" placeholder="item 15" />
                                        <div class="shop_menu_delete">
                                            <i class="material-icons">close</i>
                                        </div>
                                    </div>
                                    <ol class="dd-list">
                                        <li class="dd-item dd3-item" data-id="16">
                                            <div class="dd-handle dd3-handle"></div>
                                            <div class="dd3-content">
                                                <input type="text" class="shop_menu_input" placeholder="item 16" />
                                                <div class="shop_menu_delete">
                                                    <i class="material-icons">close</i>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="dd-item dd3-item" data-id="17">
                                            <div class="dd-handle dd3-handle"></div>
                                            <div class="dd3-content">
                                                <input type="text" class="shop_menu_input" placeholder="item 17" />
                                                <div class="shop_menu_delete">
                                                    <i class="material-icons">close</i>
                                                </div>
                                            </div>
                                        </li>
                                        <li class="dd-item dd3-item" data-id="18">
                                            <div class="dd-handle dd3-handle"></div>
                                            <div class="dd3-content">
                                                <input type="text" class="shop_menu_input" placeholder="item 18" />
                                                <div class="shop_menu_delete">
                                                    <i class="material-icons">close</i>
                                                </div>
                                            </div>
                                        </li>
                                    </ol>
                                </li>
                            </ol>
                        </div>
                    </div>
                    <b>Output JSON</b>
                    <textarea cols="30" rows="3" class="form-control no-resize"
                        readonly>[{"id":13},{"id":14},{"id":15,"children":[{"id":17},{"id":16},{"id":18}]}]</textarea>
                </div>
            </div>
        </div>
    </div>
    <!-- #END# Draggable Handles -->
</div>

<!-- Jquery Nestable -->
<script src="plugins/nestable/jquery.nestable.js"></script>

<script src="js/pages/ui/sortable-nestable.js"></script>



</html>