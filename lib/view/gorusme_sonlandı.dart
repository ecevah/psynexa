import 'package:flutter/material.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:grock/grock.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:Psynexa/view/degerlendirme.dart';

class GorusmeSonu extends StatelessWidget {
  String image;
  String title;
  String rol;
  GorusmeSonu(
      {super.key, required this.title, required this.image, required this.rol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 110,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    image,
                    width: 200,
                    height: 200,
                    scale: 0.5,
                  ),
                ),
                const SizedBox(
                  height: 13,
                ),
                const Text(
                  'Arama Sonlandı',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Constant.red),
                )
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Grock.to(Degerlendirme(
                        image: image,
                        title: title,
                        rol: rol,
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(76, 103, 71, 199),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Değerlendirme Ekleyin',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Constant.purple),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Grock.toRemove(BaseScaffold());
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Constant.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Randevularım',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Constant.white),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
