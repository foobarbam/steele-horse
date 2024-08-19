// taken from https://medium.com/@walid.karray/mastering-static-website-hosting-on-aws-with-terraform-a-step-by-step-tutorial-5401ccd2f4fb
function handler(event) {
  var request = event.request;
  var hostHeader = request.headers.host.value;
  var uri = request.uri;

  // Regular expression to extract the top-level domain and root domain
  var domainRegex = /(?:.*\.)?([a-z0-9\-]+\.[a-z]+)$/i;
  var match = hostHeader.match(domainRegex);

  if (uri.endsWith('/')) {
      request.uri += 'index.html';
  }
  
  /* else if (!uri.endsWith('.[a-z0-9\-]+')) {
      request.uri += '/index.html';
  } */

  // If the regex does not match, or the host does not start with 'www.', return the original request
  if (!match || !hostHeader.startsWith('www.')) {
      return request;
  }

  // Extract the root domain
  var rootDomain = match[1];

  // Construct and return the redirect response
  return {
    statusCode: 301,
    statusDescription: 'Moved Permanently',
    headers: {
      "location": { "value": "https://" + rootDomain + request.uri },
      "cache-control": { "value": "max-age=3600" }
    }
  };
}