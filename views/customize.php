<!-- Hiển thị chi tiết sản phẩm -->
<div class="body">
            <a class="buy_continute" href="index.php"><i class="fa fa-arrow-circle-left"></i> Trở lại mua hàng</a>
            <div class="product__details">
                <?php 
                $r3 = getID();
                    foreach($r3 as $keyID => $valueID){
                ?>
                    <div class="product__details-img">
                        <img src="./<?php echo $valueID['anhsp']; ?>" alt="">
                    </div>

                    <div class="product__details-info">
                        <h3><?php echo $valueID['tensp']; ?></h3>
                        <p>
                        <?php echo $valueID['mota']; ?>
                        </p>

                        <div class="product__pride">
                    <div class="product__pride-oldPride" style="font-size: 20px;">
                        <span class="Price">
                            <bdi><?php echo number_format($valueID['giasp']); ?>&nbsp;
                                <span class="currencySymbol">₫</span>
                            </bdi>
                        </span>
                    </div>
                    <div class="product__pride-newPride" style="font-size: 40px;">
                        <span class="Price">
                            <bdi><?php echo number_format($valueID['giasp'] * ((100 - $valueID['discount']) / 100)); ?>&nbsp;
                                <span class="currencySymbol">₫</span>
                            </bdi>
                        </span>
                    </div>
                </div>

                        <form action="index.php?page=cart&id=<?php echo $valueID['id_sanpham']; ?>" method="POST">
                            <div class="number">
                                <span>Số lượng</span>
                                <div class="number__count">
                                    <input type="number" value="1" name="quantity">
                                    <input type="hidden" name="id" value="<?php echo $valueID['id_sanpham']; ?>">
                                </div>
                            </div>
    
                            <div class="product__cart">
                                <button type="submit" class="product__cart-add" name="add-to-cart" onclick="alert('Them vao gio hang thanh cong')">Thêm vào giỏ hàng</button>
    
                                <button type="submit" class="product__cart-buy" name="buy-now">Mua ngay</button>
                            </div>
                        </form>
                    </div>
                <?php
                }
                ?>        
            </div>
    </div>