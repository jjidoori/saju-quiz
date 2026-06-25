import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '/flutter_flow/custom_functions.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

dynamic currentProgress(List<UserProgressRecord> userProgress) {
  final p = userProgress.firstOrNull;
  return p == null
      ? {}
      : {
          "level": p.currentLevel,
          "score": p.totalScore,
          "streak": p.streakDays,
          "accuracy": p.accuracyPercentage,
          "mastered": p.masteredHanja,
          "achievements": p.unlockedAchievements
        };
}
