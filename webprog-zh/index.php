<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Document</title>
	<link rel="stylesheet" href="res/style.css">
</head>
<body>
	
	<nav>
		<ul>
            <li><a href="?site=1">Bemutató</a></li>
            <li><a href="?site=2">Portfólió</a></li>
            <li><a href="?site=3">Trend</a></li>
            <li><a href="?site=4">Közösség</a></li>
		</ul>
	</nav>
	
	<header>
		<a href="" class="title">fashion</a>
	</header>
	
	<main>
		
	<?php
        if(!isset($_GET["site"])){
            echo'<h1>Fashion content</h1>
		           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse consectetur sint molestiae similique nihil, corporis eaque iure harum, eum, quos debitis pariatur quod dignissimos tempore!</p>';
        }
        else
        {
            $page = $_GET["site"];
            switch ($page)
            {
                case 1:include 'src/site1.php'; break;
                case 2:include 'src/site2.php'; break;
                case 3:include 'src/site3.php'; break;
                case 4:include 'src/site4.php'; break;
                default: echo'<h1>Fashion content</h1>
		           <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Esse consectetur sint molestiae similique nihil, corporis eaque iure harum, eum, quos debitis pariatur quod dignissimos tempore!</p>'; break;
            }
        }
        ?>
		<ul class="gallery">
			<li>
				<a href="res/content.jpg" target="_blank" title="Megtekintés">
					<img src="res/content.jpg">
				</a>
			</li>
			<li>
				<a href="res/header.jpg" target="_blank" title="Megtekintés">
					<img src="res/header.jpg">
				</a>
			</li>
			<li>
				<a href="res/content.jpg" target="_blank" title="Megtekintés">
					<img src="res/content.jpg">
				</a>
			</li>
			<li>
				<a href="res/header.jpg" target="_blank" title="Megtekintés">
					<img src="res/header.jpg">
				</a>
			</li>
			<li>
				<a href="res/content.jpg" target="_blank" title="Megtekintés">
					<img src="res/content.jpg">
				</a>
			</li>
		</ul>	
		

		<section>
			
			<h2>Additional content</h2>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rerum aperiam debitis ratione nostrum quis commodi aliquam, earum officia nisi quae fugit, odit quod harum distinctio in. Nisi, optio inventore enim cum ipsa non omnis doloribus.</p>
			
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Temporibus placeat, iste recusandae aliquid accusamus voluptatem vel iusto dolorum doloremque adipisci ducimus, rem, laborum eius non.</p>
			
		</section>
		
	</main>
	
	<aside>
	
		<section>
			<h3>Box in aside</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla ea quibusdam, illum, nam ratione facere! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolores ut suscipit, laborum, adipisci ex reprehenderit.</p>
		</section>
	
		<section>
			<h3>Box in aside</h3>
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nulla ea quibusdam, illum, nam ratione facere!</p>
		</section>
	
	</aside>
	
	<footer></footer>
	
</body>
</html>