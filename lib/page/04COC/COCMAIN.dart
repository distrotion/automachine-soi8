import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/04-1-COCBloc.dart';
import '../../bloc/BlocEvent/04-2-COCMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'COCVAR.dart';

//context.read<COCBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext COCMAINcontext;

class COCMAIN extends StatefulWidget {
  COCMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  COCReceive? data;
  String? msg;

  @override
  State<COCMAIN> createState() => _COCMAINState();
}

class _COCMAINState extends State<COCMAIN> {
  @override
  void initState() {
    super.initState();
    // context.read<COCBloc_Bloc>().add(COCBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    COCMAINcontext = context;
    COCVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      COCVAR.UserID = _UserID;
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      COCVAR.InstrumentID = _InstrumentID;
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      COCVAR.Barcode = _Barcode;
    }

    COCVAR.SPEChi = widget.data?.SPEChi ?? '';
    COCVAR.SPEClow = widget.data?.SPEClow ?? '';

    COCVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    COCVAR.SEND = widget.data?.SEND ?? '';
    COCVAR.Result = widget.data?.Result ?? '';

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
                    "COC",
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
                    isContr: COCVAR.iscontrol,
                    fnContr: (input) {
                      COCVAR.iscontrol = input;
                    },
                    sValue: COCVAR.UserID,
                    returnfunc: (s) {
                      COCVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<COCMSG_Bloc>().add(COCMSG_UserID());
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
                    isContr: COCVAR.iscontrol,
                    fnContr: (input) {
                      COCVAR.iscontrol = input;
                    },
                    sValue: COCVAR.InstrumentID,
                    returnfunc: (s) {
                      COCVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<COCMSG_Bloc>().add(COCMSG_Instrument());
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
                    isContr: COCVAR.iscontrol,
                    fnContr: (input) {
                      COCVAR.iscontrol = input;
                    },
                    sValue: COCVAR.Barcode,
                    returnfunc: (s) {
                      COCVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (COCVAR.Barcode.length == 18) {
                          context.read<COCMSG_Bloc>().add(COCMSG_Barcode());
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
                      child: Center(child: Text(COCVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<COCBloc_Bloc>().add(COCBloc_Read());
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
                          if (COCVAR.SPEChi != '')
                            Center(child: Text('MAX:' + COCVAR.SPEChi)),
                          if (COCVAR.SPEClow != '')
                            Center(child: Text('MIN:' + COCVAR.SPEClow)),
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
                          Center(child: Text(COCVAR.Result)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  context.read<COCMSG_Bloc>().add(COCMSG_Select_Send());
                },
                child: Container(
                  height: 62,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "SEND DATA",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  COCVAR.iscontrol = true;
                  context.read<COCMSG_Bloc>().add(COCMSG_clear());
                  COCVAR.UserID = '';
                  COCVAR.InstrumentID = '';
                  COCVAR.Barcode = '';
                  setState(() {});
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
                  context.read<COCMSG_Bloc>().add(COCMSG_Reject());
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
