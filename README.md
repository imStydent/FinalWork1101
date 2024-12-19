# Финальный проект: ООО «Ароматный мир»

В данном проекте пользователь может просмтаривать товары и составлять заказ, а менеджер и администратор могут просматривать товары и заказы, а так же редактировать заказы

## Начало работы

Эти инструкции предоставят вам копию проекта и помогут запустить на вашем локальном компьютере для разработки и тестирования.

### Необходимые условия

Для работы с данным проектом требуется установить Microsoft Visual Studio и утилиту для конфигурирования, администрирования и управления всех компонентов Microsoft SQL Server (SQL Server Management Studio)

### Установка

Требуется установить указанные выше программы, следуя их установщикам.

Следущем щагом будет изменить строку подключения в методе OnConfiguring, в файле FragrantWorldContext.cs, в папке Data.

```
protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    => optionsBuilder.UseSqlServer("Ваша_строка_подключения");
```

Далее требуется назначить несколько запускаемых проектов, а именно FragrantWorldWebApi и FragrantWorld.

Вы готовы использовать проект!

### Известные баги

1) Не удается вызывать метод на фильтрацию(полную его версию, то есть со всеми параметрами). При изменении параметров в HttpGet и добавлении новых параметров в метод GetFilteredProductsAsync(WebApiService), выдаётся ошибка 404.
   Ниже пример изменненного **не рабочего** кода.
   ```
   [HttpGet("{sortBy:int}/{name?}/{maker?}/{minPrice?}/{maxPrice?}"]
   // В WebApiService
   return await _client.GetFromJsonAsync<IEnumerable<Product>>($"Products/{sortBy}/{name}/{maker}/{minPrice}/{maxPrice}");
   ```

## Авторы

* **Мошников Артём** - *FinalWork1101* - [ImStydent](https://github.com/imStydent)
