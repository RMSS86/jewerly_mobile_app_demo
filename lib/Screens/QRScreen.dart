import 'package:flutter/material.dart';
import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../components/GeneralDrawer.dart';


//QREntryPage

class QREntryPage extends StatelessWidget
{
    static String id = 'qr_code_reader';
    const QREntryPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            extendBodyBehindAppBar: true,//ANDROID ONLY

            appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: Builder(
                    builder: (context)
                    {
                        return Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: IconButton(
                                icon: Icon(Icons.menu),
                                color: Colors.grey.shade400,
                                onPressed: ()
                                {
                                    Scaffold.of(context).openDrawer();
                                }
                            )
                        );
                    }
                )
            ),
            drawer: Drawer_(),
            body: Center(
                child: _QREntryPage()
            )
        );
    }
}
//QREntryPage_

class _QREntryPage extends StatefulWidget
{
    const _QREntryPage({Key? key}) : super(key: key);

    @override
    State<StatefulWidget> createState() => _QREntryPageState();
}

class _QREntryPageState extends State<_QREntryPage>
{
    Barcode? result;
    QRViewController? controller;
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

    // In order to get hot reload to work we need to pause the camera if the platform
    // is android, or resume the camera if the platform is iOS.
    @override
    void reassemble() 
    {
        super.reassemble();
        if (Platform.isAndroid) 
        {
            controller!.pauseCamera();
        }
        controller!.resumeCamera();
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

            floatingActionButton:
            FloatingActionButton(
                onPressed: ()
                {
                    print('${result!.code ?? ''}');
                },
                child: Icon(Icons.qr_code_scanner_outlined, color: Theme.of(context).colorScheme.inversePrimary)),
            body: Column(
                children: <Widget>[
                    Expanded(flex: 4, child: _buildQrView(context))

                    // Expanded(
                    //   flex: 1,
                    //   child: FittedBox(
                    //     fit: BoxFit.contain,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //       children: <Widget>[
                    // if (result != null)
                    //   Text(
                    //       'Barcode Type: ${result!.format.name}   Data: ${result!.code}')
                    //Barcode Type: ${describeEnum(result!.format.name)}   Data: ${result!.code}')

                    // else
                    // const Text('Scan a code'),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    // Container(
                    //   margin: const EdgeInsets.all(8),
                    //   child: ElevatedButton(
                    //       onPressed: () async {
                    //         await controller?.toggleFlash();
                    //         setState(() {});
                    //       },
                    //       child: FutureBuilder(
                    //         future: controller?.getFlashStatus(),
                    //         builder: (context, snapshot) {
                    //           return Text('Flash: ${snapshot.data}');
                    //         },
                    //       )),
                    // ),
                    // Container(
                    //   margin: const EdgeInsets.all(8),
                    //   child: ElevatedButton(
                    //       onPressed: () async {
                    //         await controller?.flipCamera();
                    //         setState(() {});
                    //       },
                    //       child: FutureBuilder(
                    //         future: controller?.getCameraInfo(),
                    //         builder: (context, snapshot) {
                    //           if (snapshot.data != null) {
                    //             return Text(
                    //                 'Camera facing ${(snapshot.data!.name)}');
                    //           } else {
                    //             return const Text('loading');
                    //           }
                    //         },
                    //       )),
                    // )
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   crossAxisAlignment: CrossAxisAlignment.center,
                    //   children: <Widget>[
                    //     Container(
                    //       margin: const EdgeInsets.all(8),
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           await controller?.pauseCamera();
                    //         },
                    //         child: const Text('pause',
                    //             style: TextStyle(fontSize: 20)),
                    //       ),
                    //     ),
                    //     Container(
                    //       margin: const EdgeInsets.all(8),
                    //       child: ElevatedButton(
                    //         onPressed: () async {
                    //           await controller?.resumeCamera();
                    //         },
                    //         child: const Text('resume',
                    //             style: TextStyle(fontSize: 20)),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    //       ],
                    //     ),
                    //   ),
                    // )
                ]
            )
        );
    }

    Widget _buildQrView(BuildContext context) 
    {
        // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
        var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
            ? 300.0
            : 500.0;
        // To ensure the Scanner view is properly sizes after rotation
        // we need to listen for Flutter SizeChanged notification and update controller
        return QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
                borderColor: Colors.black,
                borderRadius: 10,
                borderLength: 30,
                borderWidth: 10,
                cutOutSize: scanArea),
            onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p)
        );
    }

    void _onQRViewCreated(QRViewController controller) 
    {
        setState(()
            {
                this.controller = controller;
            }
        );
        controller.scannedDataStream.listen((scanData)
            {
                setState(()
                    {
                        result = scanData;
                    }
                );
            }
        );
    }

    void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) 
    {
        log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
        if (!p) 
        {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('no Permission'))
            );
        }
    }

    @override
    void dispose() 
    {
        controller?.dispose();
        super.dispose();
    }
}

