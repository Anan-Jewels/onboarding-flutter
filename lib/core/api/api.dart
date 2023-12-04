library provider_app_apis;

import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../config/config.dart';
import '../exception/exception_utilities.dart';
import '../settings/local_cache_key.dart';
import '../settings/variable_utilities.dart';

part 'api_manager.dart';
part 'api_utilities.dart';
