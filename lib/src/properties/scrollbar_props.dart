import 'package:flutter/material.dart';

///check [RawScrollbar] props description
class ScrollbarProps {
  final bool? thumbVisibility;
  final bool? trackVisibility;
  final double? thickness;
  final Radius? radius;
  final bool? interactive;
  final ScrollNotificationPredicate notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;
  final OutlinedBorder? shape;
  final Color? thumbColor;
  final double minThumbLength;
  final double? minOverscrollLength;
  final Radius? trackRadius;
  final Color? trackColor;
  final Color? trackBorderColor;
  final Duration fadeDuration;
  final Duration timeToFade;
  final Duration pressDuration;
  final double mainAxisMargin;
  final double crossAxisMargin;
  final EdgeInsets? padding;

  const ScrollbarProps({
    this.shape,
    this.radius,
    this.thickness,
    this.mainAxisMargin = 0.0,
    this.crossAxisMargin = 0.0,
    this.fadeDuration = const Duration(milliseconds: 300),
    this.timeToFade = const Duration(milliseconds: 600),
    this.pressDuration = Duration.zero,
    this.trackBorderColor,
    this.trackColor,
    this.thumbColor,
    this.minThumbLength = 18.0,
    this.minOverscrollLength,
    this.trackRadius,
    this.scrollbarOrientation,
    this.thumbVisibility,
    this.trackVisibility,
    this.interactive,
    this.notificationPredicate = defaultScrollNotificationPredicate,
    this.padding = EdgeInsets.zero,
  });

  // TVG - begin
  //  ScrollbarProps készítése a Flutteres ScrollbarThemeData sok property-je alapján, és , ami abban nincs benne, azokat egyesével külön bekéri
  ScrollbarProps createFromScrollbarTheme({
    required ScrollbarThemeData scrollbarThemeData, // ez a típus jön a Flutterből
    ScrollbarOrientation? scrollbarOrientation,
    EdgeInsets? padding = EdgeInsets.zero,
    ScrollNotificationPredicate notificationPredicate = defaultScrollNotificationPredicate,
    Duration? fadeDuration,
    Duration? timeToFade,
    Duration? pressDuration = Duration.zero,
    double? minOverscrollLength,
  }) {
    return ScrollbarProps(
      scrollbarOrientation: scrollbarOrientation,
      fadeDuration: fadeDuration ?? Duration(milliseconds: 300),
      timeToFade: timeToFade ?? Duration(milliseconds: 600),
      notificationPredicate: notificationPredicate,
      minOverscrollLength: minOverscrollLength,
      radius: scrollbarThemeData.radius,
      trackRadius: scrollbarThemeData.radius,
      padding: padding,
      interactive: scrollbarThemeData.interactive,
      mainAxisMargin: scrollbarThemeData.mainAxisMargin ?? 0.0,
      crossAxisMargin: scrollbarThemeData.crossAxisMargin ?? 0.0,
      trackBorderColor: scrollbarThemeData.trackBorderColor?.resolve(<WidgetState>{}) ?? Colors.black,
      trackColor: scrollbarThemeData.trackColor?.resolve(<WidgetState>{}) ?? Colors.black,
      thumbColor: scrollbarThemeData.thumbColor?.resolve(<WidgetState>{}) ?? Colors.black,
      minThumbLength: scrollbarThemeData.minThumbLength ?? 18,
      trackVisibility: scrollbarThemeData.trackVisibility?.resolve(<WidgetState>{}),
      thumbVisibility: scrollbarThemeData.thumbVisibility?.resolve(<WidgetState>{}),
      thickness: scrollbarThemeData.thickness?.resolve(<WidgetState>{}),
    );
  }
}
// TVG - end

bool defaultScrollNotificationPredicate(ScrollNotification notification) {
  return notification.depth == 0;
}
