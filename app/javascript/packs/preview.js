if (document.URL.match(/new/) || document.URL.match(/edit/)){
  document.addEventListener('DOMContentLoaded', function(){
    const ImageList = document.getElementById('image-lists');

    const createImageHTML = (blob) => {
      const imageElement = document.createElement('div');
      
      const blobImage = document.createElement('img');
      blobImage.setAttribute('src', blob);
      blobImage.setAttribute('id', 'image-list')
      blobImage.setAttribute('class', 'image-list')

      imageElement.appendChild(blobImage);
      ImageList.appendChild(imageElement);
    };


    document.getElementById('item-image').addEventListener('change',function(e){

      const imageContent = document.getElementById('image-list');
      if (imageContent){
        imageContent.remove();
      }

      const file = e.target.files[0];
      const blob = window.URL.createObjectURL(file);

      createImageHTML(blob);
    });
  });
}