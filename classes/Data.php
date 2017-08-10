<?php
class Data {

    public function get_data_contract_db($id_contract){
        $db = new Database(HOST, USER, PASS, DB);
        $result = $db->get_data_contract($id_contract);

        return $result;
    }

//    public function get_view($data){
//    }
}

?>