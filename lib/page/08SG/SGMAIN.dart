import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/08-1-SGBloc.dart';
import '../../bloc/BlocEvent/08-2-SGMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'SGVAR.dart';

//context.read<SGBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext SGMAINcontext;

class SGMAIN extends StatefulWidget {
  SGMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  SGReceive? data;
  String? msg;

  @override
  State<SGMAIN> createState() => _SGMAINState();
}

class _SGMAINState extends State<SGMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<SGBloc_Bloc>().add(SGBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    SGMAINcontext = context;
    SGVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      SGVAR.UserID = _UserID;
    } else {
      SGVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      SGVAR.InstrumentID = _InstrumentID;
    } else {
      SGVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      SGVAR.Barcode = _Barcode;
    } else {
      SGVAR.Barcode = '';
    }

    SGVAR.SPEChi = widget.data?.SPEChi ?? '';
    SGVAR.SPEClow = widget.data?.SPEClow ?? '';

    SGVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    SGVAR.SEND = widget.data?.SEND ?? '';
    SGVAR.Result = widget.data?.Result ?? '';

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
                    "SG",
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
                    isContr: SGVAR.iscontrol,
                    fnContr: (input) {
                      SGVAR.iscontrol = input;
                    },
                    sValue: SGVAR.UserID,
                    returnfunc: (s) {
                      SGVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<SGMSG_Bloc>().add(SGMSG_UserID());
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
                    isContr: SGVAR.iscontrol,
                    fnContr: (input) {
                      SGVAR.iscontrol = input;
                    },
                    sValue: SGVAR.InstrumentID,
                    returnfunc: (s) {
                      SGVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<SGMSG_Bloc>().add(SGMSG_Instrument());
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
                    isContr: SGVAR.iscontrol,
                    fnContr: (input) {
                      SGVAR.iscontrol = input;
                    },
                    sValue: SGVAR.Barcode,
                    returnfunc: (s) {
                      SGVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (SGVAR.Barcode.length == 18) {
                          context.read<SGMSG_Bloc>().add(SGMSG_Barcode());
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
                      child: Center(child: Text(SGVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<SGBloc_Bloc>().add(SGBloc_Read());
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
                          if (SGVAR.SPEChi != '')
                            Center(child: Text('MAX:' + SGVAR.SPEChi)),
                          if (SGVAR.SPEClow != '')
                            Center(child: Text('MIN:' + SGVAR.SPEClow)),
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
                          Center(child: Text(SGVAR.Result)),
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
              //     context.read<SGMSG_Bloc>().add(SGMSG_Select_Send());
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
                  SGVAR.iscontrol = true;
                  context.read<SGMSG_Bloc>().add(SGMSG_clear());
                  SGVAR.UserID = '';
                  SGVAR.InstrumentID = '';
                  SGVAR.Barcode = '';
                  setState(() {
                    SGVAR.UserID = '';
                    SGVAR.InstrumentID = '';
                    SGVAR.Barcode = '';
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
                  context.read<SGMSG_Bloc>().add(SGMSG_Reject());
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
