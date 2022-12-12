import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/17-1-BOOKFEILD02Bloc.dart';
import '../../bloc/BlocEvent/17-2-BOOKFEILD02MSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'BOOKFEILD02VAR.dart';

//context.read<BOOKFEILD02Bloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext BOOKFEILD02MAINcontext;

class BOOKFEILD02MAIN extends StatefulWidget {
  BOOKFEILD02MAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BOOKFEILD02Receive? data;
  String? msg;

  @override
  State<BOOKFEILD02MAIN> createState() => _BOOKFEILD02MAINState();
}

class _BOOKFEILD02MAINState extends State<BOOKFEILD02MAIN> {
  @override
  void initState() {
    super.initState();
    context.read<BOOKFEILD02Bloc_Bloc>().add(BOOKFEILD02Bloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    BOOKFEILD02MAINcontext = context;
    BOOKFEILD02VAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      BOOKFEILD02VAR.UserID = _UserID;
    } else {
      BOOKFEILD02VAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      BOOKFEILD02VAR.InstrumentID = _InstrumentID;
    } else {
      BOOKFEILD02VAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      BOOKFEILD02VAR.Barcode = _Barcode;
    } else {
      BOOKFEILD02VAR.Barcode = '';
    }

    BOOKFEILD02VAR.SPEChi = widget.data?.SPEChi ?? '';
    BOOKFEILD02VAR.SPEClow = widget.data?.SPEClow ?? '';

    BOOKFEILD02VAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    BOOKFEILD02VAR.SEND = widget.data?.SEND ?? '';
    BOOKFEILD02VAR.Result = widget.data?.Result ?? '';

    return Center(
      child: SizedBox(
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 60,
                width: 300,
                child: Center(
                  child: Text(
                    "BOOKFEILD02",
                    style: TextStyle(fontSize: 36),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ComInputText(
                    nLimitedChar: 50,
                    sPlaceholder: "USER ID",
                    height: 40,
                    width: 200,
                    isContr: BOOKFEILD02VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD02VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD02VAR.UserID,
                    returnfunc: (s) {
                      BOOKFEILD02VAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context
                            .read<BOOKFEILD02MSG_Bloc>()
                            .add(BOOKFEILD02MSG_UserID());
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 50,
                      color:
                          _UserID == '' && _InstrumentID == '' && _Barcode == ''
                              ? Colors.black
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ComInputText(
                    nLimitedChar: 50,
                    sPlaceholder: "INSTRUMENT",
                    height: 40,
                    width: 200,
                    isContr: BOOKFEILD02VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD02VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD02VAR.InstrumentID,
                    returnfunc: (s) {
                      BOOKFEILD02VAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context
                            .read<BOOKFEILD02MSG_Bloc>()
                            .add(BOOKFEILD02MSG_Instrument());
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 50,
                      color:
                          _UserID != '' && _InstrumentID == '' && _Barcode == ''
                              ? Colors.black
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ComInputText(
                    nLimitedChar: 18,
                    sPlaceholder: "BARCODE",
                    height: 40,
                    width: 200,
                    isContr: BOOKFEILD02VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD02VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD02VAR.Barcode,
                    returnfunc: (s) {
                      BOOKFEILD02VAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (BOOKFEILD02VAR.Barcode.length == 18) {
                          context
                              .read<BOOKFEILD02MSG_Bloc>()
                              .add(BOOKFEILD02MSG_Barcode());
                        } else {
                          WORNINGpop(context, ["WRONG BARCODE"], 80, 100);
                        }
                      }
                    },
                    child: Container(
                      height: 40,
                      width: 50,
                      color:
                          _UserID != '' && _InstrumentID != '' && _Barcode == ''
                              ? Colors.black
                              : Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text("preview"),
                    Container(
                      width: 150,
                      height: 40,
                      decoration: BoxDecoration(
                        // color: Colors.black,
                        border: Border.all(color: Colors.blue, width: 2),
                      ),
                      child: Center(child: Text(BOOKFEILD02VAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<BOOKFEILD02Bloc_Bloc>()
                            .add(BOOKFEILD02Bloc_Read());
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        color: Colors.black,
                        child: const Icon(
                          Icons.cached,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 15,
                color: Colors.red,
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 62,
                      color: Colors.blue.shade300,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(child: Text('SPEC')),
                          if (BOOKFEILD02VAR.SPEChi != '')
                            Center(child: Text('MAX:' + BOOKFEILD02VAR.SPEChi)),
                          if (BOOKFEILD02VAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + BOOKFEILD02VAR.SPEClow)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 62,
                      color: Colors.lightGreen,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          const Center(child: Text('RESULT')),
                          Center(child: Text(BOOKFEILD02VAR.Result)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   height: 5,
              // ),
              // InkWell(
              //   onTap: () {
              //     context.read<BOOKFEILD02MSG_Bloc>().add(BOOKFEILD02MSG_Select_Send());
              //   },
              //   child: Container(
              //     height: 62,
              //     color: Colors.green,
              //     child: const Center(
              //       child: Text(
              //         "SEND DATA",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  BOOKFEILD02VAR.iscontrol = true;
                  context
                      .read<BOOKFEILD02MSG_Bloc>()
                      .add(BOOKFEILD02MSG_clear());
                  BOOKFEILD02VAR.UserID = '';
                  BOOKFEILD02VAR.InstrumentID = '';
                  BOOKFEILD02VAR.Barcode = '';
                  setState(() {
                    BOOKFEILD02VAR.UserID = '';
                    BOOKFEILD02VAR.InstrumentID = '';
                    BOOKFEILD02VAR.Barcode = '';
                  });
                },
                child: Container(
                  height: 62,
                  color: Colors.orange,
                  child: const Center(
                    child: Text(
                      "CLEAR",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InkWell(
                onTap: () {
                  context
                      .read<BOOKFEILD02MSG_Bloc>()
                      .add(BOOKFEILD02MSG_Reject());
                },
                child: Container(
                  height: 30,
                  color: Colors.redAccent,
                  child: const Center(
                    child: Text(
                      "REJECT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
