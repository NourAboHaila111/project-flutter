import 'package:flutter/cupertino.dart';

abstract class SshopState{}

class SshopInitailHomeState extends SshopState{
  final Locale  locale;

  SshopInitailHomeState(this.locale);
}
