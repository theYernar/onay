import 'package:flutter/material.dart';
import 'package:onay/resources/resources.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay/screens/data/ticket_data.dart';
import 'package:onay/themes/colors.dart';

class VerificationCode extends StatelessWidget {
  const VerificationCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ClipPath(
        clipper: TicketClipper(),
        child: Container(
          height: 70,
          width: double.infinity,
          color: AppColors.yellow,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Код проверки:',
                style: TextStyle(
                  fontSize: 17,
                  color: Color.fromARGB(255, 77, 77, 77)
                ),
              ),
              Text(
                randomCode,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),  
      ),
    );
  }
}

class RouteAndTime extends StatelessWidget {
  const RouteAndTime({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 220,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.yellow,
          border: Border(bottom: BorderSide(color: AppColors.yellow, width: 2,)),
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text(
              'Маршрут',
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 77, 77, 77)
              ),
            ),
            const SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              SvgPicture.asset(
                height: 37,
                AppImages.busIcon
              ),
              const SizedBox(width: 3,),
                Text(
                busNumber,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox(width: 8,),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:const Color(0xfffee45f)
                ),
                child: Text(
                  busGosNumber,
                  style: const TextStyle(
                    fontSize: 27,
                  fontWeight: FontWeight.bold
                  ),
                ),
              )
              ],
            ),        
            const SizedBox(height: 20,),
            const Text(
              'Время',
              style: TextStyle(
                fontSize: 17,
                color: Color.fromARGB(255, 77, 77, 77)
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
                const SizedBox(width: 13,),
                Text(
                  time,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OnayLogo extends StatelessWidget {
  const OnayLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      width: 140,
      child: SvgPicture.asset(
        AppImages.onay,
      )
    );
  }
}

class QRCode extends StatelessWidget {
  const QRCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
        decoration: const BoxDecoration(
          color: AppColors.yellow,
          border: Border(
            top: BorderSide(color: AppColors.yellow, width: 2)
          )
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Image(
                fit: BoxFit.cover,
                image: AssetImage(TicketQr.qr)),
            ),
            const SizedBox(height: 15,),
          ],
        )
      ),
    );
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    // Верхняя сторона
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    // Правая сторона с большим вырезом
    path.lineTo(size.width, size.height * 0);
    path.arcToPoint(
      Offset(size.width, size.height * 0.9),
      radius: Radius.circular(size.height * 0.2), // Радиус больше
      clockwise: false,
    );
    path.lineTo(size.width, size.height);

    // Нижняя сторона
    path.lineTo(0, size.height);

    // Левая сторона с большим вырезом
    path.lineTo(0, size.height * 0.9);
    path.arcToPoint(
      Offset(0, size.height * 0),
      radius: Radius.circular(size.height * 0.2), // Радиус больше
      clockwise: false,
    );
    path.lineTo(0, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}