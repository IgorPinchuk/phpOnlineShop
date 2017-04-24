<?php

/**
 * Контроллер AdminProductController
 * Управление товарами в админпанели
 */
class AdminUserController extends AdminBase
{

    /**
     * Action для страницы "Управление товарами"
     */
    public function actionIndex()
    {
        // Проверка доступа
        self::checkAdmin();

        // Получаем список товаров
        $usersList = User::getUsersList();

        // Подключаем вид
        require_once(ROOT . '/views/admin_user/index.php');
        return true;
    }
public function actionCreate()
    {
        // Проверка доступа
        self::checkAdmin();

        // Заполняем переменные для полей формы
        $name = '';
        $email = '';
        $password = '';
        $role = '';

        // Флаг результата
        $result = false;

        // Обработка формы
        if (isset($_POST['submit'])) {
            // Если форма отправлена
            // Получаем данные из формы редактирования
            $name = $_POST['name'];
            $email = $user['email'];
            $password = $_POST['password'];
            $role = $_POST['role'];
            
            // Флаг ошибок
            $errors = false;

            // Валидируем значения
            if (!User::checkName($name)) {
                $errors[] = 'Имя не должно быть короче 2-х символов';
            }
            if (!User::checkEmail($email)) {
                $errors[] = 'Некорректный e-mail';
            }
            if (!User::checkPassword($password)) {
                $errors[] = 'Пароль не должен быть короче 6-ти символов';
            }

            if ($errors == false) {
                // Если ошибок нет, сохраняет изменения профиля
                $result = User::register($name,$email, $password, $role);
            }
            header("Location: /admin/user");
        }

        // Подключаем вид
        require_once(ROOT . '/views/admin_user/create.php');
        return true;
    }

    /**
     * Action для страницы "Редактировать товар"
     */
    public function actionUpdate($id)
    {
        $id=  intval($id);
        // Проверка доступа
        self::checkAdmin();


        $userId = $id;

        // Получаем информацию о пользователе из БД
        $user = User::getUserById($userId);

        // Заполняем переменные для полей формы
        $name = $user['name'];
        $email = $user['email'];
        $password = $user['password'];
        $role = $user['role'];

        // Флаг результата
        $result = false;

        // Обработка формы
        if (isset($_POST['submit'])) {
            // Если форма отправлена
            // Получаем данные из формы редактирования
            $name = $_POST['name'];
            $email = $user['email'];
            $password = $_POST['password'];
            $role = $_POST['role'];
            
            // Флаг ошибок
            $errors = false;

            // Валидируем значения
            if (!User::checkName($name)) {
                $errors[] = 'Имя не должно быть короче 2-х символов';
            }
            if (!User::checkEmail($email)) {
                $errors[] = 'Некорректный e-mail';
            }
            if (!User::checkPassword($password)) {
                $errors[] = 'Пароль не должен быть короче 6-ти символов';
            }

            if ($errors == false) {
                // Если ошибок нет, сохраняет изменения профиля
                $result = User::edit($userId, $name,$email, $password, $role);
            }
            header("Location: /admin/user");
        }

        // Подключаем вид
        require_once(ROOT . '/views/admin_user/update.php');
        return true;
    }

    /**
     * Action для страницы "Удалить товар"
     */
    public function actionDelete($id)
    {
        // Проверка доступа
        self::checkAdmin();
        $selfId=  User::checkLogged();
        $selfDestruct=($selfId==$id);
        // Обработка формы
        if (isset($_POST['submit'])) {
            if(!$selfDestruct){
                User::deleteUserById($id);
            }

            // Перенаправляем пользователя на страницу управлениями товарами
            header("Location: /admin/user");
        }

        // Подключаем вид
        require_once(ROOT . '/views/admin_user/delete.php');
        return true;
    }
    
    

}
