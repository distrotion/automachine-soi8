import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/12-1-AUTOTITRATEBloc.dart';
import '../../bloc/BlocEvent/12-2-AUTOTITRATEMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'AUTOTITRATEVAR.dart';

//context.read<AUTOTITRATEBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext AUTOTITRATEMAINcontext;

class AUTOTITRATEMAIN extends StatefulWidget {
  AUTOTITRATEMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  AUTOTITRATEReceive? data;
  String? msg;

  @override
  State<AUTOTITRATEMAIN> createState() => _AUTOTITRATEMAINState();
}

class _AUTOTITRATEMAINState extends State<AUTOTITRATEMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<AUTOTITRATEBloc_Bloc>().add(AUTOTITRATEBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    AUTOTITRATEMAINcontext = context;
    AUTOTITRATEVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      AUTOTITRATEVAR.UserID = _UserID;
    } else {
      AUTOTITRATEVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      AUTOTITRATEVAR.InstrumentID = _InstrumentID;
    } else {
      AUTOTITRATEVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      AUTOTITRATEVAR.Barcode = _Barcode;
    } else {
      AUTOTITRATEVAR.Barcode = '';
    }

    AUTOTITRATEVAR.SPEChi = widget.data?.SPEChi ?? '';
    AUTOTITRATEVAR.SPEClow = widget.data?.SPEClow ?? '';

    AUTOTITRATEVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    AUTOTITRATEVAR.SEND = widget.data?.SEND ?? '';
    AUTOTITRATEVAR.Result = widget.data?.Result ?? '';

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
                    "AUTOTITRATE",
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
                    isContr: AUTOTITRATEVAR.iscontrol,
                    fnContr: (input) {
                      AUTOTITRATEVAR.iscontrol = input;
                    },
                    sValue: AUTOTITRATEVAR.UserID,
                    returnfunc: (s) {
                      AUTOTITRATEVAR.UserID = s;
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
                            .read<AUTOTITRATEMSG_Bloc>()
                            .add(AUTOTITRATEMSG_UserID());
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
                    isContr: AUTOTITRATEVAR.iscontrol,
                    fnContr: (input) {
                      AUTOTITRATEVAR.iscontrol = input;
                    },
                    sValue: AUTOTITRATEVAR.InstrumentID,
                    returnfunc: (s) {
                      AUTOTITRATEVAR.InstrumentID = s;
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
                            .read<AUTOTITRATEMSG_Bloc>()
                            .add(AUTOTITRATEMSG_Instrument());
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
                    isContr: AUTOTITRATEVAR.iscontrol,
                    fnContr: (input) {
                      AUTOTITRATEVAR.iscontrol = input;
                    },
                    sValue: AUTOTITRATEVAR.Barcode,
                    returnfunc: (s) {
                      AUTOTITRATEVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (AUTOTITRATEVAR.Barcode.length == 18) {
                          context
                              .read<AUTOTITRATEMSG_Bloc>()
                              .add(AUTOTITRATEMSG_Barcode());
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
                      child: Center(child: Text(AUTOTITRATEVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<AUTOTITRATEBloc_Bloc>()
                            .add(AUTOTITRATEBloc_Read());
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
                          if (AUTOTITRATEVAR.SPEChi != '')
                            Center(child: Text('MAX:' + AUTOTITRATEVAR.SPEChi)),
                          if (AUTOTITRATEVAR.SPEClow != '')
                            Center(
                                child: Text('MIN:' + AUTOTITRATEVAR.SPEClow)),
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
                          Center(child: Text(AUTOTITRATEVAR.Result)),
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
              //     context.read<AUTOTITRATEMSG_Bloc>().add(AUTOTITRATEMSG_Select_Send());
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
                  AUTOTITRATEVAR.iscontrol = true;
                  context
                      .read<AUTOTITRATEMSG_Bloc>()
                      .add(AUTOTITRATEMSG_clear());
                  AUTOTITRATEVAR.UserID = '';
                  AUTOTITRATEVAR.InstrumentID = '';
                  AUTOTITRATEVAR.Barcode = '';
                  setState(() {
                    AUTOTITRATEVAR.UserID = '';
                    AUTOTITRATEVAR.InstrumentID = '';
                    AUTOTITRATEVAR.Barcode = '';
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
                      .read<AUTOTITRATEMSG_Bloc>()
                      .add(AUTOTITRATEMSG_Reject());
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
