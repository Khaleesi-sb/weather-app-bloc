import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/bloc/weather/weather_bloc.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/daily_info_card.dart';
import '../../widgets/screen_background.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {

  // late Timer _timer;
  // late String _timeString;

  Widget getWeatherIcon(int code){
    switch(code){
      case >= 200 && < 300 :
        return Image.asset(
            'assets/images/1.png'
        );
      case >= 300 && < 400 :
        return Image.asset(
            'assets/images/2.png'
        );
      case >= 500 && < 600 :
        return Image.asset(
            'assets/images/3.png'
        );
      case >= 600 && < 700 :
        return Image.asset(
            'assets/images/4.png'
        );
      case >= 700 && < 800 :
        return Image.asset(
            'assets/images/5.png'
        );
      case == 800 :
        return Image.asset(
            'assets/images/6.png'
        );
      case > 800 && <= 804 :
        return Image.asset(
            'assets/images/7.png'
        );
      default:
        return Image.asset(
            'assets/images/7.png'
        );
    }
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _timeString = _formatDateTime(DateTime.now());
  //   _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _getTime());
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }
  //
  // void _getTime() {
  //   final DateTime now = DateTime.now();
  //   final String formattedDateTime = _formatDateTime(now);
  //   setState(() {
  //     _timeString = formattedDateTime;
  //   });
  // }
  //
  // String _formatDateTime(DateTime dateTime) {
  //   return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}:${dateTime.second.toString().padLeft(2, '0')}';
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                const ScreenBackground(),
                if(state is WeatherSuccess)
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: '📍${state.weather.areaName}',
                        textFontWeight: FontWeight.w300,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const CustomText(
                        text: "Welcome",
                        textFontWeight: FontWeight.bold,
                        textFontSize: 18,
                      ),
                      getWeatherIcon(state.weather.weatherConditionCode!),
                      Center(
                          child: CustomText(
                        text: '${state.weather.temperature!.celsius!.round()}°c',
                        textFontWeight: FontWeight.w600,
                        textFontSize: 45,
                      )),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: CustomText(
                        text: state.weather.weatherMain!.toUpperCase(),
                        textFontWeight: FontWeight.w600,
                        textFontSize: 20,
                      )),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                          child: CustomText(
                        text: DateFormat('EEEE dd •').add_jm().format(state.weather.date!),
                        textFontWeight: FontWeight.w600,
                        textFontSize: 16,
                        textColor: Colors.black45,
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DailyInfoCard(
                              title: "Sunrise",
                              subtitle: DateFormat().add_jm().format(state.weather.sunrise!),
                              image: "assets/images/11.png"),
                          DailyInfoCard(
                              title: "Sunset",
                              subtitle: DateFormat().add_jm().format(state.weather.sunset!),
                              image: "assets/images/12.png"),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.0),
                        child: Divider(
                          color: Colors.black45,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DailyInfoCard(
                              title: "Temp max",
                              subtitle: '${state.weather.tempMax!.celsius!.round()}°c',
                              image: "assets/images/13.png"),
                          DailyInfoCard(
                              title: "Temp min",
                              subtitle: '${state.weather.tempMin!.celsius!.round()}°c',
                              image: "assets/images/14.png"),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
