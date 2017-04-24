<?php include ROOT . '/views/layouts/header.php'; ?>

<section>
    <div class="container">
        <div class="row">

            <h3>Кабинет пользователя</h3>
            
            <h4><?php echo $user['name'];?></h4>
            <ul>
                <li><a href="/cabinet/edit">Редактировать данные</a></li>
                <?php if(AdminBase::isAdmin()): ?>
                <li><a href="/admin">Админ панель</a></li>
                <?php endif; ?>
            </ul>
            
        </div>
    </div>
</section>

<?php include ROOT . '/views/layouts/footer.php'; ?>