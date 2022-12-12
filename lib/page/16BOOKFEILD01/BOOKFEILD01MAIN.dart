import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/16-1-BOOKFEILD01Bloc.dart';
import '../../bloc/BlocEvent/16-2-BOOKFEILD01MSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'BOOKFEILD01VAR.dart';

//context.read<BOOKFEILD01Bloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext BOOKFEILD01MAINcontext;

class BOOKFEILD01MAIN extends StatefulWidget {
  BOOKFEILD01MAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BOOKFEILD01Receive? data;
  String? msg;

  @override
  State<BOOKFEILD01MAIN> createState() => _BOOKFEILD01MAINState();
}

class _BOOKFEILD01MAINState extends State<BOOKFEILD01MAIN> {
  @override
  void initState() {
    super.initState();
    context.read<BOOKFEILD01Bloc_Bloc>().add(BOOKFEILD01Bloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    BOOKFEILD01MAINcontext = context;
    BOOKFEILD01VAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      BOOKFEILD01VAR.UserID = _UserID;
    } else {
      BOOKFEILD01VAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      BOOKFEILD01VAR.InstrumentID = _InstrumentID;
    } else {
      BOOKFEILD01VAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      BOOKFEILD01VAR.Barcode = _Barcode;
    } else {
      BOOKFEILD01VAR.Barcode = '';
    }

    BOOKFEILD01VAR.SPEChi = widget.data?.SPEChi ?? '';
    BOOKFEILD01VAR.SPEClow = widget.data?.SPEClow ?? '';

    BOOKFEILD01VAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    BOOKFEILD01VAR.SEND = widget.data?.SEND ?? '';
    BOOKFEILD01VAR.Result = widget.data?.Result ?? '';

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
                    "BOOKFEILD01",
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
                    isContr: BOOKFEILD01VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD01VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD01VAR.UserID,
                    returnfunc: (s) {
                      BOOKFEILD01VAR.UserID = s;
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
                            .read<BOOKFEILD01MSG_Bloc>()
                            .add(BOOKFEILD01MSG_UserID());
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
                    isContr: BOOKFEILD01VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD01VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD01VAR.InstrumentID,
                    returnfunc: (s) {
                      BOOKFEILD01VAR.InstrumentID = s;
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
                            .read<BOOKFEILD01MSG_Bloc>()
                            .add(BOOKFEILD01MSG_Instrument());
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
                    isContr: BOOKFEILD01VAR.iscontrol,
                    fnContr: (input) {
                      BOOKFEILD01VAR.iscontrol = input;
                    },
                    sValue: BOOKFEILD01VAR.Barcode,
                    returnfunc: (s) {
                      BOOKFEILD01VAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (BOOKFEILD01VAR.Barcode.length == 18) {
                          context
                              .read<BOOKFEILD01MSG_Bloc>()
                              .add(BOOKFEILD01MSG_Barcode());
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
                      child: Center(child: Text(BOOKFEILD01VAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<BOOKFEILD01Bloc_Bloc>()
                            .add(BOOKFEILD01Bloc_Read());
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
                          if (BOOKFEILD01VAR.SPEChi != '')
                            Center(child: Text('MAX:' + BOOKFEILD01VAR.SPEChi)),
                          if (BOOKFEILD01VAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + BOOKFEILD01VAR.SPEClow)),
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
                          Center(child: Text(BOOKFEILD01VAR.Result)),
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
              //     context.read<BOOKFEILD01MSG_Bloc>().add(BOOKFEILD01MSG_Select_Send());
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
                  BOOKFEILD01VAR.iscontrol = true;
                  context
                      .read<BOOKFEILD01MSG_Bloc>()
                      .add(BOOKFEILD01MSG_clear());
                  BOOKFEILD01VAR.UserID = '';
                  BOOKFEILD01VAR.InstrumentID = '';
                  BOOKFEILD01VAR.Barcode = '';
                  setState(() {
                    BOOKFEILD01VAR.UserID = '';
                    BOOKFEILD01VAR.InstrumentID = '';
                    BOOKFEILD01VAR.Barcode = '';
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
                      .read<BOOKFEILD01MSG_Bloc>()
                      .add(BOOKFEILD01MSG_Reject());
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
