<?php 

$masternodeprivkey = $_POST["masternodeprivkey"]; 
$file = '/var/www/masternodeprivkey/masternodeprivkey.txt';
file_put_contents($file, $masternodeprivkey);

echo "masternodeprivkey recieved. pepecoinmasternode docker container will be starting shortly. If you entered the wrong key, please rebuild";

chmod ("/var/www/html/index.html", 000);
chmod ("/var/www/html/masternode.php", 000);

?>

