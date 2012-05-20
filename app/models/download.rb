class Download
  def initialize apikey
    @apikey = apikey
  end

  def js
    script =<<-"EOS"
// ==UserScript==
// @author           tcliper_admin
// @name             tcliper
// @namespace        http://summer-lights.dyndns.ws/tcliper/
// @include          http://*
// @description      tcliper script
// @version          0.1.0
// ==/UserScript==
(function(w){
var KEYCODE_PUBLIC = "Q";
var KEYCODE_PRIVATE = "W";
var CTRL = true;
var SEND_TO = "http://summer-lights.dyndns.ws/tcliper/clip/";
var API_KEY = "#{@apikey}";

w.document.onkeypress = setKeyEvent;

function execExtract(){
  var range = {}, extract_text = "";
  try{
    range.obj = w.getSelection().getRangeAt(0);
    range.fragment = document.createDocumentFragment();
    range.html = document.createElement("span");
    range.html.appendChild(range.obj.cloneContents());
    extract_text = range.html.textContent;
  }
  catch(err){
    //alert(err);
  }

  return extract_text;
}

function sendClipData(title, url, comment, public){
  GM_xmlhttpRequest({
    method: "post",
    url: SEND_TO,
    headers: {
      "Content-Type": "application/x-www-form-urlencoded"
    },
    data: "title=" + title + "&url=" + url + "&comment=" + comment + "&apikey=" + API_KEY + "&public=" + public,
    onload: function(res){
      alert(res.responseText);
    },
    onerror: function(res){
      alert(res.status);
    }
  });
}

function setKeyEvent(e){
  var keycode, keychar, ctrl;
  keycode = e.which;
  keychar = String.fromCharCode(keycode).toUpperCase();
  ctrl    = typeof e.modifiers == 'undefined' ? e.ctrlKey : e.modifiers & Event.CONTROL_MASK;

  var title   = encodeURIComponent(document.getElementsByTagName("title")[0].innerHTML);
  var url     = encodeURIComponent(location.href);
  var comment = encodeURIComponent(execExtract()) || title;
  if(CTRL && ctrl){
    if(keychar == KEYCODE_PUBLIC){
      sendClipData(title, url, comment, 1);
    }
    else if(keychar == KEYCODE_PRIVATE){
      sendClipData(title, url, comment, 0);
    }
  }
}

})(this.unsafeWindow || window);
    EOS
  end
end
