part of 'pages.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Weather Forecast",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 32,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 96,
              height: 96,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/icons/sun.gif"),
                      fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitDualRing(
                    size: 20,
                    color: Colors.orange,
                    lineWidth: 2,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Please wait ...",
                    style: TextStyle(
                        fontSize: 16, color: Colors.black.withOpacity(0.7)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
