import 'package:flutter/material.dart';
import 'package:my_ok/layout.dart';
import 'package:my_ok/screen/login.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      height: 8.0,
      width: isActive ? 32.0 : 8.0,
      decoration: BoxDecoration(
        color: Color(0xFFE93649),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(children: <Widget>[
          //decoration
          Positioned(
            bottom: SizeConfig.blockHorizontal * -58,
            left: SizeConfig.blockHorizontal * -107,
            child: Image(
              image: AssetImage('assets/images/login_register/decoration.png'),
              fit: BoxFit.fitHeight,
              height: SizeConfig.blockVertical * 90,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //page bergambar
              Container(
                height: SizeConfig.blockVertical * 70,
                color: Colors.white,
                child: PageView(
                  physics: ClampingScrollPhysics(),
                  controller: _pageController,
                  onPageChanged: (int page) {
                    setState(() {
                      _currentPage = page;
                    });
                  },
                  children: <Widget>[
                    //page1
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 20.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/landingpage/landing1.png'),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Ideation',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Anda punya ide briliant? tuangkan\npada aplikasi My.Ok',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //page2
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 20.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/landingpage/landing2.png'),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Creation',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Buat kreasi sesuka kalian\ndan pesan sekarang!!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //page3
                    Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 20.0),
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                  'assets/images/landingpage/landing3.png'),
                              height: 300.0,
                              width: 300.0,
                            ),
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Wear with your passion',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Bisa cetak apa saja sesuai passion kalian loh ',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              //page indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(),
              ),

              //next
              _currentPage != _numPages - 1
                  ? Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomRight,
                        child: FlatButton(
                          onPressed: () {
                            _pageController.nextPage(
                              duration: Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.black,
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ]),
      ),
      //get started
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 50.0,
              width: double.infinity,
              color: Colors.white,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Text(
                      'Get started',
                      style: TextStyle(
                        color: Color(0xFFE93649),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            )
          : Text(''),
    );
  }
}
