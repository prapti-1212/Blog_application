document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("blog-form");
    const titleField = document.getElementById("blog-title");
    const contentField = document.getElementById("blog-content");
    const submitBtn = document.getElementById("submit-btn");
  
    const titleError = document.getElementById("title-error");
    const contentError = document.getElementById("content-error");
  
    function validateForm() {
      let isValid = true;
  
      if (titleField.value.trim() === "") {
        titleError.style.display = "block";
        isValid = false;
      } else {
        titleError.style.display = "none";
      }
  
      if (contentField.value.trim() === "") {
        contentError.style.display = "block";
        isValid = false;
      } else {
        contentError.style.display = "none";
      }
  
      submitBtn.disabled = !isValid;
      return isValid;
    }
  
    form.addEventListener("submit", function(event) {
      if (!validateForm()) {
        event.preventDefault();
      }
    });
  
    titleField.addEventListener("input", validateForm);
    contentField.addEventListener("input", validateForm);
  });
  