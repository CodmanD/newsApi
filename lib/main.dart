/*Завдання:
Створіть Flutter додаток, який відображає список новин із відомих новинних джерел.
 Додаток повинен мати наступний функціонал:
Головний екран: На головному екрані має бути список новин, відображений у формі слів.
Кожен новина повинна містити заголовок, підзаголовок (перші кілька слів) та дату публікації.
Завантаження новин: Додаток має завантажувати новини з віддаленого API.
Використовуйте будь-яке публічне API для отримання новин, наприклад, News API.
API ключ можна отримати безкоштовно
(можна використати мій тестовий apiKey: b934e64150484c21b11bcfb2430c18bc).
Підтримка станів:
Відобразити стан завантаження даних:
під час завантаження повинен бути видимий індікатор завантаження,
 а після завершення - список новин.
Підвантаження новин у список:
Дозвольте користувачу підвантажувати новини при долистуванні до кінця списку
 (в news api зверніть увагу на параметри pageSize та page якщо використовуєте News API).
Деталі новини:
При натисканні на новину, перенаправити користувача на окремий екран з повним текстом новини.
Технічні вимоги:
Використовуйте Flutter та Dart для реалізації додатку.
Використайте стандартні пакети для маршрутизації (наприклад, flutter_bloc або provider) та для роботи з мережею.
Спробуйте дотримуватися архітектурних підходів, таких як BLoC або Provider.
Результат роботи повинен бути завантажений на публічний репозиторій (GitHub, GitLab тощо).
Реалізація інтерфейсу - на розсуд кандидата. Має бути схоже на стрічку новин
Для реалізації стрічки новин використайте CustomScrollView
Оцінка:
Успішне виконання завдання буде оцінено за такими критеріями:
Правильність та повнота реалізації функціоналу.
Якість коду, його структура та організація.
Відповідність технічним вимогам.
Використання пакетів та засобів з спільноти Flutter для покращення розробки.*/
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:news/ui/app.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const App());
}

