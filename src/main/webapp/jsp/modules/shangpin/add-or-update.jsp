<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <%@ include file="../../static/head.jsp" %>
    <link href="http://www.bootcss.com/p/bootstrap-datetimepicker/bootstrap-datetimepicker/css/datetimepicker.css"
          rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap-select.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
    <script type="text/javascript" charset="utf-8">
        window.UEDITOR_HOME_URL = "${pageContext.request.contextPath}/resources/ueditor/"; //UEDITOR_HOME_URL、config、all这三个顺序不能改变
    </script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${pageContext.request.contextPath}/resources/ueditor/lang/zh-cn/zh-cn.js"></script>
</head>
<style>
    .error {
        color: red;
    }
</style>
<body>
<!-- Pre Loader -->
<div class="loading">
    <div class="spinner">
        <div class="double-bounce1"></div>
        <div class="double-bounce2"></div>
    </div>
</div>
<!--/Pre Loader -->
<div class="wrapper">
    <!-- Page Content -->
    <div id="content">
        <!-- Top Navigation -->
        <%@ include file="../../static/topNav.jsp" %>
        <!-- Menu -->
        <div class="container menu-nav">
            <nav class="navbar navbar-expand-lg lochana-bg text-white">
                <button class="navbar-toggler" type="button" data-toggle="collapse"
                        data-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="ti-menu text-white"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul id="navUl" class="navbar-nav mr-auto">

                    </ul>
                </div>
            </nav>
        </div>
        <!-- /Menu -->
        <!-- Breadcrumb -->
        <!-- Page Title -->
        <div class="container mt-0">
            <div class="row breadcrumb-bar">
                <div class="col-md-6">
                    <h3 class="block-title">编辑商品</h3>
                </div>
                <div class="col-md-6">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/index.jsp">
                                <span class="ti-home"></span>
                            </a>
                        </li>
                        <li class="breadcrumb-item">商品管理</li>
                        <li class="breadcrumb-item active">编辑商品</li>
                    </ol>
                </div>
            </div>
        </div>
        <!-- /Page Title -->

        <!-- /Breadcrumb -->
        <!-- Main Content -->
        <div class="container">

            <div class="row">
                <!-- Widget Item -->
                <div class="col-md-12">
                    <div class="widget-area-2 lochana-box-shadow">
                        <h3 class="widget-title">商品信息</h3>
                        <form id="addOrUpdateForm">
                            <div class="form-row">
                            <!-- 级联表的字段 -->
                            <!-- 当前表的字段 -->
                                    <input id="updateId" name="id" type="hidden">
                                    <div class="form-group col-md-6 shangpinNameDiv">
                                        <label>商品名称</label>
                                        <input style="width: 450px" id="shangpinName" name="shangpinName" class="form-control"
                                               placeholder="商品名称">
                                    </div>
                                    <div class="form-group col-md-6 shangpinPhotoDiv">
                                        <label>商品照片</label>
                                        <img id="shangpinPhotoImg" src="" width="100" height="100">
                                        <input name="file" type="file" id="shangpinPhotoupload"
                                               class="form-control-file">
                                        <input name="shangpinPhoto" id="shangpinPhoto-input" type="hidden">
                                    </div>
                                    <div class="form-group col-md-6 shangpinTypesDiv">
                                        <label>商品类型</label>
                                        <select style="width: 450px" id="shangpinTypesSelect" name="shangpinTypes" class="form-control">
                                        </select>
                                    </div>
                                    <div class="form-group col-md-6 shangpinKucunNumberDiv">
                                        <label>商品库存</label>
                                        <input style="width: 450px" id="shangpinKucunNumber" name="shangpinKucunNumber" class="form-control"
                                               onchange="shangpinKucunNumberChickValue(this)"  placeholder="商品库存">
                                    </div>

                                    <div class="form-group col-md-6 shangpinPriceDiv">
                                        <label>购买获得积分</label>
                                        <input style="width: 450px" id="shangpinPrice" name="shangpinPrice" class="form-control"
                                               onchange="shangpinPriceChickValue(this)"  placeholder="购买获得积分">
                                    </div>

                                    <div class="form-group col-md-6 shangpinOldMoneyDiv">
                                        <label>商品原价</label>
                                        <input style="width: 450px" id="shangpinOldMoney" name="shangpinOldMoney" class="form-control"
                                               onchange="shangpinOldMoneyChickValue(this)" placeholder="商品原价">
                                    </div>
                                    <div class="form-group col-md-6 shangpinNewMoneyDiv">
                                        <label>现价</label>
                                        <input style="width: 450px" id="shangpinNewMoney" name="shangpinNewMoney" class="form-control"
                                               onchange="shangpinNewMoneyChickValue(this)" placeholder="现价">
                                    </div>
                                    <div class="form-group  col-md-6 shangpinContentDiv">
                                        <label>商品简介</label>
                                        <input id="shangpinContentupload" name="file" type="file">
                                        <script id="shangpinContentEditor" type="text/plain"
                                                style="width:100%;height:230px;"></script>
                                        <script type = "text/javascript" >
                                        //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
                                        //相见文档配置属于你自己的编译器
                                        var shangpinContentUe = UE.getEditor('shangpinContentEditor', {
                                            toolbars: [
                                                [
                                                    'undo', //撤销
                                                    'bold', //加粗
                                                    'redo', //重做
                                                    'underline', //下划线
                                                    'horizontal', //分隔线
                                                    'inserttitle', //插入标题
                                                    'cleardoc', //清空文档
                                                    'fontfamily', //字体
                                                    'fontsize', //字号
                                                    'paragraph', //段落格式
                                                    'inserttable', //插入表格
                                                    'justifyleft', //居左对齐
                                                    'justifyright', //居右对齐
                                                    'justifycenter', //居中对
                                                    'justifyjustify', //两端对齐
                                                    'forecolor', //字体颜色
                                                    'fullscreen', //全屏
                                                    'edittip ', //编辑提示
                                                    'customstyle', //自定义标题
                                                ]
                                            ]
                                        });
                                        </script>
                                        <input type="hidden" name="shangpinContent" id="shangpinContent-input">
                                    </div>
                                    <div class="form-group col-md-12 mb-3">
                                        <button id="submitBtn" type="button" class="btn btn-primary btn-lg">提交</button>
                                        <button id="exitBtn" type="button" class="btn btn-primary btn-lg">返回</button>
                                    </div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /Widget Item -->
            </div>
        </div>
        <!-- /Main Content -->
    </div>
    <!-- /Page Content -->
</div>
<!-- Back to Top -->
<a id="back-to-top" href="#" class="back-to-top">
    <span class="ti-angle-up"></span>
</a>
<!-- /Back to Top -->
<%@ include file="../../static/foot.jsp" %>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.ui.widget.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.fileupload.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.form.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/jquery.validate.min.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/messages_zh.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/validate/card.js"></script>
<script type="text/javascript" charset="utf-8"
        src="${pageContext.request.contextPath}/resources/js/datetimepicker/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" charset="utf-8"
                 src="${pageContext.request.contextPath}/resources/js/bootstrap-select.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/laydate.js"></script>
<script>
    <%@ include file="../../utils/menu.jsp"%>
    <%@ include file="../../static/setMenu.js"%>
    <%@ include file="../../utils/baseUrl.jsp"%>

    var tableName = "shangpin";
    var pageType = "add-or-update";
    var updateId = "";
    var crossTableId = -1;
    var crossTableName = '';
    var ruleForm = {};
    var crossRuleForm = {};


    // 下拉框数组
        <!-- 当前表的下拉框数组 -->
    var shangpinTypesOptions = [];
    var shangxiaTypesOptions = [];
        <!-- 级联表的下拉框数组 -->

    var ruleForm = {};


    // 文件上传
    function upload() {

        <!-- 当前表的文件上传 -->
        $('#shangpinPhotoupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                var photoUrl= baseUrl + 'file/download?fileName=' + data.result.file;
                document.getElementById('shangpinPhotoImg').setAttribute('src',photoUrl);
                document.getElementById('shangpinPhoto-input').setAttribute('value',photoUrl);
            }
        });


        $('#shangpinContentupload').fileupload({
            url: baseUrl + 'file/upload',
            headers: {token: window.sessionStorage.getItem("token")},
            dataType: 'json',
            done: function (e, data) {
                UE.getEditor('shangpinContentEditor').execCommand('insertHtml', '<img src=\"' + baseUrl + 'upload/' + data.result.file + '\" width=900 height=560>');
            }
        });


    }

    // 表单提交
    function submit() {
        if (validform() == true && compare() == true) {
            let data = {};
            getContent();
            let value = $('#addOrUpdateForm').serializeArray();
            $.each(value, function (index, item) {
                data[item.name] = item.value;
            });
            let json = JSON.stringify(data);
            var urlParam;
            var successMes = '';
            if (updateId != null && updateId != "null" && updateId != '') {
                urlParam = 'update';
                successMes = '修改成功';
            } else {
                urlParam = 'save';
                    successMes = '添加成功';

            }
            httpJson("shangpin/" + urlParam, "POST", data, (res) => {
                if(res.code == 0){
                    window.sessionStorage.removeItem('addshangpin');
                    window.sessionStorage.removeItem('updateId');
                    let flag = true;
                    if (flag) {
                        alert(successMes);
                    }
                    if (window.sessionStorage.getItem('onlyme') != null && window.sessionStorage.getItem('onlyme') == "true") {
                        window.sessionStorage.removeItem('onlyme');
                        window.sessionStorage.setItem("reload","reload");
                        window.parent.location.href = "${pageContext.request.contextPath}/index.jsp";
                    } else {
                        window.location.href = "list.jsp";
                    }
                }
            });
        } else {
            alert("表单未填完整或有错误");
        }
    }

    // 查询列表
        <!-- 查询当前表的所有列表 -->
        function shangpinTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangpin_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shangpinTypesOptions = res.data.list;
                }
            });
        }
        function shangxiaTypesSelect() {
            //填充下拉框选项
            http("dictionary/page?page=1&limit=100&sort=&order=&dicCode=shangxia_types", "GET", {}, (res) => {
                if(res.code == 0){
                    shangxiaTypesOptions = res.data.list;
                }
            });
        }
        <!-- 查询级联表的所有列表 -->



    // 初始化下拉框
    <!-- 初始化当前表的下拉框 -->
        function initializationShangpintypesSelect(){
            var shangpinTypesSelect = document.getElementById('shangpinTypesSelect');
            if(shangpinTypesSelect != null && shangpinTypesOptions != null  && shangpinTypesOptions.length > 0 ){
                for (var i = 0; i < shangpinTypesOptions.length; i++) {
                    shangpinTypesSelect.add(new Option(shangpinTypesOptions[i].indexName,shangpinTypesOptions[i].codeIndex));
                }
            }
        }
        function initializationShangxiatypesSelect(){
            var shangxiaTypesSelect = document.getElementById('shangxiaTypesSelect');
            if(shangxiaTypesSelect != null && shangxiaTypesOptions != null  && shangxiaTypesOptions.length > 0 ){
                for (var i = 0; i < shangxiaTypesOptions.length; i++) {
                    shangxiaTypesSelect.add(new Option(shangxiaTypesOptions[i].indexName,shangxiaTypesOptions[i].codeIndex));
                }
            }
        }



    // 下拉框选项回显
    function setSelectOption() {

        <!-- 当前表的下拉框回显 -->

        var shangpinTypesSelect = document.getElementById("shangpinTypesSelect");
        if(shangpinTypesSelect != null && shangpinTypesOptions != null  && shangpinTypesOptions.length > 0 ) {
            for (var i = 0; i < shangpinTypesOptions.length; i++) {
                if (shangpinTypesOptions[i].codeIndex == ruleForm.shangpinTypes) {//下拉框value对比,如果一致就赋值汉字
                        shangpinTypesSelect.options[i].selected = true;
                }
            }
        }

        var shangxiaTypesSelect = document.getElementById("shangxiaTypesSelect");
        if(shangxiaTypesSelect != null && shangxiaTypesOptions != null  && shangxiaTypesOptions.length > 0 ) {
            for (var i = 0; i < shangxiaTypesOptions.length; i++) {
                if (shangxiaTypesOptions[i].codeIndex == ruleForm.shangxiaTypes) {//下拉框value对比,如果一致就赋值汉字
                        shangxiaTypesSelect.options[i].selected = true;
                }
            }
        }
        <!--  级联表的下拉框回显  -->
    }


    // 填充富文本框
    function setContent() {

        <!-- 当前表的填充富文本框 -->
        if (ruleForm.shangpinContent != null && ruleForm.shangpinContent != 'null' && ruleForm.shangpinContent != '' && $("#shangpinContentupload").length>0) {

            var shangpinContentUeditor = UE.getEditor('shangpinContentEditor');
            shangpinContentUeditor.ready(function () {
                var mes = '';
                if(ruleForm.shangpinContent != null){
                    mes = ''+ ruleForm.shangpinContent;
                    // mes = mes.replace(/\n/g, "<br>");
                }
                shangpinContentUeditor.setContent(mes);
            });
        }
    }
    // 获取富文本框内容
    function getContent() {

        <!-- 获取当前表的富文本框内容 -->
        if($("#shangpinContentupload").length>0) {
            var shangpinContentEditor = UE.getEditor('shangpinContentEditor');
            if (shangpinContentEditor.hasContents()) {
                $('#shangpinContent-input').attr('value', shangpinContentEditor.getContent());
            }
        }
    }
    //数字检查
        <!-- 当前表的数字检查 -->
        function shangpinKucunNumberChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function shangpinPriceChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function shangpinOldMoneyChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }
        function shangpinNewMoneyChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[0-9]{0,6}(\.[0-9]{1,2})?$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("只允许输入整数6位,小数2位的数字");
                return false;
            }
        }
        function shangpinClicknumChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }
        function shangpinDeleteChickValue(e){
            var this_val = e.value || 0;
            var reg=/^[1-9][0-9]*$/;
            if(!reg.test(this_val)){
                e.value = "";
                alert("输入不合法");
                return false;
            }
        }

    function exit() {
        window.sessionStorage.removeItem("updateId");
        window.sessionStorage.removeItem('addshangpin');
        window.location.href = "list.jsp";
    }
    // 表单校验
    function validform() {
        return $("#addOrUpdateForm").validate({
            rules: {
                shangpinName: "required",
                shangpinPhoto: "required",
                shangpinTypes: "required",
                shangpinKucunNumber: "required",
                shangpinPrice: "required",
                // shangpinOldMoney: "required",
                // shangpinNewMoney: "required",
                shangpinClicknum: "required",
                shangxiaTypes: "required",
                shangpinContent: "required",
            },
            messages: {
                shangpinName: "商品名称不能为空",
                shangpinPhoto: "商品照片不能为空",
                shangpinTypes: "商品类型不能为空",
                shangpinKucunNumber: "商品库存不能为空",
                shangpinPrice: "购买获得积分不能为空",
                // shangpinOldMoney: "商品原价不能为空",
                // shangpinNewMoney: "现价不能为空",
                shangpinClicknum: "点击次数不能为空",
                shangxiaTypes: "是否上架不能为空",
                shangpinContent: "商品简介不能为空",
            }
        }).form();
    }

    // 获取当前详情
    function getDetails() {
        var addshangpin = window.sessionStorage.getItem("addshangpin");
        if (addshangpin != null && addshangpin != "" && addshangpin != "null") {
            //注册表单验证
            $(validform());

            $('#submitBtn').text('新增');

        } else {
            $('#submitBtn').text('修改');
            var userId = window.sessionStorage.getItem('userId');
            updateId = userId;//先赋值登录用户id
            var uId  = window.sessionStorage.getItem('updateId');//获取修改传过来的id
            if (uId != null && uId != "" && uId != "null") {
                //如果修改id不为空就赋值修改id
                updateId = uId;
            }
            window.sessionStorage.removeItem('updateId');
            http("shangpin/info/" + updateId, "GET", {}, (res) => {
                if(res.code == 0)
                {
                    ruleForm = res.data
                    // 是/否下拉框回显
                    setSelectOption();
                    // 设置图片src
                    showImg();
                    // 设置视频src
                    showVideo();
                    // 数据填充
                    dataBind();
                    // 富文本框回显
                    setContent();
                    //注册表单验证
                    $(validform());
                }

            });
        }
    }

    // 清除可能会重复渲染的selection
    function clear(className) {
        var elements = document.getElementsByClassName(className);
        for (var i = elements.length - 1; i >= 0; i--) {
            elements[i].parentNode.removeChild(elements[i]);
        }
    }

    function dateTimePick() {
    }


    function dataBind() {


    <!--  级联表的数据回显  -->


    <!--  当前表的数据回显  -->
        $("#updateId").val(ruleForm.id);
        $("#shangpinName").val(ruleForm.shangpinName);
        $("#shangpinKucunNumber").val(ruleForm.shangpinKucunNumber);
        $("#shangpinPrice").val(ruleForm.shangpinPrice);
        $("#shangpinOldMoney").val(ruleForm.shangpinOldMoney);
        $("#shangpinNewMoney").val(ruleForm.shangpinNewMoney);
        $("#shangpinClicknum").val(ruleForm.shangpinClicknum);
        $("#shangpinContent").val(ruleForm.shangpinContent);

    }
    <!--  级联表的数据回显  -->

    //图片显示
    function showImg() {
        <!--  当前表的图片  -->
        $("#shangpinPhotoImg").attr("src",ruleForm.shangpinPhoto);

        <!--  级联表的图片  -->
    }


    <!--  级联表的图片  -->


    //视频回显
    function showVideo() {
    <!--  当前表的视频  -->

    <!--  级联表的视频  -->
    }


    <!--  级联表的视频  -->



    $(document).ready(function () {
        //设置右上角用户名
        $('.dropdown-menu h5').html(window.sessionStorage.getItem('username'))
        //设置项目名
        $('.sidebar-header h3 a').html(projectName)
        //设置导航栏菜单
        setMenu();
        $('#exitBtn').on('click', function (e) {
            e.preventDefault();
            exit();
        });
        //初始化时间插件
        dateTimePick();
        //查询所有下拉框
            <!--  当前表的下拉框  -->
            shangpinTypesSelect();
            shangxiaTypesSelect();
            <!-- 查询级联表的下拉框(用id做option,用名字及其他参数做名字级联修改) -->



        // 初始化下拉框
            <!--  初始化当前表的下拉框  -->
            initializationShangpintypesSelect();
            initializationShangxiatypesSelect();
            <!--  初始化级联表的下拉框  -->

        $(".selectpicker" ).selectpicker('refresh');
        getDetails();
        //初始化上传按钮
        upload();
    <%@ include file="../../static/myInfo.js"%>
                $('#submitBtn').on('click', function (e) {
                    e.preventDefault();
                    //console.log("点击了...提交按钮");
                    submit();
                });
        readonly();
        window.sessionStorage.removeItem('addshangpin');
    });

    function readonly() {
        if (window.sessionStorage.getItem('role') == '管理员') {
            //$('#jifen').attr('readonly', 'readonly');
            //$('#role').attr('style', 'pointer-events:none;width:450px;');
        }
		else if (window.sessionStorage.getItem('role') == '用户') {
            // $(".aaaaaa").remove();
            $(".yonghu").remove();//删除当前用户的信息
            // 商品原价设置不可选
            $('#shangpinOldMoney').attr('readonly', 'readonly');
            // 现价设置不可选
            $('#shangpinNewMoney').attr('readonly', 'readonly');
        }
        else{
            // alert("未知情况.......");
            // var replyTextUeditor = UE.getEditor('replyTextEditor');
            // replyTextUeditor.ready(function () {
            //     replyTextUeditor.setDisabled('fullscreen');
            // });
        }
    }

    //比较大小
    function compare() {
        var largerVal = null;
        var smallerVal = null;
        if (largerVal != null && smallerVal != null) {
            if (largerVal <= smallerVal) {
                alert(smallerName + '不能大于等于' + largerName);
                return false;
            }
        }
        return true;
    }


    // 用户登出
    <%@ include file="../../static/logout.jsp"%>
</script>
</body>

</html>
