import 'package:flutter/material.dart';

@immutable
abstract class NewsEvent{}

class NewsFetchEvent extends NewsEvent{}
class NextNewsFetchEvent extends NewsEvent{}