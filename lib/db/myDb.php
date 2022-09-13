<?php

try{
    $conn = new PDO('mysql:host=localhost','dbname=id19526796_hifadhi','id19526796_slmns','*DsC5XpM_~SRDf5T');
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    echo "success";
}catch(PDOException $e){
    echo $e -> getMessage();
    die('OOPS');
}

?>