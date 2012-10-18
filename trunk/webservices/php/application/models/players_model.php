<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Players_model extends CI_Model{
	
	var $firstname="";
	var $surname="";
	
	function get_player($player_id="", $first_idx=0, $second_idx=10){
		
		/*
			first idx & second parameter adalah parameter yg digunakan untuk paging
		*/
		
		if($player_id==""){
			$lrs = $this->db->query("select * from players limit ".$first_idx." , ".$second_idx);
 		}else{
			$lrs = $this->db->query("select * from players where playerID='".$player_id."'  limit ".$first_idx." , ".$second_idx);	
		}
		
		$lrow = $lrs->result();

		return $lrow;
	}
	
	function insert_player(){
		
        $this->title   = $_POST['title']; // please read the below note
        $this->content = $_POST['content'];
        $this->date    = time();

        $this->db->insert('entries', $this);
    }

    function update_player(){
        $this->title   = $_POST['title'];
        $this->content = $_POST['content'];
        $this->date    = time();

        $this->db->update('entries', $this, array('id' => $_POST['id']));
    }
}

?>