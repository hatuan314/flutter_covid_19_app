import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ncoviapp/blocs/blocs.dart';
import 'package:ncoviapp/ui/views/home/tabs/home_tab.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          Widget _currentTab = VietnamTabView();
          if (state is HomeOnChangeTabState) {
            if (state.selectIndex == 1)
              _currentTab = WorldTabView();
            else if (state.selectIndex == 2)
              _currentTab = InfoTabView();
            else
              _currentTab = VietnamTabView();
          }
          return Scaffold(
            backgroundColor: Color(0xffFCFAF3),
            body: _currentTab,
            bottomNavigationBar: Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
              ]),
              child: SafeArea(
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
                  child: GNav(
                      gap: 8,
                      activeColor: Colors.white,
                      iconSize: 24,
                      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      duration: Duration(milliseconds: 800),
                      tabBackgroundColor: Colors.grey[800],
                      tabs: [
                        GButton(
                          icon: Icons.star_border,
                          backgroundColor: Color(0xffF24747),
                          textColor: Colors.white,
                          iconActiveColor: Color(0xffE6D718),
                          iconColor: Colors.black,
                          text: 'Việt Nam',
                          textStyle: TextStyle(color: Color(0xffE6D718)),
                        ),
                        GButton(
                          icon: Icons.language,
                          backgroundColor: Color(0xff1299ED),
                          textColor: Colors.white,
                          iconActiveColor: Colors.white,
                          iconColor: Colors.black,
                          text: 'Thế giới',
                          textStyle: TextStyle(color: Colors.white),
                        ),
                        GButton(
                          icon: Icons.info_outline,
                          backgroundColor: Color(0xff1AB120),
                          textColor: Colors.white,
                          iconActiveColor: Colors.white,
                          iconColor: Colors.black,
                          text: 'Giới thiệu',
                          textStyle: TextStyle(color: Colors.white),
                        ),
                      ],
                      selectedIndex: state is HomeOnChangeTabState ? state.selectIndex : 0,
                      onTabChange: (index) => BlocProvider.of<HomeBloc>(context)
                        ..add(OnTabChangeEvent(index))),
                ),
              ),
            ),
          );
        });
  }
}
