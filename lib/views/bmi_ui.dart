import 'package:flutter/material.dart';

class BmiUi extends StatefulWidget {
  const BmiUi({super.key});

  @override
  State<BmiUi> createState() => _BmiUiState();
}

class _BmiUiState extends State<BmiUi> {
  final TextEditingController weightCtrl = TextEditingController();
  final TextEditingController heightCtrl = TextEditingController();

  double bmi = 0.0;

  void calculateBMI() {
    double weight = double.tryParse(weightCtrl.text) ?? 0;
    double heightCm = double.tryParse(heightCtrl.text) ?? 0;

    if (weight > 0 && heightCm > 0) {
      double heightM = heightCm / 100;
      setState(() {
        bmi = weight / (heightM * heightM);
      });
    }
  }

  void clearData() {
    setState(() {
      weightCtrl.clear();
      heightCtrl.clear();
      bmi = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: 100,
            left: 30,
            right: 30,
            bottom: 50,
          ),
          child: Center(
            child: Column(
              children: [
                //ส่วนชื่อหน้าจอ และรูป
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/bmi.png',
                  width: 170,
                  height: 170,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),

                //ส่วนการป้อนข้อมูล
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('น้ำหนัก (kg.)'),
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกน้ำหนัก',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('ส่วนสูง (cm.)'),
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกส่วนสูง',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                //ส่วนปุ่ม
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: calculateBMI,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'คำนวณ BMI',
                      style: TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: clearData,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: EdgeInsets.symmetric(vertical: 20),
                    ),
                    child: Text(
                      'ล้างข้อมูล',
                      style: TextStyle(
                      color: Colors.white,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20),

                //ส่วนแสดงผลข้อมูลที่ได้จากการคำนวณ
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(fontSize: 16),
                      ),
                      Text(
                        bmi.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}