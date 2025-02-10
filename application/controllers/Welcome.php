<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Welcome extends CI_Controller {

	public function index()
	{
		$data['pagina'] = "home";
		$this->load->view('layout', $data);
	}
}
?>
