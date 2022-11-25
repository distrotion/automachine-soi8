import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/09-1-DENSITYBloc.dart';
import '../../bloc/BlocEvent/09-2-DENSITYMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'DENSITYVAR.dart';

//context.read<DENSITYBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext DENSITYMAINcontext;

class DENSITYMAIN extends StatefulWidget {
  DENSITYMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  DENSITYReceive? data;
  String? msg;

  @override
  State<DENSITYMAIN> createState() => _DENSITYMAINState();
}

class _DENSITYMAINState extends State<DENSITYMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<DENSITYBloc_Bloc>().add(DENSITYBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    DENSITYMAINcontext = context;
    DENSITYVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      DENSITYVAR.UserID = _UserID;
    } else {
      DENSITYVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      DENSITYVAR.InstrumentID = _InstrumentID;
    } else {
      DENSITYVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      DENSITYVAR.Barcode = _Barcode;
    } else {
      DENSITYVAR.Barcode = '';
    }

    DENSITYVAR.SPEChi = widget.data?.SPEChi ?? '';
    DENSITYVAR.SPEClow = widget.data?.SPEClow ?? '';

    DENSITYVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    DENSITYVAR.SEND = widget.data?.SEND ?? '';
    DENSITYVAR.Result = widget.data?.Result ?? '';

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
                    "DENSITY",
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
                    isContr: DENSITYVAR.iscontrol,
                    fnContr: (input) {
                      DENSITYVAR.iscontrol = input;
                    },
                    sValue: DENSITYVAR.UserID,
                    returnfunc: (s) {
                      DENSITYVAR.UserID = s;
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
                            .read<DENSITYMSG_Bloc>()
                            .add(DENSITYMSG_UserID());
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
                    isContr: DENSITYVAR.iscontrol,
                    fnContr: (input) {
                      DENSITYVAR.iscontrol = input;
                    },
                    sValue: DENSITYVAR.InstrumentID,
                    returnfunc: (s) {
                      DENSITYVAR.InstrumentID = s;
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
                            .read<DENSITYMSG_Bloc>()
                            .add(DENSITYMSG_Instrument());
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
                    isContr: DENSITYVAR.iscontrol,
                    fnContr: (input) {
                      DENSITYVAR.iscontrol = input;
                    },
                    sValue: DENSITYVAR.Barcode,
                    returnfunc: (s) {
                      DENSITYVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (DENSITYVAR.Barcode.length == 18) {
                          context
                              .read<DENSITYMSG_Bloc>()
                              .add(DENSITYMSG_Barcode());
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
                      child: Center(child: Text(DENSITYVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<DENSITYBloc_Bloc>()
                            .add(DENSITYBloc_Read());
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
                          if (DENSITYVAR.SPEChi != '')
                            Center(child: Text('MAX:' + DENSITYVAR.SPEChi)),
                          if (DENSITYVAR.SPEClow != '')
                            Center(child: Text('MIN:' + DENSITYVAR.SPEClow)),
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
                          Center(child: Text(DENSITYVAR.Result)),
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
              //     context.read<DENSITYMSG_Bloc>().add(DENSITYMSG_Select_Send());
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
                  DENSITYVAR.iscontrol = true;
                  context.read<DENSITYMSG_Bloc>().add(DENSITYMSG_clear());
                  DENSITYVAR.UserID = '';
                  DENSITYVAR.InstrumentID = '';
                  DENSITYVAR.Barcode = '';
                  setState(() {
                    DENSITYVAR.UserID = '';
                    DENSITYVAR.InstrumentID = '';
                    DENSITYVAR.Barcode = '';
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
                  context.read<DENSITYMSG_Bloc>().add(DENSITYMSG_Reject());
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
