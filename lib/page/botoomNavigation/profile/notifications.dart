import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  bool status = false;
  bool bid = false;
  bool editBid = false;
  double _volumeListenerValue = 0;
  double _getVolume = 0;
  double _setVolumeValue = 0;
  double currentvol = 0.5;
  @override
  void initState() {
    PerfectVolumeControl.hideUI =
        false; //set if system UI is hided or not on volume up/down
    Future.delayed(Duration.zero, () async {
      currentvol = await PerfectVolumeControl.getVolume();
      setState(() {
        //refresh UI
      });
    });

    PerfectVolumeControl.stream.listen((volume) {
      setState(() {
        currentvol = volume;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEBE9E8),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => ProfilePage()));
            },
            child: Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.grey,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Notifications",
          style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Color(0xffe75517)),
        ),

        // iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notification Sounds",
                  style: TextStyle(color: Color(0xffe75517), fontSize: 18),
                ),
                FlutterSwitch(
                  activeColor: Color(0xffe75517),
                  width: 50.0,
                  height: 25.0,
                  // valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: status,
                  // borderRadius: 30.0,
                  // padding: 8.0,
                  // showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      status = val;
                      print(status);
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Notification Volume",
                style: TextStyle(color: Color(0xffe75517), fontSize: 18),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () => PerfectVolumeControl(),
                    child: Icon(Icons.volume_off_outlined)),
                Slider(
                  activeColor: Color(0xffe75517),
                  inactiveColor: Colors.grey.shade400,
                  value: currentvol,
                  onChanged: (newvol) {
                    currentvol = newvol;
                    PerfectVolumeControl.setVolume(newvol); //set new volume
                    setState(() {});
                  },
                  min: 0, //
                  max: 1,
                  divisions: 100,
                ),
                Icon(Icons.volume_up_outlined),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 30, bottom: 20),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300)))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Bid Edited ",
                  style: TextStyle(color: Color(0xffe75517), fontSize: 18),
                ),
                FlutterSwitch(
                  activeColor: Color(0xffe75517),
                  width: 50.0,
                  height: 25.0,
                  // valueFontSize: 25.0,
                  toggleSize: 20.0,
                  value: editBid,
                  // borderRadius: 30.0,
                  // padding: 8.0,
                  // showOnOff: true,
                  onToggle: (val) {
                    setState(() {
                      editBid = val;
                      print(editBid);
                    });
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Last Bid",
                    style: TextStyle(color: Color(0xffe75517), fontSize: 18),
                  ),
                  FlutterSwitch(
                    activeColor: Color(0xffe75517),
                    width: 50.0,
                    height: 25.0,
                    // valueFontSize: 25.0,
                    toggleSize: 20.0,
                    value: bid,
                    // borderRadius: 30.0,
                    // padding: 8.0,
                    // showOnOff: true,
                    onToggle: (val) {
                      setState(() {
                        bid = val;
                        print(bid);
                      });
                    },
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
