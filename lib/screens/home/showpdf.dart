import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:flutter_media_downloader/flutter_media_downloader.dart';

class ShowPdf extends StatelessWidget {

  final String pdfUrl = "https://firebasestorage.googleapis.com/v0/b/mprprojectsem4.appspot.com/o/CrimsonRoyaleMenu.pdf?alt=media&token=4c846cec-8926-4634-9128-af2c2d26a036";
  final _flutterMediaDownloaderPlugin = MediaDownload();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("Menu"),
        actions: [
          InkWell(onTap: (){

            _flutterMediaDownloaderPlugin.downloadMedia(context,pdfUrl);

          },child: const Chip(label: Text("Download"),),),
          SizedBox(
            width: size.width*0.04,
          ),
        ],
      ),
      body: PDF().fromAsset("assets/CrimsonRoyaleMenu.pdf"),
    );
  }
}
