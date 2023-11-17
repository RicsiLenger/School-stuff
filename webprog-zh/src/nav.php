<?php

echo '<nav><ul>';
$i=1;
$file = fopen("src/menu.txt", "r");
while (!is_resource($file) || !feof($file)) {
    if (is_resource($file)) $line_of_text = fgets($file);
    if ($line_of_text != null) {
        $titles = explode('/n', $line_of_text);
    }
    foreach ($titles as $title)
    {
        echo '<li><a href="?site=',$i,'">',$title,'</a></li>';
        $i++;
    }
}

echo '</ul></nav>';