# exercise_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# exercises
A Gym Exercise Encyclopedia

- Kodu çalıştırdığınızda direkt olarak ana ekran karşınıza gelecektir.Internet bağlantınız olduğuna emin olun, aksi takdir ana ekranda " Failded to connect server" hatası alabilirsiniz.

- Bu projede state management olarak Riverpod kullanılmıştır. MVP mimamrisi ile oluşturulan projenin presenter kısmında repo klasörü bulunmaktadır. Hive local DB tercih edilerek kullanıcıların dataları tutulmuştur.

- API istekleri http ile yapılmış getirilen veriler 
https://exercises-by-api-ninjas.p.rapidapi.com/v1/exercises adresinden getirilmiştir.

User interactions için kullanılan haptic feedback ler yalnızca gerçek cihazda fark edilebilir.

Filtreleme menüsünde "CheckBoxlistile" kullanılmıştır; ancak Radiolistile kullanılması daha doğrudur. Eğer bir filtre seçili ise diğreni aynı anda seçmenize gerek yoktur. 
Zaten uygulama da bunun yapmanıza izin vermeyecektir. Filtrelemek istediğini alanı seçip filtreleyip devamında diğer alanları sırayla seçtiğinizde çoklu filtrelemeyi zaten 
uygulama kendi yapıyor olucaktır.Neyi nasıl hangi anahtar sözcükle filtrelediğiniz üste beliren filter bardan takip edebilirsiniz.
