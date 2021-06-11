<?php
	class Profile_model extends CI_Model{
		public function __construct(){
			$this->load->database();
		}

		public function get_profiles(){
			$this->db->order_by('id');
			$query = $this->db->get('users');
			return $query->result_array();
		}
	}