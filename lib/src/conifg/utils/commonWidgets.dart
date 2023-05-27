import 'package:flutter/material.dart';

class CommonWidgets {
  static Widget DefultButton(
    BuildContext context, {
    required String text,
    required void Function()? onPressed,
    Color color = Colors.blue,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(20),
            ),
            child: MaterialButton(
                onPressed: onPressed,
                child:
                    Text(text, style: Theme.of(context).textTheme.bodyMedium)),
          ),
        ],
      ),
    );
  }

  static Widget DefultTextFormField(
      {required String label,
      TextEditingController? textEditingController,
      TextInputType textInputType = TextInputType.number}) {
    return SizedBox(
      child: TextFormField(
        controller: textEditingController,
        keyboardType: textInputType,
        validator: (value) {
          if (value!.isEmpty) {
            return "field  Can't be Empty";
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: label,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 1.5, color: Colors.grey),
              borderRadius: BorderRadius.circular(18)),

          // errorText: _loginViewModel.isUserNameVaild.value
          //     ? null
          //     : AppStrings.usernameError.tr
        ),
      ),
    );
  }

  static Widget dialogWidget(context,
      {required TextEditingController name,
      required TextEditingController salary,
      required TextEditingController age,
      required void Function()? onPressed}) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            CommonWidgets.DefultTextFormField(
                label: 'employee name',
                textEditingController: name,
                textInputType: TextInputType.name),
            const SizedBox(
              height: 20,
            ),
            CommonWidgets.DefultTextFormField(
                label: 'employee salary ', textEditingController: salary),
            const SizedBox(
              height: 20,
            ),
            CommonWidgets.DefultTextFormField(
                label: 'employee age ', textEditingController: age),
            const SizedBox(
              height: 20,
            ),
            CommonWidgets.DefultButton(
              context,
              text: 'Add',
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
