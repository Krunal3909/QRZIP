import 'package:shopping_app/utills/imports.dart';
import 'package:shopping_app/utills/size_config.dart';
class CustomRoundedButtonEnable extends StatelessWidget {
  final Function onPressed;
  final String title;
  CustomRoundedButtonEnable({@required this.onPressed, @required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(SizeConfig.sizes(6))),
      height: SizeConfig.sizes(45),
      width: MediaQuery.of(context).size.width,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SizeConfig.sizes(6)),
        ),
        disabledColor: Colors.grey,
        color: Theme.of(context).accentColor,
        onPressed: onPressed,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline3.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
