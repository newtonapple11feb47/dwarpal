 
<?php 

      require_once '/var/www/main/apps/dashboard/users/init.php';
      require_once '/var/www/main/apps/dashboard/users/includes/header.php'; 
      require_once '/var/www/main/apps/dashboard/users/includes/navigation.php'; 

?>

<div class="container">
                
  <div class="cent">

	<a href="<?php echo $hostname;?>/apps/dashboard/users/user_settings.php"><div class="app1">
              <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/dash-grey.png)"></div>
              <div class="appin2">Settings</div>
        </div></a>
        <a href="<?php echo $hostname;?>/apps/live/"><div class="app2">
              <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/live-grey.png)"></div>
              <div class="appin2">Live</div>
        </div></a>
        <a href="<?php echo $hostname;?>/apps/video/"><div class="app3">
              <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/video-grey.png)"></div>
              <div class="appin2">Video</div>
        </div></a>
        <a href="<?php echo $hostname;?>/apps/ecommerce/"><div class="app4">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/ecom-grey.png)"></div>
              <div class="appin2"> Ecommerce</div>
        </div></a>

       <a href="<?php echo $hostname;?>/apps/notebook/"><div class="app5">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/notebook-grey.png)"></div>
             <div class="appin2">Notebook</div>
       </div></a>
       <a href="<?php echo $hostname;?>/apps/test/"><div class="app6">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/test-grey.png);"></div>
             <div class="appin2">Test</div>
       </div></a>
       <a href="<?php echo $hostname;?>/apps/question-answers/"><div class="app7">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/qa-grey.png)"></div>
             <div class="appin2">Questions </div>
      </div></a>

       <a href="<?php echo $hostname;?>/apps/books/"><div class="app8">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/ebook-grey.png)"></div>
             <div class="appin2">Books</div>
       </div></a>

       <a href="<?php echo $hostname;?>/apps/blackboard/"><div class="app9">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/board-grey.png)"></div>
             <div class="appin2">Black Board</div>
       </div></a>

        <a href="https://readthedocs.org" target="_blank"><div class="app10">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/certification-grey.png)"></div>
             <div class="appin2">Documentation</div>
        </div></a>

       <a href="<?php echo $hostname;?>/apps/make/"><div class="app11">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/make-grey.png)"></div>
             <div class="appin2">Contact</div>
       </div></a>

       <a href="<?php echo $hostname;?>/apps/certification/"><div class="app12">
             <div class="appin1a" style="background-image:url(<?php echo $hostname;?>/images/icon/help-grey.png)"></div>
             <div class="appin2">Blog</div>
       </div></a>

			</div>
		</div>



<?php

 require_once '/var/www/main/global/app-footer.php';


?>
