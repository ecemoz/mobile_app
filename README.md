# LearningApp Mobile

Öğrenme odaklı mobil uygulama — Flutter ile yazılmış, çok platformlu (Android, iOS, Web, macOS, Linux, Windows) bir eğitim uygulaması projesi.

## İçindekiler

- **Açıklama**: Projenin amacı ve kısa özet
- **Özellikler**: Kullanıcı odaklı temel işlevler
- **Hızlı Başlangıç**: Geliştirme ortamı ve çalıştırma adımları
- **Proje Yapısı**: Önemli dizinlerin açıklaması
- **Testler**: Testleri çalıştırma
- **Katkıda Bulunma**: Nasıl yardımcı olabilirsiniz
- **Lisans & İletişim**: Haklar ve sorular için iletişim

## Açıklama

Bu depo, öğrenmeyi kolaylaştırmak amacıyla hazırlanmış bir mobil uygulamadır. İçerik yönetimi, dersler, quiz'ler, ilerleme takibi ve profil yönetimi gibi modüller içerir. Uygulama Flutter ile yazılmış olup proje yapısı, modüler özellikler ve test odaklı geliştirme üzerine kuruludur.

## Özellikler

- Ders (lesson) görüntüleme ve ilerleme takibi
- Quiz modülü (soru/cevap, puanlama)
- Kullanıcı profili ve ayarlar
- Onboarding (ilk kullanım rehberi)
- Yerel veri & uzak veri kaynakları entegrasyonu (API/DB)
- Çoklu platform desteği (Android, iOS, Web, masaüstü)

## Hızlı Başlangıç

Geliştirmeye başlamadan önce bilgisayarınızda Flutter SDK yüklü olmalıdır. Kurulum ve platform gereksinimleri için resmi Flutter dokümantasyonuna bakın.

Gerekli komutlar:

```bash
# Depoyu klonlayın
git clone <repo-url>
cd mobile_app

# Bağımlılıkları yükleyin
flutter pub get

# Emulator veya gerçek cihaz seçin, ardından çalıştırın
flutter run

# Android için APK derleme
flutter build apk --release

# iOS için (macOS üzerinde) derleme
flutter build ios --release

# Web için derleme
flutter build web

# Testleri çalıştır
flutter test
```

Not: iOS üzerinde çalıştırmak için Xcode ve ilgili araçlar gereklidir. Android için Android SDK & emulator/cihaz yapılandırın.

## Proje Yapısı

Kısa bir klasör özeti — tam detaylar proje içindeki dosyalarla bulunabilir:

- `lib/` — uygulama kaynak kodu
	- `main.dart` — uygulama giriş noktası
	- `app/` — uygulama temel yapılandırması ve router
	- `core/` — uygulama çapında kullanılan servisler, modeller, tema ve widget'lar
	- `features/` — özellik bazlı dizinler (auth, home, lesson, quiz, profile, settings, vb.)
- `assets/` — resimler, çeviri dosyaları, ai verileri vb.
- `android/`, `ios/`, `web/`, `macos/`, `windows/`, `linux/` — platforma özel proje dosyaları
- `test/` — birim/entegrasyon testleri

Proje, temiz mimari ve feature-based (özellik bazlı) dizinleme kullanır; bu sayede yeni özellik eklemek ve bakım yapmak kolaylaşır.

## Bağımlılıklar

Bağımlılıklar `pubspec.yaml` içinde tanımlıdır. Temel komutlar:

```bash
flutter pub get
```

Eğer projenin kullandığı paketleri görmek isterseniz `pubspec.yaml` dosyasını inceleyin.

## State Management ve Mimariler

Proje, modüler yaklaşımla yazılmıştır; state management için genellikle Provider, Riverpod veya Bloc gibi çözümler kullanılabilir. Hangi yöntemin tercih edildiğini görmek için ilgili feature dizinlerindeki kodu inceleyin (`lib/features/*`).

## Lokalizasyon

Projede yerelleştirme kullanılıyorsa `lib/l10n/` veya `assets/i18n/` gibi dizinlerde çeviri kaynakları bulunur. Flutter'ın `intl` ya da `flutter_localizations` paketleriyle entegrasyon yapılmış olabilir.

## Testler

Birim ve widget testlerini çalıştırmak için:

```bash
flutter test
```

Özel test hedefleri veya entegrasyon testleri için `integration_test/` ya da `test_driver/` dizinlerini kontrol edin.

## CI / CD

Bu depo için CI (ör. GitHub Actions, Bitrise, Codemagic) yapılandırması ekleyebilirsiniz. Tipik adımlar:

- `flutter analyze`
- `flutter test`
- `flutter build` (target platformlara göre)

## Katkıda Bulunma

Katkılar memnuniyetle karşılanır. Küçük iyileştirmeler, hata düzeltmeleri ve dokümantasyon geliştirmeleri için fork → branch → pull request akışını kullanın.

Önerilen adımlar:

1. Yeni issue açın veya mevcut issue'ya atlayın
2. Fork ve branch oluşturun
3. Değişiklikleri PR ile gönderin

## Sorun Giderme

- `flutter pub get` hata veriyorsa: Flutter SDK ve internet bağlantınızı kontrol edin; paket sürümlerini `pubspec.yaml` içinde doğrulayın.
- iOS derlemesi hata veriyorsa: `pod install` ve `pod repo update` komutlarını çalıştırın, Xcode sürümünüzü kontrol edin.

## Lisans

Proje kökünde bir `LICENSE` dosyası yoksa lisans eklemeyi düşünün (ör. MIT, Apache-2.0). Lisans bilgisi eklendiğinde burada güncelleyin.

## İletişim

Proje hakkında sorular, katkı teklifleri veya hata raporları için repository üzerindeki Issues sekmesini kullanın.

---

Dosyayı güncelledim. Daha fazla bilgi (ör. kullanılan state management kütüphanesi veya CI konfigürasyonu) eklenecekse belirtin; README'yi buna göre genişletirim.
