//Copyright (C) 2012 Sergey Akopkokhyants. All Rights Reserved.
//Author: akserg

library hello;

import 'dart:html' as dart_html;

import 'package:dart_web_toolkit/event.dart' as event;
import 'package:dart_web_toolkit/shared.dart' as shared;
import 'package:dart_web_toolkit/ui.dart' as ui;
import 'package:dart_web_toolkit/util.dart' as util;

void main() {
  //*****************
  // SplitLayoutPanel
  //*****************

  ui.SplitLayoutPanel p = new ui.SplitLayoutPanel();
  p.addWest(new ui.Button("navigation"), 128.0);
  p.addNorth(new ui.Button("list"), 384.0);
  p.add(new ui.Button("details"));

  // Attach the LayoutPanel to the RootLayoutPanel. The latter will listen for
  // resize events on the window to ensure that its children are informed of
  // possible size changes.
  ui.RootLayoutPanel rp = ui.RootLayoutPanel.get();
  rp.add(p);
}

void main2() {
  //****************
  // DockLayoutPanel
  //****************

  ui.DockLayoutPanel p = new ui.DockLayoutPanel(util.Unit.PX);
  p.getElement().id = "dock";
  //
  p.addNorth(new ui.Button("north"), 50.0);
  p.addSouth(new ui.Button("south"), 100.0);
  p.addEast(new ui.Button("east"), 150.0);
  p.addWest(new ui.Button("west"), 200.0);
  p.add(new ui.Button("center"));

  //
  ui.RootLayoutPanel root = ui.RootLayoutPanel.get();
  root.getElement().id = "root";
  root.add(p);

}

void main1() {
  //*******
  // Anchor
  //*******

  ui.Anchor anchor = new ui.Anchor(true);
  print("Href: ${anchor.href}");
  //
  anchor.tabIndex = 1;
  print("TabIndex: ${anchor.tabIndex}");
  //
  anchor.name = "Test";
  print("Name: ${anchor.name}");
  //
  anchor.target = "New target";
  print("Name: ${anchor.target}");
  //
  anchor.wordWrap = true;
  print("WordWrap: ${anchor.wordWrap}");
  anchor.wordWrap = false;
  print("WordWrap: ${anchor.wordWrap}");
  //
  anchor.html = "<b>hi</b>";
  print("Html: ${anchor.html}");
  //
  anchor.text = "Just text";
  print("Text: ${anchor.text}");
  //
  anchor.direction = "right";
  print("Direction: ${anchor.direction}");
  //
//  event.HandlerRegistration handlerRegistration;
//  handlerRegistration = anchor.addClickHandler(new shared.ClickHandler((shared.ClickEvent evt){
//    dart_html.UIEvent uiEvent = evt.nativeEvent;
//    print("Event: ${uiEvent.type}");
//    //
//    print("Direction: ${anchor.direction}");
//    handlerRegistration.removeHandler();
//  }));

  ui.RootPanel.get("testId").add(anchor);

  //*******
  // Button
  //*******

  ui.Button button = new ui.Button("Click me");
  ui.RootPanel.get("testId").add(button);

  //************
  // HeaderPanel
  //************

  ui.HeaderPanel headerPanel = new ui.HeaderPanel();

  headerPanel.setSize("150px", "100px");

  headerPanel.setHeaderWidget(new ui.Button("Header"));
  headerPanel.setFooterWidget(new ui.CheckBox("Active Footer"));
  headerPanel.setContentWidget(new ui.RadioButton("group", "Center"));

  ui.RootPanel.get("testId").add(headerPanel);

  //**************
  // VerticalPanel
  //**************

  ui.VerticalPanel vPanel = new ui.VerticalPanel();
  vPanel.spacing = 5;

  // Add some content to the panel
  for (int i = 1; i < 10; i++) {
    vPanel.add(new ui.Button("Button $i"));
  }

  ui.RootPanel.get("testId").add(vPanel);

  //**************
  // HorizontalPanel
  //**************

  ui.HorizontalPanel hPanel = new ui.HorizontalPanel();
  hPanel.spacing = 5;

  // Add some content to the panel
  for (int i = 1; i < 10; i++) {
    hPanel.add(new ui.Button("Button ${i}1"));
  }

  ui.RootPanel.get("testId").add(hPanel);
}
