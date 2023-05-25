import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/LoginEvent.dart';
import '../../mainBody.dart';
import '../../page/page1.dart';
import '../../page/page10.dart';
import '../../page/page11.dart';
import '../../page/page12.dart';
import '../../page/page13.dart';
import '../../page/page14.dart';
import '../../page/page15.dart';
import '../../page/page16.dart';
import '../../page/page17.dart';
import '../../page/page18.dart';
import '../../page/page2.dart';
import '../../page/page3.dart';
import '../../page/page4.dart';
import '../../page/page5.dart';
import '../../page/page6.dart';
import '../../page/page7.dart';
import '../../page/page8.dart';
import '../../page/page9.dart';
import 'sub_widget.dart';

late BuildContext MenuContext;

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    MenuContext = context;
    //---------------------------------------------------------------

    return Container(
      height: (MediaQuery.of(context).size.height),
      // width: MediaQuery.of(context).size.width,
      width: 200,
      color: const Color(0xff0b1327),
      //color: Colors.red,
      child: ListView(
        children: [
          Center(
            child: Data_Menu_mainmenu(),
          )
        ],
      ),
    );
  }
}

class Data_Menu_mainmenu extends StatelessWidget {
  //const Data_Menu_mainmenu({Key? key},this.pagein) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //Axis-Y
      crossAxisAlignment: CrossAxisAlignment.center, //Axis-X

      children: [
        const SizedBox(
          height: 20,
        ),
        Align(
            alignment: Alignment.center,
            child: Container(
                height: 40,
                width: 180,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsetsDirectional.all(1),
                  child: Container(
                    height: 35,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo_tpk.png"),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ))),
        menu_normal(
          name: "HOME",
          page: Page1(),
          Lv: 1,
          Colorss: Colors.blue,
        ),
        menu_normal(
          name: "BALANCE01",
          page: Page2(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "BALANCE02",
          page: Page3(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "FP COC",
          page: Page4(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "FP TCC",
          page: Page5(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "FP SCC",
          page: Page6(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "PH01",
          page: Page7(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "SG",
          page: Page8(),
          Lv: 1,
          Colorss: Colors.yellow,
        ),
        menu_normal(
          name: "DENSITY",
          page: Page9(),
          Lv: 1,
          Colorss: Colors.yellow,
        ),
        menu_normal(
          name: "KARL",
          page: Page10(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "BALANCEa",
          page: Page11(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "AUTOTRITEATE",
          page: Page12(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "PARTICALSIZE",
          page: Page13(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "MINIAV",
          page: Page14(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "EC",
          page: Page15(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "BOOKFEILD01",
          page: Page16(),
          Lv: 1,
          Colorss: Colors.green,
        ),
        menu_normal(
          name: "BOOKFEILD02",
          page: Page17(),
          Lv: 1,
        ),
        menu_normal(
          name: "PENETROMETER",
          page: Page18(),
          Lv: 1,
        ),
        menu_logout(
          name: "Logout",
        ),
        const Divider(
          color: Color(0x4dffffff),
          height: 12,
        ),
      ],
    );
  }
}

class Logomenu extends StatelessWidget {
  const Logomenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 80,
      color: Colors.white,

      child: Padding(
        padding: const EdgeInsetsDirectional.all(1),
        child: Container(
          height: 35,
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/images/logo_tpk.png"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
      ),

      //color: Colors.white,
    );
  }
}

class menu_logout extends StatelessWidget {
  menu_logout({Key? key, this.name}) : super(key: key);
  String? name;

  @override
  Widget build(BuildContext context) {
    String _name = name ?? "";

    return InkWell(
      onTap: () {
        LoginContext.read<Login_Bloc>().add(Logout());
        // BlocProvider.of<SwPageCubit>(context).togglePage(page);
        // CuPage = page;
        // CuPageLV = Lv;
        // MainBodyContext.read<ChangePage_Bloc>().add(ChangePage());
      },
      child: Container(
        //color: Colors.blue,
        height: 50,
        child: Row(
          children: [
            SizedBox(
              width: 15,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 24,
                width: 24,
                child: const Icon(
                  Icons.logout,
                  color: Colors.white,
                  // size: 30.0,
                ),
                // decoration: BoxDecoration(
                //   color: Colors.redAccent.shade400,

                //   // image: DecorationImage(
                //   //   image: AssetImage(""),
                //   //   fit: BoxFit.fitWidth,
                //   // ),
                //   //borderRadius: BorderRadius.all(Radius.circular(24.0)),
                // ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "   " + _name,
                style: const TextStyle(
                  fontFamily: 'Mitr',
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  fontStyle: FontStyle.normal,
                  letterSpacing: 0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
