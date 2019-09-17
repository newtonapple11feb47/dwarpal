 <?php


require( '/var/www/main/config/config.php') ;

ini_set("allow_url_fopen", 1);
//  if(isset($_SESSION)){session_destroy();}

 require_once 'users/init.php';
 require_once $abs_us_root.$us_url_root.'users/includes/header.php'; 


if(ipCheckBan()){Redirect::to($us_url_root.'usersc/scripts/banned.php');die();}
$settingsQ = $db->query("SELECT * FROM settings");
$settings = $settingsQ->first();
$error_message = '';
if (@$_REQUEST['err']) $error_message = $_REQUEST['err']; // allow redirects to display a message
$reCaptchaValid=FALSE;


if($user->isLoggedIn()) Redirect::to('/apps/dashboard/menu.php');


if (Input::exists()) {
    $token = Input::get('csrf');
    if(!Token::check($token)){
        include('index.php');
    }



    //Check to see if recaptcha is enabled
    if($settings->recaptcha == 1){
        require_once 'includes/recaptcha.config.php';

        //reCAPTCHA 2.0 check
        $response = null;

        // check secret key
        $reCaptcha = new ReCaptcha($settings->recap_private);

        // if submitted check response
        if ($_POST["g-recaptcha-response"]) {
            $response = $reCaptcha->verifyResponse($_SERVER["REMOTE_ADDR"],$_POST["g-recaptcha-response"]);
        }
        if ($response != null && $response->success) {
            $reCaptchaValid=TRUE;

        }else{
            $reCaptchaValid=FALSE;
            $error_message .= 'Please check the reCaptcha.';
        }
    }else{
        $reCaptchaValid=TRUE;
    }

    if($reCaptchaValid || $settings->recaptcha == 0){ //if recaptcha valid or recaptcha disabled

        $validate = new Validate();
        $validation = $validate->check($_POST, array(
            'username' => array('display' => 'Username','required' => true),
            'password' => array('display' => 'Password', 'required' => true)));

        if ($validation->passed()) {
            //Log user in
            $remember = (Input::get('remember') === 'on') ? true : false;
            $user = new User();
            $login = $user->loginEmail(Input::get('username'), trim(Input::get('password')), $remember);
            if ($login) {
              $dest = sanitizedDest('dest');
               logger($user->data()->id,"User","User logged in.");
               $twoQ = $db->query("select twoKey from users where id = ? and twoEnabled = 1",[$user->data()->id]);
               if($twoQ->count()>0) {
                 $_SESSION['twofa']=1;
                 if(!empty($dest)) {
                 $page=encodeURIComponent(Input::get('redirect'));
                 logger($user->data()->id,"Two FA","Two FA being requested.");
                 Redirect::to($us_url_root.'users/twofa.php?dest='.$dest.'&redirect='.$page); }
                 else Redirect::To($us_url_root.'users/twofa.php');
               } else {
                # if user was attempting to get to a page before login, go there
                $db->query("UPDATE users SET last_confirm = NOW() WHERE id = ?",array($user->data()->id));
                if (!empty($dest)) {
                  $redirect=htmlspecialchars_decode(Input::get('redirect'));
                  if(!empty($redirect) || $redirect!=='') Redirect::to($redirect);
                  else Redirect::to($dest);
                } elseif (file_exists($abs_us_root.$us_url_root.'usersc/scripts/custom_login_script.php')) {

                    # if site has custom login script, use it
                    # Note that the custom_login_script.php normally contains a Redirect::to() call
                require_once $abs_us_root.$us_url_root.'usersc/scripts/custom_login_script.php';
                } else {
                    if (($dest = Config::get('homepage')) ||
                            ($dest = '/apps/dashboard/menu.php')) {
                        #echo "DEBUG: dest=$dest<br />\n";
                        #die;
                        Redirect::to($dest);
                    }
            } }  } else {
                $error_message .= 'username / password do not match';
            }
        } else{
            $error_message .= '<ul>';
            foreach ($validation->errors() as $error) {
                $error_message .= '<li>' . $error . '</li>';
            }
            $error_message .= '</ul>';
        }
    }
}
if (empty($dest = sanitizedDest('dest'))) {
  $dest = '';
}

?>
<div class="cont-up"></div>
<div class="container-login">

<div class="cent">

    <form name="login" id="login-form" class="form-signin forum" action="index.php" method="post">
        <div class="text-siup">Sign In </div>

    <input type="hidden" name="dest" value="<?= $dest ?>" />

        <?php if(!$error_message=='') {?><div class="usrtxt"><?=$error_message;?></div><?php } ?>

        <div class="username">
            <div class="login-icon"><div class="material-icons icon-size ">person</div></div>
            <input  class="form-control login-input" type="text" name="username" id="username" placeholder="username" required >
        </div>

      
        <a href="<?php echo $hostname ; ?>/contact"><div for="password" class="pastxt" >Forget Password</div></a>


    <div class="password">
        <div class="login-icon"><div class="material-icons icon-size ">lock</div></div>
        <input type="password" class="form-control login-input"  name="password" id="password"  placeholder="password" required autocomplete="off">
    </div>


        <div class="termtxt"></div>

    <?php
    if($settings->recaptcha == 1){
    ?>
    <div class="g-recaptcha" data-sitekey="<?=$settings->recap_public; ?>" data-bind="next_button" data-callback="submitForm"></div>
    <?php } ?>



    <input type="hidden" name="csrf" value="<?=Token::generate(); ?>">
    <input type="hidden" name="redirect" value="<?=Input::get('redirect')?>" />
    <button class="submit  btn  btn-primary" id="next_button" type="submit"><?=lang("SIGNIN_BUTTONTEXT","");?></button>

          <a href="<?php echo $signup_link_one; ?>">
             <div class="help">  Don't have an Edifyn ID? Create yours now. </div>
          </a>

    </form>
</div>




</div>

    <!-- Place any per-page javascript here -->

<?php   if($settings->recaptcha == 1){ ?>

    
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<script>
    function submitForm() {
        document.getElementById("login-form").submit();
    }
</script>
<?php } ?>

<?php require_once $abs_us_root.$us_url_root.'users/includes/footer.php'; ?>



