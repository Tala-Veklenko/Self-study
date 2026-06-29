#### Документація для колекцій 


##### POST register
http://................................/api/register

Цей endpoint дозволяє пройти рестрацію та аутентифікацію через email та password

Body raw (json)
{
  "email": "r……..@gmail.com",
  "password": "……………"
}

##### Description
Headers:
Content-Type: application/json
Endpoint:
- POST /api/register
- GET /api/verify-email/{token}
- POST /api/auth/google
- POST /api/auth/apple
- GET /api/login/google
Status-коди:
- 200 – ………………… Опис помилки як описав бек 
- 400 – ……………… Опис помилки як описав бек
- 400  – ………………. Опис помилки як описав бек
- 401 – ………………. Опис помилки як описав бек
- 403  – ………………. Опис помилки як описав бек
- 404  – …………….. Опис помилки як описав бек
- 500  – ………………….. Опис помилки як описав бек

##### Pre-request Script

Перевіряє, що у відповіді є поле token
pm.test("Response has 'token' field", function () {var jsonData = pm.response.json();
pm.expect(jsonData).to.have.property("token"); });

##### Перевірка статус-коду 
pm.test("Status code is 200", function () { pm.response.to.have.status(200);});
pm.test("Status code is 400", function () { pm.response.to.have.status(400);});
pm.test("Status code is 404", function () { pm.response.to.have.status(404);});
pm.test("Status code is 500", function () { pm.response.to.have.status(500);});
можна доповнювати статус кодами

##### Перевірка наявності поля 'id' 
var jsonData = pm.response.json(); pm.test("All items have 'id' field", function () { if (Array.isArray(jsonData)) { jsonData.forEach(function(item) { pm.expect(item).to.have.property("id"); }); } else { pm.expect(jsonData).to.have.property("id"); } });

##### Перевірка часу відповіді 
pm.test("Response time is less than 5000ms", function () { pm.expect(pm.response.responseTime).to.be.below(5000);});

##### Перевірка Content-Type 
pm.test("Content-Type includes application/json", function () { var contentType = pm.response.headers.get("Content-Type"); pm.expect(contentType).to.include("application/json");});


##### MySQL (підставляєте свої дані з таблиць)
-- Структура таблиці
DESCRIBE users_illnesses;

-- Вибрати всі значення
SELECT * FROM users_illnesses;

-- Вибрати хвороби юзера де юзер id9
SELECT * FROM users_illnesses WHERE user_id = '9';

-- Оновити хворобу юзера
UPDATE users_illnesses
SET illness_id = 2
WHERE user_id = 9 AND illness_id = 3;

-- Додати новий запис
INSERT INTO users_illnesses (user_id, illness_id) VALUES ('9', '3');

-- Видалити запис
DELETE FROM users_illnesses
WHERE user_id = 9 AND illness_id = 3;

-- Negative Test [23000][1048] Column 'user_id' and .........cannot be null
INSERT INTO users_illnesses (user_id) VALUES (NULL);

-- Edge Case: Дуже велике значення user_id
INSERT INTO users_illnesses (user_id, illness_id) VALUES (999999999, 1);

-- Security: SQL injection
INSERT INTO users_illnesses (user_id, illness_id) VALUES ('1 OR 1=1', 1);

-- Отримати всі категорії в алфавітному порядку
SELECT * FROM categories ORDER BY name ASC;

-- Перевірка, чи є записи з NULL у колонках name або entity
SELECT * FROM categories WHERE name IS NULL OR entity IS NULL;

-- Пошук дублікатів у полі name
SELECT name, COUNT(*) FROM categories GROUP BY name HAVING COUNT(*) > 1;

-- Спроба вставити name довжиною більше 255 символів
INSERT INTO categories (name, entity) VALUES (REPEAT('A' 256), 2);




🔹 Коли доступний Resend
Користувач у статусі неверифікований.


Біля нього з’являється кнопка/лінк Resend.



🔹 Що треба перевірити тестувальнику
Відправка нового листа


Натискаєш Resend.


На пошту користувача має прийти новий лист.


Важливо: токен у новому листі інший, ніж у попередньому (інакше старе посилання залишиться валідним назавжди).


Придатність токенів


Старий токен після ресенду має стати недійсним (при спробі відкрити старе посилання → помилка invalid token / expired).


Новий токен має працювати і вести на форму встановлення пароля.


Обмеження за часом / кількістю


Перевірити, чи є обмеження (наприклад, не можна ресендити частіше ніж раз у хвилину).


Якщо такого немає — це потенційний баг (бо можна заспамити юзера).


Зміна статусу після ресенду


Статус користувача в адмінці має залишатися неверифікований (аж поки він не встановить пароль).


Лише після set password → стає верифікований.


Крос-тест


Якщо користувач уже встановив пароль (тобто став верифікований), кнопка Resend зникати повинна.



🔎 Типові проблеми, які знаходять при тестуванні
Старий токен все ще працює після ресенду.


Новий токен не згенерувався (прийшов лист, але з тим самим URL).


Токен дійсний занадто довго (наприклад, 7 днів), що небезпечно.


Немає захисту від спаму Resend.



📌 Висновок для тестувальника:
 Треба перевірити, що Resend генерує новий токен, відключає старий, надсилає лист, і кнопка зникає після верифікації.

