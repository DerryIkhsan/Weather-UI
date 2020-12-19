part of 'pages.dart';

class Rainy extends StatelessWidget {
  ImageProvider backgroundImage = AssetImage("assets/images/bg-rain-blur20.png");
  double delay                  = 0; // untuk delay fade animation
  int index                     = 0; // untuk indexing widget
  List weathers                 = [
    {"hour": "10:00", "weather": "sun", "temperature": "29", "selectedBox": false},
    {"hour": "11:00", "weather": "rain", "temperature": "22", "selectedBox": false},
    {"hour": "12:00", "weather": "rain", "temperature": "22", "selectedBox": true},
    {"hour": "13:00", "weather": "rain", "temperature": "22", "selectedBox": false},
    {"hour": "14:00", "weather": "rain", "temperature": "22", "selectedBox": false},
    {"hour": "15:00", "weather": "rain", "temperature": "22", "selectedBox": false},
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: backgroundImage,
                    fit: BoxFit.fill)),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            children: [
              //main header
              FadeAnimation(
                delay: 0.5,
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Center(
                      child: Text(
                    "Bandung",
                    style: semiBoldFont,
                  )),
                ),
              ),

              FadeAnimation(
                delay: 0.75,
                child: Container(
                  margin: EdgeInsets.only(top: 2),
                  child: Center(
                      child: Text(
                    "Sun, 20 December 2020",
                    style: defaultFont,
                  )),
                ),
              ),

              // main weather
              Container(
                margin: EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    FadeAnimation(
                      delay: 1,
                      child: Center(
                        child: Text("Today",
                            style: regularFont.copyWith(fontSize: 30)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      width: 230,
                      height: 140,
                      child: Row(
                        children: [
                          FadeAnimation(
                            delay: 1.5,
                            child: Container(
                              width: 140,
                              height: 140,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/icons/rain.png"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Container(
                              child: Column(
                            children: [
                              FadeAnimation(
                                delay: 2,
                                child: Row(
                                  children: [
                                    Text(
                                      "22",
                                      style: boldFont,
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 35),
                                        child: Text(
                                          '0',
                                          style: regularFont.copyWith(fontSize: 24),
                                        )),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 20),
                                        child: Text(
                                          'C',
                                          style: defaultFont.copyWith(fontSize: 36),
                                        ))
                                  ],
                                ),
                              ),
                              FadeAnimation(
                                delay: 2.5,
                                child: Container(
                                  padding: EdgeInsets.only(right: 30),
                                  child: Text(
                                    "Rainy",
                                    textAlign: TextAlign.left,
                                    style: regularFont.copyWith(fontSize: 26),
                                  ),
                                ),
                              )
                            ],
                          ))
                        ],
                      ),
                    )
                  ],
                ),
              ),

              // weather info
              Container(
                width: 240,
                margin: EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FadeAnimation(
                      delay: 2,                    
                      child: Container(
                        width: 40,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/icons/rainy.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Center(
                                child: Text(
                              "50%",
                              style: defaultFont,
                            ))
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 2.5,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        width: 40,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/icons/windy.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Center(
                                child: Text(
                              "7km/h",
                              style: defaultFont,
                            ))
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      delay: 3,
                      child: Container(
                        width: 40,
                        child: Column(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/icons/dew-point.png"),
                                      fit: BoxFit.fill)),
                            ),
                            Center(
                                child: Text(
                              "75%",
                              style: defaultFont,
                            ))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),

              //Hourly
              FadeAnimation(
                delay: 1.5,
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 40, left: 25),
                      child: Text("Hourly",
                          style: mediumFont),
                    )
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 20),
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // widget weather hourly
                    ...weathers.map((e) {
                      index++; // indexing widget
                      return WeatherHourly(index: index, last: weathers.length, delay: (delay += 0.25), hour: e['hour'], weather: e['weather'], temperature: e['temperature'], selectedBox: e['selectedBox'],);
                    }),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
