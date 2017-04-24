<?php

//корзина
class CartController
{

    public function actionAdd($id)
    {
        // Добавляем товар в корзину
        Cart::addProduct($id);

        // Возвращаем пользователя на страницу с которой он пришел
        $referrer = $_SERVER['HTTP_REFERER'];
        header("Location: $referrer");
    }

    //ассинхронный запрос
    public function actionAddAjax($id)
    {
        // Добавляем товар в корзину и печатаем результат: количество товаров в корзине
        echo Cart::addProduct($id);
        return true;
    }
    
    public function actionDelete($id)
    {
        // Удаляем заданный товар из корзины
        Cart::deleteProduct($id);

        // Возвращаем пользователя в корзину
        header("Location: /cart");
    }


    public function actionIndex()
    {
        // Список категорий для левого меню
        $categories = Category::getCategoriesList();

        // Получим идентификаторы и количество товаров в корзине
        $productsInCart = Cart::getProducts();

        if ($productsInCart) {
            // Получаем массив только с идентификаторами товаров
            $productsIds = array_keys($productsInCart);

            // Получаем массив с полной информацией о необходимых товарах
            $products = Product::getProdustsByIds($productsIds);

            // Получаем общую стоимость товаров
            $totalPrice = Cart::getTotalPrice($products);
        }

        // Подключаем вид
        require_once(ROOT . '/views/cart/index.php');
        return true;
    }

    //заказ
    public function actionCheckout()
    {
        if(!User::isGuest()){
        // Получием данные из корзины      
        $productsInCart = Cart::getProducts();
            // Если товаров нет, отправляем пользователи искать товары на главную
            if ($productsInCart == false) {
                header("Location: /");
            }
            // Список категорий для левого меню
            $categories = Category::getCategoriesList();
            // Находим общую стоимость
            $productsIds = array_keys($productsInCart);
            $products = Product::getProdustsByIds($productsIds);
            $totalPrice = Cart::getTotalPrice($products);
            // Количество товаров
            $totalQuantity = Cart::countItems();

            $userId = User::checkLogged();

            $result = Order::save($userId, $productsInCart);
            require_once(ROOT . '/views/cart/checkout.php');

            if ($result) {
                Cart::clear();
            }
        }
        return true;
    }

}
