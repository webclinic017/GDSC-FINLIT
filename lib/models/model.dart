/// Dart import
import 'dart:convert';

// import 'package:FinLit/sample_list.dart';
/// Package imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';



/// WidgetCategory of the each control as Data Visualization, Editors,etc.,
class WidgetCategory {
  /// Contructor holds the name, id, control collection of the [WidgetCategory]
  WidgetCategory(
      [this.categoryName,
      this.controlList,
      this.mobileCategoryId,
      this.webCategoryId,
      this.showInWeb]);

  /// Getting the control details from the json file
  factory WidgetCategory.fromJson(Map<String, dynamic> json) {
    return WidgetCategory(json['categoryName'], json['controlList'],
        json['mobileCategoryId'], json['webCategoryId'], json['showInWeb']);
  }

  /// Name of the category
  String categoryName;

  /// Control collection under the particular category
  List<dynamic> controlList;

  /// Sorting the categories based on this id in mobile.
  final int mobileCategoryId;

  /// Sorting the categories based on this id in web.
  final int webCategoryId;

  /// Specify false if the category need not to show in web
  /// (as Viewer - not supported in web).
  final bool showInWeb;

  /// Selected control in the controllist under the particular category
  int selectedIndex = 0;
}

/// Defines the control class.
class Control {
  /// Contructor holds the tile, description, status etc., of the [Control]
  Control(this.title, this.description, this.image, this.status,
      this.displayType, this.subItems, this.controlId, this.showInWeb);

  /// Getting the control details from the json file
  factory Control.fromJson(Map<String, dynamic> json) {
    return Control(
        json['title'],
        json['description'],
        json['image'],
        json['status'],
        json['displayType'],
        json['subItems'],
        json['controlId'],
        json['showInWeb']);
  }

  /// Contains title of the control, display in the home page
  final String title;

  /// Contains description of the control, display in the home page
  final String description;

  /// Contains image relates to the control, display in the home page
  final String image;

  /// Conatins status of the control New/Updated/Preview
  final String status;

  /// Display the controls based on this order.
  final int controlId;

  /// Need to mention this when samples directly given without any sub category
  /// Mention as card/fullView, by default it will taken as "fullView".
  final String displayType;

  /// Specify false if the control need not to show in web
  /// (as pdf viewer - not supported in web).
  final bool showInWeb;

  /// Contains the subItem list which comes under sample type
  List<SubItem> sampleList;

  /// Contains the subItem list which comes under [child] type
  List<SubItem> childList;

  /// Contains the sample details collection
  List<dynamic> subItems;
}

/// Contains the detail of sample in different hierarchy levels
/// parent, child, sample types
class SubItem {
  /// It holds the type, title, key, description etc., of the sample
  SubItem(
      [this.type,
      this.displayType,
      this.title,
      this.key,
      this.codeLink,
      this.description,
      this.status,
      this.subItems,
      this.showInWeb,
      this.sourceLink,
      this.sourceText,
      this.needsPropertyPanel]);

  /// Getting the SubItem details from the json file
  factory SubItem.fromJson(Map<String, dynamic> json) {
    return SubItem(
        json['type'],
        json['displayType'],
        json['title'],
        json['key'],
        json['codeLink'],
        json['description'],
        json['status'],
        json['subItems'],
        json['showInWeb'],
        json['sourceLink'],
        json['sourceText'],
        json['needsPropertyPanel']);
  }

  /// Type given as parent/child/sample.
  /// if "parent" is given then primary tab and secondary tab both come.
  /// for "parent", "child" type must be give to subItems(next hierarchy).
  /// if "child" is given only primary tab will come.
  /// if "sample" is given no tab will come.
  /// by default it taken as "sample".
  /// Note: In all cases displayType is given as "fullView",
  /// additionally sample's tab will come.
  final String type;

  /// Mention the samples layout.
  /// displayType given as card/fullView.
  /// by default it taken as "fullView".
  /// Note: Need to mention this when on display type is child.
  final String displayType;

  /// Need to mention in all type.
  final String title;

  /// Below values need to give when type is "sample".
  final String key;

  /// Contains Github sample link
  final String codeLink;

  /// Contains the description of the sample
  /// to be displayed in the sample backpanel
  final String description;

  /// Status of the sample, displays above the sample
  final String status;

  /// Specify false if the sample need not to show in web
  /// (as sample with dash array).
  final bool showInWeb;

  /// SourceLink which will launch a url of the sample's source
  /// on tapping source text present under the sample.
  final String sourceLink;

  /// Short form of the source link which will displays under the sample.
  final String sourceText;

  /// No need to give when type is "sample".
  List<dynamic> subItems;

  /// If current sample has property panel mention true.
  final bool needsPropertyPanel;

  /// Contains appropriate category name
  String categoryName;

  ///Holds the URL text
  String breadCrumbText;

  ///Current parent subItem index
  int parentIndex;

  ///Current child subItem index
  int childIndex;

  ///Current child subItem index
  int sampleIndex;

  /// Holds appropriate control
  Control control;
}

