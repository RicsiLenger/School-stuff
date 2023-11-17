<?php
$kepek_szama = 3;
echo '<ul class="gallery">';
for ($i = 1; $i <= $kepek_szama; $i++)
{

    echo '<li>';
    echo '<div>';
    if(rand(0,1)==0)
    {
        echo '<img src="res/content.jpg">';
    }
    else{
        echo '<img src="res/header.jpg">';
    }
    echo '</div>';
    echo '</li>';

}
echo '</ul>';
echo '<ul class="gallery">';
$kepek_szama = 2;
for ($i = 1; $i <= $kepek_szama; $i++)
{
    echo '<li>';
    echo '<div>';
    if(rand(0,1)==0)
    {
        echo '<img src="res/content.jpg">';
    }
    else{
        echo '<img src="res/header.jpg">';
    }
    echo '</div>';
    echo '</li>';
}
echo '</ul>';