Feature: 1.7 Сортировка

  Background:
    Given подменяю данные о точках
    Given подменяю данные о направлениях
    Given подменяю данные о предложениях
    Given подменяю запрос на удаление точки
    Given нахожусь на главной странице сайта
    When запрос на получение данных завершён
    Then на странице '5' элементов '.event'

  Scenario: Пользователю доступна возможность сортировки точек маршрута
    Then элемент '[value="sort-day"i]:checked' есть на странице
    When кликаю по элементу '[for="sort-price"i]'
    Then элемент '[value="sort-price"i]:checked' есть на странице
    Then точка '1' содержит текст '5000'
    Then точка '5' содержит текст '1000'
    Then на странице '5' элементов '.event'
    When кликаю по элементу '[for="sort-time"i]'
    Then элемент '[value="sort-time"i]:checked' есть на странице
    Then точка '1' содержит текст 'Sightseeing Empty destination'
    Then точка '5' содержит текст 'Drive Empty destination'
    Then на странице '5' элементов '.event'
    When кликаю по элементу '[for="sort-day"i]'
    Then элемент '[value="sort-day"i]:checked' есть на странице
    Then точка '1' содержит текст 'Sightseeing Empty destination'
    Then точка '5' содержит текст 'Train No pictures destination'
    Then на странице '5' элементов '.event'

  Scenario: При смене фильтра сортировка сбрасывается на состояние «Day»
    When кликаю по элементу '[for="sort-price"i]'
    Then элемент '[value="sort-price"i]:checked' есть на странице
    When кликаю по элементу '[for="filter-past"i]'
    Then элемент '[id="filter-past"i]:checked' есть на странице
    Then элемент '[value="sort-day"i]:checked' есть на странице
    Then на странице '3' элементов '.event'
    Then точка '1' содержит текст 'Check-in Full destination'
    Then точка '3' содержит текст 'Taxi No pictures destination'
