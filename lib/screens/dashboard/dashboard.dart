//import 'package:/screens/qr/qr/generate.dart';
import 'package:shopping_app/qr/qr/generate.dart';
import 'package:shopping_app/qr/qr/scan.dart';
import 'package:shopping_app/utills/imports.dart';
import 'package:shopping_app/utills/size_config.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:barcode_scan/barcode_scan.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 251,
              width: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: SizeConfig.sizes(140),
                  height: SizeConfig.sizes(150),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 12.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () async {
//                      Navigator.of(context).push(
//                          MaterialPageRoute(builder: (context) => ScanPage()));

                      String codeSanner =
                          await BarcodeScanner.scan(); //barcode scnner
                      if (await canLaunch(codeSanner)) {
                        _launchURL(codeSanner);
                      } else {
                        print('Check URL');
                      }
                    },
                    child: Card(
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/ic_scan.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 18.0),
                            Text(
                              'Scan QR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: SizeConfig.sizes(140),
                  height: SizeConfig.sizes(150),
                  decoration: new BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[400],
                        blurRadius: 12.0,
                        spreadRadius: 0.5,
                      ),
                    ],
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GeneratePage()));
                    },
                    child: Card(
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/ic_qrcode.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(height: 14.0),
                            Text(
                              'Generate QR',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(String myurl) async {
    if (await canLaunch(myurl)) {
      await launch(myurl);
    } else {
      throw 'Could not launch $myurl';
    }
  }
}
