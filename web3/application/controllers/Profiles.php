<?php
	class Users extends CI_Controller{
		public function list(){
			$data['post'] = $this->profile_model->get_profiles();
			
			if (empty($data['post'])) {
				show_404();

			}	

			$this->load->view('templates/header');
			$this->load->view('profiles/view', $data);
			$this->load->view('templates/footer');
		}
	}



















