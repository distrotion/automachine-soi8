import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/13-1-PARTICALSIZEBloc.dart';

import '../../bloc/BlocEvent/13-2-PARTICALSIZEMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'PARTICALSIZEVAR.dart';

//context.read<PATICLESIZEBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext PATICLESIZEMAINcontext;

class PATICLESIZEMAIN extends StatefulWidget {
  PATICLESIZEMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PATICLESIZEReceive? data;
  String? msg;

  @override
  State<PATICLESIZEMAIN> createState() => _PATICLESIZEMAINState();
}

class _PATICLESIZEMAINState extends State<PATICLESIZEMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<PATICLESIZEBloc_Bloc>().add(PATICLESIZEBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    PATICLESIZEMAINcontext = context;
    PATICLESIZEVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      PATICLESIZEVAR.UserID = _UserID;
    } else {
      PATICLESIZEVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      PATICLESIZEVAR.InstrumentID = _InstrumentID;
    } else {
      PATICLESIZEVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      PATICLESIZEVAR.Barcode = _Barcode;
    } else {
      PATICLESIZEVAR.Barcode = '';
    }

    PATICLESIZEVAR.SPEChi = widget.data?.SPEChi ?? '';
    PATICLESIZEVAR.SPEClow = widget.data?.SPEClow ?? '';

    PATICLESIZEVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    PATICLESIZEVAR.SEND = widget.data?.SEND ?? '';
    PATICLESIZEVAR.Result = widget.data?.Result ?? '';

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
                    "PATICLESIZE",
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
                    isContr: PATICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PATICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PATICLESIZEVAR.UserID,
                    returnfunc: (s) {
                      PATICLESIZEVAR.UserID = s;
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
                            .read<PATICLESIZEMSG_Bloc>()
                            .add(PATICLESIZEMSG_UserID());
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
                    isContr: PATICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PATICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PATICLESIZEVAR.InstrumentID,
                    returnfunc: (s) {
                      PATICLESIZEVAR.InstrumentID = s;
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
                            .read<PATICLESIZEMSG_Bloc>()
                            .add(PATICLESIZEMSG_Instrument());
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
                    isContr: PATICLESIZEVAR.iscontrol,
                    fnContr: (input) {
                      PATICLESIZEVAR.iscontrol = input;
                    },
                    sValue: PATICLESIZEVAR.Barcode,
                    returnfunc: (s) {
                      PATICLESIZEVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (PATICLESIZEVAR.Barcode.length == 18) {
                          context
                              .read<PATICLESIZEMSG_Bloc>()
                              .add(PATICLESIZEMSG_Barcode());
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
                      child: Center(child: Text(PATICLESIZEVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<PATICLESIZEBloc_Bloc>()
                            .add(PATICLESIZEBloc_Read());
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
                          if (PATICLESIZEVAR.SPEChi != '')
                            Center(child: Text('MAX:' + PATICLESIZEVAR.SPEChi)),
                          if (PATICLESIZEVAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + PATICLESIZEVAR.SPEClow)),
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
                          Center(child: Text(PATICLESIZEVAR.Result)),
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
              //     context.read<PATICLESIZEMSG_Bloc>().add(PATICLESIZEMSG_Select_Send());
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
                  PATICLESIZEVAR.iscontrol = true;
                  context
                      .read<PATICLESIZEMSG_Bloc>()
                      .add(PATICLESIZEMSG_clear());
                  PATICLESIZEVAR.UserID = '';
                  PATICLESIZEVAR.InstrumentID = '';
                  PATICLESIZEVAR.Barcode = '';
                  setState(() {
                    PATICLESIZEVAR.UserID = '';
                    PATICLESIZEVAR.InstrumentID = '';
                    PATICLESIZEVAR.Barcode = '';
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
                      .read<PATICLESIZEMSG_Bloc>()
                      .add(PATICLESIZEMSG_Reject());
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
