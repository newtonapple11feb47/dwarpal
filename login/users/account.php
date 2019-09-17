

<?php

    require_once 'init.php';

    if (!securePage($_SERVER['PHP_SELF'])){

      Redirect::to('/apps/login/');

    }


     Redirect::to('/apps/dashboard');


echo "you are logged in from account.php";