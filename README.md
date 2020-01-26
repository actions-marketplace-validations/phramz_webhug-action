Webhug Action 🤗
=================

Action to trigger Webhugs (https://github.com/phramz/webhug).

At the moment only github-style authentication is supported. Make sure your Webhug configs `security.type` is set to
`github` and `security.secret` matches the one you use in the action (see below).

## Inputs

### `endpoint` (**Required**)

URL to the Webhug endpoint. Example `'http://example.com/webhug/'`.

### `secret` (**Required**)

Secret to sign the request using github webhook authentication scheme. Example `'d5dcf6cae30e27d673eed9eefeaef87c90f6d5ed58eb08598f440ab10fb52faf'`.

### `ctype` (**Optional**)

The `content-type` header for the request. Example `'text/plain'`. Default: `'application/json'`

### `payload` (**Optional**)

The payload which will be posted to the endpoint. Example `'{ "some": ["random", "json"] }'`. Default: `''`

## Example usage

```yaml
uses: phramz/webhug-action@master
with:
  endpoint: 'http://example.com/webhug/'
  secret: 'd5dcf6cae30e27d673eed9eefeaef87c90f6d5ed58eb08598f440ab10fb52faf'
  ctype: 'text/plain'
  payload: 'let there be hugs 🤗'
```

Make sure to keep the secret actually a secret and store it whitin your repos Github secret:
https://help.github.com/en/actions/automating-your-workflow-with-github-actions/creating-and-using-encrypted-secrets

```yaml
uses: phramz/webhug-action@master
with:
  endpoint: 'http://example.com/webhug/'
  secret: '${{ secrets.WEBHUG_SECRET }}'
```

## License
``` 
MIT License

Copyright (c) 2020 Maximilian Reichel

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

