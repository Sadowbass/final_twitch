<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>트게더 - 로그인</title>
<script async src="https://www.google-analytics.com/analytics.js"></script>
<script>
      (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
      (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
      m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
      })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

      ga('create', 'UA-71349615-1', 'auto');
      ga('send', 'pageview');
    </script>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <link rel="shortcut icon" href="https://d4fodtu7cqfym.cloudfront.net/favicon/favicon.ico">
    <link rel="apple-touch-icon" sizes="57x57" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="https://d4fodtu7cqfym.cloudfront.net/favicon/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="https://d4fodtu7cqfym.cloudfront.net/favicon/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="https://d4fodtu7cqfym.cloudfront.net/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="https://d4fodtu7cqfym.cloudfront.net/favicon/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="https://d4fodtu7cqfym.cloudfront.net/favicon/favicon-16x16.png">
    <link rel="manifest" href="https://d4fodtu7cqfym.cloudfront.net/favicon/manifest.json">
    <meta name="msapplication-TileColor" content="#6441a5">
    <meta name="msapplication-TileImage" content="https://d4fodtu7cqfym.cloudfront.net/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#6441a5">
    <style type="text/css">
      html {
        background-color: #f3f2f0;
      }
      body {
        font-family: system-ui, -apple-system, "Apple SD Gothic Neo", "Noto Sans", "Malgun Gothic", sans-serif;
        margin: 0;
      }

      a {
        text-decoration: none;
        color: currentColor;
      }

      @media (max-width: 767px) {
        .hidden-xs {
          display: none !important;
        }
      }

      @media (min-width: 768px) and (max-width: 991px) {
        .hidden-sm {
          display: none !important;
        }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
        .hidden-md {
          display: none !important;
        }
      }
      @media (min-width: 1200px) {
        .hidden-lg {
          display: none !important;
        }
      }

      .tgd-login {
        background-color: #ffffff;
        margin-top: 75px;
        display: flex;
        align-items: center;
        justify-content: center;
        min-height: 712px;
        flex-direction: column;
        position: relative;
      }

      .tgd-login > .back-btn {
        display: none;
      }

      .tgd-login > img:first-of-type {
        width: 230px;
        height: 73px;
        margin-bottom: 21px;
      }

      .tgd-login > img:nth-of-type(2) {
        width: 243px;
        font-weight: 900;
        margin-bottom: 92px;
      }

      .tgd-login .link-twitch {
        margin-top: 15px;
        opacity: 0.7;
        font-size: 16px;
        font-weight: 500;
        line-height: 1.5;
        color: #6f4aaf;
        display: flex;
        align-items: center;
      }

      .tgd-login .link-twitch > svg {
        margin-left: 10px;
        padding-bottom: 3px;
      }

      #login-btn-container {
        cursor: pointer;
      }

      .tgd-login .login-btn {
        cursor: pointer;
        width: 328px;
        height: 64px;
        border-radius: 2px;
        border: none;
        box-shadow: 0 2px 6px 0 rgba(42, 0, 122, 0.4);
        background-color: #6441a6;
        color: #ffffff;
        line-height: 1.5;
        font-weight: 500;
        font-size: 16px;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .tgd-login .login-btn > img {
        width: 19px;
        height: 22px;
        margin-right: 12px;
      }

      footer.tgd-login-footer {
        position: relative;
        margin-top: auto;
        padding: 32px 0 36px 0 !important;
        justify-content: center;
        display: flex;
        text-align: center;
      }

      footer.tgd-login-footer > .footer-menu {
        font-size: 10px;
      }

      footer.tgd-login-footer > .footer-menu > .copyright {
        opacity: 0.6;
        line-height: 2.4;
        display: flex;
        flex-direction: row;
        justify-content: center;
      }
      footer.tgd-login-footer > .footer-menu > .copyright > b {
        margin-right: 8px;
      }

      footer.tgd-login-footer > .footer-menu > .footer-menu--links {
        font-size: 12px;
        font-weight: 500;
        color: #000000;
        line-height: 2;
      }

      footer.tgd-login-footer > .footer-menu > .footer-menu--links > :not(a) {
        color: #c7c7c7;
        margin: 0 8px;
      }

      #recruit {
        color: #00a2ff;
      }

      @media screen and (max-width: 767px) {
        .tgd-login {
          margin-top: 0;
          min-height: 496px;
          justify-content: flex-start;
        }
        .tgd-login > .back-btn {
          position: absolute;
          display: block;
          right: 32px;
          top: 32px;
        }
        .tgd-login > img:first-of-type {
          padding-top: 159px;
          width: 176px;
          height: 56px;
          margin-bottom: 11px;
        }
        .tgd-login > img:nth-of-type(2) {
          width: 198px;
          margin-top: 12px;
          margin-bottom: 69px;
        }
        .tgd-login .login-btn {
          width: 260px;
          height: 64px;
        }
        footer.tgd-login-footer > .footer-menu > .copyright {
          margin-top: 7px;
          flex-direction: column-reverse;
          line-height: 1.9;
        }
      }

    </style>
</head>
<body>
    <div class="tgd-login">
      <div class="back-btn">
        <a href="javascript:history.back()">
          <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 18 18">
            <g fill="none" fill-rule="evenodd" stroke="#000" stroke-linecap="round" stroke-linejoin="round" stroke-width="2">
              <path d="M17 1L1 17M1 1l16 16"></path>
            </g>
          </svg>
        </a>
      </div>
      <img src="https://d4fodtu7cqfym.cloudfront.net/images/logo@3x.png" alt="">
      <img src="https://d4fodtu7cqfym.cloudfront.net/images/login-text.png" alt="">
      <a href="/member/login?next=%2F" id="login-btn-container">
        <button class="login-btn">
          <img src="https://d4fodtu7cqfym.cloudfront.net/images/twitch@3x.png" alt="">
          트위치 아이디로 로그인
        </button>
      </a>
      <a href="https://twitch.tv/" target="_blank" class="link-twitch">
        <span>트위치 아이디가 없나요?</span>
        <svg xmlns="http://www.w3.org/2000/svg" width="8" height="14" viewBox="0 0 8 14">
          <path fill="none" fill-rule="evenodd" stroke="#6441A6" stroke-width="1.5" d="M1 13l6-6-6-6" opacity=".7"></path>
        </svg>
      </a>
    </div>
    <footer class="tgd-login-footer">
      <div class="footer-menu">
        <div class="footer-menu--links">
          <a href="/docs/policy.html" target="_blank">
            이용약관
          </a>
          <span>|</span>
          <a href="/docs/privacy.html" target="_blank">
            개인정보보호방침
          </a>
          <span>|</span>
          <a href="/pages/adcontact">
            광고문의
          </a>
          <br class="hidden-sm hidden-md hidden-lg">
          <span class="hidden-xs">|</span>
          <a href="/support">
            고객지원
          </a>
          <span>|</span>
          <a href="https://ejn.kr/team/" target="_blank" id="recruit">
            인재 채용
          </a>
        </div>
        <div class="copyright">
          <b>© 2017-2020 트게더</b>
          <span>트게더는 Twitch에서 운영하는 사이트가 아닙니다.</span>
        </div>
      </div>
    </footer>
  

</body>
</html>