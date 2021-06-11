<?php
	class Export_model extends CI_Model{
    function fetch_data()
    {
        $this->db->select("id,title,slug,post_image,created_at");
        $this->db->from("posts");
        $this->db->order_by("id");
        return $this->db->get();
    }
}