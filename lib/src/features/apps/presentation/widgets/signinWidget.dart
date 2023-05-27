import 'package:cisapp_intern_assigment/src/features/apps/data/models/usersModel.dart';
import 'package:flutter/material.dart';
import 'package:cisapp_intern_assigment/src/conifg/utils/commonWidgets.dart';

class SignInWidgets {
  static Widget informationWidget(context,
      {void Function()? editOnPressed,
      void Function()? deleteOnPressed,
      required employee model}) {
    return Row(
      children: [
        Column(
          children: [
            Text(
              model.employee_name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  'age ${model.employee_age}',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  'salary ${model.employee_salary} \$',
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        CommonWidgets.DefultButton(context,
            text: 'edit', onPressed: editOnPressed),
        CommonWidgets.DefultButton(context,
            text: 'delete', onPressed: deleteOnPressed, color: Colors.brown)
      ],
    );
  }
}
