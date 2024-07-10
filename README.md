# multipagewebapp-using-halogen

This respository demonstrates a multipage webapp using Purescript's Halogen
webapp framework.

Halogen is intended to be used as a singlepage webapp framework, but we can use
it as a multipage one as well if we punt on resource sharing.

This project is organized into three modules:
- `App.Template`: Contains templates that content is built using. A template needs to export a `main :: Effect Unit` function which is run when the page is opened.
- `App.Static`: Contains for generating static content other than the compiled Purescript. For example `App.Static.GenerateHtmlFile` generates the HTML file for a specified page, placed in a target directory (usually would be `./docs` in this case). This file references a Javascript file that corresponds to the compiled Purescript that defines that page.
- `App.Content`: Contains all the content for the webapp. Most files define a single page of the multipage webapp. But of course something like a `App.Content.Common` file is shared between all pages (though, this is just for code reuse, not for actual resource sharing). Note that for each page of the webapp, you need to actually have a build script for it somewhere. In this repository, there are only statically-known pages, so there exists a `*.page.js` file that specifies which submodule of `App.Content` to use for each page.

## Usage

Requirements:
- make
- [pnpm](https://pnpm.io/)

To build and serve the project:

```sh
pnpm install
make *.page.js -B
make serve
```
