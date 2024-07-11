import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:typewritertext/typewritertext.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MaterialApp(
    home: LnlyApp(),
  ));
}

class LnlyApp extends StatelessWidget {
  const LnlyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: OnBoardingScreen(),
    );
  }
}

class GetStarted extends StatelessWidget {
  const GetStarted({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            opacity: 0.3,
            image: AssetImage(
              'assets/images/bg_img_4.jpg',
            ),
          ),
        ),
        // TODO: add bg img
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // TODO: add pade title
                  Text(
                    'Let\'s Get Started',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.spaceGrotesk(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // TODO: add page description
                  Text(
                    'You\'re about to get the best learning experience ever. Let\'s go!',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            // TODO: add 2 action btns
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // 'Sign up' btn
                  ActionBtn(
                    btnText: 'Sign up',
                    btnColor: Colors.purple[900],
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Register(),
                        )),
                  ),
                  const SizedBox(height: 25),
                  // 'Log in' btn
                  ActionBtn(
                    btnText: 'Sign in',
                    btnColor: Colors.transparent,
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const Login(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final String btnText;
  final Color? btnColor;
  final Function()? onPressed;
  const ActionBtn(
      {super.key,
      required this.btnText,
      required this.btnColor,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        backgroundColor: btnColor,
        disabledBackgroundColor: Colors.purple[100],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        side: (btnColor == Colors.transparent)
            ? const BorderSide(
                color: Colors.white,
              )
            : BorderSide.none,
      ),
      child: Text(
        btnText,
        style: GoogleFonts.rubik(
          fontSize: 23,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// login page
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  IconData? pswVisbilityIcon = Icons.visibility_outlined;
  bool isPswVisible = false;
  final _uNameEmAddrController = TextEditingController();
  final _pswController = TextEditingController();

  @override
  void dispose() {
    _uNameEmAddrController.dispose();
    _pswController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Colors.purple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 35,
          horizontal: 20,
        ),
        children: [
          Text(
            'Sign in to your\nLearning Dashboard',
            style: GoogleFonts.rubik(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          // TODO: add textfields
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _uNameEmAddrController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(
                'Username or email address',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _pswController,
            keyboardType: TextInputType.visiblePassword,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            obscureText: (isPswVisible) ? false : true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (!isPswVisible) {
                      //
                      pswVisbilityIcon = Icons.visibility_off_outlined;
                      isPswVisible = true;
                    } else {
                      pswVisbilityIcon = Icons.visibility_outlined;
                      isPswVisible = false;
                    }
                  });
                },
                icon: Icon(
                  pswVisbilityIcon,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              label: Text(
                'Password',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: GoogleFonts.rubik(
                  color: Colors.purple[800],
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 35,
          ),
          ActionBtn(
            btnText: 'Sign in',
            btnColor: Colors.purple[900],
            onPressed: (_uNameEmAddrController.text.isEmpty ||
                    _pswController.text.isEmpty)
                ? null
                : () {
                    debugPrint('Lnly: Account login successful!');
                  },
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account?',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Register(),
                    )),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  'Sign up',
                  style: GoogleFonts.rubik(
                    color: Colors.purple[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _uNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _pswController = TextEditingController();
  final _refCodeController = TextEditingController();
  // bool isPswVisible = false;
  bool isPswVisible = true;
  IconData? pswVisbilityIcon = Icons.visibility_outlined;
  final _twController = TypeWriterController.fromValue(
    TypeWriterValue(
      [
        'Frontend Development_',
        'Backend Development_',
        'Product Design_',
        'Data Science_',
        'Mobile Development_',
        'Digital Marketing_',
      ],
    ),
    duration: Durations.short1,
    repeat: true,
  );

  @override
  void dispose() {
    _uNameController.dispose();
    _emailController.dispose();
    _pswController.dispose();
    _refCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 30,
            color: Colors.purple,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 20,
        ),
        children: [
          Text(
            'Get started in',
            style: GoogleFonts.rubik(
              fontSize: 22,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          TypeWriter(
              controller: _twController,
              builder: (context, value) {
                return Text(
                  value.text,
                  style: GoogleFonts.rubik(
                    fontSize: 27,
                    color: Colors.purple[900],
                    fontWeight: FontWeight.w700,
                  ),
                );
              }),
          const SizedBox(
            height: 25,
          ),
          // TODO: add textfields
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _uNameController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person_2_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(
                'Create your username',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _emailController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(
                'example@gmail.com',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _pswController,
            keyboardType: TextInputType.visiblePassword,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            obscureText: (isPswVisible) ? false : true,
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    if (!isPswVisible) {
                      //
                      pswVisbilityIcon = Icons.visibility_off_outlined;
                      isPswVisible = true;
                    } else {
                      pswVisbilityIcon = Icons.visibility_outlined;
                      isPswVisible = false;
                    }
                  });
                },
                icon: Icon(
                  pswVisbilityIcon,
                  size: 28,
                  color: Colors.black,
                ),
              ),
              label: Text(
                'Create your password',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            style: GoogleFonts.rubik(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            controller: _refCodeController,
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.person_3_outlined,
                      color: Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      '|',
                      style: GoogleFonts.rubik(
                        color: Colors.grey,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              label: Text(
                'Enter referral code (optional)',
                style: GoogleFonts.rubik(
                  color: Colors.grey,
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade800,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Colors.purple.shade50,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          // TODO: fix the psw visibility bug here
          ActionBtn(
            btnText: 'Sign up',
            btnColor: Colors.purple[900],
            onPressed: (_uNameController.text.isEmpty ||
                    _emailController.text.isEmpty ||
                    _pswController.text.isEmpty)
                ? null
                : () {
                    debugPrint('Lnly: Account register successful!');
                  },
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'By creating an account, you agree to LearnlyApp\'s',
            style: GoogleFonts.rubik(
              color: Colors.black87,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () async {
                  // open url in browser
                  if (!await launchUrl(
                      Uri.parse('https://learnlyapp.io/terms'))) {
                    throw Exception('Unable to launch ToU');
                  } else {
                    debugPrint('Lnly: ToU url opened in browser');
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  'Terms of Use',
                  style: GoogleFonts.rubik(
                    color: Colors.purple[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Text(
                'and',
                style: GoogleFonts.rubik(
                  color: Colors.black87,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () async {
                  // open url in browser
                  if (!await launchUrl(
                      Uri.parse('https://learnlyapp.io/privacy-policy'))) {
                    throw Exception('Unable to launch Ppol');
                  } else {
                    debugPrint('Lnly: Ppol url opened in browser');
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  'Privacy Policy',
                  style: GoogleFonts.rubik(
                    color: Colors.purple[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account?',
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => const Login(),
                    )),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(5),
                ),
                child: Text(
                  'Sign in',
                  style: GoogleFonts.rubik(
                    color: Colors.purple[800],
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// custome onboarding scrs
// OnBoarding content Model
class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

// OnBoarding content list
final List<OnBoard> demoData = [
  OnBoard(
      image: "assets/images/bg_img_1.jpg",
      title: 'Learn With A Structured Roadmap',
      description:
          'Earn points at each stage of the learning journey to get a certificate and unlock an internship opportunity.'),
  OnBoard(
    image: "assets/images/bg_img_2.jpg",
    title: 'Learn Within A Community',
    description:
        'Enjoy a social learning experience whre you can share and read learning tips from other learners.',
  ),
  OnBoard(
    image: "assets/images/bg_img_3.jpg",
    title: 'Discover Various Learning Paths',
    description:
        'Explore a variety of courses, quizzes, challenges, and events to enhance your learning experience.',
  ),
];

// OnBoardingScreen
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  // Variables
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    debugPrint('opi: $_pageIndex');
    debugPrint('demoData len= ${demoData.length}');
    // continue to scroll horizontally; to the next page
    Future.delayed(Durations.short1, () {
      _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
        if (_pageIndex < demoData.length) {
          // increment _pageIndex by 1
          debugPrint('npi= $_pageIndex');
          _pageIndex++;

          // do animate to page
          _pageController.animateToPage(_pageIndex,
              duration: Durations.medium4, curve: Curves.easeIn);
          if (_pageIndex == demoData.length) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const GetStarted(),
                ));
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Carousel area
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemCount: demoData.length,
              controller: _pageController,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                    left: 15,
                    top: 100,
                    right: 15,
                    bottom: 40,
                  ),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: 0.3,
                      image: AssetImage(
                        // 'assets/images/bg_img_1.jpg',
                        demoData[index].image,
                      ),
                    ),
                  ),
                  // TODO: add bg img
                  child: Column(
                    children: [
                      // TODO: add 'Skip' btn
                      Align(
                        alignment: Alignment.bottomRight,
                        child: TextButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    const GetStarted(),
                              )),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 25),
                            backgroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            side: const BorderSide(
                              color: Colors.white,
                            ),
                          ),
                          child: Text(
                            'Skip',
                            style: GoogleFonts.rubik(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            // TODO: add pade title
                            Text(
                              // 'Learn With A Structured Roadmap',
                              demoData[index].title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.spaceGrotesk(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 50),
                            // TODO: add page description
                            Text(
                              // 'Earn points at each stage of the learning journey to get a certificate and unlock an internship opportunity.',
                              demoData[index].description,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.rubik(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // TODO: add dotted indicator
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...List.generate(
                              demoData.length,
                              (index) => Padding(
                                padding: const EdgeInsets.only(right: 4),
                                child: DotIndicator(
                                  isActive: index == _pageIndex,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // TODO: add next page btn
                      Expanded(
                        child: CircularCountDownTimer(
                          width: 69,
                          height: 69,
                          duration: 4,
                          ringColor: Colors.transparent,
                          fillColor: Colors.purple.shade900,
                          backgroundColor: Colors.white,
                          strokeWidth: 12,
                          isReverse: true,
                          isReverseAnimation: true,
                          isTimerTextShown: false,
                          child: const CircularCTBtn(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Dot indicator widget
class DotIndicator extends StatelessWidget {
  const DotIndicator({
    this.isActive = false,
    super.key,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 27 : 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.purple[900] : Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class CircularCTBtn extends StatelessWidget {
  const CircularCTBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const GetStarted(),
            ));
        debugPrint('Lnly: forward pressed!');
      },
      style: IconButton.styleFrom(
        backgroundColor: Colors.white,
      ),
      icon: Icon(
        Icons.arrow_forward_ios_rounded,
        size: 35,
        color: Colors.purple[900],
      ),
    );
  }
}
