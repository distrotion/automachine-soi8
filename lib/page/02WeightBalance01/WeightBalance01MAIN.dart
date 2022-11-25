import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/02-1-WeighBalance01Bloc.dart';
import '../../bloc/BlocEvent/02-2-WeighBalance01MSG.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/popup.dart';
import 'WeightBalance01VAR.dart';

//context.read<WeighBalance01Bloc_Bloc>().add(VALUEINPUT_CLEAR());
late BuildContext WeightBalance01MAINcontext;

class WeightBalance01MAIN extends StatefulWidget {
  WeightBalance01MAIN({
    Key? key,
    this.data,
    this.msg,
  }) : super(key: key);
  WeighBalance01Receive? data;
  String? msg;

  @override
  State<WeightBalance01MAIN> createState() => _WeightBalance01MAINState();
}

class _WeightBalance01MAINState extends State<WeightBalance01MAIN> {
  @override
  void initState() {
    super.initState();
    context.read<WeighBalance01Bloc_Bloc>().add(WeighBalance01Bloc_Read());
  }

  @override
  Widget build(BuildContext context) {
    WeightBalance01MAINcontext = context;
    WeightBalance01VAR.iscontrol = true;
    String _UserID = widget.data?.UserID ?? '';
    if (_UserID != '') {
      WeightBalance01VAR.UserID = _UserID;
    } else {
      WeightBalance01VAR.UserID = '';
    }
    String _InstrumentID = widget.data?.InstrumentID ?? '';
    if (_InstrumentID != '') {
      WeightBalance01VAR.InstrumentID = _InstrumentID;
    } else {
      WeightBalance01VAR.InstrumentID = '';
    }
    String _Barcode = widget.data?.Barcode ?? '';
    if (_Barcode != '') {
      WeightBalance01VAR.Barcode = _Barcode;
    } else {
      WeightBalance01VAR.Barcode = '';
    }

    WeightBalance01VAR.SPEChi = widget.data?.SPEChi ?? '';
    WeightBalance01VAR.SPEClow = widget.data?.SPEClow ?? '';

    WeightBalance01VAR.W11 = widget.data?.W11 ?? '';
    WeightBalance01VAR.W12 = widget.data?.W12 ?? '';
    WeightBalance01VAR.W13 = widget.data?.W13 ?? '';
    WeightBalance01VAR.A01 = widget.data?.A01 ?? '';

    WeightBalance01VAR.W21 = widget.data?.W21 ?? '';
    WeightBalance01VAR.W22 = widget.data?.W22 ?? '';
    WeightBalance01VAR.W23 = widget.data?.W23 ?? '';
    WeightBalance01VAR.A02 = widget.data?.A02 ?? '';

    WeightBalance01VAR.W31 = widget.data?.W31 ?? '';
    WeightBalance01VAR.W32 = widget.data?.W32 ?? '';
    WeightBalance01VAR.W33 = widget.data?.W33 ?? '';
    WeightBalance01VAR.A03 = widget.data?.A03 ?? '';

    WeightBalance01VAR.DataPreview = widget.data?.DataPreview ?? ''; //SEND
    WeightBalance01VAR.SEND = widget.data?.SEND ?? '';
    WeightBalance01VAR.Result = widget.data?.Result ?? '';

    WeightBalance01VAR.dip12 = widget.data?.dip12 ?? '';
    WeightBalance01VAR.dip13 = widget.data?.dip13 ?? '';
    WeightBalance01VAR.dip23 = widget.data?.dip23 ?? '';

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
                    "BALANCE 01 (1)",
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
                    isContr: WeightBalance01VAR.iscontrol,
                    fnContr: (input) {
                      WeightBalance01VAR.iscontrol = input;
                    },
                    sValue: WeightBalance01VAR.UserID,
                    returnfunc: (s) {
                      WeightBalance01VAR.UserID = s;
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
                            .read<WeighBalance01MSG_Bloc>()
                            .add(WeighBalance01MSG_UserID());
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
                    isContr: WeightBalance01VAR.iscontrol,
                    fnContr: (input) {
                      WeightBalance01VAR.iscontrol = input;
                    },
                    sValue: WeightBalance01VAR.InstrumentID,
                    returnfunc: (s) {
                      WeightBalance01VAR.InstrumentID = s;
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
                            .read<WeighBalance01MSG_Bloc>()
                            .add(WeighBalance01MSG_Instrument());
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
                    isContr: WeightBalance01VAR.iscontrol,
                    fnContr: (input) {
                      WeightBalance01VAR.iscontrol = input;
                    },
                    sValue: WeightBalance01VAR.Barcode,
                    returnfunc: (s) {
                      WeightBalance01VAR.Barcode = s;
                    },
                    isEnabled:
                        _UserID != '' && _InstrumentID != '' && _Barcode == '',
                  ),
                  InkWell(
                    onTap: () {
                      if (_UserID != '' &&
                          _InstrumentID != '' &&
                          _Barcode == '') {
                        if (WeightBalance01VAR.Barcode.length == 18) {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Barcode());
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
                      child:
                          Center(child: Text(WeightBalance01VAR.DataPreview)),
                    ),
                    InkWell(
                      onTap: () {
                        //
                        context
                            .read<WeighBalance01Bloc_Bloc>()
                            .add(WeighBalance01Bloc_Read());
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
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          if (WeightBalance01VAR.SEND == '') {
                            context
                                .read<WeighBalance01MSG_Bloc>()
                                .add(WeighBalance01MSG_Select_W1());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 95,
                          color: WeightBalance01VAR.SEND == ''
                              ? Colors.green
                              : Colors.grey.shade400,
                          child: const Center(
                            child: Text("N1"),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 95,
                        color: Colors.blue,
                        child: Center(child: Text(WeightBalance01VAR.W11)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        width: 95,
                        color: Colors.blue,
                        child: Center(child: Text(WeightBalance01VAR.W12)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        width: 95,
                        color: Colors.blue,
                        child: Center(child: Text(WeightBalance01VAR.W13)),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 40,
                        width: 95,
                        color: Colors.green.shade200,
                        child: Center(child: Text(WeightBalance01VAR.A01)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {
                          if (WeightBalance01VAR.SEND == '') {
                            context
                                .read<WeighBalance01MSG_Bloc>()
                                .add(WeighBalance01MSG_Back_W1());
                          }
                        },
                        child: Container(
                          height: 40,
                          width: 95,
                          color: WeightBalance01VAR.SEND == ''
                              ? Colors.orange
                              : Colors.grey.shade400,
                          child: const Center(
                            child: Text("BACK N1"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(children: [
                    InkWell(
                      onTap: () {
                        if (WeightBalance01VAR.SEND == '') {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Select_W2());
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 95,
                        color: WeightBalance01VAR.SEND == ''
                            ? Colors.green
                            : Colors.grey.shade400,
                        child: const Center(
                          child: Text("N2"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W21)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W22)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W23)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.green.shade200,
                      child: Center(child: Text(WeightBalance01VAR.A02)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (WeightBalance01VAR.SEND == '') {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Back_W2());
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 95,
                        color: WeightBalance01VAR.SEND == ''
                            ? Colors.orange
                            : Colors.grey.shade400,
                        child: const Center(
                          child: Text("BACK N2"),
                        ),
                      ),
                    ),
                  ]),
                  const Spacer(),
                  Column(children: [
                    InkWell(
                      onTap: () {
                        if (WeightBalance01VAR.SEND == '') {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Select_W3());
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 95,
                        color: WeightBalance01VAR.SEND == ''
                            ? Colors.green
                            : Colors.grey.shade400,
                        child: const Center(
                          child: Text("N3"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W31)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W32)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.blue,
                      child: Center(child: Text(WeightBalance01VAR.W33)),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 40,
                      width: 95,
                      color: Colors.green.shade200,
                      child: Center(child: Text(WeightBalance01VAR.A03)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () {
                        if (WeightBalance01VAR.SEND == '') {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Back_W3());
                        }
                      },
                      child: Container(
                        height: 40,
                        width: 95,
                        color: WeightBalance01VAR.SEND == ''
                            ? Colors.orange
                            : Colors.grey.shade400,
                        child: const Center(
                          child: Text("BACK N3"),
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        if (WeightBalance01VAR.dip12 != '') ...[
                          Container(
                            height: 40,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "dip 1-2 : " + WeightBalance01VAR.dip12,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                        if (WeightBalance01VAR.dip13 != '') ...[
                          Container(
                            height: 40,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "dip 1-3 : " + WeightBalance01VAR.dip13,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            height: 40,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "dip 2-3 : " + WeightBalance01VAR.dip23,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        if (WeightBalance01VAR.SEND == '') {
                          context
                              .read<WeighBalance01MSG_Bloc>()
                              .add(WeighBalance01MSG_Recal());
                        }
                      },
                      child: Container(
                        height: WeightBalance01VAR.dip13 != ''
                            ? 120
                            : WeightBalance01VAR.dip12 != ''
                                ? 40
                                : 0,
                        color: Colors.amber,
                        child: const Center(
                          child: Text(
                            "RECAL",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
                          if (WeightBalance01VAR.SPEChi != '')
                            Center(
                                child:
                                    Text('MAX:' + WeightBalance01VAR.SPEChi)),
                          if (WeightBalance01VAR.SPEClow != '')
                            Center(
                                child:
                                    Text('MIN:' + WeightBalance01VAR.SPEClow)),
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
                          Center(child: Text(WeightBalance01VAR.Result)),
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
                  context
                      .read<WeighBalance01MSG_Bloc>()
                      .add(WeighBalance01MSG_Select_Send());
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
                  WeightBalance01VAR.iscontrol = true;
                  context
                      .read<WeighBalance01MSG_Bloc>()
                      .add(WeighBalance01MSG_clear());
                  WeightBalance01VAR.UserID = '';
                  WeightBalance01VAR.InstrumentID = '';
                  WeightBalance01VAR.Barcode = '';
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
                  context
                      .read<WeighBalance01MSG_Bloc>()
                      .add(WeighBalance01MSG_Reject());
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
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
