
 <?php if($user->isLoggedIn()){ 

echo ' 
      <link rel="stylesheet" href=" '. $hostname  . '/css/apps/app-nav.css"
';

 if (checkMenu(2,$user->data()->id)){  
          // Links for permission level 2 (default admin) 
echo ' 
<!-- Head Nav -->
<div class="onebar">
  <a href="<?php echo $hostname; ?>/in/menu"><div class="ob2"></div></a>
        <div class="ob3">
            <form action="browser.php" class="ob3c" method="get">
    <input type="text" placeholder=" search... admin-nav " class="ob3a" name="q" maxlength="1024" autocomplete="off" spellcheck="false">
    <input type="submit" value="" class="ob3b">
      </form> 
        </div>   
  <div class="ob4">
      <div class="ob5-menu-two">
      <div class="ob5-menu">
          <a href="<?=$us_url_root?>users/user_settings.php">
               <div class="ob5-menu-link">Settings</div>
          </a>
          <a href="<?=$us_url_root?>users/student_courses.php">
              <div class="ob5-menu-link">Your Courses</div>
          </a>
          <a href="/apps/login/users/logout">
                <div class="ob5-menu-link">Logout</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Report Bugs</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Contact</div>
          </a> 
      </div>
     </div>
  </div>  
  <div class="ob5">
    <div class="ob5-menu-one">
      <div class="ob5-menu">
        <a href="<?=$us_url_root?>users/payements.php">
          <div class="ob5-menu-link">Payements</div>
        </a>
        <a href="<?=$us_url_root?>users/admin_users.php">
              <div class="ob5-menu-link">Create Account</div>
        </a>
        <a href="<?=$us_url_root?>users/profile.php">
          <div class="ob5-menu-link">Public Profile</div>
        </a>
        <a href="<?=$us_url_root?>users/analytics.php">
          <div class="ob5-menu-link">Analytics</div>
        </a>
      </div>
     </div>
  </div>
</div>';
 } // is user an admin

elseif (checkMenu(5,$user->data()->id)){  
          // Links for permission level 2 (default admin) 
echo ' 
<!-- Teacher Nav -->
<div class="onebar">
  <a href="<?php echo $hostname; ?>/in/menu"><div class="ob2"></div></a>
        <div class="ob3">
            <form action="browser.php" class="ob3c" method="get">
    <input type="text" placeholder=" search.. teacher-nav" class="ob3a" name="q" maxlength="1024" autocomplete="off" spellcheck="false">
    <input type="submit" value="" class="ob3b">
      </form> 
        </div>   
  <div class="ob4">
      <div class="ob5-menu-two">
      <div class="ob5-menu">
          <a href="<?=$us_url_root?>users/user_settings.php">
               <div class="ob5-menu-link">Settings</div>
          </a>
          <a href="<?=$us_url_root?>users/student_courses.php">
              <div class="ob5-menu-link">Your Courses</div>
          </a>
          <a href="/apps/login/users/logout">
                <div class="ob5-menu-link">Logout</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Report Bugs</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Contact</div>
          </a> 
      </div>
     </div>
  </div>  
  <div class="ob5">
    <div class="ob5-menu-one">
      <div class="ob5-menu">
          <div class="ob5-menu-link">Created Courses </div>
          <div class="ob5-menu-link">Institution </div>
          <div class="ob5-menu-link">Create Account</div>
          <div class="ob5-menu-link">Analytics</div>
      </div>
     </div>
  </div>
</div> ';
 } 

 else{  
          // Links for permission level 2 (default admin) 
echo ' 
<!-- Student Nav -->
<div class="onebar">
  <a href="<?php echo $hostname; ?>/in/menu"><div class="ob2"></div></a>
        <div class="ob3">
            <form action="browser.php" class="ob3c" method="get">
    <input type="text" placeholder=" search... student-null-nav " class="ob3a" name="q" maxlength="1024" autocomplete="off" spellcheck="false">
    <input type="submit" value="" class="ob3b">
      </form> 
        </div>   
  <div class="ob4">
    <div class="ob5-menu-two">
      <div class="ob5-menu">
          <a href="<?=$us_url_root?>users/user_settings.php">
               <div class="ob5-menu-link">Settings</div>
          </a>
          <a href="<?=$us_url_root?>users/student_courses.php">
              <div class="ob5-menu-link">Your Courses</div>
          </a>
          <a href="/apps/login/users/logout">
                <div class="ob5-menu-link">Logout</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Report Bugs</div>
          </a>
          <a href="/contact">
                <div class="ob5-menu-link">Contact</div>
          </a> 
      </div>
    </div>
  </div>  
</div> ';
 }  




 } 





