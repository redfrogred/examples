// ignore_for_file: file_names

class Snippet {

  static const String _htmlTop = '<!DOCTYPE html><html><head><title>Navigation Delegate Example</title><style>a,abbr,acronym,address,applet,article,aside,audio,b,big,blockquote,body,canvas,caption,center,cite,code,dd,del,details,dfn,div,dl,dt,em,embed,fieldset,figcaption,figure,footer,form,h1,h2,h3,h4,h5,h6,header,hgroup,html,i,iframe,img,ins,kbd,label,legend,li,mark,menu,nav,object,ol,output,p,pre,q,ruby,s,samp,section,small,span,strike,strong,sub,summary,sup,table,tbody,td,tfoot,th,thead,time,tr,tt,u,ul,var,video{margin:0;padding:0;border:0;font-size:100%;font:inherit;vertical-align:baseline}article,aside,details,figcaption,figure,footer,header,hgroup,menu,nav,section{display:block}body{line-height:1}ol,ul{list-style:none}blockquote,q{quotes:none}blockquote:after,blockquote:before,q:after,q:before{content:'';content:none}table{border-collapse:collapse;border-spacing:0}body{font-size:4vw;padding:1em;background-color:#000;color:#fff;line-height:1.4;font-family:Arial,Helvetica Neue,Helvetica,sans-serif}body.dark{background-color:#000;color:#fff}body.light{background-color:#fff;color:#000}.arial{font-family:Arial,Helvetica Neue,Helvetica,sans-serif}.georgia{font-family:Georgia,Times,Times New Roman,serif}.verdana{font-family:Verdana,Geneva,sans-serif}h1{font-size:140%;font-weight:700}h2{font-size:120%;font-weight:700}h3{font-size:100%;font-weight:700}b{font-weight:700}i{font-style:oblique}p{margin-bottom:1em}a:active,a:hover,a:link,a:visited{color:#25c6da}.huge{font-size:140%}.big{font-size:120%}.normal{font-size:100%}.small{font-size:90%}.tiny{font-size:75%}.white{color:#fff}.black{color:#000}.yellow{color:#ff0}.blue{color:#25c6da}.green{color:#6fb589}.red{color:#df4739}.grey{color:#999}.ltgrey{color:#ccc}.dkgrey{color:#222}a.white:active,a.white:hover,a.white:link,a.white:visited{color:#fff}a.black:active,a.black:hover,a.black:link,a.black:visited{color:#000}a.blue:active,a.blue:hover,a.blue:link,a.blue:visited{color:#25c6da}a.yellow:active,a.yellow:hover,a.yellow:link,a.yellow:visited{color:#ff0}a.green:active,a.green:hover,a.green:link,a.green:visited{color:#6fb589}a.red:active,a.red:hover,a.red:link,a.red:visited{color:#df4739}div.white{background-color:#fff}div.black{background-color:#000}div.yellow{background-color:#ff0}div.blue{background-color:#25c6da}div.green{background-color:#6fb589}div..red{background-color:#df4739}div.grey{background-color:#999}div.ltgrey{background-color:#ccc}div.dkgrey{background-color:#222}div.black,div.blue,div.dkgrey,div.green,div.grey,div.ltgrey,div.white,div.yellow{display:inline-block;padding:.1vw .5vw .1vw .5vw}.dropcap{color:#25c6da;float:left;font-family:Georgia;font-size:11vw;line-height:1;padding-top:0;padding-right:.15em;padding-left:0}table#log{width:100%;border-collapse:separate;line-height:1.2}table#log tr.timestamp td:first-child{width:16%}table#log td{padding:.05em .1em}table#log tr.description td{padding-bottom:.5em}</style></head>';
  static const String _htmlBottom = '</script></body></html>';

  static List<String> Javascripts = [
    '',
    '<script>function scrollToBottom(){window.scrollTo(0,document.body.scrollHeight)}history.scrollRestoration="manual",window.onload=scrollToBottom;</script>',
    '<script>alert("smile")</script>'    
  ];
  
  static String html( String str, [int js = 0 ] ) {
    return _htmlTop + str + Javascripts[js] + _htmlBottom;
  }
}