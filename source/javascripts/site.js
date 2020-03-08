(() => {
  const application = Stimulus.Application.start()

  application.register('carousel', class extends Stimulus.Controller {
    static get targets() {
      return ['container']
    }
    connect() {
      this.carousel = window.tns({
        container: this.containerTarget,
        controls: true,
        controlsPosition: 'bottom',
        controlsText: ['←', '→'],
        nav: false,
        arrowKeys: true,
        autoplay: true,
        autoplayButtonOutput: false,
        loop: true,
        mouseDrag: true,
        autoHeight: true,
      })
    }

    disconnect() {
      this.carousel.destroy()
    }
  })

  application.register('navbar', class extends Stimulus.Controller {
    static get targets() {
      return ['menu', 'button']
    }

    toggleMenu() {
      if (this.hasMenuTarget) {
        this.menuTarget.classList.toggle('is-active')
      }
      if (this.hasButtonTarget) {
        this.buttonTarget.classList.toggle('is-active')
      }
    }
  })

  application.register('modal', class extends Stimulus.Controller {
    static get targets() {
      return ['modal', 'image']
    }

    open(e) {
      if (this.hasModalTarget) {
        this.modalTarget.classList.add('is-active')
      }

      var index = e.target.dataset.index || 0
      this.showImage(index % this.imageTargets.length)
    }

    close() {
      if (this.hasModalTarget) {
        this.modalTarget.classList.remove('is-active')
      }
    }

    next() {
      this.showImage(+this.index + 1)
    }

    previous() {
      this.showImage(+this.index - 1)
    }

    showImage(index) {
      index = +index < 0
        ? this.imageTargets.length - 1
        : +index % this.imageTargets.length
      this.index = index

      this.imageTargets.forEach(function(image, idx) {
        image.classList.toggle('is-hidden', index !== idx)
      })
    }
  })
})()
