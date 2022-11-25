import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/07-1-PHBloc.dart';
import '../../bloc/BlocEvent/07-2-PHMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'PHVAR.dart';

//context.read<PHBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext PHMAINcontext;

class PHMAIN extends StatefulWidget {
  PHMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PHReceive? data;
  String? msg;

  @override
  State<PHMAIN> createState() => _PHMAINState();
}

class _PHMAINState extends State<PHMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<PHBloc_Bloc>().add(PHBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    PHMAINcontext = context;
    PHVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      PHVAR.UserID = _UserID;
    } else {
      PHVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      PHVAR.InstrumentID = _InstrumentID;
    } else {
      PHVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      PHVAR.Barcode = _Barcode;
    } else {
      PHVAR.Barcode = '';
    }

    PHVAR.SPEChi = widget.data?.SPEChi ?? '';
    PHVAR.SPEClow = widget.data?.SPEClow ?? '';

    PHVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    PHVAR.SEND = widget.data?.SEND ?? '';
    PHVAR.Result = widget.data?.Result ?? '';

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
                    "PH",
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
                    isContr: PHVAR.iscontrol,
                    fnContr: (input) {
                      PHVAR.iscontrol = input;
                    },
                    sValue: PHVAR.UserID,
                    returnfunc: (s) {
                      PHVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<PHMSG_Bloc>().add(PHMSG_UserID());
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
                    isContr: PHVAR.iscontrol,
                    fnContr: (input) {
                      PHVAR.iscontrol = input;
                    },
                    sValue: PHVAR.InstrumentID,
                    returnfunc: (s) {
                      PHVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<PHMSG_Bloc>().add(PHMSG_Instrument());
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
                    isContr: PHVAR.iscontrol,
                    fnContr: (input) {
                      PHVAR.iscontrol = input;
                    },
                    sValue: PHVAR.Barcode,
                    returnfunc: (s) {
                      PHVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (PHVAR.Barcode.length == 18) {
                          context.read<PHMSG_Bloc>().add(PHMSG_Barcode());
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
                      child: Center(child: Text(PHVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<PHBloc_Bloc>().add(PHBloc_Read());
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
                          if (PHVAR.SPEChi != '')
                            Center(child: Text('MAX:' + PHVAR.SPEChi)),
                          if (PHVAR.SPEClow != '')
                            Center(child: Text('MIN:' + PHVAR.SPEClow)),
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
                          Center(child: Text(PHVAR.Result)),
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
              //     context.read<PHMSG_Bloc>().add(PHMSG_Select_Send());
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
                  PHVAR.iscontrol = true;
                  context.read<PHMSG_Bloc>().add(PHMSG_clear());
                  PHVAR.UserID = '';
                  PHVAR.InstrumentID = '';
                  PHVAR.Barcode = '';
                  setState(() {
                    PHVAR.UserID = '';
                    PHVAR.InstrumentID = '';
                    PHVAR.Barcode = '';
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
                  context.read<PHMSG_Bloc>().add(PHMSG_Reject());
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
