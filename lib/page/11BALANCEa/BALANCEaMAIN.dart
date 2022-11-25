import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/11-1-BALANCEaBloc.dart';
import '../../bloc/BlocEvent/11-2-BALANCEaMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'BALANCEaVAR.dart';

//context.read<BALANCEaBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext BALANCEaMAINcontext;

class BALANCEaMAIN extends StatefulWidget {
  BALANCEaMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  BALANCEaReceive? data;
  String? msg;

  @override
  State<BALANCEaMAIN> createState() => _BALANCEaMAINState();
}

class _BALANCEaMAINState extends State<BALANCEaMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<BALANCEaBloc_Bloc>().add(BALANCEaBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    BALANCEaMAINcontext = context;
    BALANCEaVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      BALANCEaVAR.UserID = _UserID;
    } else {
      BALANCEaVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      BALANCEaVAR.InstrumentID = _InstrumentID;
    } else {
      BALANCEaVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      BALANCEaVAR.Barcode = _Barcode;
    } else {
      BALANCEaVAR.Barcode = '';
    }

    BALANCEaVAR.SPEChi = widget.data?.SPEChi ?? '';
    BALANCEaVAR.SPEClow = widget.data?.SPEClow ?? '';

    BALANCEaVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    BALANCEaVAR.SEND = widget.data?.SEND ?? '';
    BALANCEaVAR.Result = widget.data?.Result ?? '';

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
                    "BALANCEa",
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
                    isContr: BALANCEaVAR.iscontrol,
                    fnContr: (input) {
                      BALANCEaVAR.iscontrol = input;
                    },
                    sValue: BALANCEaVAR.UserID,
                    returnfunc: (s) {
                      BALANCEaVAR.UserID = s;
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
                            .read<BALANCEaMSG_Bloc>()
                            .add(BALANCEaMSG_UserID());
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
                    isContr: BALANCEaVAR.iscontrol,
                    fnContr: (input) {
                      BALANCEaVAR.iscontrol = input;
                    },
                    sValue: BALANCEaVAR.InstrumentID,
                    returnfunc: (s) {
                      BALANCEaVAR.InstrumentID = s;
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
                            .read<BALANCEaMSG_Bloc>()
                            .add(BALANCEaMSG_Instrument());
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
                    isContr: BALANCEaVAR.iscontrol,
                    fnContr: (input) {
                      BALANCEaVAR.iscontrol = input;
                    },
                    sValue: BALANCEaVAR.Barcode,
                    returnfunc: (s) {
                      BALANCEaVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (BALANCEaVAR.Barcode.length == 18) {
                          context
                              .read<BALANCEaMSG_Bloc>()
                              .add(BALANCEaMSG_Barcode());
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
                      child: Center(child: Text(BALANCEaVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<BALANCEaBloc_Bloc>()
                            .add(BALANCEaBloc_Read());
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
                          if (BALANCEaVAR.SPEChi != '')
                            Center(child: Text('MAX:' + BALANCEaVAR.SPEChi)),
                          if (BALANCEaVAR.SPEClow != '')
                            Center(child: Text('MIN:' + BALANCEaVAR.SPEClow)),
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
                          Center(child: Text(BALANCEaVAR.Result)),
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
              //     context.read<BALANCEaMSG_Bloc>().add(BALANCEaMSG_Select_Send());
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
                  BALANCEaVAR.iscontrol = true;
                  context.read<BALANCEaMSG_Bloc>().add(BALANCEaMSG_clear());
                  BALANCEaVAR.UserID = '';
                  BALANCEaVAR.InstrumentID = '';
                  BALANCEaVAR.Barcode = '';
                  setState(() {
                    BALANCEaVAR.UserID = '';
                    BALANCEaVAR.InstrumentID = '';
                    BALANCEaVAR.Barcode = '';
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
                  context.read<BALANCEaMSG_Bloc>().add(BALANCEaMSG_Reject());
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
