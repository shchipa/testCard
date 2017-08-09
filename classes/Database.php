<?php

class Database {
    public $db;
    public $data_contract = ["contract" => "",
                             "customer" => "",
                             "service" => ""];

    public function __construct($host, $user, $pass, $db) {
        $this->db = mysqli_connect($host, $user, $pass, $db);

        if (mysqli_connect_errno()) {
            echo "Failed to connect to database: ".mysqli_connect_error();
        }

        return $this->db;
    }

    public function get_data_contract($id_contract){
        $sql = "SELECT * FROM obj_contracts WHERE id_contract = $id_contract";
        $result = mysqli_query($this->db, $sql);
        if ($result->num_rows === 0){
//            $this->data_contract = "Такого договора нет!";
            return false;
        }
        else{
            $row = mysqli_fetch_assoc($result);
            $this->data_contract["contract"] = $row;

            $sql_customer = "SELECT * FROM obj_customers WHERE id_customer = $row[id_customer]";
            $result_customer = mysqli_query($this->db, $sql_customer);
            $row_customer = mysqli_fetch_assoc($result_customer);
            $this->data_contract["customer"] = $row_customer;

            $sql_services = "SELECT title_service FROM obj_services WHERE id_contract = $id_contract";
            $result_services = mysqli_query($this->db, $sql_services);
            for ($i = 0; $i < mysqli_num_rows($result_services); $i++){
                $row_services[$i] = mysqli_fetch_assoc($result_services);
                $row_s["a".$i] = $row_services[$i]["title_service"];    //создаём одномерный массив из многомерного
            }

            $this->data_contract["service"] = $row_s;

            return $this->data_contract;
        }
    }
}
?>
