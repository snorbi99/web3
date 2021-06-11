<h2><?= $title ?></h2>

<?php foreach($posts as $post) : ?>
	
  <h3><?php echo $post['title']; ?></h3>
	
  <div class="row">
		<div class="col-md-3">
			<img class="post-thumb" src="<?php echo site_url(); ?>assets/images/posts/<?php echo $post['post_image']; ?>">
		</div>
		
    <div class="col-md-9">
			<small class="post-date">Posted on: <?php echo $post['created_at']; ?> in <strong><?php echo $post['name']; ?></strong></small><br>
		<?php echo word_limiter($post['body'], 60); ?>
		<br><br>
		<p><a class="btn btn-default" href="<?php echo site_url('/posts/'.$post['slug']); ?>">Read More</a></p>
		</div>
	</div>

<?php endforeach; ?>

<div class="pagination-links">
		<?php echo $this->pagination->create_links(); ?>
</div>

<?php      
    if($this->session->userdata('user_id') == $post['user_id'] || $this->session->userdata('admin') == 1){
		    $id=$this->session->userdata('user_id');

         $conn = mysqli_connect("localhost:8889","root","root","luxurycar");
         mysqli_set_charset($conn, "utf8");
         
         if(isset($_POST["import"])) 
         {       
             $filename = $_FILES["file"]["tmp_name"];
             
             if($_FILES["file"]["size"] > 0)
             {
                 $file = fopen($filename,"r");
                 fseek($file,0);
                             
                 while (($column = fgetcsv($file,1000,";")) !== false)
                 {                    
                     $sqlInsert = "Insert INTO posts ( category_id,user_id,title,slug,body,post_image) values (". $column[0] .",".$id.",'".$column[1]."','" .$column[2] ."','" .$column[3] ."','noimage.jpg')";

                     $result = mysqli_query($conn, $sqlInsert);                                        
                 }  
                 redirect('posts');
             }
         }
     }
?>

<form class="well" align="center"  action="" method="post" name="uploadCsv" enctype="multipart/form-data">
    <h2 align="center">Import</h2>
     <label> Choose CSV File </label>
     
   <input type="file" name="file" accept=".csv">
    <br >
    <input type="submit" name="import" class="btn btn-success btn-xs" value="Import" />
   </form>

<?php  
 $connect = mysqli_connect("localhost", "root", "root", "luxurycar");  
 $query ="SELECT * FROM posts ORDER BY id desc";  
 $result = mysqli_query($connect, $query); 
 ?>

<br/><br/>  
           <div class="container" style="width:900px;">  
                <h2 align="center">Export</h2>  
                <h3 align="center">Luxury Cars</h3>                 
                <br />  
                
                <form method="post"action="<?php echo base_url(); ?>exports/export" align="center">               
                    <input class="btn btn-success btn-xs" type="submit" name="export" value="Export to CSV" /> 
                </form> 
                     while($row = mysqli_fetch_array($result))  
                     {  
                     ?>  
                          <tr>  
                               <td><?php echo $row["id"]; ?></td>  
                               <td><?php echo $row["title"]; ?></td>  
                               <td><?php echo $row["slug"]; ?></td>  
                               <td><?php echo $row["body"]; ?></td>  
                               <td><?php echo $row["post_image"]; ?></td>    
                          </tr>  
                     <?php       
                     }  
                     ?>  
                     </table>  
                </div> 
                -->
           </div>
