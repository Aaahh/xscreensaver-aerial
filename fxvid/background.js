/*
On startup, connect to the "ping_pong" app. // https://github.com/mdn/webextensions-examples/tree/master/native-messaging
*/

/*
On a click on the browser action, send the app a message.
*/
var port = browser.runtime.connectNative("fxvid");

function logTabs(tabas) {
    let tab = tabas[0]; // Safe to assume there will only be one result
    browser.tabs.executeScript({code:'document.getElementsByClassName("ytp-play-button")[0].click();'});
    // document.getElementsByClassName('ytp-play-button')[0].click();
    console.log(tab.url.toString());
    port.postMessage(tab.url.toString());
}

function onError(err){
    console.error(err);
}

browser.browserAction.onClicked.addListener(() => {
  console.log("Sending:  ping");
  browser.tabs.query({currentWindow: true, active: true}).then(logTabs, onError);
});


// var executing = browser.tabs.executeScript({
//   code: makeItGreen
// });
// executing.then(onExecuted, onError);
// chrome.tabs.executeScript(tabId, {code:'var w = window; console.log(w);'});