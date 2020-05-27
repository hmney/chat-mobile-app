import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GetStartedScreen extends StatefulWidget {
  @override
  _GetStartedScreenState createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/get_started.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(25.0, 25.0),
              child: SvgPicture.string(
                _logo,
                allowDrawingOutsideViewBox: true,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  width: 300,
                  height: 54,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: RaisedButton(
                    onPressed: () {
                    },
                    color: Theme.of(context).primaryColor,
                    hoverColor: Theme.of(context).primaryColorLight,
                    child: Text(
                      'GET STARTED',
                      style: TextStyle(
                        fontFamily: 'Open Sans',
                        fontSize: 18,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

const String _logo =
    '<svg viewBox="25.0 25.0 75.9 75.9" ><defs><filter id="shadow"><feDropShadow dx="3" dy="3" stdDeviation="20"/></filter></defs><path transform="translate(25.0, 25.0)" d="M 17.85113525390625 0 L 58.01618957519531 0 C 67.87510681152344 0 75.86732482910156 7.992225646972656 75.86732482910156 17.85113525390625 L 75.86732482910156 58.01618957519531 C 75.86732482910156 67.87510681152344 67.87510681152344 75.86732482910156 58.01618957519531 75.86732482910156 L 17.85113525390625 75.86732482910156 C 7.992225646972656 75.86732482910156 0 67.87510681152344 0 58.01618957519531 L 0 17.85113525390625 C 0 7.992225646972656 7.992225646972656 0 17.85113525390625 0 Z" fill="#fcfcfc" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" filter="url(#shadow)"/><g transform="translate(28.0, 22.87)"><g transform=""><path transform="translate(-120.28, -1.0)" d="M 142.8358306884766 16.28082275390625 C 127.0349960327148 15.99673938751221 112.4130935668945 40.70750427246094 155.0130004882813 66.32734680175781 C 155.0597076416016 66.2432861328125 155.2393341064453 66.2432861328125 155.2860260009766 66.32734680175781 C 199.2600402832031 39.88106155395508 182.2629547119141 14.40709972381592 165.9342193603516 16.39003562927246 C 159.5686187744141 17.16307640075684 156.5646667480469 20.69601058959961 155.1495208740234 23.73455810546875 C 153.7343902587891 20.69601058959961 150.7304229736328 17.16307830810547 144.3648376464844 16.39003562927246 C 143.8545532226563 16.32804107666016 143.3455657958984 16.29000091552734 142.8358612060547 16.28081703186035 L 142.8358612060547 16.28081703186035 Z" fill="#ff007f" stroke="none" stroke-width="3.799730062484741" stroke-linecap="butt" stroke-linejoin="round" /></g></g></svg>';
