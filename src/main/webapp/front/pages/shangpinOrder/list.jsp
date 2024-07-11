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
    <title>商品订单列表页</title>
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
    <h2 style="margin-top: 20px;" class="index-title">USER / ORDER</h2>
    <div class="line-container">
        <p class="line" style="background: #EEEEEE;"> 我的商品订单 </p>
    </div>
    <!-- 标题 -->
    <div class="modal fade" id="shangpinCommentbackModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" style="z-index: 3000">
            <div class="modal-content">
                <%-- 模态框标题--%>
                <div class="modal-header">
                    <h5 class="modal-title" id="shangpinCommentbackTitle">评价</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <%-- 模态框内容 --%>
                <div class="modal-body">
                    <input type="hidden" id="id">
                    <textarea id="shangpinCommentbackContent" style="width: 500px;height: 300px"></textarea>
                </div>
                <%-- 模态框按钮 --%>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" @click="submitShangpinCommentback()" class="btn btn-theme">评价</button>
                </div>
            </div>
        </div>
    </div>



    <div class="center-container" style="width: 100%;">
        <div class="right-container" style="padding-top: 0;">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this" @click="pageList(0)">全部商品订单</li>
                    <li v-for="item in shangpinOrderTypesList" :value="item.codeIndex"  @click="pageList(item.codeIndex)">{{item.indexName}}</li>
                </ul>
                <div class="layui-tab-content">
                    <table class="layui-table" lay-skin="nob">
                        <thead>
                        <tr>
                            <th>商品名称</th>
                            <th>商品照片</th>
                            <th>商品类型</th>
                            <th>商品库存</th>
                            <th>购买获得积分</th>
                            <th>商品原价</th>
                            <th>现价</th>
                            <th>点击次数</th>
                            <th>是否上架</th>
                            <th>订单号</th>
                            <th>购买数量</th>
                            <th>实付价格</th>
                            <th>订单类型</th>
                            <th>支付类型</th>
                            <th>订单创建时间</th>
                            <td>操作</td>
                        </tr>
                        </thead>
                        <tbody>
                        <tr v-for="(item,index) in dataList" v-bind:key="index">
                            <td style="width: 60px;">{{item.shangpinName}}</td>
                            <td style="width: 250px;">
                                <img :src="item.shangpinPhoto" style="width: 100px;height: 100px;object-fit: cover;">
                            </td>
                            <td style="width: 80px;">{{item.shangpinValue}}</td>
                            <td style="width: 60px;">{{item.shangpinKucunNumber}}</td>
                            <td style="width: 60px;">{{item.shangpinPrice}}</td>
                            <td style="width: 100px;color: red">{{item.shangpinOldMoney}}</td>
                            <td style="width: 100px;color: red">{{item.shangpinNewMoney}}</td>
                            <td style="width: 60px;">{{item.shangpinClicknum}}</td>
                            <td style="width: 80px;">{{item.shangxiaValue}}</td>
                            <td style="width: 150px;">{{item.shangpinOrderUuidNumber}}</td>
                            <td style="width: 150px;">{{item.buyNumber}}</td>
                            <td style="width: 150px;">{{item.shangpinOrderTruePrice}}</td>
                            <td style="width: 80px;">{{item.shangpinOrderValue}}</td>
                            <td style="width: 80px;">{{item.shangpinOrderPaymentValue}}</td>
                            <td style="width: 150px;">{{item.insertTime}}</td>
                            <td style="width: 100px;">




                                <button v-if="item.shangpinOrderTypes==3" @click="refund(item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                    <i class="layui-icon">&#xe65e;</i> 退款
                                </button>


                                <button v-if="item.shangpinOrderTypes==4" @click="receiving(item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius layui-btn-warm">
                                    <i class="layui-icon">&#xe65e;</i> 收货
                                </button>




                                <button v-if="item.shangpinOrderTypes==5" @click="commentback(item.id)" type="button" class="layui-btn layui-btn-sm layui-btn-radius btn-theme">
                                    <i class="layui-icon">&#xe65e;</i> 评价
                                </button>

                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <div class="pager" id="pager"></div>
                </div>
            </div>
        </div>
    </div></div>


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
            shangpinOrderTypesList : [],
            shangpinOrderPaymentTypesList : [],
            shangpinOrderTypes: 0,//类型
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
            //列表查询
            ,pageList(shangpinOrderTypes) {
                this.shangpinOrderTypes = shangpinOrderTypes;
                // 获取列表数据
                layui.http.request('shangpinOrder/page', 'get', {
                    page: 1,
                    limit: this.limit,
                    shangpinOrderTypes: (vue.shangpinOrderTypes == 0)?null:vue.shangpinOrderTypes
                }, function(res) {
                    vue.dataList = res.data.list;
                    // 分页
                    layui.laypage.render({
                        elem: 'pager',
                        count: res.data.total,
                        limit: this.limit,
                        jump: function(obj, first) {
                            //首次不执行
                            if (!first) {
                                layui.http.request('shangpinOrder/page', 'get', {
                                    page: obj.curr,
                                    limit: obj.limit,
                                    shangpinOrderTypes: (this.shangpinOrderTypes == 0)?null:this.shangpinOrderTypes
                                }, function(res) {
                                    this.dataList = res.data.list
                                });
                            }
                        }
                    });
                });
            }
            // 支付
            ,pay(id) {
                var mymessage = confirm("确定要支付吗？");
                if(!mymessage){
                    alert("已取消操作");
                    return false;
                }
                // 获取商品详情信息
                layui.http.request(`shangpinOrder/pay?id=`+id, 'GET',{}, (res) => {
                    if(res.code==0){
                        layer.msg('支付成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            }
            // 退款
            ,refund(id) {
                var mymessage = confirm("确定要退款吗？");
                if(!mymessage){
                    alert("已取消操作");
                    return false;
                }
                // 获取商品详情信息
                layui.http.request(`shangpinOrder/refund?id=`+id, 'get', {}, (res) => {
                    if(res.code==0){
                        layer.msg('退款成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            }
            // 收货
            ,receiving(id) {
                var mymessage = confirm("确定要收货吗？");
                if(!mymessage){
                    alert("已取消操作");
                    return false;
                }
                // 获取商品详情信息
                layui.http.request(`shangpinOrder/receiving?id=`+id, 'get', {}, (res) => {
                    if(res.code==0){
                        layer.msg('成功收货', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
            }
            // 评价
            ,commentback(id) {
                $("#id").val(id);//设置订单id
                $('#shangpinCommentbackModal').modal('show');//打开模态框
            }
            ,submitShangpinCommentback(){
                var shangpinCommentbackContent = $("#shangpinCommentbackContent").val();
                var id = $("#id").val();

                layui.http.request("shangpinOrder/commentback?id="+id+"&commentbackText="+shangpinCommentbackContent, 'get', {}, function (res) {
                    if(res.code==0){
                        layer.msg('评价成功', {
                            time: 2000,
                            icon: 6
                        });
                        window.location.reload();
                    }else{
                        layer.msg(res.msg, {
                            time: 2000,
                            icon: 2
                        });
                    }
                });
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
            // 订单类型的查询和初始化
        shangpinOrderTypesSelect();
            // 支付类型的查询和初始化
        shangpinOrderPaymentTypesSelect();
    // 当前表的字典表
        // 订单类型的查询
        function shangpinOrderTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_order_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.shangpinOrderTypesList = res.data.list;
                }
            });
        }
        // 支付类型的查询
        function shangpinOrderPaymentTypesSelect() {
            http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_order_payment_types", 'get', {}, function (res) {
                if(res.code == 0){
                    vue.shangpinOrderPaymentTypesList = res.data.list;
                }
            });
        }





        // 获取列表数据
        http.request('shangpinOrder/page', 'get',{
            page: 1,
            limit: limit,
            shangpinOrderTypes: (vue.shangpinOrderTypes == 0)?null:vue.shangpinOrderTypes
        }, function(res) {
            vue.dataList = res.data.list;
            // 分页
            laypage.render({
                elem: 'pager',
                count: res.data.total,
                limit: vue.limit,
                jump: function(obj, first) {
                    //首次不执行  !first 是 layui的自带方法
                    if (!first) {
                        http.request('shangpinOrder/list', 'get', {
                            page: obj.curr,
                            limit: obj.limit,
                            shangpinOrderType: (vue.shangpinOrderTypes == 0)?null:vue.shangpinOrderTypes
                        }, function(res) {
                            vue.dataList = res.data.list
                        })
                    }
                }
            });
        });
        // 订单类型的查询
                shangpinOrderTypesSelect();
       function shangpinOrderTypesSelect() {
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_order_types", 'get', {}, function (res) {
               if(res.code == 0){
                   vue.shangpinOrderTypesList = res.data.list;
               }
           });
       }
        // 支付类型的查询
                shangpinOrderPaymentTypesSelect();
       function shangpinOrderPaymentTypesSelect() {
           http.request("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_order_payment_types", 'get', {}, function (res) {
               if(res.code == 0){
                   vue.shangpinOrderPaymentTypesList = res.data.list;
               }
           });
       }

    });
</script>

<script src="../../xznstatic/js/idangerous.swiper.min.js"></script>
<script src="../../xznstatic/js/aos.js" type="text/javascript" charset="utf-8"></script>
<script src="../../xznstatic/js/jquery.superslide.2.1.1.js"></script>
<script src="../../xznstatic/js/app.js"></script>
<script src="../../xznstatic/js/lightbox.js"></script>

</body>
</html>
