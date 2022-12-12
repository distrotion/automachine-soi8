import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/15-1-ECmBloc.dart';
import '../../bloc/BlocEvent/15-2-ECmMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'ECmVAR.dart';

//context.read<ECmBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext ECmMAINcontext;

class ECmMAIN extends StatefulWidget {
  ECmMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  ECmReceive? data;
  String? msg;

  @override
  State<ECmMAIN> createState() => _ECmMAINState();
}

class _ECmMAINState extends State<ECmMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<ECmBloc_Bloc>().add(ECmBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    ECmMAINcontext = context;
    ECmVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      ECmVAR.UserID = _UserID;
    } else {
      ECmVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      ECmVAR.InstrumentID = _InstrumentID;
    } else {
      ECmVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      ECmVAR.Barcode = _Barcode;
    } else {
      ECmVAR.Barcode = '';
    }

    ECmVAR.SPEChi = widget.data?.SPEChi ?? '';
    ECmVAR.SPEClow = widget.data?.SPEClow ?? '';

    ECmVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    ECmVAR.SEND = widget.data?.SEND ?? '';
    ECmVAR.Result = widget.data?.Result ?? '';

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
                    "ECm",
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
                    isContr: ECmVAR.iscontrol,
                    fnContr: (input) {
                      ECmVAR.iscontrol = input;
                    },
                    sValue: ECmVAR.UserID,
                    returnfunc: (s) {
                      ECmVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<ECmMSG_Bloc>().add(ECmMSG_UserID());
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
                    isContr: ECmVAR.iscontrol,
                    fnContr: (input) {
                      ECmVAR.iscontrol = input;
                    },
                    sValue: ECmVAR.InstrumentID,
                    returnfunc: (s) {
                      ECmVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<ECmMSG_Bloc>().add(ECmMSG_Instrument());
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
                    isContr: ECmVAR.iscontrol,
                    fnContr: (input) {
                      ECmVAR.iscontrol = input;
                    },
                    sValue: ECmVAR.Barcode,
                    returnfunc: (s) {
                      ECmVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (ECmVAR.Barcode.length == 18) {
                          context.read<ECmMSG_Bloc>().add(ECmMSG_Barcode());
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
                      child: Center(child: Text(ECmVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<ECmBloc_Bloc>().add(ECmBloc_Read());
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
                          if (ECmVAR.SPEChi != '')
                            Center(child: Text('MAX:' + ECmVAR.SPEChi)),
                          if (ECmVAR.SPEClow != '')
                            Center(child: Text('MIN:' + ECmVAR.SPEClow)),
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
                          Center(child: Text(ECmVAR.Result)),
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
              //     context.read<ECmMSG_Bloc>().add(ECmMSG_Select_Send());
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
                  ECmVAR.iscontrol = true;
                  context.read<ECmMSG_Bloc>().add(ECmMSG_clear());
                  ECmVAR.UserID = '';
                  ECmVAR.InstrumentID = '';
                  ECmVAR.Barcode = '';
                  setState(() {
                    ECmVAR.UserID = '';
                    ECmVAR.InstrumentID = '';
                    ECmVAR.Barcode = '';
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
                  context.read<ECmMSG_Bloc>().add(ECmMSG_Reject());
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
