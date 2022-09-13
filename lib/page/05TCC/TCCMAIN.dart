import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/05-1-TCCBloc.dart';
import '../../bloc/BlocEvent/05-2-TCCMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'TCCVAR.dart';

//context.read<TCCBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext TCCMAINcontext;

class TCCMAIN extends StatefulWidget {
  TCCMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  TCCReceive? data;
  String? msg;

  @override
  State<TCCMAIN> createState() => _TCCMAINState();
}

class _TCCMAINState extends State<TCCMAIN> {
  @override
  void initState() {
    super.initState();
    // context.read<TCCBloc_Bloc>().add(TCCBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    TCCMAINcontext = context;
    TCCVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      TCCVAR.UserID = _UserID;
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      TCCVAR.InstrumentID = _InstrumentID;
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      TCCVAR.Barcode = _Barcode;
    }

    TCCVAR.SPEChi = widget.data?.SPEChi ?? '';
    TCCVAR.SPEClow = widget.data?.SPEClow ?? '';

    TCCVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    TCCVAR.SEND = widget.data?.SEND ?? '';
    TCCVAR.Result = widget.data?.Result ?? '';

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
                    "TCC",
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
                    isContr: TCCVAR.iscontrol,
                    fnContr: (input) {
                      TCCVAR.iscontrol = input;
                    },
                    sValue: TCCVAR.UserID,
                    returnfunc: (s) {
                      TCCVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<TCCMSG_Bloc>().add(TCCMSG_UserID());
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
                    isContr: TCCVAR.iscontrol,
                    fnContr: (input) {
                      TCCVAR.iscontrol = input;
                    },
                    sValue: TCCVAR.InstrumentID,
                    returnfunc: (s) {
                      TCCVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<TCCMSG_Bloc>().add(TCCMSG_Instrument());
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
                    isContr: TCCVAR.iscontrol,
                    fnContr: (input) {
                      TCCVAR.iscontrol = input;
                    },
                    sValue: TCCVAR.Barcode,
                    returnfunc: (s) {
                      TCCVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (TCCVAR.Barcode.length == 18) {
                          context.read<TCCMSG_Bloc>().add(TCCMSG_Barcode());
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
                      child: Center(child: Text(TCCVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<TCCBloc_Bloc>().add(TCCBloc_Read());
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
                          if (TCCVAR.SPEChi != '')
                            Center(child: Text('MAX:' + TCCVAR.SPEChi)),
                          if (TCCVAR.SPEClow != '')
                            Center(child: Text('MIN:' + TCCVAR.SPEClow)),
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
                          Center(child: Text(TCCVAR.Result)),
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
                  context.read<TCCMSG_Bloc>().add(TCCMSG_Select_Send());
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
                  TCCVAR.iscontrol = true;
                  context.read<TCCMSG_Bloc>().add(TCCMSG_clear());
                  TCCVAR.UserID = '';
                  TCCVAR.InstrumentID = '';
                  TCCVAR.Barcode = '';
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
                  context.read<TCCMSG_Bloc>().add(TCCMSG_Reject());
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
