window.MathJax = {
  tex: {
    inlineMath: [['\\(', '\\)']],
    displayMath: [['\\[', '\\]']],
    processEscapes: true,
    processRefs: true,
    processEnvironments: true
  },
  chtml: {
    font: 'mathjax-asana'
  },
  startup: {
    ready: () => {
      console.log('MathJax is loaded and ready with font: mathjax-asana (Asana Math)');
      MathJax.startup.defaultReady();
    }
  }
};
