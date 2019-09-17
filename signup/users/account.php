<?php

?>
<?php require_once 'init.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/header.php'; ?>
<?php require_once $abs_us_root.$us_url_root.'users/includes/navigation.php'; ?>
<?php

require( dirname( __DIR__ ) . '/config.php') ;

?>


<?php  if (!securePage($_SERVER['PHP_SELF'])){die();}?>



<?php



if(!empty($_POST['uncloak'])){
	if(isset($_SESSION['cloak_to'])){
		$to = $_SESSION['cloak_to'];
		$from = $_SESSION['cloak_from'];
		unset($_SESSION['cloak_to']);
		$_SESSION['user'] = $_SESSION['cloak_from'];
		unset($_SESSION['cloak_from']);
		logger($from,"Cloaking","uncloaked from ".$to);
		Redirect::to('admin_users.php?err=You+are+now+you!');
		}else{
			Redirect::to('logout.php?err=Something+went+wrong.+Please+login+again');
		}
}



//dealing with if the user is logged in
if($user->isLoggedIn() || !$user->isLoggedIn() && !checkMenu(2,$user->data()->id)){
	if (($settings->site_offline==1) && (!in_array($user->data()->id, $master_account)) && ($currentPage != 'login.php') && ($currentPage != 'maintenance.php')){
		$user->logout();
		Redirect::to($us_url_root.'users/maintenance.php');
	}
}
$grav = get_gravatar(strtolower(trim($user->data()->email)));
$get_info_id = $user->data()->id;
// $groupname = ucfirst($loggedInUser->title);
$raw = date_parse($user->data()->join_date);
$signupdate = $raw['month']."/".$raw['day']."/".$raw['year'];
$userdetails = fetchUserDetails(NULL, NULL, $get_info_id); //Fetch user details


 ?>


<?php $user->logout(); ?>

 
<div class="container-signup-thankyou" style="background:url(<?php echo $imgcdn; ?>/signup-thankyou.jpg);background-size: cover;background-repeat: no-repeat;">

<div class="sthank">Thank You</div>
<div class="sthank-2">For Creating Account with Edifyn. We hope you will enjoy the journey of learning and exploring with us. <br><br> You can login in account </div>
<a href="<?php echo $login_link_one; ?>"><div class="sthank-3">Here</div></a>


  <div class="left-sthank">
      <div class="left-sthank-a" style="background: url(<?php echo $imgcdn ?>/icon/video-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-b" style="background: url(<?php echo $imgcdn ?>/icon/live-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-c" style="background: url(<?php echo $imgcdn ?>/icon/ecom-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-d" style="background: url(<?php echo $imgcdn ?>/icon/notebook-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-e" style="background: url(<?php echo $imgcdn ?>/icon/ebook-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-f" style="background: url(<?php echo $imgcdn ?>/icon/test-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-g" style="background: url(<?php echo $imgcdn ?>/icon/qa-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
      <div class="left-sthank-h" style="background: url(<?php echo $imgcdn ?>/icon/certification-white.png); background-size: 50% 50%; background-repeat:no-repeat; background-position: center;"></div>
  </div>
       <a href="<?php echo $hostname; ?>/contact"><div class="help-signup-tk">Want Help let us know. Contact Edifyn</div></a>
</div> <!-- /container -->


<?php require_once $abs_us_root.$us_url_root.'users/includes/footer.php'; ?>