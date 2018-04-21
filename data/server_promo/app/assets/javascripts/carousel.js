{
  function easeInOutQuad(t) {
    return t < 0.5 ? 2 * t * t : -1 + (4 - 2 * t) * t;
  };

  class Slider {
    constructor(element, skipFirstRefresh) {
      this.element = element;
      this.offset = 0;
      this.contents = [];
      this.pivot = null;
      this.visible = 0;
      this.width = 0;
      this.contents.width = 0;
      this.pace = 0;
      this.animation = {};
      this.animation.playing = false;
      this.animation.duration = 300;

      if (element.offsetParent !== null && !skipFirstRefresh) {
        this.refresh();
      }

      let dragging = false;
      let pointer = {
        start: 0,
        last: 0,
      };
      let offset = 0;
      let time = 0;

      const startDrag = (e) => {
        this.animation.playing = false;
        dragging = true;
        pointer.start = e.touches ? e.touches[0].pageX : e.pageX;
        pointer.last = e.touches ? e.touches[0].pageX : e.pageX;
        offset = this.offset;
        time = Date.now();
      };

      const drag = (e) => {
        if (!dragging) return;
        pointer.last = (e.touches ? e.touches[0].pageX : e.pageX);
        this.move(offset + pointer.last - pointer.start);
        e.preventDefault();
      };

      const release = (e) => {
        if (!dragging) return;
        dragging = false;

        const delta = pointer.last - pointer.start;
        if (delta === 0) return;

        const distance = Math.abs(delta);
        const velocity = distance / (Date.now() - time);

        if (velocity > 0.5) {
          if (delta < 0) {
            this.next();
          } else {
            this.prev();
          }
        } else {
          this.snap(this.offset);
        }
        e.preventDefault();
      };

      element.addEventListener('dragstart', (e) => {
        e.preventDefault();
      });

      element.addEventListener('click', (e) => {
        const distance = pointer.last - pointer.start;
        if (distance !== 0) {
          e.preventDefault();
          e.stopPropagation();
        }
      });

      element.addEventListener('mousedown', startDrag);
      document.addEventListener('mousemove', drag);
      document.addEventListener('mouseup', release);

      element.addEventListener('touchstart', startDrag);
      document.addEventListener('touchmove', drag);
      document.addEventListener('touchend', release);

      let timer = null;
      window.addEventListener('resize', (e) => {
        if (timer) {
          clearTimeout(timer);
        }
        timer = setTimeout(_ => this.refresh(), 500);
      });
    }

    refresh() {
      const extras = this.element.querySelectorAll('[extra]');
      Array.from(extras).forEach((element) => element.remove());
      if (this.pivot) this.pivot.style.marginLeft = '';

      this.contents = Array.from(this.element.children);
      this.pivot = this.contents[0];
      this.visible = parseInt(this.element.getAttribute('visible'), 10) || 1;
      this.width = this.element.clientWidth;
      this.contents.width = this.width / this.visible;
      this.pace = parseInt(this.element.getAttribute('pace'), 10) || 1;
      this.animation.playing = false;

      for (let i = 0; i < this.visible; i++) {
        const content = this.contents[i];
        if (!content) continue;
        const extra = content.cloneNode(true);
        extra.setAttribute('extra', '');
        this.element.appendChild(extra);
      }

      if (this.pivot) this.move(0);
    }

    slide(value) {
      const offset = this.offset;
      const delta = value - offset;
      const start = Date.now();

      const update = _ => {
        const time = (Date.now() - start) / this.animation.duration;

        if (time < 1) {
          this.move(offset + easeInOutQuad(time) * delta);
        } else {
          this.animation.playing = false;
          this.move(value);
        }

        if (this.animation.playing) requestAnimationFrame(update);
      };

      this.animation.playing = false;
      requestAnimationFrame(_ => {
        this.animation.playing = true;
        update();
      });
    }

    snap(offset) {
      if (offset % this.contents.width != 0) {
        offset = Math.round(offset / this.contents.width) * this.contents.width;
      }
      this.slide(offset);
    }

    move(offset) {
      if (offset > 0) {
        offset = offset - this.contents.width * this.contents.length;
      } else if (offset < this.contents.width * this.contents.length * -1) {
        offset = offset + this.contents.width * this.contents.length;
      }
      this.offset = Math.round(offset);
      this.pivot.style.marginLeft = `${this.offset}px`;
    }

    next() {
      this.snap(this.offset - this.pace * this.contents.width);
    }

    prev() {
      this.snap(this.offset + this.pace * this.contents.width);
    }
  }

  class Carousel extends HTMLXElement {
    constructor() {
      super();
    }

    createdCallback() {
      benchmark.start('Carousel');

      this.addEventListener('click', (e) => {
        if (e.target.hasAttribute('data-carousel-control-next') || e.target.closest('[data-carousel-control-next]')) {
          e.preventDefault();
          this.next();
        } else if (e.target.hasAttribute('data-carousel-control-prev') || e.target.closest('[data-carousel-control-prev]')) {
          e.preventDefault();
          this.prev();
        }
      });
    }

    attachedCallback() {
      if (this.slider) {
        this.slider.refresh();
      } else {
        const slider = this.querySelector('[data-carousel-slider]');
        this.slider = new Slider(slider, true);
        benchmark.stop('Carousel');
      }
    }

    setPace(pace) {
      this.slider.element.setAttribute('pace', pace);
    }

    setVisible(visible) {
      this.slider.element.setAttribute('visible', visible);
    }

    next() {
      this.slider.next();
    }

    prev() {
      this.slider.prev();
    }
  }
  window.Carousel = document.registerElement('x-carousel', Carousel);
}
