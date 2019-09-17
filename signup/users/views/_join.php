
<?php

require( dirname( __DIR__ ) . '/../config.php') ;

?>


<div class=" container-signup">
<div class=" cent-signup">

<form id="form payment-form" class="form-signup forum" action="<?=$form_action;?>" method="<?=$form_method;?>" >

        <div class="form-group">

                <div class="usrtxt">Username</div>
                <div class="form-group">
                <input type="text" class="form-control username" id="username" name="username" placeholder="Pick a Username" value="<?php if (!$form_valid && !empty($_POST)){ echo $username;} ?>" required  maxlength="255" >
            </div>
                <?php if($settings->auto_assign_un==0) {?><div id="usernameCheck" class="left-d2c"></div><?php } ?>


                <div class="firstntxt" for="fname">First Name </div>
                <div class="form-group">
                <input type="text" class="form-control firstn" id="fname" name="fname" placeholder="First Name" value="<?php if (!$form_valid && !empty($_POST)){ echo $fname;} ?>" required  maxlength="255">
            </div>

                <div class="lastntxt" for="lname">Last Name </div>
                <div class="form-group">
                <input type="text" class="form-control lastn" id="lname" name="lname" placeholder="Last Name" value="<?php if (!$form_valid && !empty($_POST)){ echo $lname;} ?>" required maxlength="255" >
            </div>

                <div class="mntxt" for="email">Email Address </div>
                <div class="form-group">
                <input  class="form-control mn" type="text" name="email" id="email" placeholder="you@example.com" value="<?php if (!$form_valid && !empty($_POST)){ echo $email;} ?>" required maxlength="255" >
            </div>

<?php

                $character_range = ' &#8226; Password must be between '.$settings->min_pw . ' and ' . $settings->max_pw;
                $character_statement = '<span id="character_range" class="gray_out_text">' . $character_range . ' characters</span>';

if ($settings->req_cap == 1){
                $num_caps = '1'; //Password must have at least 1 capital
                if($num_caps != 1){
                        $num_caps_s = 's';
                }
                $num_caps_statement = '<span id="caps" class="gray_out_text">Have at least ' . $num_caps . ' capital letter </span>';
}

if ($settings->req_num == 1){
                $num_numbers = '1'; //Password must have at least 1 number
                if($num_numbers != 1){
                        $num_numbers_s = 's';
                }

                $num_numbers_statement = '<div id="number" class="gray_out_text left-d2c"> &#8226; Have at least ' . $num_numbers . ' number</div>';
}
                $password_match_statement = '<span id="password_match" class="gray_out_text">&#8226; Password must be typed correctly twice</span>';


                //2.) Apply default class to gray out green check icon
                echo '
                        <style>
                                .gray_out_icon{
                                        -webkit-filter: grayscale(100%); /* Safari 6.0 - 9.0 */
                                        filter: grayscale(100%);
                                }
                                .gray_out_text{
                                      color:#234;                                }
                        </style>
                ';

                //3.) Javascript to check to see if user has met conditions on keyup (NOTE: It seems like we shouldn't have to include jquery here because it's already included by UserSpice, but the code doesn't work without it.)
                echo '
                        <script type="text/javascript">
                        $(document).ready(function(){

                                $( "#password" ).keyup(function() {
                                        var pswd = $("#password").val();

                                        //validate the length
                                        if ( pswd.length >= ' . $settings->min_pw . ' && pswd.length <= ' . $settings->max_pw . ' ) {
                                                $("#character_range_icon").removeClass("gray_out_icon");
                                                $("#character_range").removeClass("gray_out_text");
                                        } else {
                                                $("#character_range_icon").addClass("gray_out_icon");
                                                $("#character_range").addClass("gray_out_text");
                                        }

                                        //validate capital letter
                                        if ( pswd.match(/[A-Z]/) ) {
                                                $("#num_caps_icon").removeClass("gray_out_icon");
                                                $("#caps").removeClass("gray_out_text");
                                        } else {
                                                $("#num_caps_icon").addClass("gray_out_icon");
                                                $("#caps").addClass("gray_out_text");
                                        }

                                        //validate number
                                        if ( pswd.match(/\d/) ) {
                                                $("#num_numbers_icon").removeClass("gray_out_icon");
                                                $("#number").removeClass("gray_out_text");
                                        } else {
                                                $("#num_numbers_icon").addClass("gray_out_icon");
                                                $("#number").addClass("gray_out_text");
                                        }
                                });

                                $( "#confirm" ).keyup(function() {
                                        var pswd = $("#password").val();
                                        var confirm_pswd = $("#confirm").val();

                                        //validate password_match
                                        if (pswd == confirm_pswd) {
                                                $("#password_match_icon").removeClass("gray_out_icon");
                                                $("#password_match").removeClass("gray_out_text");
                                        } else {
                                                $("#password_match_icon").addClass("gray_out_icon");
                                                $("#password_match").addClass("gray_out_text");
                                        }

                                });
                        });
                        </script>
                ';

?>

                <div style="display: inline-block">
                        <div class="pastxt" for="password">Password</div>
                        <div class="form-group">
                        <input  class="form-control password" type="password" maxlength="255"  name="password" id="password" placeholder="Password" required autocomplete="off"  aria-describedby="passwordhelp">
                    </div>

                        <div class="confpastxt" for="confirm">Confirm Password</div>
                        <div class="form-group">
                        <input  type="password" id="confirm" required maxlength="255"  name="confirm" class="form-control confpas" placeholder="Confirm Password"  autocomplete="off" >
                    </div>
                </div>

                <br><br>

                <?php include('/var/www/main/apps/signup/usersc/scripts/additional_join_form_fields.php'); ?>

              <!--  <div for="confirm">Registration User Terms and Conditions</div>
                <textarea id="agreement" name="agreement" rows="5" class="form-control" disabled ><?php // require $abs_us_root.$us_url_root.'usersc/includes/user_agreement.php'; ?></textarea>

                <label><input type="checkbox" id="agreement_checkbox" name="agreement_checkbox"> Check box to agree to terms</label>
        </div>-->

        <?php if($settings->recaptcha == 1|| $settings->recaptcha == 2){ ?>
        <div class="g-recaptcha" data-sitekey="<?=$settings->recap_public; ?>" data-bind="next_button" data-callback="submitForm"></div>
        <?php } ?>


        <input type="hidden" value="<?=Token::generate();?>" name="csrf">
       
        <div class="termtxt">By continuing with any of the options, you agree to our <a href="<?php echo $hostname; ?>">Terms of Service</a></div>

        <button class=" btn btn-primary submit " type="submit" id="next_button"><i class="fa fa-plus-square"></i> Create Account</button>
         <a href="<?php echo $login_link_one; ?>"><div class="help">Have Account | Login</div></a>
         
         </form>

</div>
</div>


<div class="left-pane">

<div class="left-d1">
    <div class="left-d1a">Create Edifyn Account. Its Free</div>
    <div class="left-d1b">At Edifyn we welcome our users with free learning materials and help them to learn and explore the edifyn infastructure. Just create accouunt and you are ready to go. </div>
</div>


</div>


<div class="left-pane">

    <div class="left-d2">

      <div style="display: inline-block;" class="left-d2c">

        <div class="left-d2b">please enter values acocording to the folowing rule set !</div>

          <?php
    if (!$form_valid && Input::exists()){?>
          <?php if(!$validation->errors()=='') {?><div class="dot"></div><div class="alert alert-danger left-d2c-red"><?=display_errors($validation->errors());?></div><?php } ?>
    <?php }
    $settingsQ = $db->query("SELECT * FROM settings");
    $settings = $settingsQ->first();
    ?>
              <div id="character_range_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c" style="color: green"><?php echo $character_statement;?></div>
    <?php
    if ($settings->req_cap == 1){ ?>
              <div id="num_caps_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c" style="color: green"><?php echo $num_caps_statement;?></div>
    <?php }

    if ($settings->req_num == 1){ ?>
              <div id="num_numbers_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c" style="color: green"><?php echo $num_numbers_statement;?></div>
    <?php } ?>
              <div id="password_match_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c" style="color: green"><?php echo $password_match_statement;?></div>

              <div id="password_match_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c"> &#8226; Email Should be genuine as it is later used for verification</div>

              <div id="password_match_icon" class="glyphicon glyphicon-ok gray_out_icon left-d2c">&#8226; Username must be between 4-30 characters long</div>



      </div>

</div>

</div>
<style>
.form-group input.error {
    border: 2px solid rgb(0,121,204);
    transition:all ease 0.9s;
}
.form-group textarea.error {
    border: 2px solid rgb(0,121,204);
}
</style>




<div class="left-pane">

  <div class="left-d3">
      <div class="left-d3a"><i class="material-icons">live_tv</i></div>
      <div class="left-d3b"><i class="material-icons">video_library</i></div>
      <div class="left-d3c"><i class="material-icons">shopping_cart</i></div>
      <div class="left-d3d"><i class="material-icons">note</i></div>
      <div class="left-d3e"><i class="material-icons">library_books</i></div>
      <div class="left-d3f"><i class="material-icons">assessment</i></div>
      <div class="left-d3g"><i class="material-icons">forum</i></div>
      <div class="left-d3h"><i class="material-icons">developer_board</i></div>

  </div>


<div class="left-d1-two">
    <div class="left-d1a" style="text-align: center;">One Account its all you need</div>
    <div class="left-d1b" style="text-align: center;">One free account gets you into all the applications edifyn provide. </div>
     <a href="<?php echo $hostname; ?>/contact"><div class="help-signup">Want Help let us know. Contact Edifyn</div></a>
</div>

</div>




