function myFunction() {
  let element = document.body;
  element.classList.toggle('dark-mode');
  

  if(document.body.classList.contains('dark-mode')){
    localStorage.setItem('dark', 'true');
  } else {
    localStorage.setItem('dark', 'false');
  }
};

  if(localStorage.getItem('dark') === 'true'){
    document.body.classList.add('dark-mode');
  } else {
    document.body.classList.remove('dark-mode');
  }
