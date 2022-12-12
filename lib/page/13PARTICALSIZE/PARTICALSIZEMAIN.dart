import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/13-1-PARTICALSIZEBloc.dart';

import '../../bloc/BlocEvent/13-2-PARTICALSIZEMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'PARTICALSIZEVAR.dart';

//context.read<PARTICLESIZEBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext PARTICLESIZEMAINcontext;

class PARTICLESIZEMAIN extends StatefulWidget {
  PARTICLESIZEMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PARTICLESIZEReceive? data;
  String? msg;

  @override
  State<PARTICLESIZEMAIN> createState() => _PARTICLESIZEMAINState();
}

class _PARTICLESIZEMAINState extends State<PARTICLESIZEMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<PARTICLESIZEBloc_Bloc>().add(PARTICLESIZEBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    PARTICLESIZEMAINcontext = context;
    PARTICLESIZEVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      PARTICLESIZEVAR.UserID = _UserID;
    } else {
      PARTICLESIZEVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      PARTICLESIZEVAR.InstrumentID = _InstrumentID;
    } else {
      PARTICLESIZEVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      PARTICLESIZEVAR.Barcode = _Barcode;
    } else {
      PARTICLESIZEVAR.Barcode = '';
    }

    PARTICLESIZEVAR.SPEChi = widget.data?.SPEChi ?? '';
    PARTICLESIZEVAR.SPEClow = widget.data?.SPEClow ?? '';

    PARTICLESIZEVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    PARTICLESIZEVAR.SEND = widget.data?.SEND ?? '';
    PARTICLESIZEVAR.Result = widget.data?.Result ?? '';

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
                    "PARTICLESIZE",
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
                    isContr: PARTICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PARTICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PARTICLESIZEVAR.UserID,
                    returnfunc: (s) {
                      PARTICLESIZEVAR.UserID = s;
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
                            .read<PARTICLESIZEMSG_Bloc>()
                            .add(PARTICLESIZEMSG_UserID());
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
                    isContr: PARTICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PARTICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PARTICLESIZEVAR.InstrumentID,
                    returnfunc: (s) {
                      PARTICLESIZEVAR.InstrumentID = s;
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
                            .read<PARTICLESIZEMSG_Bloc>()
                            .add(PARTICLESIZEMSG_Instrument());
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
                    isContr: PARTICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PARTICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PARTICLESIZEVAR.Barcode,
                    returnfunc: (s) {
                      PARTICLESIZEVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (PARTICLESIZEVAR.Barcode.length == 18) {
                          context
                              .read<PARTICLESIZEMSG_Bloc>()
                              .add(PARTICLESIZEMSG_Barcode());
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
                      child: Center(child: Text(PARTICLESIZEVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<PARTICLESIZEBloc_Bloc>()
                            .add(PARTICLESIZEBloc_Read());
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
                          if (PARTICLESIZEVAR.SPEChi != '')
                            Center(
                                child: Text('MAX:' + PARTICLESIZEVAR.SPEChi)),
                          if (PARTICLESIZEVAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + PARTICLESIZEVAR.SPEClow)),
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
                          Center(child: Text(PARTICLESIZEVAR.Result)),
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
              //     context.read<PARTICLESIZEMSG_Bloc>().add(PARTICLESIZEMSG_Select_Send());
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
                  PARTICLESIZEVAR.iscontrol = true;
                  context
                      .read<PARTICLESIZEMSG_Bloc>()
                      .add(PARTICLESIZEMSG_clear());
                  PARTICLESIZEVAR.UserID = '';
                  PARTICLESIZEVAR.InstrumentID = '';
                  PARTICLESIZEVAR.Barcode = '';
                  setState(() {
                    PARTICLESIZEVAR.UserID = '';
                    PARTICLESIZEVAR.InstrumentID = '';
                    PARTICLESIZEVAR.Barcode = '';
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
                      .read<PARTICLESIZEMSG_Bloc>()
                      .add(PARTICLESIZEMSG_Reject());
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
