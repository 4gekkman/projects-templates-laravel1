<!DOCTYPE html>
<html>
    <head>
        <title>Laravel</title>

        <link href="https://fonts.googleapis.com/css?family=Lato:100" rel="stylesheet" type="text/css">

    <style>
      .text {
        font-size: 300px;
        margin-left: 300px;
        margin-top: 100px;
      }
    </style>
    </head>
    <body>

      <div class="text">
        <span>{!! $test !!}</span>   
        <span>{!! $cache !!}</span>
      </div>

      <div>
        {!! phpinfo(); !!} 
      </div>
      

    </body>
</html>
