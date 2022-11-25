import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';
import '../page10.dart';
import '../page2.dart';
import '../page4.dart';
import '../page5.dart';
import '../page6.dart';
import '../page7.dart';
import '../page8.dart';
import '../page9.dart';
import 'SELECT_INSvar.dart';

class SELECT_INSmain extends StatelessWidget {
  SELECT_INSmain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ComInputText(
                nLimitedChar: 50,
                sPlaceholder: "INSTRUMENT",
                height: 40,
                width: 230,
                isContr: SELECT_INSvar.iscontrol,
                fnContr: (input) {
                  SELECT_INSvar.iscontrol = input;
                },
                sValue: SELECT_INSvar.goto,
                returnfunc: (s) {
                  SELECT_INSvar.goto = s;
                },
              ),
              InkWell(
                onTap: () {
                  if (SELECT_INSvar.goto == 'BALANCE01') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page2();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'COC') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page4();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'TCC') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page5();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'SCC') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page6();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'PH') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page7();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'SG') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page8();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'DENSITY') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page9();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  } else if (SELECT_INSvar.goto == 'KARL') {
                    SELECT_INSvar.goto = "";
                    CuPage = Page10();
                    MainBodyContext.read<ChangePage_Bloc>()
                        .add(ChangePage_nodrower());
                  }
                },
                child: Container(
                  height: 40,
                  width: 50,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
