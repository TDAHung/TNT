import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
        const slideCountElement = document.querySelectorAll('.slideCount');
        slideCountElement.forEach(element => {
            const slides = element.closest("[data-carousel]").querySelector("[data-slides]");
            element.innerText = `1/${slides.children.length}`;
        })
    }

    translateSlide(event) {
        const offset = event.currentTarget.dataset.carouselButton === "next" ? 1 : -1;
        const slideCountElement = event.currentTarget.closest("[data-carousel]").querySelector(".slideCount");
        const slides = event.currentTarget.closest("[data-carousel]").querySelector("[data-slides]");
        const activeSlide = slides.querySelector("[data-active]");
        let newIndex = [...slides.children].indexOf(activeSlide) + offset;
        if (!(newIndex < 0 || newIndex >= slides.children.length)) {
            slides.children[newIndex].dataset.active = "active";
            delete activeSlide.dataset.active
        } else {
            if (newIndex < 0) newIndex = 0;
            else newIndex = slides.children.length - 1;
        }
        slideCountElement.innerText = `${newIndex + 1}/${slides.children.length}`;
    }
}
