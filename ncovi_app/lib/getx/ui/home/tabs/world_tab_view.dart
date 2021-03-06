import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/world_controller.dart';
import 'package:ncoviapp/models/model.dart';
import 'package:ncoviapp/ui/loading_view.dart';
import 'package:ncoviapp/ui/multi_screen.dart';

class WorldTabView extends GetWidget<WorldController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFAF3),
      body: SafeArea(
        child: GetX<WorldController>(
            builder: (state) {
              if (state.worldStateObs.value.viewState == ViewState.initial) {
                World world = state.worldStateObs.value.world;
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: ScUtil.getInstance().setWidth(13)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(16),
                        ),
                        Text(
                          'Covid-19',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScUtil.getInstance().setSp(20)),
                        ),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(4),
                        ),
                        Text('Update: ${world.data.lastUpdate}',
                            style: TextStyle(
                                color: Color(0xffBFBFBF),
                                fontSize: ScUtil.getInstance().setSp(14))),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(13),
                        ),
                        _caseWidget('Ca nhiễm', '${world.data.totalCases}'),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(23),
                        ),
                        _caseWidget('Tử vong', '${world.data.deathCases}'),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(23),
                        ),
                        _caseWidget('Khỏi bệnh', '${world.data.recoveryCases}'),
                      ],
                    ),
                  ),
                );
              } else {
                return Center(child: LoadingView(dotRadius: 8.0, radius: 20,));
              }

            }
        ),
      ),
    );
  }

  _caseWidget(String caseName, String totalCases) {
    return SizedBox(
      width: ScUtil.getInstance().setWidth(320),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        color: caseName.contains('Ca nhiễm')
            ? Color(0xffF4B408)
            : caseName.contains('Tử vong')
            ? Color(0xffF52C2C)
            : Color(0xff1299ED),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: ScUtil.getInstance().setWidth(20)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: ScUtil.getInstance().setHeight(13),
              ),
              Text(
                caseName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: ScUtil.getInstance().setSp(18)),
              ),
              SizedBox(
                height: ScUtil.getInstance().setHeight(10),
              ),
              Center(
                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                    Text(
                      totalCases,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScUtil.getInstance().setSp(18)),
                    ),
                    SizedBox(
                      height: ScUtil.getInstance().setHeight(10),
                    ),
                    Text(
                      'Tổng',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: ScUtil.getInstance().setSp(18)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: ScUtil.getInstance().setHeight(20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}