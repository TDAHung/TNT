import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ['fileInput', 'imagePreview', 'imgGroup'];
    connect() {
        this.dataGlobal = new DataTransfer();
    }

    deleteButton() {
        const button = document.createElement('button');
        button.classList.add('btn-delete', 'btn');
        return button;
    }

    handleAddImg(src, index) {
        const imagePreviewNode = document.querySelector("#image-upload").content.cloneNode(true);
        const imageElement = imagePreviewNode.querySelector("div");
        const canvas = imageElement.querySelector('iframe');
        canvas.src = src;

        const deleteButtonNode = document.querySelector('#deleteButton');
        const deleteButtonFragment = deleteButtonNode.content.cloneNode(true);
        const deleteButtonElement = deleteButtonFragment.querySelector('div');

        imageElement.setAttribute('id', `img${src.split('/').pop()}`);
        deleteButtonElement.setAttribute('id', imageElement.id);

        deleteButtonElement.addEventListener('click', () => {
            this.removeImg(imageElement.id, index);
        });

        console.log(this.fileInputTarget.files);

        imageElement.innerHTML = '';
        imageElement.appendChild(deleteButtonElement);
        imageElement.appendChild(canvas);
        return imageElement;
    }

    removeImg(imgID, index) {
        const imgPreview = this.imgGroupTarget.querySelector(`#${imgID}`);
        this.imgGroupTarget.removeChild(imgPreview);
        console.log(this.fileInputTarget.files);
        const file = this.fileInputTarget.files[index];
        this.dataGlobal.items.remove(file);
        this.fileInputTarget.files = this.dataGlobal.files;
    }

    handleChange() {
        for (let i = 0; i < this.fileInputTarget.files.length; i++) {
            const file = this.fileInputTarget.files[i];
            this.dataGlobal.items.add(file);
        }

        this.fileInputTarget.files = this.dataGlobal.files;

        if (this.fileInputTarget.files.length > 0) {
            const files = Array.from(this.fileInputTarget.files);
            const srcs = files.map((file) => URL.createObjectURL(file));

            this.imgGroupTarget.innerHTML = '';

            srcs.forEach((element, index) => {
                const children = this.handleAddImg(element, index);
                this.imgGroupTarget.insertBefore(
                    children,
                    this.element.querySelector('.preview')
                );
            });
        } else {
            this.imagePreviewTarget.src = '#';
        }
    }
}
