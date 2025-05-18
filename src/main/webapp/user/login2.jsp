<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Secure Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap (only for alert & btn reset) + Font Awesome -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" rel="stylesheet">

  <!-- ========== Your CSS ========== -->
  <style>
@import url('https://rsms.me/inter/inter-ui.css');
::selection{background:#2D2F36}
::-webkit-selection{background:#2D2F36}
::-moz-selection{background:#2D2F36}
body{
  background:white;
  font-family:'Inter UI',sans-serif;
  margin:0;padding:20px;
}
.page{
  background:#e2e2e5;
  display:flex;
  flex-direction:column;
  height:calc(100% - 40px);
  position:absolute;
  place-content:center;
  width:calc(100% - 40px);
}
@media(max-width:767px){
  .page{height:auto;margin-bottom:20px;padding-bottom:20px}
}
.container{
  display:flex;height:320px;margin:0 auto;width:640px;
}
@media(max-width:767px){
  .container{flex-direction:column;height:630px;width:320px}
}
.left{
  background:white;
  height:calc(100% - 40px);
  top:20px;position:relative;width:50%;
}
@media(max-width:767px){
  .left{height:100%;left:20px;width:calc(100% - 40px);max-height:270px}
}
.login{
  font-size:50px;font-weight:900;margin:50px 40px 40px;
}
.eula{
  color:#999;font-size:14px;line-height:1.5;margin:0 40px;
}
.right{
  background:#474A59;
  box-shadow:0 0 40px 16px rgba(0,0,0,0.22);
  color:#F1F1F2;position:relative;width:50%;
}
@media(max-width:767px){
  .right{flex-shrink:0;height:100%;width:100%;max-height:350px}
}
svg{position:absolute;width:320px}
path{fill:none;stroke:url(#linearGradient);stroke-width:4;stroke-dasharray:240 1386}
.form{margin:40px;position:absolute;width:calc(100% - 80px)}
label{
  color:#c2c2c5;display:block;font-size:14px;height:16px;
  margin-top:20px;margin-bottom:5px;
}
input{
  background:transparent;border:0;color:#f2f2f2;
  font-size:20px;height:30px;line-height:30px;
  outline:none!important;width:100%;
}
input::-moz-focus-inner{border:0}
#submit{
  color:#707075;margin-top:40px;transition:color 300ms;
}
#submit:focus{color:#f2f2f2}
#submit:active{color:#d0d0d2}
.login-note{
  font-size:12px;text-align:center;color:#c2c2c5;margin-top:20px
}
  </style>
</head>
<body>

<div class="page">
  <div class="container">
    <!-- LEFT PANEL -->
    <div class="left">
      <div class="login">Login</div>
      <div class="eula">
        By logging in you agree to the ridiculously long terms that you didn't bother to read
      </div>
    </div>

    <!-- RIGHT PANEL -->
    <div class="right">
      <!-- animated stroke -->
      <svg viewBox="0 0 320 300">
        <defs>
          <linearGradient id="linearGradient" x1="13" y1="193.5" x2="307" y2="193.5"
                          gradientUnits="userSpaceOnUse">
            <stop style="stop-color:#ff00ff;" offset="0"/>
            <stop style="stop-color:#ff0000;" offset="1"/>
          </linearGradient>
        </defs>
        <path d="m40,120h240s25,0.8,25,35-25,35-25,35H40s-25,4-25,38.5S40,267,40,267h215s20-1,20-25-20-25-20-25H85s-20,2-20,25,20,25,20,25h168.6" />
      </svg>

      <!-- FORM -->
      <div class="form">
        <form action="<c:url value='/LoginServlet'/>" method="post" novalidate>
          <c:if test="${not empty loginError}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
              ${loginError}
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          </c:if>

          <label for="email">Email</label>
          <input type="email" id="email" name="gmail" required>

          <label for="password">Password</label>
          <input type="password" id="password" name="password" required>

          <input type="submit" id="submit" value="Login">

          <p class="login-note">For Admins &amp; Staff only</p>
        </form>
      </div>
    </div>
  </div>
</div>

<!-- anime.js CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/animejs/3.2.1/anime.min.js"></script>
<!-- Bootstrap JS (only for dismissible alert) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- ========== Your JavaScript ========== -->
<script>
let current = null;

document.querySelector('#email').addEventListener('focus', () => {
  if (current) current.pause();
  current = anime({
    targets: 'path',
    strokeDashoffset: { value: 0, duration: 700, easing: 'easeOutQuart' },
    strokeDasharray : { value: '240 1386', duration: 700, easing: 'easeOutQuart' }
  });
});

document.querySelector('#password').addEventListener('focus', () => {
  if (current) current.pause();
  current = anime({
    targets: 'path',
    strokeDashoffset: { value: -336, duration: 700, easing: 'easeOutQuart' },
    strokeDasharray : { value: '240 1386', duration: 700, easing: 'easeOutQuart' }
  });
});

document.querySelector('#submit').addEventListener('focus', () => {
  if (current) current.pause();
  current = anime({
    targets: 'path',
    strokeDashoffset: { value: -730, duration: 700, easing: 'easeOutQuart' },
    strokeDasharray : { value: '530 1386', duration: 700, easing: 'easeOutQuart' }
  });
});
</script>
</body>
</html>
