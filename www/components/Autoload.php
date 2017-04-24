<?php

/**
 * Функция __autoload для автоматического подключения классов
 */
function __autoload($class_name)
{
    // Папки  с классами
    $array_paths = array(
        '/models/',
        '/components/',
        '/controllers/',
    );

    foreach ($array_paths as $path) {
        // Формируем путь к файлу с классом
        $path = ROOT . $path . $class_name . '.php';

        // подключаем его
        if (is_file($path)) {
            include_once $path;
        }
    }
}
