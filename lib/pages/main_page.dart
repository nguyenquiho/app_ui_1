import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _pageController = PageController(viewportFraction: 0.85);
  List<String> _categoryList = ["Tea", "Wine", "Beer", "Milk", "Juice"];
  int _categorySelectedIdx = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            color: Color.fromRGBO(255, 247, 231, 1),
          ),
          Column(
            children: [
              SizedBox(),
              _buildSearchBar(),
              _buildUserProfile(),
              _buildCategoryList(),
              _buildMenu(),
            ]
          ),
        ],
      ),
    );
  }

  _buildSearchBar(){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 50, bottom: 20, right: 50),
        child: Material(
          borderRadius: BorderRadius.circular(16),
          child: TextField(
            cursorColor: Color.fromARGB(255, 254, 182, 81),
            decoration: InputDecoration(
              hintText: 'What would you like?',
              fillColor: Colors.white,
              contentPadding: EdgeInsets.only(left: 16, top: 14),
              hintStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
              suffixIcon: Icon(Icons.search, color: Color.fromARGB(255, 254, 182, 81),),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              focusedBorder: InputBorder.none,
            ),
            onTap: (){},
          ),
        ),
      ),
    );
  }

  _buildUserProfile(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50),
      height: 80,
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome back",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Colors.grey.shade400,
                ),
              ),
              Text(
                "Kelvin Wong",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          ClipOval(
            child: Container(
              width: 80,
              height: 80,
              color: Colors.grey.shade200,
              child: Image.network('https://as1.ftcdn.net/v2/jpg/00/67/69/82/1000_F_67698277_Fxid77AeH5vXPXOAehmiMahXi4qCsNIy.jpg', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  _buildCategoryList(){
    return Container(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 30, right: 30),
        scrollDirection: Axis.horizontal,
        itemCount: _categoryList.length,
        itemExtent: 70,
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: (){
              _categorySelectedIdx = index;
              setState((){});
            },
            child: Align(
              alignment: Alignment.center,
              child: Text(
                _categoryList[index],
                style: TextStyle(
                  fontSize: index == _categorySelectedIdx ? 25 : 16,
                  fontWeight: FontWeight.w700,
                  color: index == _categorySelectedIdx ? Color.fromARGB(255, 254, 182, 81) : Color.fromRGBO(245, 189, 70, 1),
                ),
              ),
            ),
          );
        },

      ),
    );
  }

  _buildMenu(){
    return Container(
      height: 400,
      margin: EdgeInsets.only(top: 15),
      // color: Colors.blue,
      child: PageView.builder(
        controller: _pageController,
        itemBuilder: (context, index){
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            // color: Colors.red,
            child: ClipRect(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter, end: Alignment.bottomCenter,
                        colors: [
                          Color.fromARGB(255,255,183,82),
                          Color.fromARGB(255,255,228,98),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15, left: 45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Traditional\nKombucha",
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25).copyWith(color: Colors.white),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("\$9", 
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 35).copyWith(color: Colors.white),
                        ),
                      ]
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(150, -80),
                      child: Image.asset('assets/images/wave.png',color: Colors.white.withOpacity(0.4),fit: BoxFit.cover, height: 600)
                      ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Transform.translate(
                      offset: Offset(0, 60),
                      child: Image.asset('assets/images/DrinkOrange.png'
                      )),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
