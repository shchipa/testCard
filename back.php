<?php

include 'config.php';
include 'classes/Database.php';


class Back {

    public function get_data_contract_db($id_contract){
        $db = new Database(HOST, USER, PASS, DB);
        $result = $db->get_data_contract($id_contract);

        return $result;
    }

//    public function get_view($data){
//    }
}

//if(isset($_POST['id_contract'])) {
    $id_contract = $_POST['id_contract'];


    $back = new Back();
    $data = $back->get_data_contract_db($id_contract);
//}

//$view = $back->get_view($data);

//вернуть $data через json
echo json_encode($data);

?>