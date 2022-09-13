import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slms/widgets/custom_tff.dart';

import '../../../widgets/button_widget.dart';

class Invite extends StatefulWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  final inviteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/subscriber.svg',
              height: 150,
              width: 150,
              allowDrawingOutsideViewBox: true,
            ),
            const SizedBox(
              height: 50,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTff(
                        text: 'Invite Link',
                        alertMessage: 'Copy Invite Link',
                        controller: inviteController),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      onClicked: () {},
                      text: 'copy',
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
