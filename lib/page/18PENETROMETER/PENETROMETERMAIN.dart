import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/18-1-PENETROMETERBloc.dart';
import '../../bloc/BlocEvent/18-2-PENETROMETERMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'PENETROMETERVAR.dart';

//context.read<PENETROMETERBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext PENETROMETERMAINcontext;

class PENETROMETERMAIN extends StatefulWidget {
  PENETROMETERMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  PENETROMETERReceive? data;
  String? msg;

  @override
  State<PENETROMETERMAIN> createState() => _PENETROMETERMAINState();
}

class _PENETROMETERMAINState extends State<PENETROMETERMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<PENETROMETERBloc_Bloc>().add(PENETROMETERBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    PENETROMETERMAINcontext = context;
    PENETROMETERVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      PENETROMETERVAR.UserID = _UserID;
    } else {
      PENETROMETERVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      PENETROMETERVAR.InstrumentID = _InstrumentID;
    } else {
      PENETROMETERVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      PENETROMETERVAR.Barcode = _Barcode;
    } else {
      PENETROMETERVAR.Barcode = '';
    }

    PENETROMETERVAR.SPEChi = widget.data?.SPEChi ?? '';
    PENETROMETERVAR.SPEClow = widget.data?.SPEClow ?? '';

    PENETROMETERVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    PENETROMETERVAR.SEND = widget.data?.SEND ?? '';
    PENETROMETERVAR.Result = widget.data?.Result ?? '';

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
                    "PENETROMETER",
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
                    isContr: PENETROMETERVAR.iscontrol,
                    fnContr: (input) {
                      PENETROMETERVAR.iscontrol = input;
                    },
                    sValue: PENETROMETERVAR.UserID,
                    returnfunc: (s) {
                      PENETROMETERVAR.UserID = s;
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
                            .read<PENETROMETERMSG_Bloc>()
                            .add(PENETROMETERMSG_UserID());
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
                    isContr: PENETROMETERVAR.iscontrol,
                    fnContr: (input) {
                      PENETROMETERVAR.iscontrol = input;
                    },
                    sValue: PENETROMETERVAR.InstrumentID,
                    returnfunc: (s) {
                      PENETROMETERVAR.InstrumentID = s;
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
                            .read<PENETROMETERMSG_Bloc>()
                            .add(PENETROMETERMSG_Instrument());
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
                    isContr: PENETROMETERVAR.iscontrol,
                    fnContr: (input) {
                      PENETROMETERVAR.iscontrol = input;
                    },
                    sValue: PENETROMETERVAR.Barcode,
                    returnfunc: (s) {
                      PENETROMETERVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (PENETROMETERVAR.Barcode.length == 18) {
                          context
                              .read<PENETROMETERMSG_Bloc>()
                              .add(PENETROMETERMSG_Barcode());
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
                      child: Center(child: Text(PENETROMETERVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<PENETROMETERBloc_Bloc>()
                            .add(PENETROMETERBloc_Read());
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
                          if (PENETROMETERVAR.SPEChi != '')
                            Center(
                                child: Text('MAX:' + PENETROMETERVAR.SPEChi)),
                          if (PENETROMETERVAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + PENETROMETERVAR.SPEClow)),
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
                          Center(child: Text(PENETROMETERVAR.Result)),
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
              //     context.read<PENETROMETERMSG_Bloc>().add(PENETROMETERMSG_Select_Send());
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
                  PENETROMETERVAR.iscontrol = true;
                  context
                      .read<PENETROMETERMSG_Bloc>()
                      .add(PENETROMETERMSG_clear());
                  PENETROMETERVAR.UserID = '';
                  PENETROMETERVAR.InstrumentID = '';
                  PENETROMETERVAR.Barcode = '';
                  setState(() {
                    PENETROMETERVAR.UserID = '';
                    PENETROMETERVAR.InstrumentID = '';
                    PENETROMETERVAR.Barcode = '';
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
                      .read<PENETROMETERMSG_Bloc>()
                      .add(PENETROMETERMSG_Reject());
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
