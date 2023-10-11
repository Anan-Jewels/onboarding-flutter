import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

abstract class BaseServices {
  Future<Response> getDesignStyles();
  Future<Response> submitStyles();
}
