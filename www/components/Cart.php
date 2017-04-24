<?php


//корзина
class Cart
{

    //добавление в корзину
    public static function addProduct($id)
    {
        $id = intval($id);

        $productsInCart = array();

        // Если в корзине уже есть товары (в сессии)
        if (isset($_SESSION['products'])) {
            // извлекаем их в массив
            $productsInCart = $_SESSION['products'];
        }

        // есть ли уже такой товар в корзине 
        if (array_key_exists($id, $productsInCart)) {
            //увеличим количество на 1
            $productsInCart[$id] ++;
        } else {
            // иначе, добавляем id нового товара в корзину с количеством 1
            $productsInCart[$id] = 1;
        }

        // Записываем массив с товарами в сессию
        $_SESSION['products'] = $productsInCart;

        // Возвращаем количество товаров в корзине
        return self::countItems();
    }

    //количество товаров в корзине
    public static function countItems()
    {
        // Проверка наличия товаров в корзине
        if (isset($_SESSION['products'])) {
            // считаем кол-во
            $count = 0;
            foreach ($_SESSION['products'] as $id => $quantity) {
                $count = $count + $quantity;
            }
            return $count;
        } else {
            // иначе, вернем 0
            return 0;
        }
    }

    //получить массив товаров
    public static function getProducts()
    {
        if (isset($_SESSION['products'])) {
            return $_SESSION['products'];
        }
        return false;
    }

    //посчитать общую сумму
    public static function getTotalPrice($products)
    {
        $productsInCart = self::getProducts();

        $total = 0;
        if ($productsInCart) {
            foreach ($products as $item) {
                // цена товара * количество товара
                $total += $item['price'] * $productsInCart[$item['id']];
            }
        }

        return $total;
    }

    //очистка корзины
    public static function clear()
    {
        if (isset($_SESSION['products'])) {
            unset($_SESSION['products']);
        }
    }

    //удаление одного товара
    public static function deleteProduct($id)
    {
        $id = intval($id);

        $productsInCart = array();

        // Если в корзине уже есть товары (в сессии)
        if (isset($_SESSION['products'])) {
            // извлекаем их в массив
            $productsInCart = $_SESSION['products'];
        }

        // есть ли уже такой товар в корзине 
        if (array_key_exists($id, $productsInCart)) {
            if($productsInCart[$id]>1){
                //уменьшаем количество на 1
                $productsInCart[$id] --;
            }else{
                unset($productsInCart[$id]);
            }
        } 

        // Записываем массив с товарами в сессию
        $_SESSION['products'] = $productsInCart;
    }

}
