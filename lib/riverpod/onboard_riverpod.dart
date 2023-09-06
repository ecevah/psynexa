import 'package:flutter/material.dart';
import 'package:Psynexa/models/onboard_model.dart';

class FirstPageRivepod extends ChangeNotifier {
  FirstPageModel firstPage = FirstPageModel(
    card: [
      FirstCardModel(
          text:
              'Randevularınızı kolaylıkla planlamak, uygun psikolog ile görüşmek veya iptal etmek için yapay zeka entegre edilen bu sistemi deneyin.',
          title: 'Yapay Zeka Entegrasyonu İle Randevu Planlaması Yapın.'),
      FirstCardModel(
          text:
              'Hızlı ve kolay bir şekilde randevularınızı planlayabilir, doktor veya diğer sağlık profesyonelleriyle görüşmek için yapay zeka destekli bu sistemi keşfedebilirsiniz.',
          title: 'Yapay Zeka Destekli Randevu Planlaması İle Verimli Yaşayın'),
      FirstCardModel(
          text:
              'Randevu almak, değiştirmek veya iptal etmek hiç bu kadar kolay olmamıştı. Yapay zeka entegrasyonu ile randevularınızı kolaylıkla planlayın ve hayatınızı kolaylaştırın.',
          title: 'Yapay Zeka İle Yönetim sayesinde Zaman Kazanın')
    ],
  );

  int firstPageCurrentIndex = 0;

  PageController pageController = PageController(initialPage: 0);

  void setFirstPageIndex(int newPageValue) {
    firstPageCurrentIndex = newPageValue;
    notifyListeners();
  }
}
