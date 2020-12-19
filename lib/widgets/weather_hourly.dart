part of 'widgets.dart';

class WeatherHourly extends StatelessWidget {
  int index, last;
  double delay      = 0;
  String hour, weather, temperature;
  bool selectedBox  = false;

  WeatherHourly({this.index, this.last, this.delay, this.hour, this.weather, this.temperature, this.selectedBox});

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
      delay: (1.5 + delay),
      child: Container(
        margin: (index == 1) 
          ? EdgeInsets.only(left: 25)
          : (index == last) 
            ? EdgeInsets.only(left: 10, right: 25)
            : EdgeInsets.only(left: 10),
        width: 70,
        height: 100,
        decoration: (selectedBox) 
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Color(0xFF6D9FF0).withOpacity(0.7))
          : BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.white, width: 2)),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5),
              child: Text(
                hour,
                style: defaultFont.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 2),
                width: 40,
                height: 38,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: (weather == 'sun') 
                          ? AssetImage("assets/icons/sun.png")
                          : (weather == 'rain') 
                            ? AssetImage("assets/icons/rain.png")
                            : AssetImage("assets/icons/snow.png"))),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 24),
              child: Row(
                children: [
                  Text(
                    temperature,
                    style: semiBoldFont.copyWith(fontSize: 24),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 16),
                    child: Text(
                      "o",
                      textAlign: TextAlign.left,
                      style: regularFont.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
