import 'package:linkfy_text/linkfy_text.dart';
import 'package:flutter/material.dart';
// import 'package:linkfy_text/src/model/link.dart';

/// Defines the various text styles available in the Material Design typography system.
enum Type {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

/// A customizable text widget that supports various text styles, linkification, and a "read more" feature.
class PulseText extends StatefulWidget {
  // Core properties
  final String? value; // The text to be displayed
  final TextStyle? style; // Custom style to be applied to the text
  final TextStyle? linkStyle; // Custom style for linked text
  final TextAlign textAlign; // Text alignment
  final TextOverflow? overflow; // How to handle text overflow
  final Type type; // The type of text style to use
  final Function()? onPressed; // Callback for when the text is pressed

  // Linkify properties
  final bool linkify; // Whether to linkify the text
  final Function(Link)? onLinkPressed; // Callback for when a link is pressed

  // Read more properties
  final bool withReadMore; // Whether to include a "read more" feature
  final String readMoreText; // Text for the "read more" button
  final TextStyle? readMoreTextStyle; // Style for the "read more" text
  final int? limit; // Character limit before truncation
  final double? height; // Fixed height for the text widget
  final Function(ScrollNotification)? onScroll; // Callback for scroll events
  final Function(bool)?
      onPressedShowMore; // Callback for "show more" button press

  /// Constructor for displayLarge text style
  const PulseText.displayLarge(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.displayLarge;
  //
  const PulseText.displayMedium(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.displayMedium;
  // -
  const PulseText.displaySmall(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.displaySmall;

  /// Constructor for headline text style
  const PulseText.headlineLarge(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.headlineLarge;
  //-
  const PulseText.headlineMedium(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.headlineMedium;
  //-
  const PulseText.headlineSmall(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.headlineSmall;
  //-----------------------------------
  const PulseText.titleLarge(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.titleLarge;
  //-

  const PulseText.titleMedium(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.titleMedium;
  //-----------------------------------
  const PulseText.titleSmall(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.titleSmall;

  //-----------------------------------
  const PulseText.bodyLarge(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.bodyLarge;
  //-
  const PulseText.bodyMedium(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.bodyMedium;
  //-
  const PulseText.bodySmall(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.bodySmall;
  //-----------------------------------
  //-----------------------------------
  const PulseText.labelLarge(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.labelLarge;
  //-
  const PulseText.labelMedium(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.labelMedium;
  //-
  const PulseText.labelSmall(
    this.value, {
    super.key,
    this.style,
    this.linkStyle,
    this.textAlign = TextAlign.start,
    this.limit,
    this.overflow,
    this.onPressed,
    this.linkify = false,
    this.onLinkPressed,
    this.readMoreText = 'Show',
    this.withReadMore = false,
    this.readMoreTextStyle,
    this.height,
    this.onScroll,
    this.onPressedShowMore,
  }) : type = Type.labelSmall;

  @override
  State<PulseText> createState() => _PTextState();
}

class _PTextState extends State<PulseText> {
  bool _showAll = false; // Whether to show all text or truncated version
  late TextStyle? _defaultStyle; // The default style based on the selected type

  @override
  void initState() {
    super.initState();
    _showAll = false;
  }

  @override
  void didUpdateWidget(covariant PulseText oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Reset _showAll if the text or style changes
    if (widget.value != oldWidget.value || widget.style != oldWidget.style) {
      _showAll = false;
    }
  }

  /// Selects the appropriate default style based on the widget's type
  void _chooseDefaultStyle(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    switch (widget.type) {
      case Type.displayLarge:
        _defaultStyle = textTheme.displayLarge;
        break;
      case Type.displayMedium:
        _defaultStyle = textTheme.displayMedium;
        break;
      case Type.displaySmall:
        _defaultStyle = textTheme.displaySmall;
        break;
      case Type.headlineLarge:
        _defaultStyle = textTheme.headlineLarge;
        break;
      case Type.headlineMedium:
        _defaultStyle = textTheme.headlineMedium;
        break;
      case Type.headlineSmall:
        _defaultStyle = textTheme.headlineSmall;
        break;
      case Type.titleLarge:
        _defaultStyle = textTheme.titleLarge;
        break;
      case Type.titleMedium:
        _defaultStyle = textTheme.titleMedium;
        break;
      case Type.titleSmall:
        _defaultStyle = textTheme.titleSmall;
        break;
      case Type.bodyLarge:
        _defaultStyle = textTheme.bodyLarge;
        break;
      case Type.bodyMedium:
        _defaultStyle = textTheme.bodyMedium;
        break;
      case Type.bodySmall:
        _defaultStyle = textTheme.bodySmall;
        break;
      case Type.labelLarge:
        _defaultStyle = textTheme.labelLarge;
        break;
      case Type.labelMedium:
        _defaultStyle = textTheme.labelMedium;
        break;
      case Type.labelSmall:
        _defaultStyle = textTheme.labelSmall;
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _chooseDefaultStyle(context);

    return NotificationListener<ScrollNotification>(
      onNotification: (notify) {
        if (widget.onScroll != null) {
          widget.onScroll!(notify);
        }
        return true;
      },
      child:
          widget.withReadMore ? _buildWithReadMore() : _buildWithoutReadMore(),
    );
  }

  /// Builds the text widget without the "read more" feature
  Widget _buildWithoutReadMore() {
    return widget.linkify ? _buildLinkfyText() : _buildNormalText();
  }

  /// Builds the text widget with the "read more" feature
  Widget _buildWithReadMore() {
    if (widget.value == null) {
      return const SizedBox();
    }

    final showMoreStyle =
        widget.readMoreTextStyle ?? _defaultStyle?.copyWith(color: Colors.blue);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (_showAll)
          widget.linkify ? _buildLinkfyText() : _buildNormalText()
        else
          widget.linkify
              ? _buildLinkfyText(widget.value!.substring(0, widget.limit))
              : _buildNormalText(widget.value!.substring(0, widget.limit)),
        GestureDetector(
          onTap: () {
            setState(() {
              _showAll = !_showAll;
            });
            if (widget.onPressedShowMore != null) {
              widget.onPressedShowMore!(_showAll);
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              _showAll ? 'Show less' : widget.readMoreText,
              style: showMoreStyle,
            ),
          ),
        ),
      ],
    );
  }

  /// Builds a normal text widget
  Widget _buildNormalText([String? text]) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: Text(
        text ?? widget.value ?? '',
        style: widget.style ?? _defaultStyle,
        textAlign: widget.textAlign,
        overflow: widget.overflow,
      ),
    );
  }

  /// Builds a linkified text widget
  Widget _buildLinkfyText([String? text]) {
    return GestureDetector(
      onTap: widget.onPressed,
      child: LinkifyText(
        text ?? widget.value ?? '',
        textStyle: widget.style ?? _defaultStyle,
        linkStyle:
            widget.linkStyle ?? _defaultStyle?.copyWith(color: Colors.blue),
        onTap: widget.onLinkPressed,
        textAlign: widget.textAlign,
        overflow: widget.overflow,
      ),
    );
  }
}
