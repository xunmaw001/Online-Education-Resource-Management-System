<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

  <title>注册</title>
  <link rel="stylesheet" href="../../layui/css/layui.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/util.css">
  <link rel="stylesheet" type="text/css" href="../../xznstatic/css/main.css">
</head>
<body>
  <div id="app">
    <div class="dowebok">
      <div class="container-login100">
        <div class="wrap-login100">
          <div class="login100-pic js-tilt" data-tilt="">
            <img src="../../xznstatic/img/img-01.png">
          </div>
  
          <form class="login100-form validate-form layui-form">
            <span class="login100-form-title">
              注 册
            </span>

            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="paperid" name="paperid" placeholder="请输入所属试卷id（外键）" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="papername" name="papername" placeholder="请输入试卷名称" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="questionname" name="questionname" placeholder="请输入试题名称" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="score" name="score" placeholder="请输入分值" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="answer" name="answer" placeholder="请输入正确答案" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="type" name="type" placeholder="请输入试题类型，0：单选题 1：多选题 2：判断题 3：填空题（暂不考虑多项填空）" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="wrap-input100 validate-input">
              <div class="layui-form-item">
                <div class="layui-input-block" style="margin-left: 0;">
                  <input class="input100" type="text" id="sequence" name="sequence" placeholder="请输入试题排序，值越大排越前面" autocomplete="off" class="layui-input" lay-ignore>
                </div>
              </div>
              <span class="focus-input100"></span>
              <span class="symbol-input100">
                <i class="fa fa-envelope" aria-hidden="true"></i>
              </span>
            </div>
            <div class="container-login100-form-btn">
              <div class="layui-form-item" style="margin-bottom: 0;">
                <div class="layui-input-block" style="margin-left: 0;">
                  <button class="layui-btn btn-submit login100-form-btn" lay-submit lay-filter="register" lay-ignore>注册</button>
                </div>
              </div>
            </div>
  
            <div class="text-center p-t-12"></div>

            <div class="text-center p-t-136">
              <a class="txt2" href="javascript:window.location.href='../login/login.jsp'">
                已有账号？去登录
                <i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
              </a>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <script src="../../layui/layui.js"></script>
  <script src="../../js/vue.js"></script>
  <script src="../../js/config.js"></script>
  <script src="../../modules/config.js"></script>
  <script src="../../js/utils.js"></script>
  <script src="../../js/validate.js"></script>

  <script>
    layui.use(['layer', 'element', 'carousel', 'form', 'http', 'jquery'], function() {
      var layer = layui.layer;
      var element = layui.element;
      var carousel = layui.carousel;
      var form = layui.form;
      var http = layui.http;
      var jquery = layui.jquery;

      var tablename = http.getParam('tablename');
              
      // 注册
      form.on('submit(register)', function(data) {
        data = data.field;
        if(!data.paperid){
          layer.msg('所属试卷id（外键）不能为空', {
            time: 2000,
            icon: 5
          });
          return false
        }
                        if(!data.papername){
          layer.msg('试卷名称不能为空', {
            time: 2000,
            icon: 5
          });
          return false
        }
                        if(!data.questionname){
          layer.msg('试题名称不能为空', {
            time: 2000,
            icon: 5
          });
          return false
        }
                                                                                                                        http.requestJson(tablename + '/register', 'post', data, function(res) {
          layer.msg('注册成功', {
            time: 2000,
            icon: 6
          },function(){
            // 路径访问设置
            window.location.href = '../login/login.jsp';
          });
        });
        return false
      });
    });
  </script>
</body>
</html>
