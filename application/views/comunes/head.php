<?= doctype('html5') ?>
<head>
  <meta charset="UTF-8">
  <title><?=$titulo?></title>
  <style type="text/css">
    #cat-menu li ul {
    display: none;
    background: #4a5b78;
    }
    #cat-menu li ul li div {
        display: block;
        background: none;
        padding: 10px 0px;
        padding-left: 30px;
        font-size: 1.1em;
        text-decoration: none;
        font-weight: bold;
        color: #e3e7f1;
        text-shadow: 1px 1px 0px #000;
    }
    #cat-menu li ul li div:hover {
        background: #394963;
    }
  </style>
</head>