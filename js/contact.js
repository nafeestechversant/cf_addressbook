function confirmDelete(pageID)
{
   if(window.confirm('Are you sure you want to delete this Contact?'))
   {
      window.location.href = 'index.cfm?From=Delete&ID='+pageID;
   }
   else
   {
      null;
   }
}

function viewContact(contactID)
{
    window.location.href = 'index.cfm?From=View&ID='+contactID; 
     
}

function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
  
      reader.onload = function (e) {
        $('#cnt-img').attr('src', e.target.result).width(150).height(200);
      };
  
      reader.readAsDataURL(input.files[0]);
    }
  }