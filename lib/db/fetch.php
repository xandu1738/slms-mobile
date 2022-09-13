<?php

require('myDb.php');

$query = "SELECT * FROM deposits";

$stmt = $connection->prepeare($query);

$stmt->execute();

$myarray = array();

while($resultsFrom = $stmt->fetch()){
    array_push(
        $myarray,array(
            "amount"=>$resultsFrom['amount'],
            "source"=>$resultsFrom['source'],
            "time"=>$resultsFrom['created_at'],
        )
        );
}
 echo json_encode($myArray);
?>