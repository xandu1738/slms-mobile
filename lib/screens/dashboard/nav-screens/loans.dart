import 'package:flutter/material.dart';
import 'package:slms/screens/dashboard/loans/apply_loan.dart';
import 'package:slms/screens/dashboard/loans/repay.dart';
import 'package:slms/widgets/custom_card.dart';

class Loans extends StatelessWidget {
  const Loans({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: (){Navigator.of(context).pop(context);},),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            // InkWell(
            //   onTap: () {},
            //   child: const CustomCard(title: 'Eligibility', image: AssetImage('assets/images/trophy-solid.png'),),
            // ),

            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoanApplication(),
                  ),
                );
              },
              child: const CustomCard(
                title: 'Apply',
                image: AssetImage('assets/images/pen-to-square-solid.png'),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Repay(),
                  ),
                );
              },
              child: const CustomCard(
                title: 'Repay',
                image: AssetImage('assets/images/ranking-star-solid.png'),
              ),
            ),

            InkWell(
              onTap: () {},
              child: const CustomCard(
                title: 'History',
                image: AssetImage('assets/images/clock-rotate-left-solid.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
