import 'package:flutter/material.dart';
import 'package:y_perz/common/app_theme.dart';
import 'package:y_perz/extensions/util_extensions.dart';

class AlertDialogBox extends StatelessWidget {
  final String? title, description;
  final Image? image;
  final BuildContext? myContext;

  const AlertDialogBox({
    Key? key,
    @required this.title,
    @required this.description,
    this.image,
    @required this.myContext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.white,
      child: dialogContent(context),
    );
  }

  dialogContent(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15.0, right: 15, bottom: 20, top: 30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Column(
                children: <Widget>[
                  15.verticalSpace(),
                  Center(
                    child: Text(
                      title.toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  10.verticalSpace(),
                  Center(
                    child: Text(
                      description.toString(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  0.verticalSpace(),
                ],
              ),
              Center(
                child: SizedBox(
                  height: 35,
                  width: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: AppTheme.primaryGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      // splashColor: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Text(
                          "OK",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
