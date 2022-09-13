import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/06-1-SCCBloc.dart';
import '../../bloc/BlocEvent/06-2-SCCMSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'SCCVAR.dart';

//context.read<SCCBloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext SCCMAINcontext;

class SCCMAIN extends StatefulWidget {
  SCCMAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  SCCReceive? data;
  String? msg;

  @override
  State<SCCMAIN> createState() => _SCCMAINState();
}

class _SCCMAINState extends State<SCCMAIN> {
  @override
  void initState() {
    super.initState();
    // context.read<SCCBloc_Bloc>().add(SCCBloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    SCCMAINcontext = context;
    SCCVAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      SCCVAR.UserID = _UserID;
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      SCCVAR.InstrumentID = _InstrumentID;
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      SCCVAR.Barcode = _Barcode;
    }

    SCCVAR.SPEChi = widget.data?.SPEChi ?? '';
    SCCVAR.SPEClow = widget.data?.SPEClow ?? '';

    SCCVAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    SCCVAR.SEND = widget.data?.SEND ?? '';
    SCCVAR.Result = widget.data?.Result ?? '';

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
                    "SCC",
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
                    isContr: SCCVAR.iscontrol,
                    fnContr: (input) {
                      SCCVAR.iscontrol = input;
                    },
                    sValue: SCCVAR.UserID,
                    returnfunc: (s) {
                      SCCVAR.UserID = s;
                    },
                    isEnabled:
                        _UserID == '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID == '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<SCCMSG_Bloc>().add(SCCMSG_UserID());
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
                    isContr: SCCVAR.iscontrol,
                    fnContr: (input) {
                      SCCVAR.iscontrol = input;
                    },
                    sValue: SCCVAR.InstrumentID,
                    returnfunc: (s) {
                      SCCVAR.InstrumentID = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID == '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID == '' &&
                          _Barcode == '') {
                        context.read<SCCMSG_Bloc>().add(SCCMSG_Instrument());
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
                    isContr: SCCVAR.iscontrol,
                    fnContr: (input) {
                      SCCVAR.iscontrol = input;
                    },
                    sValue: SCCVAR.Barcode,
                    returnfunc: (s) {
                      SCCVAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (SCCVAR.Barcode.length == 18) {
                          context.read<SCCMSG_Bloc>().add(SCCMSG_Barcode());
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
                      child: Center(child: Text(SCCVAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context.read<SCCBloc_Bloc>().add(SCCBloc_Read());
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
                          if (SCCVAR.SPEChi != '')
                            Center(child: Text('MAX:' + SCCVAR.SPEChi)),
                          if (SCCVAR.SPEClow != '')
                            Center(child: Text('MIN:' + SCCVAR.SPEClow)),
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
                          Center(child: Text(SCCVAR.Result)),
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
                  context.read<SCCMSG_Bloc>().add(SCCMSG_Select_Send());
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
                  SCCVAR.iscontrol = true;
                  context.read<SCCMSG_Bloc>().add(SCCMSG_clear());
                  SCCVAR.UserID = '';
                  SCCVAR.InstrumentID = '';
                  SCCVAR.Barcode = '';
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
                  context.read<SCCMSG_Bloc>().add(SCCMSG_Reject());
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
