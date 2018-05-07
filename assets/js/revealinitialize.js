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
            src: 'packages/revealjs/plugin/markdown/marked.js', 
            condition: function() { 
                return !!document.querySelector( '[data-markdown]' ); 
            } 
        }, {
            src: 'packages/revealjs/plugin/markdown/markdown.js', 
            condition: function() { 
                return !!document.querySelector( '[data-markdown]' ); 
            } 
        }, { 
            src: 'packages/revealjs/plugin/highlight/highlight.js', 
            async: true, 
            callback: function() { 
                hljs.initHighlightingOnLoad(); 
            } 
        }, { 
            src: 'packages/revealjs/plugin/zoom-js/zoom.js', 
            async: true 
        }, { 
            src: 'packages/revealjs/plugin/math/math.js',
            async: true 
        }
    ]
});
