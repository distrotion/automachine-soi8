import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/10-1-KARLBloc.dart';
import '../../bloc/BlocEvent/10-2-KARLMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'KARLVAR.dart';

//context.read<KARLBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext KARLMAINcontext;

class KARLMAIN extends StatefulWidget {
  KARLMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  KARLReceive? data;
  String? msg;

  @override
  State<KARLMAIN> createState() => _KARLMAINState();
}

class _KARLMAINState extends State<KARLMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<KARLBloc_Bloc>().add(KARLBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    KARLMAINcontext = context;
    KARLVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      KARLVAR.UserID = _UserID;
    } else {
      KARLVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      KARLVAR.InstrumentID = _InstrumentID;
    } else {
      KARLVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      KARLVAR.Barcode = _Barcode;
    } else {
      KARLVAR.Barcode = '';
    }

    KARLVAR.SPEChi = widget.data?.SPEChi ?? '';
    KARLVAR.SPEClow = widget.data?.SPEClow ?? '';

    KARLVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    KARLVAR.SEND = widget.data?.SEND ?? '';
    KARLVAR.Result = widget.data?.Result ?? '';

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
                    "KARL",
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
                    isContr: KARLVAR.iscontrol,
                    fnContr: (input) {
                      KARLVAR.iscontrol = input;
                    },
                    sValue: KARLVAR.UserID,
                    returnfunc: (s) {
                      KARLVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<KARLMSG_Bloc>().add(KARLMSG_UserID());
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
                    isContr: KARLVAR.iscontrol,
                    fnContr: (input) {
                      KARLVAR.iscontrol = input;
                    },
                    sValue: KARLVAR.InstrumentID,
                    returnfunc: (s) {
                      KARLVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<KARLMSG_Bloc>().add(KARLMSG_Instrument());
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
                    isContr: KARLVAR.iscontrol,
                    fnContr: (input) {
                      KARLVAR.iscontrol = input;
                    },
                    sValue: KARLVAR.Barcode,
                    returnfunc: (s) {
                      KARLVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (KARLVAR.Barcode.length == 18) {
                          context.read<KARLMSG_Bloc>().add(KARLMSG_Barcode());
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
                      child: Center(child: Text(KARLVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<KARLBloc_Bloc>().add(KARLBloc_Read());
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
                          if (KARLVAR.SPEChi != '')
                            Center(child: Text('MAX:' + KARLVAR.SPEChi)),
                          if (KARLVAR.SPEClow != '')
                            Center(child: Text('MIN:' + KARLVAR.SPEClow)),
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
                          Center(child: Text(KARLVAR.Result)),
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
              //     context.read<KARLMSG_Bloc>().add(KARLMSG_Select_Send());
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
                  KARLVAR.iscontrol = true;
                  context.read<KARLMSG_Bloc>().add(KARLMSG_clear());
                  KARLVAR.UserID = '';
                  KARLVAR.InstrumentID = '';
                  KARLVAR.Barcode = '';
                  setState(() {
                    KARLVAR.UserID = '';
                    KARLVAR.InstrumentID = '';
                    KARLVAR.Barcode = '';
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
                  context.read<KARLMSG_Bloc>().add(KARLMSG_Reject());
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
