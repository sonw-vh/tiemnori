<?php 
    if(isset($_POST['update']) && isset($_GET['id'])){

        $name = $_POST['name'];
        $price = $_POST['price'];
        $mota = $_POST['content'];
        $discount = $_POST['discount'];
        $idcata = $_POST['categori'];

        $id = $_GET['id'];

        $sql_up = "SELECT * FROM sanpham WHERE id_sanpham = $id";
        $queryup = mysqli_query($conn, $sql_up);
        $row_up = mysqli_fetch_assoc($queryup);

        if($_FILES['img']['name'] == ''){ //neu ko tai len anh
            $imgage_name = $row_up['anhsp'];
            $tmp_name = $_FILES['img']['tmp_name'];
            $folder = $imgage_name;
            move_uploaded_file($tmp_name, $folder);

        }else{ //up anh len thi cap nhap
            $imgage_name = $_FILES['img']['name'];
            $tmp_name = $_FILES['img']['tmp_name'];
            $folder = "./upload/" .$imgage_name;
            move_uploaded_file($tmp_name, $folder);
        }


        $sql = "UPDATE `sanpham` SET `tensp` = '$name', `anhsp` = '$folder', `giasp` = '$price', `mota` = '$mota', `discount` = '$discount', `id_danhmuc` = '$idcata' WHERE `id_sanpham` = '$id'";
        if(mysqli_query($conn, $sql)){
            header("Location: index.php?page=admin");
        }
        else{
            echo "Sửa thất bại";
        }


    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="./css/bsgrid.min.css" />
    <link rel="stylesheet" href="./css/admin.min.css" />
</head>
<body>

    <div class="with70">
        <div class="row">
            <div class="col-md-3">
                <div class="menu_option">
                    <div class="menu_option-head">Menu</div>
                    <ul>
                        <li><a href="index.php?page=admin">Trang chủ</a></li>
                        <li><a href="index.php?page=add_product">Thêm sản phẩm</a></li>
                        <li><a href="index.php?page=manage_order">Quản lý đơn hàng</a></li>
                        <li><a href="./index.php">Thoát</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-md-9">
                <div class="menu_option-head2">Sửa sản phẩm</div>
                <form action="" method="POST" class="list" style="padding-left: 10px;" enctype="multipart/form-data">
            <?php
                $products = getID();
                foreach($products as $keyFind => $valueFind){

                    ?>
                        <div class="wrap-field">
                            <label>Tên sản phẩm</label>
                            <div class="right-wrap-field">
                                <input type="text" name="name" value="<?php echo $valueFind['tensp']; ?>">
                            </div>
                        </div>
        
                        <div class="wrap-field">
                            <label>Ảnh sản phẩm</label>
                            <div class="right-wrap-field">
                                <input type="file" name="img" onchange="readURL(this);" value="<?php echo $valueFind['anhsp']; ?>">
                                <img src="<?php echo $valueFind['anhsp']; ?>" alt="" id="preImg" style="max-width: 300px;"/><br>
                            </div>

                        </div>
        
                        <div class="wrap-field">
                            <label>Giá</label>
                            <div class="right-wrap-field">
                                <input type="text" name="price" value="<?php echo $valueFind['giasp']; ?>">
                            </div>
                        </div>
        
                        <div class="wrap-field">
                            <label>Danh mục</label>
                            <div class="right-wrap-field">
                                <select name="categori" id="">
                                    <option value="<?php echo $valueFind['id_danhmuc']; ?>"><?php echo $valueFind['id_danhmuc']; ?></option>
                                    <option value="1">1 - Cơm nắm</option>
                                    <option value="3">2 - Tất cả sản phẩm</option>
                                    <option value="5">3 - Nổi bật</option>
                                </select>
                            </div>
                        </div>
        
                        <div class="wrap-field">
                            <label>Giảm giá</label>
                            <div class="right-wrap-field">
                                <input type="text" name="discount" value="<?php echo $valueFind['discount']; ?>">
                            </div>
                        </div>

                        <div class="wrap-field2">
                            <label>Mô tả</label>
                            <div class="right-wrap-field2">
                                <textarea name="content" id="product-content"><?php echo $valueFind['mota']; ?></textarea>
                                <div class="save">
                                    <button type="submit" name="update">Lưu</button>
                                    <a href="index.php?page=admin" class="cancel">Hủy</a>
                                </div>
                            </div>
                        </div>

                        

                    <?php
                }
            ?>
    
                </form>
    
                <!-- pagination -->
                
            </div>
        </div>
    </div>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();

                reader.onload = function (e) {
                    $('#preImg').attr('src', e.target.result);
                };

                reader.readAsDataURL(input.files[0]);
            }
        }

    </script>

    <script src="./script/ckeditor/ckeditor.js"></script>
    <script>
        CKEDITOR.replace('content');
    </script>
</body>
</html>