# wintersmith-xmlb

A template plugin for the Wintersmith static site generator that lets one to write *xmlb* templates to generate XML.

The *xmlb* template library uses the *xmlbuilder-js* library to generate XML.

My need for outputting XML was to generate a sitemap file. It could also be used to generate RSS and Atom feeds.

Here's an example of a snippet of a sitemap.xmlb template:

```js
//set up pages array

var root = xml.begin('urlset', {version: '1.0', encoding: 'UTF-8'})
              .att('xmlns', 'http://www.sitemaps.org/schemas/sitemap/0.9')

pages.forEach(function(item){
  root.ele('url')
        .ele('loc')
          .text(locals.url + item.url)
        .up()
        .ele('changefreq')
          .text('weekly')
});
```

## Referenced projects

* [Wintersmith](https://github.com/jnordberg/wintersmith)
* [xmlb](https://github.com/jaredhanson/xmlb)
* [xmlbuilder-js](https://github.com/oozcitak/xmlbuilder-js)

A special thanks to the [wintersmith-ejs](https://github.com/stephenallred/wintersmith-ejs) project by [Stephen Allred](https://github.com/stephenallred), which I used as the template for this project.

## Contributors

* Nick Baugh <niftylettuce@gmail.com>
