import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:slms/screens/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const SLMS());
}

class SLMS extends StatelessWidget {
  const SLMS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 182, 74, 47)),
          ),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.light,
      home: const Authentication(),
      // home: NeumorphicTheme(
      //   themeMode: ThemeMode.light,
      //   theme: const NeumorphicThemeData(
      //     baseColor: Color(0xFFFFFFFF),
      //     lightSource: LightSource.topLeft,
      //     depth: 10,
      //   ),
      //   darkTheme: const NeumorphicThemeData(
      //     baseColor: Color.fromARGB(255, 18, 15, 34),
      //     lightSource: LightSource.topLeft,
      //     depth: 6,
      //   ),
      //   child: const Authentication(),
      // ),
    );
  }
}
