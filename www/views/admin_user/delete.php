<?php include ROOT . '/views/layouts/header_admin.php'; ?>

<section>
    <div class="container">
        <div class="row">

            <br/>

            <div class="breadcrumbs">
                <ol class="breadcrumb">
                    <li><a href="/admin">Админпанель</a></li>
                    <li><a href="/admin/product">Управление пользователями</a></li>
                    <li class="active">Удалить пользователя</li>
                </ol>
            </div>


            <h4>Удалить пользователя #<?php echo $id; ?></h4>

            <?php if(!$selfDestruct): ?>
            <p>Вы действительно хотите удалить этого пользователя?</p>

            
            <?php else: ?>
                <p>Вы не можете удалить самого себя!</p>
            <?php endif; ?>
                <form method="post">
                <input type="submit" name="submit" value="OK" />
            </form>
        </div>
    </div>
</section>

<?php include ROOT . '/views/layouts/footer_admin.php'; ?>

