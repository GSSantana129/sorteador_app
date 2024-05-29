import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class YoutubeRedirectPage extends StatelessWidget {
  Future<void> _launchURL() async {
    const url = 'https://www.youtube.com/watch?v=dQw4w9WgXcQ';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Youtube com um vídeo importante'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Abre e veja!', style: TextStyle(color: Colors.white),),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50), // Ajuste o padding aqui
            backgroundColor: Colors.deepPurple,
            textStyle: TextStyle(fontSize: 22),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
    );
  }
}
