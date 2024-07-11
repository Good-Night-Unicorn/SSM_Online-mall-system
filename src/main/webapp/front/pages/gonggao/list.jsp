<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <!--通用-->
    <meta name="format-detection" content="telephone=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="viewport" content="width=device-width,minimum-scale=1.0,maximum-scale=1.0">
    <title>公告信息列表页</title>
    <meta name="keywords" content="" />
    <meta name="description" content="" />
    <link rel="stylesheet" href="../../layui/css/layui.css">
    <link rel="stylesheet" href="../../xznstatic/css/aos.css" />
    <link rel="stylesheet" href="../../xznstatic/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../../xznstatic/css/idangerous.swiper.css" />
    <link rel="stylesheet" href="../../xznstatic/css/lightbox.css">
    <link rel="stylesheet" href="../../xznstatic/css/app.css" />
    <link rel="stylesheet" href="../../xznstatic/css/apmin.css"/>
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/iconfont.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/color.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/global.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/page.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/uzlist.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/animate.min.css">
    <link rel="stylesheet" type="text/css" href="../../xznstatic/css/fancybox.css" />
    <script type="text/javascript" src="../../xznstatic/js/jquery.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/superslide.2.1.1.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/wow.min.js"></script>
    <script type="text/javascript" src="../../xznstatic/js/fancybox.js"></script>
    <!-- 样式 -->
    <link rel="stylesheet" href="../../css/style.css"/>
    <!-- 主题（主要颜色设置） -->
    <link rel="stylesheet" href="../../css/theme.css"/>
    <!-- 通用的css -->
    <link rel="stylesheet" href="../../css/common.css"/>
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "../../../resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="../../../resources/ueditor/lang/zh-cn/zh-cn.js"></script>
    <script type="text/javascript">
        var CATID = "0",
                BCID = "0",
                NAVCHILDER = "",
                ONCONTEXT = 0,
                ONCOPY = 0,
                ONSELECT = 0;
    </script>
    <style>
        .ng-djn-txt {
            text-align: justify;
            text-justify: inter-ideograph;
            word-wrap: break-word;
            word-break: break-all;
        }
        .ng-inpusbox {
            text-indent:0px;
        }
        .am-inside-adv{
            height:auto;
        }
        .am-inside-adv img {
            width:100%;
        }
        .ng-oa a .small {
            display:none;
        }
        .ng-oa a:hover .small {
            display:block;
        }
        .ng-oa a:hover .image {
            display:none;
        }
        .pos-a {
            height:30px;
            line-height:30px;
            margin:0 5px;
        }
        .pos-a a {
            margin:0 5px;
        }
        .layui-laypage .layui-laypage-curr .layui-laypage-em {
            background-color: var(--publicMainColor,orange);
        }
        .jishuzichis a {
            font-size: 12px;
            color: #878787;
        }
        .ng-siotext {
            line-height: 50px;
        }

        @media screen and (max-width: 992px) {
            .ng-zein-iten-link li {
                width: 50%;
                text-align: center;
            }
            .ng-zein-iten-link li.li {
                width: 100%;
            }
            .bdshare-button-style2-16 a, .bdshare-button-style2-16 .bds_more {
                float: initial;
            }
            .ng-zein-code {
                width: 100%;
            }
            .ng-zein-code-tit {
                width: 100%;
                text-align: center;
            }
        }

        /* 前台模态框使用集成tinymce富文本框会导致页面做下角出现上传图片和添加表格功能，由于处理不了，把它z-index属性设置为负的，不能让页面上可以点*/
        .tox-pop{
            z-index: -99999;
        }
    </style>
</head>
<body >
<div id="app">

    <div class="am-add">
        <div class="swiper-container ng-swiper">
            <div class="swiper-wrapper">
                <div class="swiper-slide" v-for="(item,index) in swiperList" v-bind:key="index">
                    <a href="#">
                        <div class="swiper-slide"><img :src="item.img" style="width: 100%;height:400px "></div>
                    </a>
                </div>
            </div>
            <div class="swiper-pagination"></div>
            <div class="swiper-button-prev ng-swiper-ovleft"><img src="../../xznstatic/img/snne1.png"/></div>
            <div class="swiper-button-next ng-swiper-ovright"><img src="../../xznstatic/img/snne2.png"/></div>
        </div>
    </div>
    <div class="ng-container ng-fault">
        <div class="ng-inmod ng-fault ng-paddor ng-bg-fff">
            <div class="ng-inmod-ini">
                    <div class="ng-fault ng-container">
                        <div class="ng-inmod-the ng-container">
                            <span class="ng-inmod-the-bg ng-inmod-the-bg-left" aos="fade-down-right"><img src="../../xznstatic/img/insie1.png" alt="" /></span>
                            <span class="ng-inmod-the-bg ng-inmod-the-bg-right" aos="fade-up-left"><img src="../../xznstatic/img/insie2.png" alt="" /></span>
                            <span class="ng-inmod-the-cn" aos="fade-down">公告信息展示</span>
                            <span class="ng-inmod-the-en" aos="fade-up">DATA SHOW</span>
                        </div>
                        <span class="ng-inmod-thebor" aos="fade-up"></span>
                    </div>                <fieldset class="search-container" style="text-align: center;">
                    <form class="layui-form" lay-filter="myForm">

         
                      <div class="layui-inline" style="margin-bottom: 10px;">
                          <label class="layui-form-label">公告名称</label>
                          <div class="layui-input-inline">
                              <input type="text" name="gonggaoName" id="gonggaoName" placeholder="公告名称" autocomplete="off" class="layui-input">
                          </div>
                      </div>
                    
                      <div class="layui-inline" style="margin-left: 30px;margin-bottom: 10px;">
                          <button id="btn-search" type="button" class="layui-btn" style="background-color: var(--publicMainColor,orange);">
                              搜索
                          </button>
                          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                      </div>
                    </form>
                </fieldset>

                <div class="back-white">
                    <div class="container box-content">
                        <div class="article-list">
                            <ul class="after">
                                <li v-for="(item,index) in dataList" v-bind:key="index">
                                    <a target="_self" :href="'../gonggao/detail.jsp?id='+item.id">
                                        <img width="180" class="fl" :src="item.gonggaoPhoto" />
                                        <h5>{{item.gonggaoName}}</h5>
                                        <p class="time-sour">
                                            <span>发布时间：{{item.insertTime}} </span>
                                        </p>
                                        <p class="reamk">{{item.gonggaoContent|subString}}</p>
                                    </a>
                                </li>
                            </ul>
                            <div class="pages">
                                <div class="pager" id="pager"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="am-end">
        <div class="ng-siobox ng-fault ng-paddor">
            <div class="am-end-ini">
                <div class="ng-siotext" aos="fade-up" aos-delay="400" aos-anchor-placement="top-bottom">
                    <p>欢迎访问<span v-text="projectName"></span>！</p>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="../../xznstatic/js/bootstrap.min.js" type="text/javascript" charset="utf-8"></script>
<script src="../../layui/layui.js"></script>
<script src="../../js/vue.js"></script>
<!-- 引入element组件库 -->
<script src="../../xznstatic/js/element.min.js"></script>
<!-- 引入element样式 -->
<link rel="stylesheet" href="../../xznstatic/css/element.min.css">
<script src="../../js/config.js"></script>
<script src="../../modules/config.js"></script>
<script src="../../js/utils.js"></script>

<script>
    var vue = new Vue({
        el: '#app',
        data: {
            id:null,
            detail: {},
            swiperList: [],//轮播图
            dataList: [],//数据
        // 当前表字典表数据
            gonggaoTypesList : [],
            gonggaoTypes: 0,//类型
            limit: 8,
            projectName: projectName,//项目名
            centerMenu: centerMenu

        },
        updated: function() {
            layui.form.render(null, 'myForm');
        },
        filters: {
            //把字符串去除无用字符 如果字段长度大于60  就截取到60
            subString: function(val) {
                if (val) {
                    val = val.replace(/<[^<>]+>/g, '').replace(/undefined/g, '');
                    if (val.length > 60) {
                        val = val.substring(0, 60);
                        val+='...';
                    }

                    return val;
                }
                return '';
            }
        },
        computed: {
        },
        methods: {
            jump(url) {
                jump(url);
            }
            ,jumpCheck(url,check1,check2) {
                if(check1 == "2" || check1 == 2){//级联表的逻辑删除字段[1:未删除 2:已删除]
                    layui.layer.msg("已经被删除", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                if(check2 == "2"  || check2 == 2){//是否下架[1:上架 2:下架]
                    layui.layer.msg("已经下架", {
                        time: 2000,
                        icon: 2
                    });
                    return false;
                }
                this.jump(url);
            }

        }
    });

    layui.use(['layer', 'element', 'carousel', 'laypage','form', 'http', 'jquery', 'laydate', 'tinymce'], function() {
        var layer = layui.layer;
        var element = layui.element;
        var carousel = layui.carousel;
        var laypage = layui.laypage;
        var http = layui.http;
        var form = layui.form;
        var laydate = layui.laydate;
        var tinymce = layui.tinymce;
        window.jQuery = window.$ = jquery = layui.jquery;

        var limit = 8;

        // 获取轮播图 数据
        http.request('config/list', 'get', {
            page: 1,
            limit: 5
        }, function(res) {
            if (res.data.list.length > 0) {
                let swiperList = [];
                res.data.list.forEach(element => {
                    if (element.value != null) {
                        swiperList.push({
                            img: element.value
                        });
                    }
                });
                vue.swiperList = swiperList;
                vue.$nextTick(()=>{
                    var mySwiper = new Swiper('.ng-swiper', {
                        speed: 400,
                        spaceBetween: 100,
                        pagination: '.ng-swiper .swiper-pagination',
                        autoplay : 5000,
                        loop : true,
                        autoplayDisableOnInteraction : false,
                        calculateHeight : true
                    });
                    $(".ng-swiper-ovleft").bind("click",function (){ mySwiper.swipePrev();});
                    $(".ng-swiper-ovright").bind("click",function (){ mySwiper.swipeNext();});
                });
            }
        });
        // 查询当前字典表相关
            // 公告类型的查询和初始化
        gonggaoTypesSelect();
    // 当前表的字典表
        // 公告类型的查询
        function gonggaoTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=gonggao_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.gonggaoTypesList = res.data.list;
                }
            });
        }







        // 日期效验规则及格式
        dateTimePick();
        // 表单效验规则
        form.verify({
            // 正整数效验规则
            integer: [
                /^[1-9][0-9]*$/
                ,'必须是正整数'
            ]
            // 小数效验规则
            ,double: [
                /^[1-9][0-9]{0,5}(\.[0-9]{1,2})?$/
                ,'最大整数位为6为,小数最大两位'
            ]
                 
                                        

        });


        // 分页列表
        pageList();

        // 搜索按钮
        jquery('#btn-search').click(function(e) {
            pageList();
        });

        function pageList() {
            var param = {
                page: 1
                ,limit: limit
            };



            // 当前表
                 
            if (jquery('#gonggaoName').val() != null && jquery('#gonggaoName').val() != "" && jquery('#gonggaoName').val() != "null" ) {
                param['gonggaoName'] = jquery('#gonggaoName').val();
            }
                                        

            // 获取列表数据
            http.request('gonggao/list', 'get', param, function(res) {
                vue.dataList = res.data.list;
                // 分页
                laypage.render({
                    elem: 'pager',
                    count: res.data.total,
                    limit: limit,
                    jump: function(obj, first) {
                        param.page = obj.curr;
                        //首次不执行
                        if (!first) {
                            http.request('gonggao/list', 'get', param, function(res) {
                                vue.dataList = res.data.list;
                                vue.$nextTick(()=>{
                                    window.xznResize();
                            });
                            })
                        }
                    }
                });
                vue.$nextTick(()=>{
                    window.xznResize();
                });
            });
        }


        // 日期框初始化
        function dateTimePick(){
            /*
                ,change: function(value, date, endDate){
                    value       得到日期生成的值，如：2017-08-18
                    date        得到日期时间对象：{year: 2017, month: 8, date: 18, hours: 0, minutes: 0, seconds: 0}
                    endDate     得结束的日期时间对象，开启范围选择（range: true）才会返回。对象成员同上。
            */
        }




    });
</script>

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

<script>
    window.xznResize = function() {
        var mySwiper2 = new Swiper('.ng-inzep',{
            calculateHeight : true,
            loop : true,
            paginationClickable :true,
            pagination: ".ng-inzep .swiper-pagination"
        });

        $(document).bind("scroll",function (){
            if($(".ng-swip-porlist").length > 0){
                if($(window).width() > 769){
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                }else if($(window).width() < 769){
                    if($(window).width() < 480){
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    }else{
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }
        });

        $(window).bind("resize", function () {
            // 强制关闭导航
            if ($(window).width() > 992) { $(".ipad-nav").slideUp(); };

            if ($(".ng-swip-porlist").length > 0) {
                if ($(window).width() > 769) {
                    mySwiper2.params.slidesPerView = 4;
                    mySwiper3.params.slidesPerView = 4;
                } else if ($(window).width() < 769) {
                    if ($(window).width() < 480) {
                        mySwiper2.params.slidesPerView = 2;
                        mySwiper3.params.slidesPerView = 2;
                    } else {
                        mySwiper2.params.slidesPerView = 3;
                        mySwiper3.params.slidesPerView = 3;
                    }
                }
            }

            Spirit_dynamicBG($(".ng-inswbg"), 1600, 616, $(".ng-inswbg"));
            Spirit_CallBack($(".ng-porlist-doc>a"), 280, 200);
            Spirit_CallBack($(".ng-incontlst-img"), 368, 240);
            Spirit_CallBack($(".ng-inzep-ims"), 400, 270);
            Spirit_CallBack($(".ng-isenst-img"), 368, 240);
            Spirit_CallBack($(".ng-prslist-img"), 100, 100);
            Spirit_CallBack($(".ng-vrslist-img"), 260, 170);
            Spirit_CallBack($(".ng-newbve-img-ikk"), 368, 240);

            $(".ng-subc-swiper").css({ "height": $(".ng-subc-swiper").width() });

            if ($(window).width() < 640) {
                $(".am-inside-swf").css({
                    "min-height": $(window).height() - 60
                });
            } else {
                $(".am-inside-swf").css({
                    "min-height": "auto"
                });
            }
        }).resize();
    }
</script>
</body>
</html>
