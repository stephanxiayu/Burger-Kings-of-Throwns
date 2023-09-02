import 'package:burgerking_apitest/Components/AppScaffold.dart';
import 'package:burgerking_apitest/Shared/styles.dart';
import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProfilDetailScreen extends StatelessWidget {
   ProfilDetailScreen({super.key});
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();


 
  @override
Widget build(BuildContext context) {
  return AppScaffold(
    
    child: Container(color:Styles.of(context).darkblue ,
      child: SfPdfViewer.asset(
        'assets/cv.pdf',
        key: _pdfViewerKey,
      ),
    ),
  );
}
}