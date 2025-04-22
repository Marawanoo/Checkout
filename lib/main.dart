import 'package:checkout_app/features/checkout/presentation/bloc/checkout_bloc.dart';
import 'package:checkout_app/features/checkout/presentation/views/add_new_card_view.dart';
import 'package:checkout_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 797),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          routes: {
            'addNewCard': (context) => const AddNewCardView(),
            'checkout': (context) => BlocProvider(
                  create: (context) => CheckoutBloc(),
                  child: CheckoutView(),
                )
          },
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(backgroundColor: Colors.white)),
          home: child,
        );
      },
      child: BlocProvider<CheckoutBloc>(
        create: (context) => CheckoutBloc(),
        child: CheckoutView(),
      ),
    );
  }
}
