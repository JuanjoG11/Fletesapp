/* ============================================================
   FLETES APP - Toque Navideno
   - Nieve sutil (canvas)
   - Feliz Navidad en login y dashboard
   - Gorrito diagonal en esquina sup-izq del card/sidebar
============================================================ */
(function () {
    'use strict';

    var ENABLED        = true;
    var SEASONAL       = false;
    var FLAKES_DESKTOP = 55;
    var FLAKES_MOBILE  = 28;

    if (!ENABLED) return;
    if (SEASONAL) {
        var hoy = new Date();
        var ok  = hoy.getMonth() === 11 || (hoy.getMonth() === 0 && hoy.getDate() <= 6);
        if (!ok) return;
    }

    var reduceMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

    /* CSS */
    var css = [
        '.xmas-snow{position:fixed;inset:0;width:100%;height:100%;pointer-events:none;z-index:9000;}',
        '.xmas-hat-fixed{position:fixed;pointer-events:none;z-index:9999;}',
        /* Saludo login */
        '.xmas-greet-login{display:block;margin:-4px 0 20px;font-size:1rem;font-weight:700;}',
        '.xmas-greet-login .xmas-emo{color:initial;-webkit-text-fill-color:initial;background:none;}',
        '.xmas-greet-login .xmas-txt{background:linear-gradient(90deg,#fbbf24,#ef4444 50%,#22c55e);-webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent;}',
        /* Banner dashboard */
        '.xmas-greet-dash{display:flex;align-items:center;justify-content:center;gap:10px;margin:0 0 24px;padding:13px 20px;border-radius:14px;flex-wrap:wrap;',
        'background:linear-gradient(135deg,rgba(251,191,36,.10),rgba(239,68,68,.08) 50%,rgba(34,197,94,.08));',
        'border:1px solid rgba(251,191,36,.28);backdrop-filter:blur(6px);font-size:.95rem;font-weight:700;',
        'animation:xmas-pulse 3s ease-in-out infinite;}',
        '.xmas-greet-dash .xmas-emo{font-size:1.3rem;line-height:1;color:initial;-webkit-text-fill-color:initial;background:none;}',
        '.xmas-greet-dash .xmas-txt{background:linear-gradient(90deg,#fbbf24,#ef4444 55%,#22c55e);-webkit-background-clip:text;background-clip:text;-webkit-text-fill-color:transparent;}',
        '@keyframes xmas-pulse{0%,100%{box-shadow:none;}50%{box-shadow:0 0 18px rgba(251,191,36,.18);}}',
        '@media(max-width:600px){.xmas-greet-dash{font-size:.82rem;padding:10px 12px;}}'
    ].join('');

    var st = document.createElement('style');
    st.textContent = css;
    document.head.appendChild(st);

    /* Dibuja el gorrito en canvas */
    function crearGorro(hatW) {
        var hatH = Math.round(hatW * 1.15);
        var dpr  = Math.min(window.devicePixelRatio || 1, 2);
        var cv   = document.createElement('canvas');
        cv.width  = hatW * dpr;
        cv.height = hatH * dpr;
        cv.style.cssText = 'width:' + hatW + 'px;height:' + hatH + 'px;display:block;';
        var c = cv.getContext('2d');
        c.scale(dpr, dpr);
        var w = hatW, h = hatH;
        var baseH = h * 0.22;
        var baseY = h - baseH;

        c.shadowColor = 'rgba(0,0,0,.4)';
        c.shadowBlur  = 5;
        c.shadowOffsetX = 1; c.shadowOffsetY = 2;

        /* Cuerpo rojo */
        c.beginPath();
        c.moveTo(w*.05, baseY);
        c.bezierCurveTo(w*.15, h*.10, w*.52, h*.00, w*.76, h*.28);
        c.bezierCurveTo(w*.87, h*.42, w*.95, h*.62, w*.96, baseY);
        c.lineTo(w*.05, baseY);
        c.closePath();
        var gRojo = c.createLinearGradient(0, 0, w, h);
        gRojo.addColorStop(0,   '#ff3333');
        gRojo.addColorStop(.55, '#cc0000');
        gRojo.addColorStop(1,   '#8b0000');
        c.fillStyle = gRojo;
        c.fill();

        /* Banda blanca */
        c.shadowBlur = 2;
        c.beginPath();
        if (c.roundRect) {
            c.roundRect(w*.02, baseY, w*.96, baseH, baseH/2);
        } else {
            c.rect(w*.02, baseY, w*.96, baseH);
        }
        var gBanda = c.createLinearGradient(0, baseY, 0, baseY + baseH);
        gBanda.addColorStop(0, '#ffffff');
        gBanda.addColorStop(1, '#cccccc');
        c.fillStyle = gBanda;
        c.fill();

        /* Pompon */
        var px = w*.22, py = h*.10, pr = w*.13;
        c.shadowBlur = 8; c.shadowColor = 'rgba(255,255,255,.5)';
        var gPom = c.createRadialGradient(px-pr*.3, py-pr*.3, pr*.05, px, py, pr);
        gPom.addColorStop(0, '#ffffff');
        gPom.addColorStop(1, '#cccccc');
        c.beginPath(); c.arc(px, py, pr, 0, Math.PI*2);
        c.fillStyle = gPom; c.fill();
        c.shadowBlur = 0;
        return { cv: cv, hatH: hatH };
    }

    /*
      Ancla el gorro en la esquina sup-izq del elemento dado.
      El gorro rota -45deg (diagonal hacia la esquina):
        - transform-origin: bottom right  -> la esquina inf-der del canvas
          queda fija en la esquina sup-izq del card.
      offX/offY: ajuste fino en px.
    */
    /*
      Pega el gorro en la esquina sup-izq de anchorEl.
      - El div se posiciona con top-left en (r.left - hatW*0.3, r.top - hatH*0.55)
        de modo que la BANDA del gorro quede sobre la esquina del elemento.
      - rotate(-45deg) con transform-origin:center lo gira diagonalmente.
      hatW  : ancho del gorro en px
    */
    function pegarGorro(anchorEl, hatW) {
        var res  = crearGorro(hatW);
        var wrap = document.createElement('div');
        wrap.className = 'xmas-hat-fixed';
        wrap.style.width           = hatW + 'px';
        wrap.style.height          = res.hatH + 'px';
        wrap.style.transformOrigin = 'center center';
        wrap.style.transform       = 'rotate(-45deg)';
        wrap.appendChild(res.cv);
        document.body.appendChild(wrap);

        function colocar() {
            var r = anchorEl.getBoundingClientRect();
            // Centramos el gorro sobre la esquina sup-izq del elemento
            // left: esquina izq del elemento menos la mitad del gorro (queda mitad adentro, mitad afuera)
            // top:  esquina top del elemento menos la mitad del alto del gorro
            wrap.style.left = (r.left - hatW  * 0.5) + 'px';
            wrap.style.top  = (r.top  - res.hatH * 0.5) + 'px';
        }

        colocar();
        var rt;
        window.addEventListener('resize', function() {
            clearTimeout(rt); rt = setTimeout(colocar, 150);
        });
    }
    /* INIT */
    function init() {
        if (document.querySelector('.xmas-greet-login') ||
            document.querySelector('.xmas-greet-dash')) return;
        var esLogin = !!document.querySelector('.login-card');
        if (esLogin) initLogin();
        else         initDashboard();
        if (!reduceMotion) startSnow();
    }

    /* LOGIN */
    function initLogin() {
        var card = document.querySelector('.login-card');
        if (!card) return;

        /* Saludo - texto sin tildes en JS, tildes como entidades HTML */
        var h2  = card.querySelector('h2');
        var sub = document.createElement('span');
        sub.className = 'xmas-greet-login';
        sub.innerHTML =
            '<span class="xmas-emo">&#127876;</span>' +
            '<span class="xmas-txt"> &iexcl;Feliz Navidad! </span>' +
            '<span class="xmas-emo">&#127877;</span>';
        if (h2) h2.after(sub); else card.prepend(sub);

        /* Gorro diagonal en esquina sup-izq del card
           offX=18, offY=18 -> la punta sobresale 18px fuera del borde */
        pegarGorro(card, 55);
    }

    /* DASHBOARD */
    function initDashboard() {
        var inicio = document.getElementById('inicio');
        if (inicio && !inicio.querySelector('.xmas-greet-dash')) {
            var banner = document.createElement('div');
            banner.className = 'xmas-greet-dash';
            banner.innerHTML =
                '<span class="xmas-emo">&#127876;</span>' +
                '<span class="xmas-txt">&iexcl;Feliz Navidad y Pr&oacute;spero A&ntilde;o Nuevo!</span>' +
                '<span class="xmas-emo">&#127877;</span>';
            inicio.insertBefore(banner, inicio.firstChild);
        }

        /* Gorro en la esquina sup-izq del topbar "CONTROL DE FLETES" */
        requestAnimationFrame(function() {
            var topbar = document.querySelector('.topbar');
            if (topbar) {
                pegarGorro(topbar, 50);
            }
        });
    }

    /* NIEVE */
    function startSnow() {
        var canvas = document.createElement('canvas');
        canvas.className = 'xmas-snow';
        document.body.appendChild(canvas);
        var ctx = canvas.getContext('2d');
        var w, h, flakes = [], raf = null;
        var COUNT = window.innerWidth < 768 ? FLAKES_MOBILE : FLAKES_DESKTOP;

        function isLight() {
            return document.documentElement.getAttribute('data-theme') === 'light';
        }
        var col = isLight() ? '#64748b' : '#e2e8f0';
        try {
            new MutationObserver(function() { col = isLight() ? '#64748b' : '#e2e8f0'; })
                .observe(document.documentElement, { attributes:true, attributeFilter:['data-theme'] });
        } catch(e) {}

        function reset(f, top) {
            f.x = Math.random() * w;
            f.y = top ? -(Math.random() * 40) : Math.random() * h;
            f.r = Math.random() * 2.0 + 0.5;
            f.v = Math.random() * 0.6  + 0.2;
            f.a = Math.random() * Math.PI * 2;
            f.va= Math.random() * 0.018 + 0.004;
            f.s = Math.random() * 0.9   + 0.2;
            f.o = Math.random() * 0.35  + 0.20;
        }
        function resize() { w = canvas.width = window.innerWidth; h = canvas.height = window.innerHeight; }
        function build()  {
            flakes = [];
            for (var i = 0; i < COUNT; i++) { var f = {}; reset(f, false); flakes.push(f); }
        }
        function draw() {
            ctx.clearRect(0, 0, w, h);
            ctx.fillStyle = col;
            for (var i = 0; i < flakes.length; i++) {
                var f = flakes[i];
                f.a += f.va; f.y += f.v;
                var x = f.x + Math.sin(f.a) * f.s;
                if (f.r > 1.5) {
                    ctx.globalAlpha = f.o * .14;
                    ctx.beginPath(); ctx.arc(x, f.y, f.r*2.2, 0, Math.PI*2); ctx.fill();
                }
                ctx.globalAlpha = f.o;
                ctx.beginPath(); ctx.arc(x, f.y, f.r, 0, Math.PI*2); ctx.fill();
                if (f.y - f.r > h) reset(f, true);
            }
            ctx.globalAlpha = 1;
            raf = requestAnimationFrame(draw);
        }
        resize(); build(); draw();
        var rt2;
        window.addEventListener('resize', function() {
            clearTimeout(rt2); rt2 = setTimeout(function(){ resize(); build(); }, 250);
        });
        document.addEventListener('visibilitychange', function() {
            if (document.hidden) { if (raf) { cancelAnimationFrame(raf); raf = null; } }
            else if (!raf) draw();
        });
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

})();