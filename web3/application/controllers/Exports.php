<?php

	class Exports extends CI_Controller {
 public function __construct()
 {
  parent::__construct();
  $this->load->model('Export_model');
 }

 public function index()
 {
  $data['posts'] = $this->Export_model->fetch_data();
  $this->load->view('posts/index', $data);
 }
 

 public function export() {
    $file_name = 'posts'.'.csv'; 
       header("Content-Description: File Transfer"); 
       header('Content-Encoding: UTF-8');
       header("Content-Disposition: attachment; filename=$file_name"); 
       header("Content-Type: application/csv; charset=UTF-8");    
       
       $posts = $this->Export_model->fetch_data();
     
       $file = fopen("php://output", "w+"); 
       $seperator = ";";
       fputs($file, "\xEF\xBB\xBF");
       
       $header = array('id', 'title', 'slug', 'posted image', 'created date'); 
       fputcsv($file, $header, $seperator);    
       foreach ($posts->result_array() as  $value)
       { 
         fputcsv($file, $value, $seperator); 
       }
       fclose($file); 
       exit; 
  } 
}
