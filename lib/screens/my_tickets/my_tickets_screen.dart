import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:onay/resources/resources.dart';
import 'package:onay/themes/colors.dart';
import 'ticket/ticket.dart';
import '../data/ticket_data.dart';

class MyTicketsScreen extends StatefulWidget {
  MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 236, 243),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
            const SizedBox(
              width: 20,
            ),
            const Text(
              'Мои билеты',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            IconButton(
                onPressed: () => _editTicket(context),
                icon: const Icon(
                  Icons.edit,
                  color: Colors.transparent,
                ))
          ],
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Сегодня',
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 116, 116, 116)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: double.infinity,
                          padding: const EdgeInsets.all(3),
                          decoration: const BoxDecoration(
                              color: AppColors.yellow,
                              borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(12))),
                          child:
                              const Image(image: AssetImage(AppImages.onay3)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Автобус',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              const Text(
                                'г.Алматы, электронный билет',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 130, 130, 130)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Маршрут:',
                                        style: _CustomTextStyle(),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Время:',
                                        style: _CustomTextStyle(),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Цена:',
                                        style: _CustomTextStyle(),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        'Код проверки:',
                                        style: _CustomTextStyle(),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(AppImages.busIcon),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            busNumber,
                                            style: _SecondCustomTextStyle(),
                                          ),
                                          const SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 3, vertical: 2),
                                            decoration: BoxDecoration(
                                                color: const Color.fromARGB(
                                                    255, 237, 237, 237),
                                                borderRadius:
                                                    BorderRadius.circular(7)),
                                            child: Text(
                                              busGosNumber,
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  color: Color.fromARGB(
                                                      255, 126, 126, 126)),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '$date $time',
                                            style: _SecondCustomTextStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '120',
                                            style: _SecondCustomTextStyle(),
                                          ),
                                          const Image(
                                              height: 18,
                                              image:
                                                  AssetImage(AppImages.tenge))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            randomCode,
                                            style: _SecondCustomTextStyle(),
                                          ),
                                          const SizedBox(
                                            width: 6,
                                          ),
                                          SvgPicture.asset(AppImages.qr)
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () => _showTicket(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  TextStyle _CustomTextStyle() =>
      const TextStyle(fontSize: 15, color: Color.fromARGB(255, 79, 79, 79));

  TextStyle _SecondCustomTextStyle() =>
      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

  var newBusNumber = TextEditingController();

  var newGosBusNumber = TextEditingController();

  var newGosBusNumberLetters = TextEditingController();

  var newHour = TextEditingController();

  var newMinutes = TextEditingController();

  Future<dynamic> _editTicket(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SizedBox(
            height: 500,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 80,
                  decoration: BoxDecoration(
                      color: AppColors.yellow,
                      borderRadius: BorderRadius.circular(10)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Номер автобуса:',
                              style: _editTicketTextStyle()),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 50,
                            child: TextField(
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              controller: newBusNumber,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Только буквы
                              ],
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: '48',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Гос. номер автобуса:',
                            style: _editTicketTextStyle(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 45,
                            child: TextField(
                              maxLines: 1,
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              controller: newGosBusNumber,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Только буквы
                              ],
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: '123',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            width: 45,
                            child: TextField(
                              maxLength: 3,
                              textAlign: TextAlign.center,
                              controller: newGosBusNumberLetters,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[a-zA-Z]')), // Только буквы
                              ],
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: 'AB',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const SizedBox(
                            width: 40,
                            child: TextField(
                              enabled: false,
                              maxLength: 2,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: '02',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            'Время:',
                            style: _editTicketTextStyle(),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 2,
                              textAlign: TextAlign.center,
                              controller: newHour,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Только буквы
                              ],
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: '21',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Text(
                              ':',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                            child: TextField(
                              maxLength: 2,
                              textAlign: TextAlign.center,
                              controller: newMinutes,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]')), // Только буквы
                              ],
                              decoration: const InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(vertical: 8),
                                  border: OutlineInputBorder(),
                                  isDense: true,
                                  hintText: '32',
                                  counterText: '',
                                  hintStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 110, 110, 110))),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  busNumber = newBusNumber.text;
                                  busGosNumber =
                                      '${newGosBusNumber.text}${newGosBusNumberLetters.text}02';
                                  hour = newHour.text;
                                  minutes = newMinutes.text;
                                  time = '$hour:$minutes';
                                });
                                Navigator.pop(context);
                              },
                              child: const Text('Сохранить'))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  TextStyle _editTicketTextStyle() {
    return const TextStyle(fontSize: 20);
  }

  Future<dynamic> _showTicket(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: const Column(
            children: [
              OnayLogo(),
              SizedBox(
                height: 30,
              ),
              RouteAndTime(),
              VerificationCode(),
              Expanded(
                child: QRCode(),
              ),
            ],
          ),
        );
      },
    );
  }
}
