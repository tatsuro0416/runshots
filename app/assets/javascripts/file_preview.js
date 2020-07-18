$(function () {
  const fileInput = document.getElementById('file-picture');
  const preview = document.getElementById('preview');
  const previewInner = document.getElementById('preview-inner');

  fileInput.addEventListener('change', function (evt) {
    if (document.getElementById('previewPicture') != null) {
      while (previewInner.firstChild) {
        previewInner.removeChild(previewInner.firstChild);
      }
    }
    const files = fileInput.files;
    filePreview(files);
  }, false);
  // fileをプレビューする関数
  function filePreview(files) {
    preview.classList.add('preview__on')
    for (let i = 0; i < files.length; i++) {
      var imageFile = files[i];
      var blobUrl = window.URL.createObjectURL(imageFile);
      console.log(blobUrl)
      var img = document.createElement("img");
      img.setAttribute("src", blobUrl);
      img.setAttribute("class", "preview-picture");
      img.setAttribute("id", "previewPicture");
      img.height = 300;
      img.width = 300;
      previewInner.appendChild(img);
    }
  }
});
