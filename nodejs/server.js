var http  = require('http'),
    url   = require('url'),

start = function (router){

  onRequest = function(request, response){
    var path = url.parse(request.url).pathname;
    console.log('[' + Date() + '] Received request: ' + path);
    router(path);
    response.writeHead(200, { 'Content-Type' : 'text/html' });
    response.write('Hello world');
    response.end();
  }

  http.createServer(onRequest).listen(3000);
  console.log("The server has started and listening on port 3000");

}

exports.start = start;
