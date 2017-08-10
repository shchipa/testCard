<?php

include 'config.php';
include 'classes/Data.php';
include 'classes/Database.php';


//if(isset($_POST['id_contract'])) {
    $id_contract = $_POST['id_contract'];


    $data = new Data();
    $data_contr = $data->get_data_contract_db($id_contract);
//}

//$view = $back->get_view($data);

//вернуть $data_contr через json
echo json_encode($data_contr);

?>
