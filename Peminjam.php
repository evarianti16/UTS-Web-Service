<?php
defined('BASEPATH') OR exit ('No direct script access allowed');

require APPPATH . '/libraries/REST_Controller.php';
use Restserver\Libraries\REST_Controller;

class Peminjam extends REST_Controller {

    function __construct($config = 'rest') {
        parent::__construct($config);
		$this->load->database();
    }
    
    public function index_get() {
        $id = $this->get('id');
		$peminjam=[];
        if ($id == '') {
            $data = $this->db->get('peminjam')->result();
			foreach($data as $row=>$key):
				$peminjam[]=["id_peminjam"=>$key->id_peminjam,
						     "nama"=>$key->nama,
							 "Alamat"=>$key->Alamat,
							 "No_HP"=>$key->No_HP,
							 "_links"=>[(object)["href"=>"petugas/{$key->Id_petugas}",
											"rel"=>"petugas",
											"type"=>"GET"]]
							];
			endforeach;				
        } else {
            $this->db->where('id_peminjam', $id);
            $data = $this->db->get('peminjam')->result();
        }
		$result = ["took"=>$_SERVER["REQUEST_TIME_FLOAT"],
				  "code"=>200,
				  "message"=>"Response successfully",
				  "data"=>$data];
        $this->response($result, 200);
    }

   public function index_post(){
       $data = array(
                    'id_peminjam'=> $this->post('id_peminjam'),
                    'nama' => $this->post('nama'),
                    'Alamat' => $this->post('Alamat'),
					'No_HP' => $this->post('No_HP'),
					'Id_petugas' => $this->post('Id_petugas'));
        $insert = $this->db->insert('peminjam', $data);
        if ($insert) {
			$result = ["took"=>$_SERVER["REQUEST_TIME_FLOAT"],
				  "code"=>201,
				  "message"=>"Data has successfuly added",
				  "data"=>$data];
			$this->response($result, 201);	  
        } else {
			$result=["took"=>$_SERVER["REQUEST_TIME_FLOAT"],
				"code"=>502,
				"message"=>"Failed adding data",
				"data"=>null];
            $this->response($result, 502);
        }
    }
	function index_put() {
        $id = $this->get('id');
        $data = array(
                    'id_peminjam' => $this->put('id_peminjam'),
                    'nama' => $this->put('nama'),
                    'Alamat' => $this->put('Alamat'),
					'No_HP' => $this->put('No_HP'),
					'Id_petugas' => $this->put ('Id_petugas'));
        $this->db->where('id_peminjam', $id);
        $update = $this->db->update('peminjam', $data);
        if ($update) {
            $this->response($data, 200);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }
	
	function index_delete() {
        $id = $this->delete('id');
        $this->db->where('id_peminjam', $id);
        $delete = $this->db->delete('peminjam');
        if ($delete) {
            $this->response(array('status' => 'success'), 201);
        } else {
            $this->response(array('status' => 'fail', 502));
        }
    }
}
?>