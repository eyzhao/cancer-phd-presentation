Reveal.initialize({
    width: 960,
    height: 720,
    maxScale: 1.2,
    controls: false,
    progress: true,
    history: true,
    center: true,
    slideNumber: true,
    dependencies: [
        { 
            src: 'lib/js/classList.js', 
            condition: function() { 
                return !document.body.classList; 
            }
        }, {
            src: 'git/revealjs/plugin/markdown/marked.js', 
            condition: function() { 
                return !!document.querySelector( '[data-markdown]' ); 
            } 
        }, {
            src: 'git/revealjs/plugin/markdown/markdown.js', 
            condition: function() { 
                return !!document.querySelector( '[data-markdown]' ); 
            } 
        }, { 
            src: 'git/revealjs/plugin/highlight/highlight.js', 
            async: true, 
            callback: function() { 
                hljs.initHighlightingOnLoad(); 
            } 
        }, { 
            src: 'git/revealjs/plugin/zoom-js/zoom.js', 
            async: true 
        }, { 
            src: 'git/revealjs/plugin/math/math.js',
            async: true 
        }
    ]
});
