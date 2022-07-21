// ignore_for_file: prefer_conditional_assignment

import 'package:flutter/material.dart';

NavigationService navigationService = NavigationService().get();

class NavigationService {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  NavigationService();

  NavigationService? _instance;
  NavigationService get() {
    if (_instance == null) _instance = NavigationService();

    return _instance!;
  }

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  popPage() => _navigationKey.currentState!.pop();

}
