import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ncoviapp/getx/common/enums/view_state.dart';
import 'package:ncoviapp/getx/ui/home/tabs/controllers/vietnam_controller.dart';
import 'package:ncoviapp/models/country/country.dart';
import 'package:ncoviapp/ui/loading_view.dart';
import 'package:ncoviapp/ui/multi_screen.dart';
import 'package:ncoviapp/utils/int_convert.dart';

class VietnamTabView extends GetWidget<VietnamController> {
  @override
  Widget build(BuildContext context) {
    // Country vn;
    // vn = state.ncovid;
    return GetX<VietnamController>(
      initState: (state) {
        Get.find<VietnamController>().onInit();
      },
      builder: (controller) {
        Country country = controller.vnState.value.country;
        if (controller.vnState.value.viewState == ViewState.loading) {
          return Center(
              child: LoadingView(
                dotRadius: 8.0,
                radius: 20,
              ));
        }

        return Scaffold(
          backgroundColor: Color(0xffFCFAF3),
          body: SafeArea(
            child: SingleChildScrollView(
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
                    Text('Update: ${country.data.lastUpdate}',
                        style: TextStyle(
                            color: Color(0xffBFBFBF),
                            fontSize: ScUtil.getInstance().setSp(14))),
                    SizedBox(
                      height: ScUtil.getInstance().setHeight(13),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _caseWidget('Ca nhiễm', '${country.data.rows[0].totalCases}',newCases: '${country.data.rows[0].newCases}'),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(23),
                        ),
                        _caseWidget('Tử vong', '${country.data.rows[0].totalDeaths}',newCases: '${country.data.rows[0].newDeaths}'),
                        SizedBox(
                          height: ScUtil.getInstance().setHeight(23),
                        ),
                        _caseWidget('Khỏi bệnh', '${country.data.rows[0].totalRecovered}'),
                      ],
                    )

                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _caseWidget(String caseName, String totalCases, {String newCases}) {
    return SizedBox(
      width: ScUtil.getInstance().setWidth(320),
      child: Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Card(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                      newCases != null ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            newCases,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScUtil.getInstance().setSp(18)),
                          ),
                          SizedBox(
                            height: ScUtil.getInstance().setHeight(10),
                          ),
                          Text(
                            'Mới',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: ScUtil.getInstance().setSp(18)),
                          ),
                        ],
                      ) : SizedBox()
                    ],
                  ),
                  SizedBox(
                    height: ScUtil.getInstance().setHeight(45),
                  ),
                ],
              ),
            ),
          ),
          newCases != null ? Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8))),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: ScUtil.getInstance().setWidth(8),
                  vertical: ScUtil.getInstance().setHeight(12)),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    Icons.arrow_upward,
                    size: ScUtil.getInstance().setHeight(14),
                    color: caseName.contains('Ca nhiễm')
                        ? Color(0xffF52C2C)
                        : caseName.contains('Tử vong')
                            ? Color(0xffF52C2C)
                            : Color(0xff1299ED),
                  ),
                  Text(
                    '${Percent.convert(totalCases, newCases)}%',
                    style: TextStyle(
                        color: caseName.contains('Ca nhiễm')
                            ? Color(0xffF52C2C)
                            : caseName.contains('Tử vong')
                                ? Color(0xffF52C2C)
                                : Color(0xff1299ED),
                        fontSize: ScUtil.getInstance().setSp(14)),
                  )
                ],
              ),
            ),
          ) : SizedBox()
        ],
      ),
    );
  }
}
