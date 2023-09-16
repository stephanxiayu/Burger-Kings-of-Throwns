import 'package:burgerking_apitest/Components/app_scaffold.dart';
import 'package:burgerking_apitest/Screen/Profiles/profil_screen.dart';
import 'package:burgerking_apitest/Shared/global_contraoller.dart';

import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProfilDetailScreen extends StatelessWidget {
   ProfilDetailScreen({super.key});
  final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();


 
  @override
Widget build(BuildContext context) {
  GlobalController globalController= GlobalController();
  return AppScaffold(
    selectedPage: ProfilScreen.pageName,
    
child: 
        Container(
          height: MediaQuery.of(context).size.width * 2,
          color:globalController.darkblue ,
          child: SfPdfViewer.asset(enableDoubleTapZooming: true,
            'assets/cv.pdf',
            key: _pdfViewerKey,
            pageLayoutMode: PdfPageLayoutMode.continuous
          ),
        ),
       
      
    
  );
}
}