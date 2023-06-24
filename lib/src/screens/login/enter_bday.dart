import 'package:bilkent_tinder/controllers/auth_controller.dart';
import 'package:bilkent_tinder/src/utils/colors.dart';
import 'package:bilkent_tinder/src/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnterBdayScreen extends StatefulWidget {
  const EnterBdayScreen({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<EnterBdayScreen> createState() => _EnterBdayScreenState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _EnterBdayScreenState extends State<EnterBdayScreen>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2000, 1, 1));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(1980),
          lastDate: DateTime(2030),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: GetBuilder<AuthController>(builder: (authController) {
          void _submitText() {
            authController.updateUserInfo("birthDay", _selectedDate.value);
            Get.toNamed("enter_gender");
          }

          return Padding(
            padding: EdgeInsets.all(Dimensions.width30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your b-day?",
                  style: TextStyle(
                      fontSize: Dimensions.font26, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Dimensions.height30 * 1.5),
                OutlinedButton(
                  onPressed: () {
                    _restorableDatePickerRouteFuture.present();
                  },
                  child: const Text('Open Date Picker'),
                ),
                SizedBox(height: Dimensions.height30),
                Text(
                    'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
                SizedBox(height: Dimensions.height15),
                Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ElevatedButton(
                      onPressed: () => _submitText(),
                      child: Text('NEXT'),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          backgroundColor: AppColors.pink2),
                    ),
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
