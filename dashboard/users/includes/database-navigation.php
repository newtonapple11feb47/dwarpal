
  <?php
  $settingsQ = $db->query("SELECT * FROM settings");
  $settings = $settingsQ->first();

  // Set up notifications button/modal
  if ($user->isLoggedIn()) {
      if ($dayLimitQ = $db->query('SELECT notif_daylimit FROM settings', array())) $dayLimit = $dayLimitQ->results()[0]->notif_daylimit;
      else $dayLimit = 7;

      // 2nd parameter- true/false for all notifications or only current
  	$notifications = new Notification($user->data()->id, false, $dayLimit);
  }
  /*
  Load main navigation menus
  */
  $main_nav_all = $db->query("SELECT * FROM menus WHERE menu_title='main' ORDER BY display_order");

  /*
  Set "results" to true to return associative array instead of object...part of db class
  */
  $main_nav=$main_nav_all->results(true);

  /*
  Make menu tree
  */
  $prep=prepareMenuTree($main_nav);

  ?>

  <div class="navbar navbar-fixed-top navbar-inverse" role="navigation">
  	<div class="container">

  		<div class="navbar-header ">
 </a>
    </div>
    <div id="navbar_test" class="navbar-collapse collapse">
  	<ul class="nav navbar-nav navbar-right">
  <?php
  foreach ($prep as $key => $value) {
    $authorizedGroups = array();
    foreach (fetchGroupsByMenu($value['id']) as $g) {
    	$authorizedGroups[] = $g->group_id;
    }

  	if (sizeof($value['children'])==0) {
  		if ($user->isLoggedIn()) {
        if((hasPerm($authorizedGroups,$user->data()->id) || in_array(0,$authorizedGroups)) && $value['logged_in']==1) {
  			//if (checkMenu($value['id'],$user->data()->id) && $value['logged_in']==1) {
          if($value['label']=='{{notifications}}') {
              $itemString='';
              if($settings->notifications==1) {
                  $itemString='<li><a href="#" onclick="displayNotifications(';
                  $itemString.="'new')";
                  $itemString.='"';
                  $itemString.='id="notificationsTrigger" data-toggle="modal" data-target="#notificationsModal"  >';
                  $itemString.=(($notifications->getUnreadCount() > 0) ? $notifications->getUnreadCount() : '');
                  $itemString.='</span></a></li>';
              }
           }
          elseif($value['label']=='{{messages}}') {
              $itemString='';
              if($settings->messaging==1) {
                  $itemString='<li><a href="'.$us_url_root.'users/messages.php"><i class="glyphicon glyphicon-envelope"></i> <span id="msgCount" class="badge" style="margin-top: -5px">';
                  if($msgC > 0) $itemString.= $msgC;
                  $itemString.='</span></a></li>'; }
           }
          else {
          $itemString = prepareItemString($value,$user->data()->id);
          $itemString = str_replace('{{username}}',$user->data()->username,$itemString);
          $itemString = str_replace('{{fname}}',$user->data()->fname,$itemString);
          $itemString = str_replace('{{lname}}',$user->data()->lname,$itemString); 
         }
  				echo $itemString;
  			}
  		} else {
  			if ($value['logged_in']==0) {
  				echo prepareItemString($value,0);
  			}
  		}
  	} else {
  		if ($user->isLoggedIn()) {
  			if((hasPerm($authorizedGroups,$user->data()->id) || in_array(0,$authorizedGroups)) && $value['logged_in']==1) {
  				$dropdownString=prepareDropdownString($value,$user->data()->id);
  				$dropdownString=str_replace('{{username}}',$user->data()->username,$dropdownString);
  				echo $dropdownString;
  			}
  		} else {
  			if ($value['logged_in']==0) {
  				$dropdownString=prepareDropdownString($value,0);

  				echo $dropdownString;
  			}
  		}
  	}
  }
  ?>
  	</ul>
    </div>
  </div>
</div>
