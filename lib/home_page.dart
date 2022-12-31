import 'package:emf/Widget/main_reading.dart';
import 'package:emf/Widget/meter_reading.dart';
import 'package:emf/Widget/xyz_reading.dart';
import 'package:emf/models/magnitude_provider.dart';
import 'package:emf/models/utils/colors.dart';
import 'package:emf/pages/visuals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            MainReading(),
            XYZReading(),
            MeterReading(),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all(AppColors.primaryColor),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Visuals()));
                },
                child: Text("Visualize"),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Consumer<MagnitudeProvider>(
              builder: (context, model, child) => Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                            side: BorderSide(color: Colors.white))),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.primaryColor)),
                    onPressed: () {
                      model.changeValues();
                    },
                    child: Text('Start')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
