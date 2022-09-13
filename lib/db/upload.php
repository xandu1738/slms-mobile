<?php
require_once('./myDb.php');
$keys=array('amount','source','time_at');
//$keys=array('name','mobile','password','type');
for ($i = 0; $i < count($keys); $i++){
	if(!isset($_POST[$keys[$i]]))

	 {
		$response['error'] = true;
		$response['message'] = 'Required File Missed';
		echo json_encode($response);
	
        return;
	 }

}

$amount=$_POST['amount'];

$source=$_POST['source'];

$time_at=$_POST['created_at'];

//if user is new creating an insert query
$stmt = $con->prepare("INSERT INTO deposits ( source, amount, created_at) VALUES (?,?,?)");
$stmt->bind_param("sss",  $source, $amount, $created_at);

//if the user is successfully added to the database
if($stmt->execute()){
//fetching the user back
	$stmt = $con->prepare("SELECT * FROM deposits WHERE source = ?");
	$stmt->bind_param("s",$amount);
	$stmt->execute();
	$stmt->bind_result( $id, $source, $amount,$created_at);
	$stmt->fetch();

	$transaction = array(
		'id'=>$id,
		'source'=>$source,
		'amount'=>$amount,
		'created_at'=>$created_at

    );

    $stmt->close();

//adding the transaction data in response
	$response['error'] = false;
	$response['message'] = 'Success';
	$response['data'] = $transaction;

}
	echo json_encode($response);

?>