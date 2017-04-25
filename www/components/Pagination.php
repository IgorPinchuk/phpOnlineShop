<?php

//постраничная навигация
 
class Pagination
{

    private $max = 9;

    //Ключ для url
    private $index = 'page';

    //Номер текущей страницы
    private $current_page;

    //бщее количество записей
    private $total;

    //Количество записей на страницу
    private $limit;

    public function __construct($total, $currentPage, $limit, $index)
    {
        $this->total = $total;

        $this->limit = $limit;

        $this->index = $index;

        $this->amount = $this->amount();
        
        $this->setCurrentPage($currentPage);
    }

    // HTML-код со ссылками навигации
     
    public function get()
    {
        $links = null;
        
        // ограничения для цикла
        $limits = $this->limits();
        
        $html = '<ul class="pagination">';
        // Генерируем ссылки
        for ($page = $limits[0]; $page <= $limits[1]; $page++) {
            // Если текущая это текущая страница, ссылки нет и добавляется класс active
            if ($page == $this->current_page) {
                $links .= '<li class="active"><a href="#">' . $page . '</a></li>';
            } else {
                // Иначе генерируем ссылку
                $links .= $this->generateHtml($page);
            }
        }

        // Если ссылки созданы
        if (!is_null($links)) {
            // Если текущая страница не первая
            if ($this->current_page > 1)
            // Создаём ссылку на первую
                $links = $this->generateHtml(1, '&lt;') . $links;

            // Если текущая страница не последняя
            if ($this->current_page < $this->amount)
            // Создаём ссылку на последнюю
                $links .= $this->generateHtml($this->amount, '&gt;');
        }

        $html .= $links . '</ul>';

        // Возвращаем html
        return $html;
    }

    // Для генерации HTML-кода ссылки 
    private function generateHtml($page, $text = null)
    {
        // Если текст ссылки не указан
        if (!$text)
        // текст - номер страницы
            $text = $page;

        $currentURI = rtrim($_SERVER['REQUEST_URI'], '/') . '/';
        $currentURI = preg_replace('~/page-[0-9]+~', '', $currentURI);
        // Формируем HTML код ссылки и возвращаем
        return
                '<li><a href="' . $currentURI . $this->index . $page . '">' . $text . '</a></li>';
    }

    //Границы
    private function limits()
    {
        // Вычисляем ссылки слева (чтобы активная ссылка была посередине)
        $left = $this->current_page - round($this->max / 2);
        
        // Вычисляем начало отсчёта
        $start = $left > 0 ? $left : 1;

        // Если впереди есть как минимум $this->max страниц
        if ($start + $this->max <= $this->amount) {
        // Назначаем конец цикла вперёд на $this->max страниц или просто на минимум
            $end = $start > 1 ? $start + $this->max : $this->max;
        } else {
            // Конец - общее количество страниц
            $end = $this->amount;

            // Начало - минус $this->max от конца
            $start = $this->amount - $this->max > 0 ? $this->amount - $this->max : 1;
        }

        return
                array($start, $end);
    }

    
    private function setCurrentPage($currentPage)
    {
        // Получаем номер страницы
        $this->current_page = $currentPage;

        // Если текущая страница больше нуля
        if ($this->current_page > 0) {
            // Если текущая страница меньше общего количества страниц
            if ($this->current_page > $this->amount)
            // Устанавливаем страницу на последнюю
                $this->current_page = $this->amount;
        } else
        // Устанавливаем страницу на первую
            $this->current_page = 1;
    }

    //Общее число страниц
    private function amount()
    {
        // Делим и возвращаем
        return ceil($this->total / $this->limit);
    }

}
