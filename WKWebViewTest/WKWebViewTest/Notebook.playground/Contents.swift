//: 用户脚本(User Scripts)
//: 简单来说，用户脚本是被注入正在加载的WKWebView网页的JavaScript片段。用户脚本在内容（DOM）被加载完成之前或者之后被注入。用户脚本可以在页面上做任何常规的javascript脚本可以做的事情，包括操纵DOM，并访问加载页面中现有的JavaScript方法。用户脚本是你的本地应用程序与JavaScript的对话。



//: 脚本消息（Script Messages）
//: 表示网页上的脚本如何应答你的本地应用程序。脚本消息显示在网页中可以调用的JavaScript方法。你需要在你的应用程序中定义处理器来处理来自网站的消息。脚本消息可以是来自用户脚本或者由WKWebView控制的网页中注入的任何其他的脚本。


//: Demo
//: 在这个Demo中，我们将看到如何从我们的原生应用程序中调用JavaScript方法来改变DOM元素的颜色，同事收听来自 从HTML页面中的JavaScript发送给本机应用程序的异步消息。让我们开始吧！

//: 需要两个因素：1.一个WKWebView可以加载的带有一些JavaScript的网页；2.一个访问WKWebView网页的本地应用程序


//:这个网页
//:网页一般是相当简单的。有两个文件，一个是"index.html",一个是main.js（包含在index.html的body标签的结尾）。


//:main.js的内容如下：

/*
function callNativeApp () {
    try {
        webkit.messageHandlers.callbackHandler.postMessage("Hello from JavaScript");
    } catch(err) {
        console.log('The native context does not exist yet');
    }
}

setTimeout(function () {
    callNativeApp();
    }, 5000);

function redHeader() {
    document.querySelector('h1').style.color = "red";
}
*/

//:当这个脚本文件加载时，将等待5秒钟，然后执行"callNativeApp"方法。唯一需要注意的是，这里有一个"callbackHandler",它是脚本消息回调的名字，我们将在本地应用程序中定义它。
//Also, I'm wrapping the callback to "webkit.messageHandlers....." in a try catch block to avoid the script falling over when it's running outside of a native app context.
//
//There is also a tiny function which will change the header in the HTML page to a red color when run, well use this later.
//
//You can load this web-page from a server or simply include it in your app. I'll be loading it from a local server to simulate a more realistic example.







