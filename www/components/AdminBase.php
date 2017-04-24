<?php


abstract class AdminBase
{


    public static function checkAdmin()
    {
        // Проверяем авторизирован ли пользователь. Если нет, он будет переадресован
        $userId = User::checkLogged();

        // Получаем информацию о текущем пользователе
        $user = User::getUserById($userId);

        // Если роль текущего пользователя "admin"
        if ($user['role'] == 'admin') {
            return true;
        }

        // Иначе завершаем работу с сообщением об закрытом доступе
        die('Access denied');
    }
    
    public static function isAdmin()
    {
        if(User::isGuest()){
            return false;
        }else{
            $userId = User::checkLogged();
        }

        // Получаем информацию о текущем пользователе
        $user = User::getUserById($userId);

        // Если роль текущего пользователя "admin"
        if ($user['role'] == 'admin') {
            return true;
        }else {
            return false;    
        }
    }

}
