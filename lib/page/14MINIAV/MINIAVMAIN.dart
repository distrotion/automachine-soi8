import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/14-1-MINIAVBloc.dart';
import '../../bloc/BlocEvent/14-2-MINIAVMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';

import 'MINIAVVAR.dart';

//context.read<MINIAVBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext MINIAVMAINcontext;

class MINIAVMAIN extends StatefulWidget {
  MINIAVMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  MINIAVReceive? data;
  String? msg;

  @override
  State<MINIAVMAIN> createState() => _MINIAVMAINState();
}

class _MINIAVMAINState extends State<MINIAVMAIN> {
  @override
  void initState() {
    super.initState();
    context.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    MINIAVMAINcontext = context;
    MINIAVVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      MINIAVVAR.UserID = _UserID;
    } else {
      MINIAVVAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      MINIAVVAR.InstrumentID = _InstrumentID;
    } else {
      MINIAVVAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      MINIAVVAR.Barcode = _Barcode;
    } else {
      MINIAVVAR.Barcode = '';
    }

    MINIAVVAR.SPEChi = widget.data?.SPEChi ?? '';
    MINIAVVAR.SPEClow = widget.data?.SPEClow ?? '';

    MINIAVVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    MINIAVVAR.SEND = widget.data?.SEND ?? '';
    MINIAVVAR.Result = widget.data?.Result ?? '';

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
                    "MINIAV",
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
                    isContr: MINIAVVAR.iscontrol,
                    fnContr: (input) {
                      MINIAVVAR.iscontrol = input;
                    },
                    sValue: MINIAVVAR.UserID,
                    returnfunc: (s) {
                      MINIAVVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<MINIAVMSG_Bloc>().add(MINIAVMSG_UserID());
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
                    isContr: MINIAVVAR.iscontrol,
                    fnContr: (input) {
                      MINIAVVAR.iscontrol = input;
                    },
                    sValue: MINIAVVAR.InstrumentID,
                    returnfunc: (s) {
                      MINIAVVAR.InstrumentID = s;
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
                            .read<MINIAVMSG_Bloc>()
                            .add(MINIAVMSG_Instrument());
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
                    isContr: MINIAVVAR.iscontrol,
                    fnContr: (input) {
                      MINIAVVAR.iscontrol = input;
                    },
                    sValue: MINIAVVAR.Barcode,
                    returnfunc: (s) {
                      MINIAVVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (MINIAVVAR.Barcode.length == 18) {
                          context
                              .read<MINIAVMSG_Bloc>()
                              .add(MINIAVMSG_Barcode());
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
                      child: Center(child: Text(MINIAVVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<MINIAVBloc_Bloc>().add(MINIAVBloc_Read());
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
                          if (MINIAVVAR.SPEChi != '')
                            Center(child: Text('MAX:' + MINIAVVAR.SPEChi)),
                          if (MINIAVVAR.SPEClow != '')
                            Center(child: Text('MIN:' + MINIAVVAR.SPEClow)),
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
                          Center(child: Text(MINIAVVAR.Result)),
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
              //     context.read<MINIAVMSG_Bloc>().add(MINIAVMSG_Select_Send());
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
                  MINIAVVAR.iscontrol = true;
                  context.read<MINIAVMSG_Bloc>().add(MINIAVMSG_clear());
                  MINIAVVAR.UserID = '';
                  MINIAVVAR.InstrumentID = '';
                  MINIAVVAR.Barcode = '';
                  setState(() {
                    MINIAVVAR.UserID = '';
                    MINIAVVAR.InstrumentID = '';
                    MINIAVVAR.Barcode = '';
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
                  context.read<MINIAVMSG_Bloc>().add(MINIAVMSG_Reject());
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
