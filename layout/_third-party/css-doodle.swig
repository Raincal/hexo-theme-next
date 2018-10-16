{% if theme.scheme == 'Gemini' and theme.css_doodle and theme.css_doodle.enable %}
  <link rel='stylesheet prefetch' href='https://cdn.jsdelivr.net/devicons/1.8.0/css/devicons.min.css'>
  <script src="https://cdn.jsdelivr.net/npm/css-doodle@0.4.9/css-doodle.min.js"></script>
  <css-doodle>
    :doodle {
      @grid: 22 / 100vmax;
      background: #12152f;
    }
    :after {
      font-family: devicons;
      content: '\@hex(@rand(58894, 59050))';
      font-size: 3.6vmax;
      color: hsla( @rand(360), 70%, 70%,@rand(.9) );
    }
    @keyframes turn {
      0, 30% { transform: rotate(0deg); }
      30% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    :hover {
      animation: turn 1.4s 0s ease-out infinite;
    }
  </css-doodle>
  <style>
    css-doodle {
      position: fixed;
      top: 0;
      left: 0;
  }
  </style>
  <script>
    if (!window.customElements || !document.head.attachShadow) {
      document.body.classList.add('no-doodle-support');
    } else {
      document.body.classList.add('doodle-support');
      var myDoodle = document.querySelector('css-doodle');

      myDoodle.addEventListener('click', function() {
        myDoodle.update();
      });
    }
  </script>
{% endif %}
