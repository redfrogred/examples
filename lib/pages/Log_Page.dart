// ignore_for_file: prefer_const_constructors, camel_case_types

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../classes/Config.dart';
import '../classes/Snippet.dart';
import '../classes/Utils.dart';
import '../pages/_AllPages.dart';
import '../providers/Controller.dart';

class Log_Page extends StatefulWidget {
  const Log_Page({ super.key });

  @override
  State createState() => _Log_PageState();
}

class _Log_PageState extends State<Log_Page> {

  _Log_PageState() {
    Utils.log( 'Log_Page.dart', '<<< init >>', 0 );
  }

  // (this page) variables
  static const String _fileName = 'Log_Page.dart';
  static const String kExamplePage = '''
  <!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title>
<style>

html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td,
article, aside, canvas, details, embed, 
figure, figcaption, footer, header, hgroup, 
menu, nav, output, ruby, section, summary,
time, mark, audio, video {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 100%;
	font: inherit;
	vertical-align: baseline;
}
/* HTML5 display-role reset for older browsers */
article, aside, details, figcaption, figure, 
footer, header, hgroup, menu, nav, section {
	display: block;
}
body {
	line-height: 1;
}
ol, ul {
	list-style: none;
}
blockquote, q {
	quotes: none;
}
blockquote:before, blockquote:after,
q:before, q:after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

	/* CUSTOM */
	
	body { 
		font-size: 4vw; 
		padding: 1em; 
		background-color: #000;
		color: #fff;
		line-height: 1.4;
		font-family: Arial,Helvetica Neue,Helvetica,sans-serif; 
	}
	
	body.dark {
		background-color: #000;
		color: #fff;	
	}

	body.light {
		background-color: #fff;
		color: #000;	
	}

	.arial 		{ font-family: Arial,Helvetica Neue,Helvetica,sans-serif;  }
	.georgia 	{ font-family: Georgia,Times,Times New Roman,serif; }
	.verdana	{ font-family: Verdana,Geneva,sans-serif; }
	
	h1 { font-size: 140%; font-weight: bold; }
	h2 { font-size: 120%; font-weight: bold; }
	h3 { font-size: 100%; font-weight: bold; }
	
	b { font-weight: bold; }
	i { font-style: oblique; }
	
	p { margin-bottom: 1em; }

	a:link, a:visited, a:hover, a:active {
		color: #25c6da;
	}

	/* START OF SIZES */
	.huge 	{ font-size: 140%; }
	.big 		{ font-size: 120%; }
	.normal	{ font-size: 100%; }
	.small 	{ font-size: 90%; }
	.tiny 	{ font-size: 75%; }
	
	/* START OF FONT COLORS */
	
	.white 	{ color: #fff; }
	.black 	{ color: #000; }
	.yellow { color: Yellow; }
	.blue 	{ color: #25c6da; }
	.green 	{ color: #6fb589; }
	.red		{ color: #df4739; }

	.grey 	{ color: #999; }
	.ltgrey	{ color: #ccc; }
	.dkgrey { color: #222; }

			/* START OF LINK COLORS */
			a.white:link, a.white:visited, a.white:hover, a.white:active { color: #fff; }
			a.black:link, a.black:visited, a.black:hover, a.black:active { color: #000; }	
			a.blue:link, a.blue:visited, a.blue:hover, a.blue:active { color: #25c6da; }
			a.yellow:link, a.yellow:visited, a.yellow:hover, a.yellow:active { color: Yellow; }
			a.green:link, a.green:visited, a.green:hover, a.green:active { color: #6fb589; }
			a.red:link, a.red:visited, a.red:hover, a.red:active { color: #df4739; }			
					
					/* START OF DIV BACKGROUND COLORS */
					
					div.white 	{ background-color: #fff; }
					div.black 	{ background-color: #000; }
					div.yellow { background-color: Yellow; }
					div.blue 	{ background-color: #25c6da; }
					div.green 	{ background-color: #6fb589; }
					div..red		{ background-color: #df4739; }

					div.grey 	{ background-color: #999; }
					div.ltgrey	{ background-color: #ccc; }
					div.dkgrey { background-color: #222; }
					
					div.white, div.black, div.yellow,
					div.blue, div.green, div.grey,
					div.ltgrey, div.dkgrey {
						display: inline-block; padding: .1vw .5vw .1vw .5vw;
					}			


	.dropcap {
		color: #25c6da;
		float: left;
		font-family: Georgia;
		font-size: 11vw;
		line-height: 1;
		padding-top: 0;
		padding-right: .15em;
		padding-left: 0;
	}

					
	
	/* START OF LOG */
	
	table#log {
		width: 100%;
		border-collapse: separate;
		line-height: 1.2;
	}
	
	table#log tr.timestamp td:first-child {
		width: 20%;
	}
	
	table#log tr.description {
		
	}

	table#log td {
		padding: .05em .1em;
	}

	table#log tr.description td {
		padding-bottom: .5em;
	}
	
</style>
</head>
<body class="dark">

	<p>
		<span class="dropcap">W</span>
		elcome ipsum dolor sit amet, consectetur adipiscing elit.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit.
		Lorem ipsum dolor sit amet, consectetur adipiscing elit.
	</p>

	<h1>Some font stylin'...</h1>	
	<p>
		This is <i>italisized</i> while this is <b>bolded</b>! Meanwhile,
		these <i class="green big">next three words</i> are big, green
		and italian! <a href="">This is a link</a>!
	</p>	


	<p>
		<h1>Show some Headings! (This is h1)</h1>
		<h2>Second headings? (This is h2)</h2>
		<h3>The third time's a churn! (This is h3)</h3>
	</p>

	<p>
		<h1 class="georgia">Heading1 in Georgia font</h1>
		<h1 class="arial">Heading2 in Arial font</h1>
		<h1 class="verdana">Heading3 in Verdana font</h1>
	</p>
	
	<p>
		<h1>Show some sizes...</h1>
		<span class="huge">Huge Font!</span><br />
		<span class="big">This is a big font</span><br />
		<span class="normal">Normalize this!</span><br />
		<span class="small">Small, yet mighty?</span><br />
		<span class="tiny">Teeny-tiny font</span><br />
	</p>
	
	<p>
		<h1>Show some colors!</h1>
		<span class="white">White (white)</span><br />
		<div class="grey"><span class="black">Black-eyed peas (black)</span></div><br />
		<span class="yellow">Mellow yellow (yellow)</span><br />
		<span class="red">Red Devils (red)</span><br />
		<span class="blue">Blue skies? (blue)</span><br />
		<span class="green">Green eyes! (green)</span><br />
		<span class="ltgrey">Light Grey (ltgrey)</span><br />
		<span class="grey">Grey skies(grey)</span><br />
		<span class="dkgrey">Dark Grey (dkgrey)</span><br />
	</p>

	<table id="log">
		<tr class="timestamp">
			<td class="yellow">64.7 sec</td>
			<td><span class="grey">(</span> Start_Page.dart <span class="grey">)</span></td>
		</tr>	
		<tr class="description">
			<td></td>
			<td class="ltgrey">Loaded the thing and made it happen</td>
		</tr>		
		<tr class="timestamp">
			<td class="yellow">64.7 sec</td>
			<td><span class="grey">(</span> Start_Page.dart <span class="grey">)</span></td>
		</tr>	
		<tr class="description">
			<td></td>
			<td class="ltgrey">Loaded the thing and made it happen Loaded the thing and made it happen Loaded the thing and made it happen</td>
		</tr>			
		<tr class="timestamp">
			<td class="yellow">64.7 sec</td>
			<td><span class="grey">(</span> Start_Page.dart <span class="grey">)</span></td>
		</tr>	
		<tr class="description">
			<td></td>
			<td class="ltgrey">Loaded the thing and made it happen</td>
		</tr>			
	</table>
<script>
	// from https://stackoverflow.com/questions/11715646/scroll-automatically-to-the-bottom-of-the-page
	
	// scroll to bottom
	function scrollToBottom() {
      window.scrollTo(0, document.body.scrollHeight);
	}
	history.scrollRestoration = "manual";
	window.onload = scrollToBottom;
 
</script>
</body>
</html>
  ''';   
  
  // (this page) init and dispose
  @override
  void initState() {
    super.initState();
    Utils.log( _fileName, 'initState()' );
    WidgetsBinding.instance.addPostFrameCallback((_) => _addPostFrameCallbackTriggered(context));
  }

  @override
  void dispose() {
    Utils.log( _fileName, ' dispose()');
    super.dispose();
  }

  // (this page) methods
  void _buildTriggered() {
    Utils.log( _fileName, ' _buildTriggered()');
  }
  
  void _addPostFrameCallbackTriggered( context ) {
    Utils.log( _fileName, ' _addPostFrameCallbackTriggered()');
  }

  // (this page) build
  @override
  Widget build(BuildContext context) {

    _buildTriggered();

    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,  
          backgroundColor: Config.mainBackgroundColor,
          appBar: AppBar(
            title: const Text( _fileName ),
            centerTitle: true,
          ), //AppBar
          // drawer: DrawerWidget(),
          body: 
              Container(
                color: Colors.transparent,
                child: WebView(
                  initialUrl: Uri.dataFromString(Snippet.html('<body class="dark"><table id="log">' + Config.log + '</table>',1) , mimeType: 'text/html', encoding: utf8).toString(),
                  onPageFinished: (String url) async {
                  },
                  javascriptMode: JavascriptMode.unrestricted,
                ),
              
          ),
        ),
      );
  }
}