import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:hsmentor/pages/pagina_principal.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) async {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const PaginaPrincipal()),
    );

    final pres = await SharedPreferences.getInstance();
    pres.setBool("onboarding", true);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      globalBackgroundColor: Colors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 20000,
      infiniteAutoScroll: true,
      bodyPadding: const EdgeInsets.only(top: 50),
      globalHeader: Align(
        alignment: Alignment.topRight,
      ),
      globalFooter: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          child: const Text(
            'Deixem-me usar a app pá!',
            style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6BBA75)),
          ),
          onPressed: () => _onIntroEnd(context),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Bem-vindo ao HSMentor!",
          body: "A App que te ajuda a sobreviver no Técnico",
          image: Image.asset(
            'assets/Welcome-pana.png',
            height: 750,
            width: 750,
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Navegação",
          body:
              "Utiliza o nosso sistema de navegação para te orientares no campus labiríntico da Alameda",
          image: Image.asset('assets/Directions-pana.png',
              height: 750, width: 750),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Comida",
          body:
              "Vê preços, menus, avaliações e lotações na nossa página dedicada às cantinas e bares do Técnico",
          image: Image.asset('assets/Coffee-shop-pana.png',
              height: 750, width: 750),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Notícias",
          body: "Descobre as últimas novidades da vida académica",
          image: Image.asset('assets/Beer-Celebration-pana.png',
              height: 750, width: 750),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "FAQ",
          body: "Encontrarás as respostas a todas as tuas perguntas",
          image:
              Image.asset('assets/Questions-pana.png', height: 750, width: 750),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      //rtl: true, // Display as right-to-left
      back: const Icon(Icons.arrow_back),
      skip: const Text('Saltar',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF6BBA75))),
      next: const Icon(Icons.arrow_forward, color: Color(0xFF6BBA75)),
      done: const Text('Fim',
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF6BBA75))),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: Color(0xFF6BBA75),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: Colors.black87,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}
