import 'package:Psynexa/assets.dart';
import 'package:Psynexa/components/custom_back_appbar.dart';
import 'package:Psynexa/components/custom_first_btn.dart';
import 'package:Psynexa/components/pay_alert.dart';
import 'package:Psynexa/constant/constant.dart';
import 'package:Psynexa/view/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:grock/grock.dart';

class PayPage extends StatelessWidget {
  PayPage({super.key});
  double price = 500.00;

  @override
  Widget build(BuildContext context) {
    Future<bool> _onWillPop() async {
      return await onPayPop(context);
    }

    return Scaffold(
      appBar: CustomAccAppBar(appbarTitle: 'Ödeme Detayları'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                color: Constant.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(81, 217, 217, 217),
                      spreadRadius: 5,
                      blurRadius: 4),
                ],
              ),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ödeme Detayı',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Muayene Ücreti:',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova'),
                      ),
                      Text(
                        '$price₺',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'KDV:',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova'),
                      ),
                      Text(
                        '${price * 0.20}₺',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 1,
                    color: Color(0xFFE8E6EA),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Toplam Tutar:',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Constant.black50,
                            fontFamily: 'Proxima Nova'),
                      ),
                      Text(
                        '${price + (price * 0.20)}₺',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Constant.black75,
                            fontFamily: 'Proxima Nova'),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 37,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              decoration: BoxDecoration(
                color: Constant.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(81, 217, 217, 217),
                      spreadRadius: 5,
                      blurRadius: 4),
                ],
              ),
              width: MediaQuery.sizeOf(context).width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nasıl ödeme yapmak istersiniz?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Proxima Nova',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    'Ödeme yapmak için istediğiniz ödeme türünü seçin',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Constant.black50,
                        fontFamily: 'Proxima Nova'),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: 1,
                    color: Color(0xFFE8E6EA),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.icons.visaSVG,
                        height: 50,
                        width: 70,
                      ),
                      SvgPicture.asset(
                        Assets.icons.mastercardSVG,
                        height: 50,
                        width: 70,
                      ),
                      SvgPicture.asset(
                        Assets.icons.maestroSVG,
                        height: 50,
                        width: 70,
                      ),
                    ],
                  )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 34.0),
              child: FirstBtn(
                onTap: () async {
                  await _onWillPop();
                  Grock.toRemove(BaseScaffold());
                },
                text: 'Ödeme Yap',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
