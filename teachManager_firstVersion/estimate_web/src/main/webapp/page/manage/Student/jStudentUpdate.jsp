<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>修改学生</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png"
		href="${pageContext.request.contextPath}/assets/i/favicon.png">
	<link rel="apple-touch-icon-precomposed"
		href="${pageContext.request.contextPath}/assets/i/app-icon72x72@2x.png">
	<meta name="apple-mobile-web-app-title" content="Amaze UI" />
	<script src="http://cdn.bootcss.com/echarts/3.3.2/echarts.min.js"></script>
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/amazeui.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/amazeui.datatables.min.css" />
	<link rel="stylesheet"
		href="${pageContext.request.contextPath}/assets/css/app.css">
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.0.min.js"></script>

	<style>
		.tpl-content-myWrapper {
		  transition: all 0.4s ease-in-out;
		  position: relative;
		  /*margin-left: 240px;*/
		  z-index: 1101;
		  min-height: 922px;
		  border-bottom-left-radius: 3px;
		}
	</style>
</head>

<body data-type="widgets">
    <script src="${pageContext.request.contextPath}/assets/js/theme.js"></script>
    <div class="am-g tpl-g">
        <!-- 头部 -->
        <header>
            <!-- logo -->
			<div class="am-fl tpl-header-logo">
				<img src="${pageContext.request.contextPath }/assets/img/shentie.png" alt="" style="height:55px ;width: 55px;margin-left:-10px ;">
				<h3 style="display: inline;font: '楷体';">什贴中学教学评价系统</h3>
			</div>
            <!-- 右侧内容 -->
            <div class="tpl-header-fluid">
                <!-- 其它功能-->
                <div class="am-fr tpl-header-navbar">
                    <ul>
                        <!-- 欢迎语 -->
                        <li class="am-text-sm tpl-header-navbar-welcome">
                            <a href="javascript:;">欢迎你, <span>${session._user_name }</span> </a>
                        </li>

                        <!-- 退出 -->
                        <li class="am-text-sm">
                            <a href="${pageContext.request.contextPath}/loginAction_logout">
                                <span class="am-icon-sign-out"></span> 退出
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </header>


        <!-- 内容区域 -->
        <div class="tpl-content-myWrapper">

				<div class="row-content am-cf">

					<div class="row">

						<div class="am-u-sm-12 am-u-md-12 am-u-lg-12">
							<div class="widget am-cf">
								<div class="widget-head am-cf">
									<div class="widget-title am-fl">修改[${classesName }]学生[${name }]</div>
								
									<div class="am-u-sm-12 am-u-md-6 am-u-lg-6">
										<div class="am-form-group">
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
													<button type="button" onclick="history.go(-1)"
														class="am-btn am-btn-default am-btn-success">
														<span class="am-icon-reply"></span> 返回
													</button>
												</div>
											</div>
										</div>
									</div>
								
								</div>

								<div class="widget-body am-fr">

									<form class="am-form tpl-form-border-form tpl-form-border-br" id="studentForm"  action="studentAction_update" >
										<input type="hidden" name="classesId" value="${classesId }" />
										<input type="hidden" name="id" value="${id }" />
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">姓名</label>
											<div class="am-u-sm-9">
												<input type="text" class="tpl-form-input"  name="name" value="${name }">
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">学籍号 </label>
											<div class="am-u-sm-9">
												<input type="text" class="tpl-form-input" name="no" value="${no }"> 
											</div>
										</div>

										<div class="am-form-group am-u-md-6">
											<label for="user-tel" class="am-u-sm-3 am-form-label">联系方式</label>
											<div class="am-u-sm-9">
												<input type="text" class="tpl-form-input" name="tel" value="${tel }">
											</div>
										</div>

										<div class="am-form-group am-u-md-6">
											<label for="user-birthday" class="am-u-sm-3 am-form-label">生日 </label>
											<div class="am-u-sm-9">
												<input type="text" class="tpl-form-input"  data-am-datepicker="" readonly name="birthday" 
												value="<fmt:formatDate value='${birthday }' type='date'/>"
												>
											</div>
										</div>
 
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">身份证号 </label>
											<div class="am-u-sm-9">
												<input type="text" class="tpl-form-input" name="number" value="${number }"> 
											</div>
										</div>

										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">性别 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
											
												<input type="radio" name="gender" value="1" class="tpl-form-input"  <c:if test="${gender == 1 }">checked="checked"</c:if> >男
												<input type="radio" name="gender" value="0" class="tpl-form-input" style="margin-left: 15px;" <c:if test="${gender == 0 }">checked="checked"</c:if> >女
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">政治面貌 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
											
												<select data-am-selected name="background">
												  <option value=""></option>
												  <option value="团员" <c:if test="${'团员' eq background}">selected</c:if>>团员</option>
												  <option value="少先队员" <c:if test="${'少先队员' eq background}">selected</c:if>>少先队员</option>
												  <option value="群众" <c:if test="${'群众' eq background}">selected</c:if>>群众</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">班内职务 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<select data-am-selected name="job">
												  <option value=""></option>
												  <option value="班长" <c:if test="${'班长' eq job}">selected</c:if>>班长</option>
												  <option value="学习委员" <c:if test="${'学习委员' eq job}">selected</c:if>>学习委员</option>
												  <option value="纪律委员" <c:if test="${'纪律委员' eq job}">selected</c:if>>纪律委员</option>
												  <option value="生活委员" <c:if test="${'生活委员' eq job}">selected</c:if>>生活委员</option>
												  <option value="卫生委员" <c:if test="${'卫生委员' eq job}">selected</c:if>>卫生委员</option>
												  <option value="体育委员" <c:if test="${'体育委员' eq job}">selected</c:if>>体育委员</option>
												  <option value="心理委员" <c:if test="${'心理委员' eq job}">selected</c:if>>心理委员</option>
												  <option value="文艺委员" <c:if test="${'文艺委员' eq job}">selected</c:if>>文艺委员</option>
												</select>
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">所在村 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<input type="text" class="tpl-form-input" name="viliage" value="${ viliage}">
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">现住址 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<input type="text" class="tpl-form-input" name="address" value="${address }">
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">父母名称 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<input type="text" class="tpl-form-input" name="parentName" value="${parentName }">
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">父母联系方式 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<input type="text" class="tpl-form-input" name="parentTel" value="${parentTel }">
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
											<label for="user-name" class="am-u-sm-3 am-form-label">独生子女 </label>
											<div class="am-u-sm-9" style="padding-top: 5px;">
												<input type="radio" name="isSingle" value="1" class="tpl-form-input"  <c:if test="${isSingle == 1 }">checked="checked"</c:if> >是
												<input type="radio" name="isSingle" value="0" class="tpl-form-input" style="margin-left: 15px;" <c:if test="${isSingle == 0 }">checked="checked"</c:if> >否
											</div>
										</div>
										
										<div class="am-form-group am-u-md-6">
										</div>
										
										<div class="am-form-group am-u-md-12" style="text-align: center;">
											<button type="button" class="am-btn am-btn-default am-btn-secondary" onclick="formSubmit()" ><span class="am-icon-save"></span> 保存</button>
										</div>
										
										<script type="text/javascript">
										function formSubmit(){
											document.getElementById("studentForm").submit();
										}
									</script>
									</form>
									
								</div>
							</div>
						</div>
					</div>
    </div>
    </div>
    <script
		src="${pageContext.request.contextPath}/assets/js/amazeui.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/amazeui.datatables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/dataTables.responsive.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/app.js"></script>

</body>

</html>