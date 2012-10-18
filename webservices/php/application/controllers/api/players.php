<?php defined('BASEPATH') OR exit('No direct script access allowed');

/*
class untuk data pemain


*/

require APPPATH.'/libraries/REST_Controller.php';

class Players extends REST_Controller{
	
	function index_get(){
		 		
		if(!$this->get('id')){
			$player=$this->players_model->get_player();
		}else{

			$player=$this->players_model->get_player($this->get('id'));
		}
    	
    	
        if($player) {
            $this->response($player, 200); // 200 being the HTTP response code
        } else  {
            $this->response(array('error' => 'Player could not be found'), 404);
        }
	}
	
	function index_post(){
		
	}
}
?>