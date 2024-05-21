<?php
// Check if filename and word are provided
if ($argc != 3) {
    echo "Usage: php script.php filename word\n";
    exit(1);
}

$filename = $argv[1];
$word = $argv[2];

// Read the file
$content = file_get_contents($filename);

// Convert to lowercase and remove non-alphabetic characters
$content = strtolower($content);
$content = preg_replace("/[^a-z]/", "", $content);

// Count occurrences
$count = substr_count(strrev($content), strrev($word));

// Output as HTML
echo "<html><body>Matches: $count</body></html>\n";
?>