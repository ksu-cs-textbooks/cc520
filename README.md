# K-State CS Hugo Framework

This is a [Hugo](https://gohugo.io/)-based web framework for K-State CS lecture content. It uses a lightly adapted version of the [Hugo-theme-learn](https://learn.netlify.com/en/) theme called [ksucs-hugo-theme](https://github.com/russfeld/ksucs-hugo-theme)

Major added features are the addition of [Reveal.js](https://github.com/hakimel/reveal.js/) slideshow framework, and the creation of an embeddable version of content pages for use with IFrames in [Canvas](https://www.instructure.com/) and other learning management systems.

**[Demo](https://ksucs-hugo.russfeld.me)**

#### Relevant Documentation

* [Hugo Documentation](https://gohugo.io/documentation/)
* [Hugo-theme-learn Documentation](https://learn.netlify.com/en/)
* [Reveal.js Documentation](https://github.com/hakimel/reveal.js/)

## Installation

Install Hugo > 0.60 on your system. I recommend using Linux or Windows Subsystem for Linux.

Clone this repository and edit your content.

To view the content locally, use the `hugo server` command and visit http://localhost:1313 to view a local version of your site

To deploy the content, use the `hugo` command on the destination server to generate a `public` folder. Then, point your web server of choice to that folder.

### Cloning for the first time?

1. `git clone --recursive [URL to Git repo]`
2. or `git clone` and:
    1. `git submodule update --init --recursive`
       1. `git submodule update --recursive --remote`
    2. pull all changes in the repo including changes in the submodules `git pull --recurse-submodules`
    3. pull all changes for the submodules `git submodule update --remote`