const images = [
    { full: "full1.jpg" },
    { full: "full2.jpg" },
    { full: "full3.jpg" },
    { full: "full4.jpg" }
];

const thumbnailContainer = document.querySelector('.thumbnails');
const fullImage = document.getElementById('fullImage');

images.forEach(image => {
    const thumb = document.createElement('img');

    thumb.src = image.full;
    thumb.width = 100;
    thumb.height = 100;
    thumb.style.objectFit = 'cover';
    thumb.addEventListener('mouseover', () => {
        fullImage.src = image.full;
    });
    thumbnailContainer.appendChild(thumb);
});

if (images.length > 0) {
    fullImage.src = images[0].full;
}