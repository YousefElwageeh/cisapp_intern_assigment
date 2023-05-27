import 'package:cisapp_intern_assigment/src/conifg/utils/commonWidgets.dart';
import 'package:cisapp_intern_assigment/src/features/apps/presentation/cubit/apps_cubit.dart';
import 'package:flutter/material.dart';
import 'package:cisapp_intern_assigment/src/features/apps/presentation/widgets/signinWidget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  void initState() {
    super.initState();

    context.read<AppsCubit>().getEmployees();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<AppsCubit, AppsState>(
      builder: (context, state) {
        if (state is GetEmployyesLoading || state is AppsInitial) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetEmployyesError) {
          return Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('error  '),
              CommonWidgets.DefultButton(context,
                  text: 'retry',
                  onPressed: () => context.read<AppsCubit>().getEmployees())
            ],
          ));
        } else {
          return ScreenContent(context, cubit: context.read<AppsCubit>());
        }
      },
    ));
  }

  Widget ScreenContent(
    context, {
    required AppsCubit cubit,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) =>
                    SignInWidgets.informationWidget(context,
                        model: cubit.employees!.users[index],
                        editOnPressed: () async {
                      cubit.showEmployeData(index);

                      await showDialog(
                        context: context,
                        builder: (context) => Form(
                          key: cubit.formKey,
                          child: CommonWidgets.dialogWidget(context,
                              age: cubit.age,
                              name: cubit.name,
                              salary: cubit.salary, onPressed: () {
                            cubit.editEmployees(index);
                            Navigator.pop(context);
                          }),
                        ),
                      );
                    }, deleteOnPressed: () {
                      cubit.deleteEmployees(index);
                      Navigator.pop(context);
                    }),
                separatorBuilder: (context, index) => const SizedBox(
                      height: 25,
                    ),
                itemCount: cubit.employees?.users.length ?? 0),
          ),
          Row(
            children: [
              const Text('Add item'),
              const Spacer(),
              IconButton(
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return Form(
                          key: cubit.formKey,
                          child: CommonWidgets.dialogWidget(context,
                              age: cubit.age,
                              name: cubit.name,
                              salary: cubit.salary, onPressed: () {
                            cubit.addEmployees();
                            Navigator.pop(context);
                          }),
                        );
                      },
                    );
                  },
                  icon: const Icon(Icons.add))
            ],
          )
        ],
      ),
    );
  }
}
